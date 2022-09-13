$command = New-CrescendoCommand -Verb 'Get' -Noun 'IpConfig' -OriginalName 'ipconfig.exe'
$command.Platform = 'Windows'
$parameter = New-ParameterInfo -Name 'All' -OriginalName '-all'
$parameter.Aliases = '-a'
$parameter.OriginalPosition = 0
$parameter.ParameterType = 'string'
$parameter.ParameterSetName = 'Default'
$command.Parameters = $parameter
$handler = New-OutputHandler
$handler.ParameterSetName = 'Default'
$handler.Handler = @"
param ( `$lines )
`$post = `$false;
foreach(`$line in (`$lines | ?{`$_.trim()})) {
    `$LineToCheck = `$line | select-string '^[a-z]';
    if ( `$LineToCheck ) {
        if ( `$post ) { [pscustomobject] `$ht |add-member -pass -typename `$oName }
        `$oName = if (`$LineToCheck -match 'Configuration') { 'IpConfiguration' } else {'EthernetAdapter'}
        `$ht = @{};
        `$post = `$true
    }
    else {
        if ( `$line -match '^   [a-z]' ) {
            `$prop,`$value = `$line -split ' :',2;
            `$pName = `$prop -replace '[ .-]';
            `$ht[`$pName] = `$value.Trim()
        }
        else {
            `$ht[`$pName] = .{`$ht[`$pName];`$line.trim()}
        }
    }
}
[pscustomobject] `$ht | add-member -pass -typename `$oName
"@
$command.OutputHandlers = $handler
$rootPath = Resolve-Path -Path ([string]::IsNullOrWhiteSpace($PSScriptRoot) ? $PWD : $PSScriptRoot) -Relative
$assetPath = Get-ChildItem -Path $rootPath -Recurse -Directory -Filter 'assets' | Where-Object {$_.FullName -match 'news'}
$configurationFile = Join-Path -Path $assetPath -ChildPath 'get-ipconfig2.crescendo.json'
@{
  '$schema' = 'https://aka.ms/PowerShell/Crescendo/Schemas/2021-11'
  Commands  = @($command)
} | ConvertTo-Json -Depth 99 | Out-File $configurationFile -Force

Export-CrescendoModule -ConfigurationFile $configurationFile -ModuleName (Join-Path $assetPath 'WUG') -Force -Verbose -InformationAction:Continue