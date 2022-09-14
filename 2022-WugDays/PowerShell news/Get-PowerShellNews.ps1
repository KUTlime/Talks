<# PS vydání

v7.1.0 RC1	| Září  	2020 	| PowerShell    		| .NET 5.0-RC1
v7.2.0  	| Listopad 	2021 	| PowerShell    		| .NET 6.0.100-rtm.21527.11
v7.3.0 PR1 	| Prosinec 	2021 	| PowerShell    		| .NET 6.0.100-rc.1.21458.32
v7.2.6  	| Srpen  	2022 	| PowerShell    		| .NET 6.0.8
v7.3.0 PR7	| Srpen  	2022 	| PowerShell    		| .NET 7.0.100-preview.7.22377.5

#>
#####################################################################################

# Co nového - The PS style
Install-Module -Name Microsoft.PowerShell.WhatsNew
Get-Command -Module WhatsNew
Get-WhatsNew
#####################################################################################


<# Jak jsme na tom s chybami?

V roce 2020 jsme měli 2638 nahlášených chyb, 5535 zavřených a 91 otevřených PR, 5304 zavřených PR.
V roce 2022 jsme měli 3192 nahlášených chyb, 7221 zavřených a 79 otevřených PR, 6871 zavřených PR.
Za        2 roky    o  554 více        chyb, 1686 zavřených chyb v mezidobí   , 1567 zavřených PR v mezidobí.

#>
#####################################################################################

<# PS 7.2.0

- LTS verze (Long-Term Support)
- Podpora ARM64 pro Windows/macOS, ARM64 & 32 pro Debian a Ubuntu
- Integrace s Windows Update
  (netřeba už ručně aktualizovat, WU už aktualizuje PS sám)
- Tichá instalace PS z MSI automaticky registruje PS do WU
  (musíme aktivně vypnout, pokud nechceme)
- Nová univerzální instalace pro Linux distribuce
- Vylepšené TAB našeptávání
- Separace DSC mimo PS 7 pro oddělení vývoje
- PSCultureInvariantReplaceOperator už není experimentální
  (-replace operátor je kulturně invariantní)
- Nová experimentální fíčura PSNativeCommandArgumentPassing
  (více za chvíli)
- PSReadLine od verze 2.1 získala prediktivní IntelliSense
- Podpora pro vykreslování barev ANSI FileInfo

#>

<# PS 7.3.0

- Většinou opravy chyb
- Postaveno na .NET 7.0
  (rychlejší runtime)
- Nově přidán clean block
  (takže máme begin, process, end, clean).
- Nový přepínač -StrictMode pro Invoke-Command
  (takže můžeme jednoduše vynutit striktní chování PS pro konkrétní příkaz)
- Při zpracování chyb opraveno chování $?
  (status posledního volaného příkazu) při přesměrování,
  dále nativní příkazy respektují nastavení ErrorActionPreference.
- Pro vzdálené sezení skrze SSH máme možnost přidat rovnou Options
  (Invoke-Command, Start-PSSession, End-PSSession),
  dále nový parameter ConfigurationFile u pwsh, ať můžeme přidat rovnou konfiguraci sezení uloženou v *.pssc souboru
  (lze nahrát konfiguraci napřímo),
  konfigurační soubory pro sezení můžeme generovat na jiných, než Windows platformách
  (New-PSSessionConfigurationFile nevrací chybu při použití např. na macOS).

#>
# Jak se nám posunuli experimentální fíčury?
Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/scripting/learn/experimental-features?view=powershell-7.3#available-features'

# PSNativeCommandArgumentPassing - experimentální fíčura pro obarvení
Get-ExperimentalFeature
Enable-ExperimentalFeature -Name:PSNativeCommandArgumentPassing
pwsh # Potřebujeme nové sezení
Get-ExperimentalFeature
$PSNativeCommandArgumentPassing = 'Legacy'
$PSNativeCommandArgumentPassing = 'Standard'
$PSNativeCommandArgumentPassing = 'Windows'
Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/scripting/learn/experimental-features?view=powershell-7.3#psnativecommandargumentpassing'

# PSAnsiRenderingFileInfo - experimentální fíčura pro obarvení výstupu FileInfo
Get-ExperimentalFeature
Enable-ExperimentalFeature -Name:PSAnsiRenderingFileInfo
pwsh # Potřebujeme nové sezení
Get-ExperimentalFeature
Get-ChildItem
$PSStyle.FileInfo
#####################################################################################


# PSReadLine - module pro našeptávání z historie zadávání
Install-Module -Name PSReadLine -Force
Import-Module -Name PSReadLine # Ideálně do profilu, abychom měli vždy dostupné
Set-PSReadLineOption -PredictionSource History # Od v2.2.6 již nemusíme, nastaveno automaticky
# Nastavení listování v historii, funguje standardně pro prázdný řádek, jinak v historii zadávání.
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
#####################################################################################

<# Crescendo - modul pro generování PS příkazů (modulů) pro obalení nativních utilit

- Po 2 letech stále ve fázi vývoje, těžko říci v jaké fázi, ale použít se dá.
- Aktuálně verze 1.1.0
- O nějaké automatizaci si můžeme nechat jenom zdát.
- Generování skrze schématický JSON, ze kterého se vyrobí PS modul.
- Potřeba velká míra ruční práce na tvorbu schématu.

#>
$rootPath = Resolve-Path -Path ([string]::IsNullOrWhiteSpace($PSScriptRoot) ? $PWD : $PSScriptRoot) -Relative
$examplePath = Get-ChildItem -Path $rootPath -Recurse -File -Filter '*.ps1' | Where-Object {$_.FullName -match 'Crescendo'} | Select-Object -ExpandProperty FullName
code $examplePath

# Dobrý příklad pro pochopení jak to funguje
Start-Process -FilePath 'https://github.com/adamdriscoll/sysinternals'

# Celé schéma
Start-Process -FilePath 'https://raw.githubusercontent.com/PowerShell/Crescendo/master/Microsoft.PowerShell.Crescendo/schemas/2021-11'
#####################################################################################

<# Microsoft.PowerShell.Archive - nová verze (v2) pro práci s archívy v PS

- Přepsán do C#
- Podpora tar (dáno .NET 7)
- Podpora zip64 formátu
- Lepší podpora zástupných znaků
- Na platformě nezávislé cesty
- Celkově interoperabilita mezi systémy

#>
Start-Process -FilePath 'https://www.powershellgallery.com/packages/Microsoft.PowerShell.Archive/'
#####################################################################################

<# PowerShellGet - modul pro instalaci modulů

- Ekosystém PowerShellu se opírá o řadu modulů (vertikální rozšiřování),
  které je potřeba spolehlivě spravovat.
- PowerShellGet 2.x.x.x napsán v PS, na prasáka.
- PowerShellGet 3.x.x.x napsán v C#, ale taky docela na prasáka.
- PSGet v3 je stále po dvou letech v betě (17 beta verzí !!!)
- PSGet v3 stále neakceptuje oficiálně příspěvky komunity.

#>
#####################################################################################


<# PowerShell rozšíření pro VS Code

- V květnu 2022 velké a dlouho očekávané rozšíření.
- Prakticky kompletní reengineering backendu rozšíření.
- Zaměřeno především na výkon.
- Vyřešeny problémy s vlákny a souběžností při zpracování skriptu.
- Významně posílena stabilita debuggeru.
- Spouštění PS roury podporuje řazení a zrušení úkolů.
  (takže lze řešit priority, zrušení požadavku a pokračování atd.)
- Opravena celá řada bugů při použití ReadKey, hlavně na macOS & Linux.
- Rozšířeno použití třídy PSHost, kde to šlo.
  (konzistentnější chování hostitele mezi ve VS Code a mimo něj)
- Značně vylepšena logika doplňování kódu.
- Snippety mají více barev, lépe se čtou.
- Samotný kód snippetů aktualizován.
- Položky slovníku jsou při ladění zobrazeny jako klíč/hodnota, ne jako kolekce
- Podpora ladění ostatních PS procesů
- Zrychleno formátování kódu

#>
#####################################################################################


<# winget - Windows Package Manager CLI (aka winget aka Choco od MS aka soumrak Chocolatey Choco od MS)

- Integrován ve Windows 11
- Integrován v modernějších verzích Windows 10
  (dokumentace mlčí o tom, co je modernější verze W10)
- Aktualizován skrze Windows Update
- Aktuálně přes 3700 balíčků
- Chybí statistiky stažení pro lepší katalog
- Přepínače jsou trochu více užvaněné
- Přizpůsobení skrze JSON (winget settings)
- Podpora pro privátní repositáře
- Podrobné logování skrze "--verbose-logs"

#>
# Nejlepší katalog
Start-Process -FilePath 'https://winstall.app/'
# Co můžeme nastavit
Start-Process -FilePath 'https://aka.ms/winget-settings'
# Co stačí umět pro winget
winget search 'vscode' --accept-source-agreements
winget upgrade --all --accept-package-agreements --accept-source-agreements
#####################################################################################

<# Windows Terminál - terminál, který můžete mít opravdu rádi

- Celkově velice stabilní, svižný a bez nějakých fuckupů
- Nově pouze Terminál (alespoň na GitHubu)
- Kompletní podpora pro aktivní hyperlinky (v1.5)
- Nastavení má UI (!!!) + mezitím několikanásobně předěláno
  (Pozor! Ne všechno nastavení má UI, dost věcí stále skrze JSON.)
- Lepší možnosti práce s fokusem oken a panelů
  (Možnost vizuálně odlišit nefokusovaný panel v okně.)
  (Automatický focus na panel pod myší.)
- Nový Quake mode (Win + `)
- V nastavení možno rovnou přidat nový profil
- Panely můžeme prohazovat, rozdělovat záložky, přesouvat na nový panel a zpět
  (příkazy Move, swap)
- Minimalizovat do systémové lišty
- Možnost přidat nové akce (v nastavení WT)
- Obnovení předchozích oken (v1.12)
- Výběr výchozího terminálu na úrovni systému (v1.12)
- Nové, hezčí rozhraní pro nastavení (v1.13)
- Automatické povýšení práv u profilu (v1.13)
- Přizpůsobení zvuku zvonku (v1.13 Preview)
  (můžeme přidat hned několik zvuků, WT náhodně přehraje nějaký z nich)
- Nové možnosti výběru textu klávesnicí (v1.15 Preview)

#>
# Témata pro fajnšmejkry
Start-Process -FilePath 'https://terminalsplash.com/'