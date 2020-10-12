# Name: Kam kráčí PowerShell (Wug Days)
# author: Radek Zahradník (radek tečka zahradnik zavináč msn tečka com)
# Date: 2020-10-10
# Version: 1.0
# Purpose: This script is replacement for PowerPoint presentation.
##########################################################################


####################################################
# Představení přednášejícího
####################################################
# .NET programátor
# IT konzultant
# Lektor
# Nadšenec PowerShellu
Start-Process -FilePath 'www.radekzahradnik.cz/bio'
####################################################


####################################################
# Pro začátek...
####################################################
<#
- Příkazy PowerShellu se nazývají cmdlety nebo funkce, není to to samé a je vhodné to rozlišovat.
- PowerShell se rozšiřuje do šířky pomocí modulů.
- PowerShell se rozšiřuje do hloubky pomocí nové jazykové syntaxe a jiných fíčur.
- PowerShell NeNí CaseSensitive.
- Znak | není svislítko, ale roura, alias pipeline, alias operátor zřetězení.
- Když se to neumí zřetězit, je to PowerScript, ne PowerShell.
- Proměnné se uvazují znakem $.
- WPS => Windows PowerShell verze 5.1.x
- PSC => PowerShell Core => PowerShell 6.x.x
- PS => PowerShell => PowerShell (Core) 7.x.x a vyšší
- Přednáška se zabývá PowerShell 7.x.x
#>
####################################################


####################################################
# Co je Powershell?
####################################################
<#

Odpovědi, které nejčastěji slyším:
- Lepší příkazový řádek.
- Modrá příkazová řádka.
- Skriptovací jazyk.
- Skriptovací jazyk, co umožňuje opakovatelnost.
- Nové terminálové prostředí.
- Best of: "Nejlepší hackovací nástroj, co znám." (Disclaimer: Kali Linux neznal.)

# Co to tedy je?

# Česká wiki: PowerShell je rozšiřitelný textový shell se skriptovacím jazykem od společnosti Microsoft založený na .NET Frameworku.
- Poněkud zjednodušené.
- Zavádějící.

# Anglická wiki: PowerShell is a task automation and configuration management framework from Microsoft, consisting of a command-line shell and associated scripting language.
- Obecnější, ale "trefná" definice.
- Vypadlo nám informace o ".NET Frameworku".

# Dobrá, dobrá a jak se to tedy má?
PowerShell je framework primárně pro automatizaci a správu IT založený na textovém terminálu a stejnojmenném skriptovacím jazyce, který umožňuje rozšiřitelnost nad rámec původního záměru. Třeba ten hacking...

#>
####################################################


####################################################
# Jak šel čas s PowerShell(y)
####################################################
<# Co je ovšem potřeba dodat...
v1.0.0.x 	| Listopad 	2006 	| Windows PowerShell 	| .NET Framework
v2.0.0.x 	| Červenec  2009 	| Windows PowerShell 	| .NET Framework 3.5 (asi ???)
v3.0.0.x 	| Říjen		2012 	| Windows PowerShell 	| .NET Framework 4.0
v4.0.0.x 	| Říjen 	2013 	| Windows PowerShell 	| .NET Framework 4.5
v5.0.0.x 	| Únor 		2016 	| Windows PowerShell 	| .NET Framework 4.5
v5.1.0.x 	| Leden 	2017 	| Windows PowerShell 	| .NET Framework 4.5
v6.0.0   	| Leden 	2018 	| PowerShell Core		| .NET Core v2.0.9
v6.1.0   	| Září 		2018 	| PowerShell Core		| .NET Core v2.1.13
v6.2.0   	| Březen 	2019 	| PowerShell Core		| .NET Core v2.1.13
v7.0.0 P4	| Září 		2019 	| PowerShell    		| .NET Core 3.0
v7.0.0 RC2	| Leden 	2020 	| PowerShell        	| .NET Core 3.0
v7.0.3 LTS 	| Červenec  2020 	| PowerShell    		| .NET Core 3.1
v7.1.0 RC1	| Září  	2020 	| PowerShell    		| .NET 5.0-RC1
#>

# WPS v1.0 .. v5.1 => 10 let
# WPS v1.0 obsahoval cca 120 cmdletů.
# WPS v2.0 obsahoval cca 240 cmdletů.
# WPS v5.1 obsahuje cca 1540 cmdletů v základů
# PS obsahuje...
Write-Host ("Total number of commands: " + (Get-Command).Count)
Get-Module -ListAvailable
Get-Command * | Measure-Object # pro porovnání obou verzí
Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-pohledem-dotNET-programatora/blob/master/Images/PowerShell%20Windows%20DLL%20dependency.png'
Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-pohledem-dotNET-programatora/blob/master/Images/PowerShell%20Core.png'
Start-Process -FilePath 'https://4sysops.com/wiki/differences-between-powershell-versions/'
Start-Process -FilePath 'https://github.com/PowerShell/PowerShell/tags'
####################################################


####################################################
# Windows PowerShell vs. PowerShell (Core)
####################################################
# V čem je hlavní rozdíl?
<#
Windows PowerShell  => Windows only
PowerShell Core     => Multiplatformní (Windows, Linux, MacOS, ARM)
PSC není náhrada za WPS !!!
PS už může být pokládán za náhradu za WPS !!!
#>

# Jak poznám, jaký PowerShell mám?
<#
# Windows PowerShell se verzoval od 1.x do 5.1.x | Desktop
# PowerShell Core se verzuje od 6.x | Core
#>
$PSVersionTable.PSVersion  # Zabudovaná proměnné, pouze od 5.x
$PSVersionTable.PSVersion.Major # Cokoliv většího než 5 je Core  # Zabudovaná proměnné
$PSEdition # Zabudovaná proměnná, Desktop => Windows, Core => Core
####################################################


####################################################
# Jakou verzi použít?
####################################################
<#
PowerShell (Core) sleduje stejnou praxi jako .NET Core.
Existují Long-Term-Support (LTS) verze, které mají 3 roky podporu.
Verze 7.0.x byla první LTS verzí pro PowerShell.
#>
Start-Process -FilePath 'https://docs.microsoft.com/en-us/lifecycle/policies/modern'
Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/scripting/powershell-support-lifecycle?view=powershell-7'
####################################################


####################################################
# Editory
####################################################
<#
- VS Code (a nemá smysl se bavit o ničem jiném)
- Lze částečně využít i ISE
#>

# Instalace VS Code + konfigurace
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
Write-Host "Installing VS Code..."
Start-Process powershell { choco upgrade vscode -y } -Wait
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
Start-Process powershell { code --install-extension ms-vscode.powershell } -Wait
Start-Process code
Write-Host "VS Code installed and prepared for PowerShell experience."

# Přidání PS do ISE
$psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add("Switch to PowerShell 7", {
        function New-OutOfProcRunspace
        {
            param($ProcessId)

            $ci = New-Object -TypeName System.Management.Automation.Runspaces.NamedPipeConnectionInfo -ArgumentList @($ProcessId)
            $tt = [System.Management.Automation.Runspaces.TypeTable]::LoadDefaultTypeFiles()

            $Runspace = [System.Management.Automation.Runspaces.RunspaceFactory]::CreateRunspace($ci, $Host, $tt)

            $Runspace.Open()
            $Runspace
        }

        $PowerShell = Start-Process PWSH -ArgumentList @("-NoExit") -PassThru -WindowStyle Hidden
        $Runspace = New-OutOfProcRunspace -ProcessId $PowerShell.Id
        $Host.PushRunspace($Runspace)
    }, "ALT+F7") | Out-Null

$psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add("Switch to Windows PowerShell", {
        $Host.PopRunspace()

        $Child = Get-CimInstance -ClassName win32_process | Where-Object { $_.ParentProcessId -eq $Pid }
        $Child | ForEach-Object { Stop-Process -Id $_.ProcessId }

    }, "ALT+F5") | Out-Null
# Ideální vložit do profile.ps1
####################################################


####################################################
# Jak PS (Core) vlastně funguje?
####################################################
<# Klíčové koncepty:

Windows PowerShell  => Postaven na .NET Framework
PowerShell Core     => Postaven na .NET Core
PowerShell          ´> Postaven na .NET Core a .NET 5, 6,...)

CMD && UNIX && Linux    => textový vstup | výstup
PS                      => Objektový vstup | výstup

Jelikož PS úzce spoléhá na .NET, je postaven objektově.
Klíčový je koncept roury, která umožňuje snadné zřetězení programů.
Tento koncept zůstal zachován i v nové verzi PS.

PS je postaven s novou filozofií:
Ovládat UNIX-like systémy (macOS, Linux) z Windows a naopak.
#>
####################################################


####################################################
# Kde vlastně PowerShell funguje?
####################################################
<#
To je jednoduché, tam kde funguje .NET Core/5/6...
- Windows
- Linux (různé distribuce)
- macOS
- ARM32/64 (neoficiální experimentální build)
#>
Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/scripting/powershell-support-lifecycle?view=powershell-7#supported-platforms'
####################################################


####################################################
# Co kompatibilita skriptů?
####################################################
<#
Ze zajištění kompatibility skriptů se nám stal komplexní problém. Doslova.
Na reálné ose máme jednotlivé verze (W)PS(C),
na imaginární ose máme jednotlivé platformy.
#>

# Chuťovky z praxe
## UTF8 BOM a NoBOM
pwsh -NoLogo -NoProfile -Command { "abc" | Out-File "$env:USERPROFILE\TestPSC.txt" -Encoding utf8 } # Výsledek je UTF8NoBOM => Nežádoucí.
powershell -NoLogo -NoProfile -Command { "abc" | Out-File "$env:USERPROFILE\TestWPS.txt" -Encoding utf8 } # Výsledek je UTF8BOM

## Chování FileInfo objektu na WPS a PS
[System.IO.FileInfo]$path = "$env:USERPROFILE\test.txt"
Get-Content -Path $Path             # V PS je výsledek korektní předání celé cesty, na WPS viz další řádek.
Get-Content -Path $path.FullName    # Kompatibilní chování mezi PS a WPS.

## V podstatě jakékoliv manuální operace s cestou je tikající bomba
$logPath = "$Env:LOCALAPPDATA\Test.log" # Na Windows možná, ale Linux používá '/'
$logPath = Join-Path -Path $Env:LOCALAPPDATA -ChildPath 'Text.log'
Get-Command -Noun Path

## Samozřejmě systémové proměnné jsou další tikající bomba
$Env:LOCALAPPDATA # Snad si nemyslíte, že tato proměnná bude na Linuxu

## UseBasicParsing je nucené díky InternetExploreru, zlepšení v nejbližší době nečekejme, spíše vůbec
powershell -NoLogo -NoProfile -Command 'Invoke-WebRequest "https://www.facebook.com/"'
pwsh -NoLogo -NoProfile -Command 'Invoke-WebRequest "https://www.facebook.com/"'        # Tady bychom položku forms hledali marně.


## Pak použití některých Cmdletů někde nedává smysl
Enable-WindowsOptionalFeature  # Samozřejmě Windows-only
Get-WmiObject # Není a nebude v PowerShell
Get-Service # Příklad cmdletu, u kterého nezáleží na verzi, ale záleží na platformě. Na ARM balíčku tento cmdlet nenajdete.

# Obecně lze říci
## Platný WPS skript nemusí být platný PS skript.
## Platný WPS skript může být platný PS skript, ale nemusí mít stejné chování.
## Platný PS skript pro jednu platformu nemusí být platný PS skript pro jinou platformu, včetně oficiálně podporovaných.
## Moderně napsaný PS skript je neplatný WPS skript.

# PowerShell dále obsahuje celou řadu nových věcí, viz další kapitola
####################################################


####################################################
# Jak probíhá vývoj?
####################################################
<#
PS se vyvíjí:
- Jako open-source
- Na GitHubu
- Se zapojením komunity (jak kdy, jak u čeho)
- Pod MIT licencí
- Vývoj PS je silně závislý na vývoji .NETu
#>

# Nový domov PS
Start-Process -FilePath 'https://github.com/powershell/'

<#
Zkušenosti z vývoje:
- Je komplikovaný.
- Vleče se, aktuálně v PS repu 26xx otevřených issues, 91 otevřených PR, některé i více než 2 roky.
- Je v tom chaos, např. PowerShellGetV2, kde jsou nepublikované release, PR jsou ignorovány měsíce i roky.
- PowerShellGallery už měsíce nemá aktualizované statistiky stažení balíčků.
#>
####################################################


####################################################
# Změny PS oproti WPS
####################################################
# Nový název procesu
pwsh # => PowerShell Core

# Nový způsob distribuce
Start-Process -FilePath "https://github.com/PowerShell/PowerShell/releases"
choco upgrade powershell-core -y # Pokud máme již nainstalované choco.
$env:POWERSHELL_DISTRIBUTION_CHANNEL # Telemetrická proměnná pro distribuční kanál

# Jiné chování chyb
## Jedná se o změnu chování ToString() metody, která nevypisuje tolik informací.
Start-Process -FilePath powershell -ArgumentList "-NoLogo -NoProfile -Command &{Write-Error 'Some error'}" -NoNewWindow
Start-Process -FilePath pwsh -ArgumentList "-NoLogo -NoProfile -Command &{Write-Error 'asdf'}" -NoNewWindow
Start-Process -FilePath pwsh -ArgumentList "-NoLogo -NoProfile -Command &{Write-Error 'asdf'; Get-Error}" -NoNewWindow

$ErrorView = 'NormalView' # Starý způsob alá WPS5
$ErrorView = 'ConciseView' # Nový způsob alá PS

# Nová složka v dokumentech
Invoke-Item "$env:USERPROFILE\onedrive\Dokumenty\PowerShell"

# Nová domovská cesta
powershell -NoLogo -NoProfile -Command '$PSHOME'
pwsh -NoLogo -NoProfile -Command '$PSHOME'

# Nové uložiště modulů
powershell -NoLogo -NoProfile -Command '$env:PSModulePath -split '';'''
pwsh -NoLogo -NoProfile -Command '$env:PSModulePath -split '';'''

# Nové systémové proměnné
$IsCoreCLR; $IsLinux; $IsMacOS; $IsWindows;

# Podpora modulů
## Většina modulů z WPS v PS již funguje a pokud ne...
Import-Module OpenHere -UseWindowsPowerShell # Vytvoří proxy modul, který deleguje PSC volání do WPS.

# PS Remoting skrze SSH
## Jednodušší připojení v případech mimo AD.
## Mohu použít jakýkoliv SSH klient.
Start-Process -FilePath "https://4sysops.com/archives/enable-powershell-core-6-remoting-with-ssh-transport/#enabling-ssh-for-powershell-on-the-host"


# Paralelní zpracování pro ForEach-Object
'Security', 'Application', 'System' | ForEach-Object -Parallel { Get-WinEvent -LogName $_ -MaxEvents 1000 } -ThrottleLimit 5

# Nativní příkazy
## Snaha o "vygenerování" nativních příkazů PS pro existující utility jako kubectl, docker, git, netsh, net...
## Místo obalování volání jedlových utilit automaticky vygenerovat syntaxi PowerShellu a nápovědu, která je
## v souladu se současnými standardy.

# Syntaktické změny

## Přepínač Parallel pro ForEach-Object
(Measure-Command {1..10 | ForEach-Object {Start-Sleep -Seconds 1}}).TotalSeconds
(Measure-Command {1..10 | ForEach-Object -Parallel {Start-Sleep -Seconds 1}}).TotalSeconds

## Ternární operátor
if ($psEditor -eq 'Core')
{
    $encoding = 'utf8BOM'
}
else
{
    $encoding = 'utf8'
}
### můžeme nově nahradit
$encoding = $PSEdition -eq 'Core' ? 'utf8BOM' : 'utf8'

## Operátory pro potlačení Null
### V PS jsou všechny proměnné referenční.
### Referenční hodnota znamená, že proměnná neříká jaká je hodnota, ale kde je hodnota.
### Je to ukazatel na paměť. A jako ukazatel může ukazovat "nikam", tj. může nést hodnotu Null.
$filePath = $null
$filePath ?? "$env:TEMP\PSC.log"  # Pokud je proměnná $null, je nahrazena hodnotou vpravo. $filePath je stále $null.
$file ?? "$env:TEMP\PSC.log"      # Pokud proměnná neexistuje, operátor ?? opět nahradí $null. $file stále neexistuje.

## Operátory pro nahrazení Null
$filePath = $null
$filePath ??= "$env:TEMP\PSC.log"  # Pokud je proměnná $null, je nahrazena hodnotou vpravo.
$filePath
$file ??= "$env:TEMP\PSC.log"      # Pokud proměnná neexistuje, operátor ?? opět nahradí $null.
$file

## Operátory zřetězení
### Logické NEBO
Get-Process calc -ErrorAction SilentlyContinue || "You have to run Calculator first" # Provede se pravá strana operátoru
Get-Process calc -ErrorAction SilentlyContinue || calc                               # Provede se levá strana operátoru

### Logické A
calc && Get-Process calc                   # Vykonají se obě strany operátoru
calcTypoInProcessName && Get-Process calc  # Vykoná se pouze levá strana operátoru

## Podmíněný přístup
Get-ExperimentalFeature
Enable-ExperimentalFeature -Name PSNullConditionalOperators
$Service = Get-Service -Name 'bits'
if ([ExperimentalFeature]::IsEnabled("PSNullConditionalOperators"))
{
    ${Service}?.status
}

# mnoho jiných experimentálních fíčur
Start-Process -FilePath "https://docs.microsoft.com/en-us/powershell/scripting/learn/experimental-features?view=powershell-7.1"

# 7.1.x
## Vesměs low-level věci
## PowerShellGet v3 (kompletně přepsaný z PS do C#)
## Secret Management Module (správa hesel pro PS)
## PSScriptAnalyzer v2.0 (vylepšení toolingu okolo VS Core)
## Vylepšení aktualizace PowerShellu

# Mimo soutěž - Windows Terminal
wt
####################################################


####################################################
# Kdy PS nahradí WPS ve Windows nebo bude součástí instalace Windows?
####################################################
<#
První se určitě nestane v dohledné době,
druhé v blízké budoucnosti také ne. Microsoft otevřeně říká,
že plány pro instalaci PS do Windows 10 zatím nemá a určitě se
to nestane se 7.0.x jakožto LTS, určitě ne s 7.1.x jakožto
ne-LTS verze, takže pokud, bude to spíše příští nebo přespříští
LTS verze. Smysl dává konec roku 2021 po .NET 6.
#>
####################################################

####################################################
# Jak zajistit běh v PSC?
####################################################
# Magické zaříkávadlo
if ($PSEdition -eq 'Desktop') { Start-Process pwsh.exe "-ExecutionPolicy Bypass -File `"$PSCommandPath`""; exit }
####################################################


####################################################
# Co nejlepší první krok a jak začít s PS?
####################################################
{
    # Jednoduchá odpověď...
    Get-Help # Získáme nápovědu o nápovědě. Jediné, co je potřeba si opravdu pamatovat.

    # PS používá dva druhy nápovědy
    <# 1. #> Get-Help Get-Member        # Nápověda pro konkrétní cmdlet.
    <# 2. #> Get-Help about_operators   # Tematická nápověda

    # Přehled PowerShellu od Microsoft
    Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7'

    # 1. výsledek pokud zadáte do Google: PowerShell Core
    Start-Process -FilePath 'https://github.com/PowerShell/PowerShell'

    # Pěkný GithHub rozcestník.
    Start-Process -FilePath 'https://github.com/janikvonrotz/awesome-powershell'

    # Pěkná akce
    Start-Process -FilePath 'https://www.psconf.eu/'
}
####################################################


####################################################
# Závěr - Kam tedy kráčí PowerShell?
####################################################
# 1. PowerShell (Core) je nový open-source framework
# 2. Windows PowerShell se již nevyvíjí
# 3. Konečná verze Windows PowerShell je 5.1.x
# 4. PowerShell Core je označení pro PowerShell 6.x.x
# 5. PowerShell je označení pro PowerShell 7.x.x a vyšší
# 6. PowerShell má nové paradigma ovládat Linux z Windows a naopak
# 7. Hlavní editor je VS Core + rozšíření PowerShell
# 8a. Zpětná kompatibilita PowerShellu a Windows PowerShellu byla značně zlepšena oproti PowerShell Core
# 8b. Zpětná kompatibilita PowerShellu 7.x.x a PowerShellu 5.1.x byla značně zlepšena oproti PowerShell 6.x.x
# 9. Kompatibilitu skriptů je potřeba pečlivě hlídat
# 10. Nové skripty byste měli psát vůči verzi PowerShellu 7.x.x
####################################################