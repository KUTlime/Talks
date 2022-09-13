# Module created by Microsoft.PowerShell.Crescendo
class PowerShellCustomFunctionAttribute : System.Attribute { 
    [bool]$RequiresElevation
    [string]$Source
    PowerShellCustomFunctionAttribute() { $this.RequiresElevation = $false; $this.Source = "Microsoft.PowerShell.Crescendo" }
    PowerShellCustomFunctionAttribute([bool]$rElevation) {
        $this.RequiresElevation = $rElevation
        $this.Source = "Microsoft.PowerShell.Crescendo"
    }
}



function Get-IpConfig
{
[PowerShellCustomFunctionAttribute(RequiresElevation=$False)]
[CmdletBinding()]

param(
[Alias('-a')]
[Parameter(ParameterSetName='Default')]
[string]$All
    )

BEGIN {
    $__PARAMETERMAP = @{
         All = @{
               OriginalName = '-all'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'string'
               ApplyToExecutable = $False
               NoGap = $False
               }
    }

    $__outputHandlers = @{
        Default = @{ StreamOutput = $False; Handler = { param ( $lines )
$post = $false;
foreach($line in ($lines | ?{$_.trim()})) {
    $LineToCheck = $line | select-string '^[a-z]';
    if ( $LineToCheck ) {
        if ( $post ) { [pscustomobject] $ht |add-member -pass -typename $oName }
        $oName = if ($LineToCheck -match 'Configuration') { 'IpConfiguration' } else {'EthernetAdapter'}
        $ht = @{};
        $post = $true
    }
    else {
        if ( $line -match '^   [a-z]' ) {
            $prop,$value = $line -split ' :',2;
            $pName = $prop -replace '[ .-]';
            $ht[$pName] = $value.Trim()
        }
        else {
            $ht[$pName] = .{$ht[$pName];$line.trim()}
        }
    }
}
[pscustomobject] $ht | add-member -pass -typename $oName } }
    }
}

PROCESS {
    $__boundParameters = $PSBoundParameters
    $__defaultValueParameters = $PSCmdlet.MyInvocation.MyCommand.Parameters.Values.Where({$_.Attributes.Where({$_.TypeId.Name -eq "PSDefaultValueAttribute"})}).Name
    $__defaultValueParameters.Where({ !$__boundParameters["$_"] }).ForEach({$__boundParameters["$_"] = get-variable -value $_})
    $__commandArgs = @()
    $MyInvocation.MyCommand.Parameters.Values.Where({$_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $__boundParameters[$_.Name]}).ForEach({$__boundParameters[$_.Name] = [switch]::new($false)})
    if ($__boundParameters["Debug"]){wait-debugger}
    foreach ($paramName in $__boundParameters.Keys|
            Where-Object {!$__PARAMETERMAP[$_].ApplyToExecutable}|
            Sort-Object {$__PARAMETERMAP[$_].OriginalPosition}) {
        $value = $__boundParameters[$paramName]
        $param = $__PARAMETERMAP[$paramName]
        if ($param) {
            if ($value -is [switch]) {
                 if ($value.IsPresent) {
                     if ($param.OriginalName) { $__commandArgs += $param.OriginalName }
                 }
                 elseif ($param.DefaultMissingValue) { $__commandArgs += $param.DefaultMissingValue }
            }
            elseif ( $param.NoGap ) {
                $pFmt = "{0}{1}"
                if($value -match "\s") { $pFmt = "{0}""{1}""" }
                $__commandArgs += $pFmt -f $param.OriginalName, $value
            }
            else {
                if($param.OriginalName) { $__commandArgs += $param.OriginalName }
                $__commandArgs += $value | Foreach-Object {$_}
            }
        }
    }
    $__commandArgs = $__commandArgs | Where-Object {$_ -ne $null}
    if ($__boundParameters["Debug"]){wait-debugger}
    if ( $__boundParameters["Verbose"]) {
         Write-Verbose -Verbose -Message ipconfig.exe
         $__commandArgs | Write-Verbose -Verbose
    }
    $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
    if (! $__handlerInfo ) {
        $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
    }
    $__handler = $__handlerInfo.Handler
    if ( $PSCmdlet.ShouldProcess("ipconfig.exe $__commandArgs")) {
    # check for the application and throw if it cannot be found
        if ( -not (Get-Command -ErrorAction Ignore "ipconfig.exe")) {
          throw "Cannot find executable 'ipconfig.exe'"
        }
        if ( $__handlerInfo.StreamOutput ) {
            & "ipconfig.exe" $__commandArgs | & $__handler
        }
        else {
            $result = & "ipconfig.exe" $__commandArgs
            & $__handler $result
        }
    }
  } # end PROCESS

<#
.SYNOPSIS

USAGE:
    ipconfig [/allcompartments] [/? | /all | 
                                 /renew [adapter] | /release [adapter] |
                                 /renew6 [adapter] | /release6 [adapter] |
                                 /flushdns | /displaydns | /registerdns |
                                 /showclassid adapter |
                                 /setclassid adapter [classid] |
                                 /showclassid6 adapter |
                                 /setclassid6 adapter [classid] ]

where
    adapter             Connection name 
                       (wildcard characters * and ? allowed, see examples)

    Options:
       /?               Display this help message
       /all             Display full configuration information.
       /release         Release the IPv4 address for the specified adapter.
       /release6        Release the IPv6 address for the specified adapter.
       /renew           Renew the IPv4 address for the specified adapter.
       /renew6          Renew the IPv6 address for the specified adapter.
       /flushdns        Purges the DNS Resolver cache.
       /registerdns     Refreshes all DHCP leases and re-registers DNS names
       /displaydns      Display the contents of the DNS Resolver Cache.
       /showclassid     Displays all the dhcp class IDs allowed for adapter.
       /setclassid      Modifies the dhcp class id.  
       /showclassid6    Displays all the IPv6 DHCP class IDs allowed for adapter.
       /setclassid6     Modifies the IPv6 DHCP class id.


The default is to display only the IP address, subnet mask and
default gateway for each adapter bound to TCP/IP.

For Release and Renew, if no adapter name is specified, then the IP address
leases for all adapters bound to TCP/IP will be released or renewed.

For Setclassid and Setclassid6, if no ClassId is specified, then the ClassId is removed.

Examples:
    > ipconfig                       ... Show information
    > ipconfig /all                  ... Show detailed information
    > ipconfig /renew                ... renew all adapters
    > ipconfig /renew EL*            ... renew any connection that has its 
                                         name starting with EL
    > ipconfig /release *Con*        ... release all matching connections,
                                         eg. "Wired Ethernet Connection 1" or
                                             "Wired Ethernet Connection 2"
    > ipconfig /allcompartments      ... Show information about all 
                                         compartments
    > ipconfig /allcompartments /all ... Show detailed information about all
                                         compartments

.DESCRIPTION See help for ipconfig.exe

.PARAMETER All




#>
}


