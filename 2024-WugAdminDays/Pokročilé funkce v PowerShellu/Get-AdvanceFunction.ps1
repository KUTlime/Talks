# 1. Pojem příkaz, cmdlet, funkce základní a pokročilá

# Command
# Obecný pokyn pro PowerShell aby něco udělal.

# Cmdlet
# Je to příkaz, který se umí napřímo zřetězit v rouře v PS.

# Funkce
# Je to příkaz, který říká vezmi vstup a něco s ním udělej.

# Základní funkce v PS
function Get-Something
{
    Write-Host 'Ahoj světe'
}

# Pokročilá funkce v PowerShell

# Blok param stačí. Přidá nám common parameters.
function Get-Something
{
    param ()
}

function Get-Something
{
    [CmdletBinding(
        PositionalBinding = $false,
        HelpUri = 'https://www.seznam.cz',
        DefaultParameterSetName = 'Default')]
    [Alias('gs')]
    [OutputType([string])]
    [OutputType([System.Diagnostics.Process])]
    param (
        [Parameter(Mandatory,
            Position = 0,
            ParameterSetName = 'Default',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments)]
        [string]
        $Message
    )
    Write-Host 'Ahoj světe'
}

# 2. Begin, process, end

function Get-Something
{
    [CmdletBinding(
        PositionalBinding = $false,
        HelpUri = 'https://www.seznam.cz',
        DefaultParameterSetName = 'Default')]
    [Alias('gs')]
    [OutputType([string])]
    [OutputType([System.Diagnostics.Process])]
    param (
        [Parameter(Mandatory,
            Position = 0,
            ParameterSetName = 'Default',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments)]
        [string]
        $Message
    )
    begin
    {
        # Můžeme provést ověření předpokladů,
        # které nejde validovat (objekty z roury), nebo nedává smysl validovat.
        # Begin se spouští před blokem process.
    }
    process
    {
        Write-Host 'Ahoj světe'
    }
    end
    {
        # Většinou čistíme po sobě.
    }
}

# 3. Validace parametrů

function Get-Something
{
    [CmdletBinding(
        PositionalBinding = $false,
        HelpUri = 'https://www.seznam.cz',
        DefaultParameterSetName = 'Default')]
    [Alias('gs')]
    [OutputType([string])]
    [OutputType([System.Diagnostics.Process])]
    param (
        [Parameter(Mandatory,
            Position = 0,
            ParameterSetName = 'Default',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments)]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateSet('Value1', 'Value2')]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.FileInfo]
        $Path
    )
    begin
    {

    }
    process
    {
        Write-Host 'Ahoj světe'
    }
    end
    {

    }
}

# 4. Množiny parametrů

# Slouží pro oddělení různých kombinací parametrů.
# Taktéž díky nim můžeme přidat ValueFromPipeline na vícero příkazů, viz další kapitola.
# Taky lze využít pro vícero povinných parametrů.

function Get-Something
{
    [CmdletBinding(
        PositionalBinding = $false,
        HelpUri = 'https://www.seznam.cz',
        DefaultParameterSetName = 'Default')]
    [Alias('gs')]
    [OutputType([string])]
    [OutputType([System.Diagnostics.Process])]
    param (
        [Parameter(
            Mandatory,
            Position = 0,
            ParameterSetName = 'Default',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments)]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateSet('Value1', 'Value2')]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.FileInfo]
        $FilePath,
        [Parameter(
            Mandatory,
            Position = 0,
            ParameterSetName = 'Directory',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments)]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateSet('Value1', 'Value2')]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.FileInfo]
        $DirectoryPath
    )
    begin
    {

    }
    process
    {
        Write-Host 'Ahoj světe'
    }
    end
    {

    }
}

# 5. Výchozí hodnoty

# Výchozí hodnoty nelze kombinovat s Mandatory, protože to nedává smysl.
# Mandatory - uživatel musí zadat hodnotu.
# Výchozí hodnota - uživatel buď zadá hodnotu, nebo se použije to, co zadal autor příkazu.
function Get-Something
{
    [CmdletBinding(
        PositionalBinding = $false,
        HelpUri = 'https://www.seznam.cz',
        DefaultParameterSetName = 'Default')]
    [Alias('gs')]
    [OutputType([string])]
    [OutputType([System.Diagnostics.Process])]
    param (
        [Parameter(
            Position = 0,
            ParameterSetName = 'Default',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments)]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateSet('Value1', 'Value2')]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.FileInfo]
        $Path = (Join-Path -Path $env:APPDATA -ChildPath 'log.log')
    )
    begin
    {

    }
    process
    {
        Write-Host 'Ahoj světe'
    }
    end
    {

    }
}

# 6. Práce s rourou

# Díky nastavení ValueFromPipeline si příkaz už sám vytáhne hodnoty z roury.
# Díky nastavení ValueFromPipelineByPropertyName si příkaz už sám vytáhne argument z libovolného objektu,
# který má vlastnost "Path"
function Get-Something
{
    [CmdletBinding(
        PositionalBinding = $false,
        HelpUri = 'https://www.seznam.cz',
        DefaultParameterSetName = 'Default')]
    [Alias('gs')]
    [OutputType([string])]
    [OutputType([System.Diagnostics.Process])]
    param (
        [Parameter(Mandatory,
            Position = 0,
            ParameterSetName = 'Default',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments)]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateSet('Value1', 'Value2')]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.FileInfo]
        $Path
    )
    begin
    {

    }
    process
    {
        Write-Host 'Ahoj světe'
    }
    end
    {

    }
}
# 7. Nápověda

# Pro nápovědu stačí přilepit tento blok nad funkci a PowerShell zařídí zbytek.
# Stačí jenom doplnit text.
# Položek Example může být více.

<#
.SYNOPSIS
    A short one-line action-based description, e.g. 'Tests if a function is valid'
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>
function Get-Something
{
    [CmdletBinding(
        PositionalBinding = $false,
        HelpUri = 'https://www.seznam.cz',
        DefaultParameterSetName = 'Default')]
    [Alias('gs')]
    [OutputType([string])]
    [OutputType([System.Diagnostics.Process])]
    param (
        [Parameter(
            Position = 0,
            ParameterSetName = 'Default',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            ValueFromRemainingArguments)]
        [ValidateNotNullOrWhiteSpace()]
        [ValidateSet('Value1', 'Value2')]
        [ValidateScript({ $_ | Test-Path })]
        [System.IO.FileInfo]
        $Path = (Join-Path -Path $env:APPDATA -ChildPath 'log.log')
    )
    begin
    {

    }
    process
    {
        Write-Host 'Ahoj světe'
    }
    end
    {

    }
}

# Bonus - splatting

# Mějme nějakou sakra dlouhou funkci, která se nám ani nevejde na řádek
Invoke-WebRequest -Uri 'https://novinky.cz' -HttpVersion 2.0 -Certificate $certificate -Headers @{Header1 = 'SomeHeader'; Header2 = 'SomeHeader2' } -UserAgent $userAgent -MaximumRetryCount 3

# Číst takový skript je peklo
# Jde to udělat i jinak, lépe

$requestArgs = @{
    Uri               = 'https://novinky.cz'
    HttpVersion       = 2.0
    Certificate       = $certificate
    Headers           = @{Header1 = 'SomeHeader'; Header2 = 'SomeHeader2' }
    UserAgent         = $userAgent
    MaximumRetryCount = 3
}
Invoke-WebRequest @requestArgs

# Barevné znázornění
Invoke-WebRequest -Uri 'https://excalidraw.com/#json=OOJ6YhIOySyuNVPx2qrzH,u9FtKrzq0_L6fBscHETaig'