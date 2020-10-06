# Name: Amenit Days přednáška
# author: Radek Zahradník (radek tečka zahradnik zavináč msn tečka com)
# Date: 2020-10-01
# Version: 1.0
# Purpose: This script is replacement for PowerPoint presentation.
##########################################################################


####################################################
# Představení přednášejícího
####################################################
Start-Process -FilePath 'www.radekzahradnik.cz/bio'
# .NET programátor
# Lektor
# Nadšenec PowerShellu
####################################################


####################################################
# Pro začátek je dobré vědět následující...
####################################################
<# I will always remember
- PowerShell NeNí CaseSensitive.
- Příkazy PowerShellu se nazývají cmdlety nebo funkce, není to to samé a je vhodné to rozlišovat.
- PowerShell se rozšiřuje do šířky pomocí modulů.
- | není svislítko, ale roura, alias pipeline, alias operátor zřetězení.
  Když se to neumí zřetězit, je to PowerScript, ne PowerShell.
- Proměnné se uvazují znakem $.
- WPS => Windows PowerShell
- PSC => PowerShell Core => PowerShell 6.x
- PS => PowerShell => PowerShell (Core) 7.x a vyšší
#>
# PS v1.0 .. v5.1 => 10 let
# PS v1.0 obsahoval cca 120 cmdletů.
# PS v2.0 obsahoval cca 240 cmdletů.
# ps V5.1 obsahuje...
Write-Host ("Total number of commands: " + (Get-Command).Count)
Get-Module -ListAvailable
Get-Command * | Measure-Object # pro porovnání obou verzí
####################################################


####################################################
# Co je Powershell?
####################################################
<# Otázka pro publikum: Co je podle vás PowerShell?

Odpovědi, které nejčastěji slyším:
- Lepší příkazový řádek.
- Modrá příkazová řádka.
- Skriptovací jazyk.
- Skriptovací jazyk, co umožňuje opakovatelnost.
- Nové terminálové prostředí.
- Best of: "Nejlepší hackovací nástroj, co znám." (Disclaimer: Kali Linux neznal.)

#>
<# Co to tedy je?

# Česká wiki: PowerShell je rozšiřitelný textový shell se skriptovacím jazykem od společnosti Microsoft založený na .NET Frameworku.
- Poněkud zjednodušené.
- Zavádějící.

# Anglická wiki: PowerShell is a task automation and configuration management framework from Microsoft,
consisting of a command-line shell and associated scripting language.
- Obecnější, ale "trefná" definice.
- Vypadlo nám informace o ".NET Frameworku".

# Dobrá, dobrá a jak se to tedy má?
PowerShell je framework primárně pro automatizaci a správu IT založený na textovém terminálu a stejnojmenném skriptovacím jazyce,
který umožňuje rozšiřitelnost nad rámec původního záměru. Třeba ten hacking...
To jsme si řekli A, teď si ještě říci B...

#>
####################################################


####################################################
# Windows PowerShell vs. PowerShell (Core)
####################################################
# V čem je hlavní rozdíl?
<#
Windows PowerShell  => Windows only
PowerShell Core     => Multiplatformní (Windows, Linux, MacOS, ARM)
PSC není náhrada za WPS !!! (zatím)
#>

# Jak poznám, jaký PowerShell mám?
<#
# Windows PowerShell se verzoval od 1.x do 5.1.x
# PowerShell Core se verzuje od 6.x
#>
$PSVersionTable.PSVersion  # Zabudovaná proměnné, pouze od 5.x
$PSVersionTable.PSVersion.Major # Cokoliv většího než 5 je Core  # Zabudovaná proměnné
$PSEdition # Zabudovaná proměnná, Desktop => Windows, Core => Core
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
Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-pohledem-dotNET-programatora/blob/master/Images/PowerShell%20Windows%20DLL%20dependency.png'
Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-pohledem-dotNET-programatora/blob/master/Images/PowerShell%20Core.png'
Start-Process -FilePath 'https://4sysops.com/wiki/differences-between-powershell-versions/'
Start-Process -FilePath 'https://github.com/PowerShell/PowerShell/tags'
####################################################


####################################################
# Kde a jak začít?
####################################################
Start-Process -FilePath 'https://github.com/PowerShell/PowerShell' # 1. výsledek pokud zadáte do Google: PowerShell Core
Start-Process -FilePath 'https://github.com/janikvonrotz/awesome-powershell' # Pěkný GithHub rozcestník.
Start-Process -FilePath 'https://www.psconf.eu/' # Pěkná akce
####################################################


####################################################
# Jakou verzi použít?
####################################################
<#
PowerShell Core sleduje stejnou praxi jako .NET Core.
Existují Long-Term-Support (LTS) verze, které mají 3 roky podporu.
Verze 7.0.x byla první LTS verzí pro PowerShell.
#>
Start-Process -FilePath 'https://docs.microsoft.com/en-us/lifecycle/policies/modern'
Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/scripting/powershell-support-lifecycle?view=powershell-7'
####################################################


####################################################
# Editory
####################################################
<# OK, PS Core je kúl, ale v čem to tedy budeme bouchat?
- VS Code (a nemá smysl se bavit o ničem jiném)
#>
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
Write-Host "Installing VS Code..."
Start-Process powershell { choco upgrade vscode -y } -Wait
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
Start-Process powershell { code }
Write-Host "VS Code installed."
####################################################


####################################################
# Jak PS (Core) vlastně funguje?
####################################################
<# Klíčové koncepty:

Před vznikem Windows PowerShellu si asi někdo řekl:
"Pojďme vzít to, co funguje, ale udělejme to pořádně."
"S dokumentací..."
"...kterou navíc budeme aktualizovat, když něco změníme."
"In your face, Linux!"
A pak si asi řekli:
"Jsou to taky lidi, pojďme jim pomoci. Uděláme to i pro Linux."

Windows PowerShell  => Postaven na .NET Framework
PowerShell Core     => Postaven na .NET Core
PowerShell          ´> Postaven na .NET (5, 6,...)

CMD && UNIX => textový vstup | výstup
PS => Objektový vstup | výstup

Jelikož PS úzce spoléhá na .NET, je postaven objektově.
Klíčový je koncept roury, která umožňuje snadné zřetězení programů.
Tento koncept zůstal zachován i v nové verzi PS.
#>
####################################################


####################################################
# V čem je PSC jiný a na co si dát pozor při
# přechodu z WPS
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
Start-Process -FilePath pwsh -ArgumentList "-NoLogo -NoProfile -Command &{Write-Error 'asdf';Get-Error}" -NoNewWindow

$ErrorView = 'NormalView' # Starý způsob alá WPS5
$ErrorView = 'ConciseView' # Nový způsob alá PSC

# Nová složka v dokumentech
Invoke-Item "$env:USERPROFILE\onedrive\Dokumenty\PowerShell"

# Nová domovská cesta
powershell -NoLogo -NoProfile -Command '$PSHOME'
pwsh -NoLogo -NoProfile -Command '$PSHOME'

# Nové uložiště modulů
powershell -NoLogo -NoProfile -Command '$env:PSModulePath -split '';'''
pwsh -NoLogo -NoProfile -Command '$env:PSModulePath -split '';'''

# Podpora modulů
## Většina modulů z WPS v PS již funguje a pokud ne...
Import-Module OpenHere -UseWindowsPowerShell # Vytvoří proxy modul, který deleguje PSC volání do WPS.

# PS Remoting skrze SSH
## Jednodušší připojení v případech mimo AD.
## Mohu použít jakýkoliv SSH klient.
Start-Process -FilePath "https://4sysops.com/archives/enable-powershell-core-6-remoting-with-ssh-transport/#enabling-ssh-for-powershell-on-the-host"


# Paralelní zpracování pro ForEach-Object
'Security','Application','System' | ForEach-Object -Parallel {Get-WinEvent -LogName $_ -MaxEvents 1000 } -ThrottleLimit 5

# Nativní příkazy
## Snaha o "vygenerování" nativních příkazů PS pro existující utility jako kubectl, docker, git, netsh, net...
## Místo obalování volání jedlových utilit automaticky vygenerovat syntaxi PowerShellu a nápovědu, která je
## v souladu se současnými standardy.

# Syntaktické změny

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

# Chuťovky z praxe
## UTF8 BOM a NoBOM
pwsh -NoLogo -NoProfile -Command { "abc" | Out-File "$env:USERPROFILE\TestPSC.txt" -Encoding utf8 } # Výsledek je UTF8NoBOM => Nežádoucí.
powershell -NoLogo -NoProfile -Command { "abc" | Out-File "$env:USERPROFILE\TestWPS.txt" -Encoding utf8 } # Výsledek je UTF8BOM

## Chování FileInfo objektu na WPS a PS
[System.IO.FileInfo]$path = "$env:USERPROFILE\test.txt"
Get-Content -Path $Path             # V PS je výsledek korektní předání celé cesty, na WPS viz další řádek.
Get-Content -Path $path.FullName    # Kompatibilní chování mezi PS a WPS.

# Mimo soutěž - Windows Terminal
wt
####################################################


####################################################
# Jak zajistit běh v PSC?
####################################################
# Magické zaříkávadlo
if ($PSEdition -eq 'Desktop') { Start-Process pwsh.exe "-ExecutionPolicy Bypass -File `"$PSCommandPath`""; exit }
####################################################


####################################################
# Co nejlepší první krok s PS?
####################################################
{
    # Jednoduchá odpověď...
    Get-Help # Získáme nápovědu o nápovědě. Jediné, co je potřeba si opravdu pamatovat.

    # PS používá dva druhy nápovědy
    <# 1. #> Get-Help Get-Member # Nápověda pro konkrétní cmdlet. Je obsažena v kódu a formu si ukážeme později na příkladu.
    <# 2. #> Get-Help about_operators
    Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7'
}
####################################################


####################################################
# Závěr
####################################################
# 1. Windows PowerShell se již nevyvíjí.
# 2. Konečná verze Windows PowerShell je 5.1.x
# 3. PowerShell Core je označení pro PowerShell 6.x.x
# 4. PowerShell je označení pro PowerShell 7.x.x a vyšší
# 5a. Zpětná kompatibilita PowerShellu a Windows PowerShellu byla značně zlepšena oproti PowerShell Core
# 5b. Zpětná kompatibilita PowerShellu 7.x.x a PowerShellu 5.1.x byla značně zlepšena oproti PowerShell 6.x.x
# 6. Nové skripty byste měli psát vůči verzi PowerShellu 7.x.x
####################################################