function Install-GoogleDbTooling
{
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [IO.DirectoryInfo]
        $CloudSQLProxyDirectory = (Join-Path -Path $env:USERPROFILE -ChildPath 'source\Citya\CloudSQLProxy'),

        [Parameter(ValueFromPipelineByPropertyName, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [IO.FileInfo]
        $CloudSqlProxyBinaryName = 'cloud-sql-proxy.exe',

        [Parameter(ValueFromPipelineByPropertyName, Position = 2)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ $_ | Test-Path })]
        [IO.FileInfo]
        $Instance = 'citya-development:europe-central2:api-db'
    )

    winget install -e --id 'Google.CloudSDK' --silent --accept-package-agreements --accept-source-agreements
    New-Item -Path "$($CloudSQLProxyDirectory.FullName)" -ItemType:Directory -Force
    [IO.FileInfo] $outFile = Join-Path -Path "$($CloudSQLProxyDirectory.FullName)" -ChildPath $CloudSqlProxyBinaryName
    $downloadUri = 'https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.7.0/cloud-sql-proxy.x64.exe'
    Invoke-WebRequest -Uri $downloadUri -OutFile "$($outFile.FullName)"
    [IO.FileInfo []]$programFilesFilePaths = Join-Path -Path "${env:ProgramFiles(x86)}" -ChildPath 'Google\Cloud SDK\google-cloud-sdk\bin\gcloud'
    if (-not($programFilesFilePaths | Test-Path))
    {
        [IO.FileInfo]$programFilesFilePath = Join-Path -Path "$env:LOCALAPPDATA" -ChildPath 'Google\Cloud SDK\google-cloud-sdk\bin\gcloud'
    }
    if (!($programFilesFilePath | Test-Path))
    {
        throw [System.IO.FileNotFoundException]::new('The gcloud binary cannot be found!')
    }

    Start-Process -FilePath "$($programFilesFilePath.FullName)" -ArgumentList 'auth login' -Wait
    Start-Process -FilePath "$($programFilesFilePath.FullName)" -ArgumentList 'auth application-default login' -Wait
}

function Start-PortForwarding
{
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName, Position = 0)]
        [ValidateScript({
                $out = [ipaddress]::Parse('127.0.0.1')
                [ipaddress]::TryParse($_, [ref] $out)
            })]
        [ipaddress]
        $Address = '127.0.0.1',

        [Parameter(ValueFromPipelineByPropertyName, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [UInt16]
        $Port = 5432,

        [Parameter(ValueFromPipelineByPropertyName, Position = 2)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ $_ | Test-Path })]
        [IO.FileInfo]
        $CloudSqlProxyBin = "$($env:USERPROFILE)\source\Citya\CloudSQLProxy\cloud-sql-proxy.exe",

        [Parameter(ValueFromPipelineByPropertyName, Position = 3)]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('development', 'production')]
        [string]
        $Instance = 'development'
    )

    process
    {
        $instanceId = "citya-$($Instance):europe-central2:api-db"
        Write-Information -MessageData "Arguments: `"$($CloudSqlProxyBin.FullName)`" -ArgumentList `"--address=`"$($Address)`" --port=$($($Port)) $($instanceId)`""
        Start-Process -FilePath "$($CloudSqlProxyBin.FullName)" -ArgumentList "--address=`"$($Address)`" --port=$($($Port)) $($instanceId)" -Wait -NoNewWindow
    }
}

function Find-NuGetPackage
{
    <#
    .SYNOPSIS
        Finds the given NuGet version in CSProj files and prints all occurrences.
    .DESCRIPTION
        Finds all '*.csproj', '*.props', '*.targets' files in the given project directory, loads the content of these files and finds all occurrences of the given NuGet version.
    .NOTES
        This function requires PowerShell >=7.3.3 and work over local repositories only. The NuGet is found by name and version string comparison mach.
    .LINK
        https://github.com/CITYA-mobility/DevTools
    .EXAMPLE
        Find-NuGetPackage -ProjectFolder .\Citya\api-server\ -Name 'Serilog.Expressions' -Version '3.4.1'
        Finds all occurrences of 'Serilog.Expressions' with version '3.4.1' in the given directory path .\Citya\api-server\ and prints verbose messages.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.DirectoryInfo]
        $ProjectFolder,
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 2)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Version
    )

    process
    {
        Get-ChildItem -Path $ProjectFolder -Include '*.csproj', '*.props', '*.targets' -Exclude 'NuGetTemplate.csproj' -Recurse -File
        | ForEach-Object {
            "Reading package: $($_.FullName)" | Write-Verbose
            $csprojFile = $_
            $csproj = [xml](Get-Content $csprojFile.FullName -ErrorAction:Inquire)
            $csproj.Project.ItemGroup.PackageReference
            | ForEach-Object {
                if ($_.Include -eq $Name -and $_.Version -eq $Version)
                {
                    Write-Host "Package $($_.Include), version $($_.Version) has been detected in $($csprojFile.FullName)"
                }
            }
        }
    }
}

function Get-NuGetVersion
{
    <#
    .SYNOPSIS
        Collects & prints all NuGet packages in the given directory.
    .DESCRIPTION
        Collects all NuGet packages from all '*.csproj', '*.props', '*.targets' files, sort them based on name & version and prints out all unique versions of all discovered NuGet packages.
    .NOTES
        This function requires PowerShell >=7.3.3 and work over local repositories only.
    .LINK
        https://github.com/CITYA-mobility/DevTools
    .EXAMPLE
        Get-NuGetVersion -ProjectFolder .\Cityaq\api-server\
        Gets all unique NuGet package versions from the given directory recursively.
    .EXAMPLE
        Get-NuGetVersion -ProjectFolder .\Cityaq\api-server\ -NonFloatingOnly
        Gets all unique, non-floating NuGet package versions from the given directory recursively.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.DirectoryInfo]
        $ProjectFolder,
        [Parameter(ValueFromPipelineByPropertyName, Position = 1)]
        [switch]
        $NonFloatingOnly,
        [Parameter(ValueFromPipelineByPropertyName, Position = 3)]
        [ValidateNotNullOrEmpty()]
        [System.IO.FileInfo]
        $OutputFile
    )

    begin
    {
        if ($OutputFile)
        {
            if (-not($OutputFile.Directory | Test-Path))
            {
                if ($PSCmdlet.ShouldProcess('New-Item', "Directory of name $($OutputFile.Directory)"))
                {
                    New-Item -Path $OutputFile.Directory -ItemType:Directory -Force -ErrorAction:Continue | Write-Information
                }
            }
            $xdoc = [xml]@'
<Project Sdk="Microsoft.NET.Sdk">
<ItemGroup>
<ItemGroup>
</ItemGroup>
</ItemGroup>
</Project>
'@
        }
    }

    process
    {
        $packages = [System.Collections.Generic.HashSet[System.Xml.XmlElement]]::new()
        Get-ChildItem -Path $ProjectFolder -Include '*.csproj', '*Directory.Build.props', 'Directory.Build.targets' -Exclude 'NuGetTemplate.csproj', '*.nuget.g.targets', '*.nuget.g.props' -Recurse -File
        | ForEach-Object {
            "Reading package: $($_.FullName)" | Write-Verbose
            $csproj = [xml](Get-Content $_.FullName -ErrorAction:Inquire)
            $csproj.Project.ItemGroup.PackageReference
            | ForEach-Object {
                if ([string]::IsNullOrWhiteSpace($_.Include) -eq $false -and [string]::IsNullOrWhiteSpace($_.Version) -eq $false)
                {
                    $packages.Add($_) | Write-Verbose
                }
            }
        }

        $packages
        | Sort-Object -Unique -Property Include, Version
        | Where-Object {
            if ($NonFloatingOnly)
            {
                ($_.Version[-1] -eq '*') -ne $NonFloatingOnly
            }
            else
            {
                $true
            }
        } | ForEach-Object {
            Write-Host $_
            $importedNode = $xdoc.ImportNode($_, $true)
            $xdoc.Project.ItemGroup.AppendChild($importedNode)
        }
    }
    end
    {
        if ($OutputFile)
        {
            if ($PSCmdlet.ShouldProcess("'$($OutputFile.FullName)'", 'Creates a new CSProj template'))
            {
                $xdoc.Project.ItemGroup.RemoveChild($xdoc.Project.ItemGroup.FirstChild)
                $xdoc.Save("$($OutputFile.FullName)")
            }
        }
    }
}

function Set-NuGetVersion
{
    <#
    .SYNOPSIS
        Sets NuGet version globally.
    .DESCRIPTION
        Finds all '*.csproj', '*.props', '*.targets' files, overrides their NuGet versions by the versions found in the given or default template that acts as a list of required NuGet versions.
    .NOTES
        This function requires PowerShell >=7.3.3 and work over local repositories only.
    .LINK
        https://github.com/CITYA-mobility/DevTools
    .EXAMPLE
        Set-NuGetVersion
        Sets all NuGet package versions in the root directory (and recurse paths) from which the script is executed from.
    .EXAMPLE
        Set-NuGetVersion -ProjectFolder .\Citya\api-server\
        Sets all NuGet package versions in the .\Citya\api-server\ directory recursively.
    .EXAMPLE
        Set-NuGetVersion -PrototypeFilePath .\CustomTemplate.csproj -ProjectFolder .\Citya\api-server\
        Sets all NuGet package versions from a custom template CustomTemplate.csproj in the .\Citya\api-server\ directory recursively.
    #>
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.FileInfo]
        $PrototypeFilePath = (Join-Path -Path $PSScriptRoot -ChildPath 'NuGetTemplate.csproj'),
        [Parameter(ValueFromPipelineByPropertyName, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.DirectoryInfo]
        $ProjectFolder = $PSScriptRoot
    )

    begin
    {
        $prototypeCsproj = [Xml] (Get-Content -LiteralPath $prototypeFilePath.FullName)
    }

    process
    {
        Get-ChildItem -Path "$($ProjectFolder.FullName)" -Include '*.csproj', '*.props', '*.targets' -Exclude 'NuGetTemplate.csproj' -Recurse -File
        | ForEach-Object {
            $csproj = [xml](Get-Content $_.FullName)
            $saveFile = $false
            $csproj.Project.ItemGroup.PackageReference
            | ForEach-Object {
                $package = $_
                $prototypePackage = $prototypeCsproj.Project.ItemGroup.PackageReference | Where-Object { ($_.Include -eq $package.Include) -and ($_.Version -ne $package.Version) }
                if ($prototypePackage)
                {
                    $package.Version = $prototypePackage.Version
                    $saveFile = $true
                }
            }
            if ($saveFile)
            {
                $csproj.Save("$($_.FullName)")
            }
        }
    }
}

function Remove-CityaDatabases
{
    <#
    .SYNOPSIS
    This function deletes databases from a specific Cloud SQL instance in a specific project.

    .DESCRIPTION
    The function lists all databases in the "api-db" instance within the "citya-development" project, filters the output to only include databases whose names contain the input string, and then deletes each of these databases.

    .PARAMETER NamePattern
    The string to match in the database names. Databases with names containing this string will be deleted.

    .EXAMPLE
    Remove-CityaDatabase -NamePattern "db-cit-"
    This example deletes all databases in the "api-db" instance within the "citya-development" project whose names contain the string "db-cit-".
    #>

    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrWhiteSpace()]
        [string]
        $NamePattern
    )

    if ($NamePattern -match 'db-staging')
    {
        throw "Error: 'db-staging' is not allowed as input."
    }
    gcloud sql databases list --instance="api-db" --project="citya-development" | Select-String $NamePattern | ForEach-Object {
        $dbName = $_.ToString().Split()[0]
        Write-Host "Found database $dbName"
        gcloud sql databases delete --quiet $dbName --instance="api-db" --project="citya-development"
    }
}

function New-AccessToken
{
    param (
        # The password for the user name
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [securestring]
        $Password,
        # The user name
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $UserName = 'email@example.com',
        # The target environment URI
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrWhiteSpace()]
        [System.Uri]
        $Uri = 'https://citya-api-dev-staging-hqzn5nkhwq-lm.a.run.app'
    )

    process
    {
        $arguments = @{
            Method  = 'POST'
            Uri     = "$($Uri)auth/authorize"
            Headers = @{
                'accept'       = 'text/plain'
                'Content-Type' = 'application/json'
            }
            Body    = @{
                'username' = $UserName
                'password' = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password))
            } | ConvertTo-Json
        }
        $arguments.Values | Write-Verbose
        $response = Invoke-RestMethod @arguments
        $token = $response.data.accessToken
        Set-Clipboard -Value $token
        Write-Host 'The token value has been copied to the clipboard.'
    }
}

function Invoke-Allocation
{
    <#
    .SYNOPSIS
        Invokes an allocation requestion in the Allocator V5.
    .DESCRIPTION
        Sends a request to the given Allocator instance and returns the response.
    .NOTES
        The default instance is Říčany in Development environment.
    .LINK
        https://github.com/CITYA-mobility/DevTools
    .PARAMETER FilePath
        A file path to a JSON file with a request that must be invoked.
    .PARAMETER AllocatorInstance
        An Allocator V5 instance in GCP to which the request will be send to.
    .PARAMETER GCPEnvironment
        An Allocator V5 environment in GCP to which the request will be send to.
    .EXAMPLE
        Invoke-Allocation -FilePath .\Request.json
        Takes the relative path to a JSON file Request.json and sends it to the Říčany Development allocator.
    .EXAMPLE
        Invoke-Allocation -FilePath .\Request.json -AllocatorInstance 'pardubicesvitavy'
        This example takes the relative path to a JSON file Request.json and sends it to the Pardubice-Svitavy Development allocator.

    .EXAMPLE
        Invoke-Allocation -FilePath .\Request.json -GCPEnvironment 'vja3qd7qdq'
        This example takes the relative path to a JSON file Request.json and sends it to the Říčany allocator in the 'vja3qd7qdq' GCP environment.

    .EXAMPLE
        Invoke-Allocation -FilePath .\Request.json -AllocatorInstance 'pardubicesvitavy' -GCPEnvironment 'vja3qd7qdq'
        This example takes the relative path to a JSON file Request.json and sends it to the Pardubice-Svitavy allocator in the 'vja3qd7qdq' GCP environment.
    #>
    [CmdletBinding()]
    [Alias('tar')]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName, HelpMessage = 'A path to JSON file that represents Allocator request')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ $_ | Test-Path })]
        [IO.FileInfo]
        $FilePath,
        [Parameter(Position = 1, ValueFromPipelineByPropertyName, HelpMessage = 'The allocator instance to which the request will be send to')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateSet('ricany', 'pardubicesvitavy', 'jindrichovice', 'lipnik', 'ceskebudejovice', 'moravskatrebova')]
        [IO.FileInfo]
        $AllocatorInstance = 'ricany',
        [Parameter(Position = 2, ValueFromPipelineByPropertyName, HelpMessage = 'The allocator location (environment) in GCP')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateSet('hqzn5nkhwq', 'vja3qd7qdq')]
        [IO.FileInfo]
        $GCPEnvironment = 'hqzn5nkhwq'
    )

    process
    {
        $json = Get-Content -LiteralPath "$($FilePath.FullName)"
        $arguments = @{
            Uri         = "https://citya-allocator-$AllocatorInstance-$GCPEnvironment-lm.a.run.app/allocator"
            Body        = $json
            Method      = 'POST'
            ContentType = 'application/json'
        }

        $response = Invoke-WebRequest @arguments

        return $response.Content
    }
}

function Add-CityaMigration
{
    <#
    .SYNOPSIS
        Adds a new database migration for the Citya backend.

    .DESCRIPTION
        This cmdlet facilitates the creation of a new Entity Framework (EF) Core database migration for the Citya backend by invoking the dotnet EF Core global tool with the specified migration name.

    .PARAMETER MigrationName
        The name of the migration to be created. This is a mandatory parameter and must follow PascalCase naming convention.

    .PARAMETER InfrastructureProjectPath
        The file system path to the Infrastructure project where the DbContext is located. If not provided, defaults to the Infrastructure project within the current working directory's 'src' folder.

    .PARAMETER ApiEntrypointProjectPath
        The file system path to the executable ApiEntrypoint project. If not provided, defaults to the ApiEntrypoint project within the current working directory's 'src' folder.

    .NOTES
        Ensure that you are in the root directory of the backend solution (api-server directory) when running this cmdlet without providing explicit paths for the Infrastructure and ApiEntrypoint projects.

    .LINK
        https://github.com/CITYA-mobility/DevTools

    .EXAMPLE
        Add-CityaMigration -MigrationName 'CreateRideTable'
        This example creates a new migration named 'CreateRideTable' using the default project paths.

    .EXAMPLE
        Add-CityaMigration -MigrationName 'AddStatusToRideEntity' -InfrastructureProjectPath 'C:\Projects\Citya\src\Infrastructure\Infrastructure.csproj' -ApiEntrypointProjectPath 'C:\Projects\Citya\src\ApiEntrypoint\ApiEntrypoint.csproj'
        This example creates a new migration named 'AddStatusToRideEntity' using the specified paths for the Infrastructure and ApiEntrypoint projects.

    .EXAMPLE
        Add-CityaMigration -MigrationName 'RefactorRideTable' -Verbose
        This example creates a new migration named 'RefactorRideTable' and outputs detailed information during the migration creation process due to the -Verbose parameter.
    #>

    [Alias('acm')]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName, HelpMessage = 'A name of the migration')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ $_ -cmatch '^[A-Z]' }, ErrorMessage = 'The migration name must starts with capital letter.')]
        [string]
        $MigrationName,
        [Parameter(Position = 1, ValueFromPipelineByPropertyName, HelpMessage = 'A path to Infrastructure project where DbContext is located.')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ $_ | Test-Path }, ErrorMessage = 'Please, navigate to Citya API Server solution root first.')]
        [IO.FileInfo]
        $InfrastructureProjectPath = (Join-Path -Path $pwd -ChildPath '\src\Infrastructure\Infrastructure.csproj'),
        [Parameter(Position = 2, ValueFromPipelineByPropertyName, HelpMessage = 'A path to executable ApiEntrypoint project.')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ $_ | Test-Path }, ErrorMessage = 'Please, navigate to Citya API Server solution root first.')]
        [IO.FileInfo]
        $ApiEntrypointProjectPath = (Join-Path -Path $pwd -ChildPath '.\src\ApiEntrypoint\ApiEntrypoint.csproj')
    )
    begin
    {
        if (($InfrastructureProjectPath.FullName | Test-Path) -eq $false)
        {
            Write-Error -Message "Infrastructure project cannot be found in the path: '$($InfrastructureProjectPath.FullName)'" -RecommendedAction 'Either specify the path to the infrastructure project where CityaDbContext is located, or navigate yourself to the root of the solution' -ErrorAction:Stop
        }
        if (($ApiEntrypointProjectPath.FullName | Test-Path) -eq $false)
        {
            Write-Error -Message "ApiEntrypoint project cannot be found in the path: '$($ApiEntrypointProjectPath.FullName)'" -RecommendedAction 'Either specify the path to the ApiEntrypoint project, or navigate yourself to the root of the solution' -ErrorAction:Stop
        }
    }

    process
    {
        $arguments = @{
            FilePath     = 'dotnet'
            ArgumentList = 'tool install --global dotnet-ef'
            Wait         = $true
            NoNewWindow  = $true
        }
        Start-Process @arguments
        $arguments.ArgumentList = "ef migrations add $MigrationName --project ""$($InfrastructureProjectPath.FullName)"" --startup-project ""$($ApiEntrypointProjectPath.FullName)"" --context CityaDbContext --output-dir .\Postgres\Migrations"
        if ($PSCmdlet.MyInvocation.BoundParameters['Verbose'].IsPresent)
        {
            $arguments.ArgumentList += ' --verbose'
        }
        Start-Process @arguments
    }
}

function Get-CityaMigrationScript
{
    <#
    .SYNOPSIS
        Gets an idempotent SQL script for an existing Citya database migrations.

    .DESCRIPTION
        This cmdlet gets an idempotent SQL script for an existing Entity Framework (EF) Core database migrations for the Citya backend by invoking the dotnet EF Core global tool.

    .PARAMETER OutputPath
        The output path for the generated SQL script file. This is a mandatory parameter.

    .PARAMETER InfrastructureProjectPath
        The file system path to the Infrastructure project where the DbContext is located. If not provided, defaults to the Infrastructure project within the current working directory's 'src' folder.

    .PARAMETER ApiEntrypointProjectPath
        The file system path to the executable ApiEntrypoint project. If not provided, defaults to the ApiEntrypoint project within the current working directory's 'src' folder.

    .NOTES
        Ensure that you are in the root directory of the backend solution (api-server directory) when running this cmdlet without providing explicit paths for the Infrastructure and ApiEntrypoint projects.

    .LINK
        https://github.com/CITYA-mobility/DevTools

    .EXAMPLE
        Get-CityaMigrationScript -OutputPath '.\src\Infrastructure\Postgres\Migrations\UpdateRideTable.sql'
        This example gets an idempotent SQL script for the latest migration and outputs it to the specified 'Migrations' directory.

    .EXAMPLE
        Get-CityaMigrationScript -OutputPath 'C:\Scripts\InitializeDatabase.sql' -InfrastructureProjectPath 'C:\Projects\Citya\src\Infrastructure\Infrastructure.csproj' -ApiEntrypointProjectPath 'C:\Projects\Citya\src\ApiEntrypoint\ApiEntrypoint.csproj'
        This example gets an idempotent SQL script and outputs it to 'C:\Scripts\InitializeDatabase.sql', using the specified paths for the Infrastructure and ApiEntrypoint projects.
    #>

    [CmdletBinding()]
    [Alias('gcms')]
    param (
        [Parameter(Position = 0, ValueFromPipelineByPropertyName, HelpMessage = 'The output path for the generated SQL script file.')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ Test-Path (Split-Path $_ -Parent) }, ErrorMessage = 'The directory for the output path does not exist.')]
        [string]
        $OutputPath = (Join-Path -Path $pwd -ChildPath '\src\Infrastructure\Postgres\Migrations\Test.sql'),

        [Parameter(Position = 1, ValueFromPipelineByPropertyName, HelpMessage = 'The file system path to the Infrastructure project where the DbContext is located.')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ T$_ | Test-Path }, ErrorMessage = 'The path to the Infrastructure project is not valid or does not exist.')]
        [IO.FileInfo]
        $InfrastructureProjectPath = (Join-Path -Path $pwd -ChildPath '\src\Infrastructure\Infrastructure.csproj'),

        [Parameter(Position = 2, ValueFromPipelineByPropertyName, HelpMessage = 'The file system path to the executable ApiEntrypoint project.')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ $_ | Test-Path }, ErrorMessage = 'The path to the ApiEntrypoint project is not valid or does not exist.')]
        [IO.FileInfo]
        $ApiEntrypointProjectPath = (Join-Path -Path $pwd -ChildPath '.\src\ApiEntrypoint\ApiEntrypoint.csproj')
    )

    begin
    {
        if (-not (Test-Path (Split-Path $OutputPath -Parent)))
        {
            Write-Error -Message "Output path does not exist: '$OutputPath'" -RecommendedAction 'Please provide a valid output path for the SQL script file.' -ErrorAction:Stop
        }
        if (-not (Test-Path -Path $InfrastructureProjectPath.FullName))
        {
            Write-Error -Message "Infrastructure project cannot be found in the path: '$($InfrastructureProjectPath.FullName)'" -RecommendedAction 'Either specify the path to the infrastructure project where CityaDbContext is located, or navigate yourself to the root of the solution' -ErrorAction:Stop
        }
        if (-not (Test-Path -Path $ApiEntrypointProjectPath.FullName))
        {
            Write-Error -Message "ApiEntrypoint project cannot be found in the path: '$($ApiEntrypointProjectPath.FullName)'" -RecommendedAction 'Either specify the path to the ApiEntrypoint project, or navigate yourself to the root of the solution' -ErrorAction:Stop
        }
    }

    process
    {
        $arguments = @{
            FilePath     = 'dotnet'
            ArgumentList = "ef migrations script --idempotent --project ""$($InfrastructureProjectPath.FullName)"" --startup-project ""$($ApiEntrypointProjectPath.FullName)"" --context CityaDbContext -o ""$OutputPath"""
            Wait         = $true
            NoNewWindow  = $true
        }
        if ($PSCmdlet.MyInvocation.BoundParameters['Verbose'].IsPresent)
        {
            $arguments.ArgumentList += ' --verbose'
        }
        Start-Process @arguments
    }
}

function Update-CityaDatabase
{
    <#
    .SYNOPSIS
        Updates the Citya database to the latest migration based on the specified environment or pull request.

    .DESCRIPTION
        This cmdlet updates the Citya backend database to the latest migration by invoking the dotnet EF Core global tool, targeting either a specified environment or a specific pull request.
        The connection strings are solved internally.

    .PARAMETER Environment
        The target environment for the database update. Valid values are 'Production' and 'Staging'.

    .PARAMETER PullRequestNumber
        The pull request number. This parameter is mandatory when using the PullRequest parameter set and has an alias 'PRN'.

    .PARAMETER ApiEntrypointProjectPath
        The file system path to the executable ApiEntrypoint project.

    .PARAMETER InfrastructureProjectPath
        The file system path to the Infrastructure project where the DbContext is located.

    .PARAMETER ForwarderPort
        The forwarded connection port used for the database connection.

    .NOTES
        Ensure that you are in the root directory of the backend solution (api-server directory) when running this cmdlet.
        Before using this cmdlet, set up the database password inside the cmdlet implementation due to security reasons and PowerShell ecosystem limitations (edit CityaDevTools.psm1).
        Use the -Verbose parameter to get detailed output during the database update process.

    .LINK
        https://github.com/CITYA-mobility/DevTools

    .EXAMPLE
        Update-CityaDatabase -Environment 'Staging'
        This example updates the Citya database to the latest migration for the Staging environment using the default project paths and the default forwarded port.

    .EXAMPLE
        Update-CityaDatabase -PullRequestNumber 42
        This example updates the Citya database to the latest migration for the pull request number 42 using the default project paths and the default forwarded port.

    .EXAMPLE
        Update-CityaDatabase -PullRequestNumber 101 -Verbose
        This example updates the Citya database to the latest migration for the pull request number 101 with detailed output.

    .EXAMPLE
        Update-CityaDatabase -Environment 'Staging' -ApiEntrypointProjectPath 'C:\Projects\Citya\src\ApiEntrypoint\ApiEntrypoint.csproj' -InfrastructureProjectPath 'C:\Projects\Citya\src\Infrastructure\Infrastructure.csproj' -ForwarderPort 5432
        This example updates the Citya database to the latest migration for the Staging environment using the specified project paths and a custom forwarded port.

    #>

    [CmdletBinding(DefaultParameterSetName = 'Environment')]
    [Alias('ucd')]
    param (
        [Parameter(ParameterSetName = 'Environment', Mandatory, HelpMessage = 'The target environment for the database update.')]
        [ValidateSet('Production', 'Staging')]
        [string]
        $Environment,

        [Parameter(ParameterSetName = 'PullRequest', Mandatory, HelpMessage = 'The pull request number from GitHub.')]
        [Alias('PRN')]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ $_ -gt 0 })]
        [int]
        $PullRequestNumber,

        [Parameter(Position = 1, ValueFromPipelineByPropertyName, HelpMessage = 'The file system path to the executable ApiEntrypoint project.')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ Test-Path $_ }, ErrorMessage = 'The path to the ApiEntrypoint project is not valid or does not exist.')]
        [IO.FileInfo]
        $ApiEntrypointProjectPath = (Join-Path -Path $pwd -ChildPath '.\src\ApiEntrypoint\ApiEntrypoint.csproj'),

        [Parameter(Position = 2, ValueFromPipelineByPropertyName, HelpMessage = 'The file system path to the Infrastructure project where the DbContext is located.')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ Test-Path $_ }, ErrorMessage = 'The path to the Infrastructure project is not valid or does not exist.')]
        [IO.FileInfo]
        $InfrastructureProjectPath = (Join-Path -Path $pwd -ChildPath '.\src\Infrastructure\Infrastructure.csproj'),

        [Parameter(Position = 3, ValueFromPipelineByPropertyName, HelpMessage = 'The forwared connection port')]
        [ValidateNotNullOrWhiteSpace()]
        [UInt16]
        $ForwarderPort = 5433
    )

    begin
    {
        if (-not (Test-Path -Path $InfrastructureProjectPath.FullName))
        {
            Write-Error -Message "Infrastructure project cannot be found in the path: '$($InfrastructureProjectPath.FullName)'" -RecommendedAction 'Either specify the path to the infrastructure project where CityaDbContext is located, or navigate yourself to the root of the solution' -ErrorAction:Stop
        }
        if (-not (Test-Path -Path $ApiEntrypointProjectPath.FullName))
        {
            Write-Error -Message "ApiEntrypoint project cannot be found in the path: '$($ApiEntrypointProjectPath.FullName)'" -RecommendedAction 'Either specify the path to the ApiEntrypoint project, or navigate yourself to the root of the solution' -ErrorAction:Stop
        }
    }

    process
    {
        $arguments = @{
            FilePath     = 'dotnet'
            ArgumentList = "ef database update --startup-project ""$($ApiEntrypointProjectPath.FullName)"" --project ""$($InfrastructureProjectPath.FullName)"""
            Wait         = $true
            NoNewWindow  = $true
        }
        switch ($PSCmdlet.ParameterSetName)
        {
            'Environment'
            {
                switch ($PSCmdlet.ParameterSetName)
                {
                    'Production'
                    {
                        Write-Error -Message 'Not supported, GitHub should take care of this.' -ErrorAction:Stop
                    }
                    'Staging'
                    {
                        $arguments.ArgumentList += " --connection ""User ID =postgres;Password=;Server=localhost;Port=$ForwarderPort;Database=db-staging; Pooling=true"""
                    }
                }

            }
            'PullRequest'
            {
                $arguments.ArgumentList += " --connection ""User ID =postgres;Password=;Server=localhost;Port=$ForwarderPort;Database=db-pr-$PullRequestNumber; Pooling=true"""
            }
        }

        if ($PSCmdlet.MyInvocation.BoundParameters['Verbose'].IsPresent)
        {
            $arguments.ArgumentList += ' --verbose'
        }
        Start-Process @arguments
    }
}
function New-CityaBackendReleaseTag
{
    param (
        [Parameter(Mandatory, ParameterSetName = 'Major')]
        [switch]$Major,
        [Parameter(Mandatory, ParameterSetName = 'Minor')]
        [switch]$Minor,
        [Parameter(Mandatory, ParameterSetName = 'Patch')]
        [switch]$Patch
    )

    Start-Process -FilePath 'git' -ArgumentList 'checkout main' -NoNewWindow -Wait
    Start-Process -FilePath 'git' -ArgumentList 'pull' -NoNewWindow -Wait

    $tags = git tag

    [version] $parsedVersion = $tags
    | Where-Object { $_ -match '^v\d+\.\d+\.\d+' }
    | ForEach-Object { [string]::new($_[1..100]) }
    | Sort-Object { [version]$_ } -Descending
    | Select-Object -First 1

    if ([object]::ReferenceEquals($parsedVersion, $null))
    {
        Write-Host 'No valid version tags found.'
        return
    }


    # Increment the appropriate part based on user choice
    if ($Major)
    {
        $parsedVersion = "$($parsedVersion.Major + 1).0.0"
    }
    if ($Minor)
    {
        $parsedVersion = "$($parsedVersion.Major).$($parsedVersion.Minor + 1).0"
    }
    if ($Patch)
    {
        $parsedVersion = "$($parsedVersion.Major).$($parsedVersion.Minor).$($parsedVersion.Build + 1)"
    }

    # Convert back to string format
    $newVersion = "v$($parsedVersion.ToString())"

    # Perform your desired action with the new version (e.g., create a release)
    Write-Host "New version tag: $newVersion"
    # Add your custom logic here

    # Return the new version for further processing if needed
    return $newVersion
}

function Push-CityaBackendReleaseTag
{
    param (
        [Parameter(Mandatory, ParameterSetName = 'Major')]
        [switch]$Major,
        [Parameter(Mandatory, ParameterSetName = 'Minor')]
        [switch]$Minor,
        [Parameter(Mandatory, ParameterSetName = 'Patch')]
        [switch]$Patch
    )

    $newRelease = New-CityaBackendReleaseTag @PSBoundParameters
    Write-Verbose -Message "Release tag: $($newRelease)"
    git tag "$newRelease"
    git push origin "$newRelease"
    Start-Process -FilePath 'https://github.com/CITYA-mobility/api-server/releases/new'
}

function Test-AllocatorRequest
{
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName, HelpMessage = 'The path to the JSON file to analyze.')]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateScript({ Test-Path $_ }, ErrorMessage = 'The path to the file is not valid or does not exist.')]
        [IO.FileInfo]
        $FilePath
    )
    $request = Get-Content -LiteralPath "$($FilePath.FullName)" | ConvertFrom-Json
    $request.existingAllocation.ridePlans | ForEach-Object {
        $ridePlan = $_
        for ($i = 0; $i -lt $ridePlan.vehicleStopActions.Count - 1; $i++)
        {
            if ($ridePlan.vehicleStopActions[$i].departureTime -gt $ridePlan.vehicleStopActions[$i + 1].arrivalTime)
            {
                Write-Host "RidePlan: $($ridePlan.vehicleId) has a departure -> arrival time problem at stop $($ridePlan.vehicleStopActions[$i].Id): DepartureTime: $($ridePlan.vehicleStopActions[$i].departureTime) ArrivalTime: $($ridePlan.vehicleStopActions[$i + 1].arrivalTime)"
            }
            if (($ridePlan.vehicleStopActions[$i].actionCompletionTime -gt $ridePlan.vehicleStopActions[$i + 1].actionCompletionTime) -and ($null -ne $ridePlan.vehicleStopActions[$i].actionCompletionTime -and $null -ne $ridePlan.vehicleStopActions[$i + 1].actionCompletionTime))
            {
                Write-Host "RidePlan: $($ridePlan.vehicleId) has a actionCompletionTime problem at stop $($ridePlan.vehicleStopActions[$i].Id): ActionCompletionTime: $($ridePlan.vehicleStopActions[$i].actionCompletionTime) ActionCompletionTime: $($ridePlan.vehicleStopActions[$i + 1].actionCompletionTime)"
            }
        }
    }
}