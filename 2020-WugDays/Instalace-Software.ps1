# Name: Instalace Software ve Windows 10 v roce 20 (Wug Days)
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
- Proměnné se uvazují znakem $.
- WPS => Windows PowerShell verze 5.1.x
- PSC => PowerShell Core => PowerShell 6.x.x
- PS => PowerShell => PowerShell (Core) 7.x.x a vyšší

#>
####################################################


####################################################
# Trocha historie
####################################################
# Začínali jsme hledáním správného, nezavirovaného instalátoru všude možně po internetu
Start-Process -FilePath 'https://www.slunecnice.cz/' # Automatizace prakticky žádná, nevhodné pro praktické každodenní použití

<#
Po cestě jsme dále posbírali:
- Windows Store (AppX balíčky)
- Microsoft Store (AppX balíčky, později i MSIX)
- App Installer (Tool pro sideloading)
- MSIX (next-gen MSI balíčků, předělávka AppX balíčků, která ale asi nikoho moc nezajímá)
- OneGet
- NuGet
- Čokoláda
- Windows Package Manager

#>
Start-Process ms-windows-store:

#...a marasmus instalací dále pokračuje.
# AppX balíčky byly dlouho totální problém, teď už je to jenom problém,
# MSIX balíčky nikoho nezajímají, já osobně je viděl prvně u PS Core,
# u PS už ani nejsou. Windows Store doteď nemá CLI ovládání/automatizaci.
# Dokud jsem nezačal používat Linux/Android, celé mi to přišlo normální.
# Teď mi to přijde spíše k pláči. MS nedokáže pohnout problematiku kupředu,
# znova a znova vymýšlí kolo.
####################################################


####################################################
# MSI
####################################################
<#
MSI je:
- Instalátor pro Windows

MSI není:
- Balíčkovací systém

MSI podporuje:
- Automatizovanou instalaci
- Přidání/odebrání/opravu/úpravu instalace

MSI chybí:
- Hostování balíčků
- Tranzitivní závislosti

#>
Start-Process msiexec '-?'
####################################################


####################################################
# AppX
####################################################
<#
AppX (AppXBundle) je:
- Balíček pro Windows Store
- To, co Store normálně instaluje
- (asi ??? to měl být) nástupce MSI
- Oproti MSI nový formát balíčků, které podporuje ochranu pro "úpravám"
- Matení BFU, protože to nezná

#>
Add-AppPackage -Path MyAppxPackage.appx -Register
Add-AppPackage -Path MyAppxPackage.appx
Get-Command -Module Appx
####################################################


####################################################
# MSIX
####################################################
<#
MSIX je:
- Open-source instalátor pro Windows
- Náhrada za AppX

MSIX není:
- Balíčkovací systém

MSIX podporuje:
- Automatizovanou instalaci
- Přidání/odebrání/opravu/úpravu instalace
- Pouze Win10 1709 a výše
- Různé funkce podle cílového systému (1)
- A tak vůbec, je to v tom hrozný guláš a dobré tak pro Win10 2004 a vyšší

MSIX chybí:
- Hostování balíčků

#>
<# (1) #> Start-Process -FilePath 'https://docs.microsoft.com/en-us/windows/msix/supported-platforms#msix-feature-support'

####################################################


####################################################
# Smutný příběh jménem OneGet
####################################################
<#
OneGet je:
- Správce balíčkovacích systémů pro Windows
- Dobrá myšlenka, tragická realizace
- Open-source
- Prakticky nulový vývoj
- Vyžaduje netriviální konfiguraci pro triviální systémy, např. choco
- Defaultně přítomen v Win10, ale nelze ho bez konfigurace použít.
- V praxi není důvod proč ho používat

#>
Get-Command -Module 'PackageManagement'
Start-Process -FilePath 'https://github.com/OneGet/oneget/wiki/Provider-Requests'
Start-Process -FilePath 'https://github.com/OneGet/oneget'
####################################################


####################################################
# Chocolatey
####################################################
<#
Čokoláda je:
- Správce balíčků a instalátor pro Windows
- Open-source
- Postaven na NuGetu
- Řeší tranzitivní závislosti
- Umožňuje odinstalace software
- Umožňuje přizpůsobení instalace
- Kdokoliv můžeme přidat libovolný balíček
- Balíčky jsou ověřovány automaticky (approved) a schvalovány ručně (trusted)
- Disponuje 2458 balíčky (k 10.10.2020)
- No. 1 balíčkovací systém pro Windows (a v praxi asi jediný použitelný)

#>

# Instalace Čokolády
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Install-Module Choco -Force; ich

# Použití
choco search NÁZEV_BALÍČKU
choco upgrade NÁZEV_BALÍČKU -y

<#
Nejčastější dotazy k Čokoládě z PS kurzů
- Lze to používat i offline?
Ano, lze, Pokud si zaplatíte zrcadlo hlavního repositáře, které umístíte na okraj vnitřní sítě, která do internetu vidí.
Ano, lze pokud si balíčky stáhnete, ale nezaručuje, že se nainstalují.

- Lze aktualizovat hromadně?
Ano, lze choco upgrade all -y

- Co když uživatel aktualizuje verzi ručně?
To chocu vesměs nevadí. Záleží jak je udělaný instalační balíček.

- Jak se řeší přizpůsobení instalace, např. jazyková mutace instalace?
Záleží na balíčku, je dobré si přečíst dokumentaci k balíčku. #RTFM

#>
####################################################


####################################################
# Ninite
####################################################
<#
Ninite je:
- One-click instalátor populárního software
- GUI aplikace
- Obsahuje vyšší desítky software k dispozici
- Částečně zastaralé verze balíčků
 #>
####################################################


####################################################
# Windows Package Manager (winget)
####################################################
<#
WPM je:
- Kopie one-man show open-source projektu AppGet (1,2)
- Open-source
- Na začátku svého vývoje
- Červený hard pro GitHub diskuze nad problematikou instalací ve Windows (3)

WPM není:
- Plnohodnotný správce balíčků (kdo ví, jestli vůbec někdy bude) (4)

#>
<# (1) #> Start-Process -FilePath 'https://keivan.io/the-day-appget-died/'
<# (2) #> Start-Process -FilePath 'https://github.com/microsoft/winget-cli/discussions/223'
<# (3) #> Start-Process -FilePath 'https://github.com/microsoft/winget-cli/issues/407'
<# (4) #> Start-Process -FilePath 'https://www.theverge.com/2020/6/2/21277863/microsoft-winget-windows-package-manager-appget-response-credit-comment'

# Instalace WPM
Start-Process -FilePath 'https://github.com/microsoft/winget-cli/releases'
Start-Process -FilePath 'https://github.com/microsoft/winget-cli/releases/download/v.0.2.2521-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle'

# Použití
winget search visual
winget install powertoys --version 0.15.2
winget show vscode
####################################################


####################################################
# Automatizace instalací ve Windows
####################################################
{
  <# Co se většinou instaluje:
    1) MSI balíčky.
    2) MSIX balíčky.
    3) AppX balíčky
    4) Custom instalace
    #>

  # 1) MSI Balíčky
  $SetupFile = 'C:\MsiInstallers\Test.msi'
  $DataStamp = get-date -Format yyyyMMddTHHmmss
  $logFile = '{0}-{1}.log' -f $SetupFile, $DataStamp
  $MSIArguments = @(
    "/i"
    ('"{0}"' -f $SetupFile)
    "/qn"
    "/norestart"
    "/L*v"
    $logFile
  )
  Start-Process -FilePath "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow

  # nebo při problémech můžeme rovnou vynutit spuštění MSI balíčku.
  Start-Process -FilePath $SetupFile -ArgumentList $MSIArguments -Wait

  # Alternativně
  $installationPath = 'C:\MsiInstallers'
  $SetupFile = 'Test.msi'
  Set-Location -Path $installationPath
  Start-Process -FilePath Msiexec -ArgumentList "/passive /i $SetupFile" -Wait

  # 2) MSIX Balíčky
  Start-Process -FilePath 'https://docs.microsoft.com/en-us/windows/msix/desktop/powershell-msix-cmdlets'

  # Nově lze ovládat pomocí příkazů z modulu AppX, viz níže.

  # 3) Možnost side loadingu, ale není to šťastné řešení.
  Get-Command -Module Appx

  # 4) Ostatní instalace

  # Máme několik možností:
  # I.  Choco - touto možností bychom měli začít.
  # II. Stažení instalace z internetu, zjištění cmd argumentů a přizpůsobení instalace tomuto instalátoru.

  # Instalace Choco balíčku
  {
    function Install-Choco
    {
      Write-Host "Installing Chocolatey..."
      [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12  # No. 1 co je potřeba ohlídat.
      Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

      # No. 2 co je potřeba ohlídat, je pokud instaluje balíček z www.github.com
      # www.github.com je plně běží pod IPv6 a DNS IPv4 nedokáže lokalizovat www.github.com
    }

    function Set-DnsIpV6Servers
    {
      if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process powershell.exe "-ExecutionPolicy Bypass -Command Set-DnsIpV6Servers" -Verb RunAs; exit }

      Get-NetAdapter -Physical |
      Where-Object { $_.Name -notcontains 'hyper' -or $_.Description -notcontains 'hyper' } |
      Set-DnsClientServerAddress -ServerAddresses ("2606:4700:4700::1111", "2606:4700:4700::1001") # Open DNS by CloudFare
    }
  }

  # Instalace Choco balíčků
  choco upgrade firefox -y # atd.

  # Je vhodné vyčlenit každou instalaci do samostatné funkce a sestavit např. instalační modul.
  # Můžeme tím hlouběji ovládat instalace, přistoupit k instalacím a obnově nastavení systematicky.
  # Pokud potřebujeme admin práva pro instalaci dané aplikace, můžeme např. do funkce s názvem 'Install-Firefox' šoupnout zaříkadlo:
  if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process powershell.exe "-ExecutionPolicy Bypass -Command Install-Firefox" -Verb RunAs; exit }

  # Stažení souboru z internetu
  $wc = New-Object System.Net.WebClient
  $wc.DownloadFile('https://cdn.adguard.com/public/Windows/AdGuard.msi', $SetupFile)

  # Skenování přepínačů
  # Pobavilo... aneb lokalizace uživatele na internetu...
  Start-Process -FilePath 'https://www.google.com/search?client=firefox-b-d&sxsrf=ALeKk035serjZHtUR-J59-mJMp0PDgQJDw%3A1588217540083&ei=xEaqXqrYBI7psAeio7voCA&q=Universal+Silent+Switch+Finder+download&oq=Universal+Silent+Switch+Finder+download&gs_lcp=CgZwc3ktYWIQAzIGCAAQBxAeMgYIABAHEB4yBggAEAcQHjIGCAAQBxAeMgUIABDLAToGCCMQJxATOgYIABAIEB46CAgAEAcQHhATUMILWKAOYJsXaABwAHgAgAFViAGBA5IBATWYAQCgAQKgAQGqAQdnd3Mtd2l6&sclient=psy-ab&ved=0ahUKEwiqyrWym4_pAhWONOwKHaLRDo0Q4dUDCAs&uact=5'
  Start-Process -FilePath 'https://www.google.com/search?q=Universal+Silent+Switch+Finder'

  # Aktualizace PATH za běhu konzole
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

  # Spuštění obecné instalace
  Start-Process -FilePath $PathToSetupFile -ArgumentList "/SILENT /InstallPath=C:\ProgramData" -Wait
  Start-Process -FilePath $PathToSetupFile -ArgumentList "/SILENT", "/InstallPath=`"C:\ProgramData`"" -Wait # ArgumentList přebírá string[]

  # Skrze PowerShell
  Start-Process -FilePath powershell -ArgumentList "" -Wait # Možnosti předání cmd argumentů viz nápověda na následujícím odkazu:
  Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/About/about_PowerShell_exe?view=powershell-5.1'
  # U předávání cest k ps1 souborů, je nutné je uzavřít do dvojitých uvozovek.

  # Pro obnovu nastavení můžeme použít klasické cmdlety pro práci se soubory:
  Get-Command -Noun Item

  # Pro import nastavení registrů můžeme registry editovat buď opět přes cmdlety k tomu určené...
  Get-Command -Noun Item
  Get-Command -Noun ItemProperty

  # nebo importovat zálohu reg souboru
  reg import "$PathToRegFileBackup" # Pozor! Regedit musí být nejprve spuštěn v GUI módu, aby fungoval správně.
  Start-process regedit -Verb runAs -Wait # Po zavření aplikace bude fungovat import správně.

  # Specialita: Instalace aplikace z admin uživatele bez admin práv
  {
    $storeSpotify = Get-AppxPackage -Name *spotify*
    if ($storeSpotify)
    {
      $storeSpotify | Remove-AppxPackage
    }
    $spotifyDefaultPath = "$env:APPDATA\Spotify\Spotify.exe"
    if ($spotifyDefaultPath | Test-Path)
    {
      Start-Process -FilePath "$env:APPDATA\Spotify\Spotify.exe" -Wait
      Get-Process -Name *spotify* | Stop-Process -Force
      Start-Process -FilePath "$env:APPDATA\Spotify\Spotify.exe" -ArgumentList '/UNINSTALL', '/SILENT' -Wait
    }
    if (Get-Package -Provider Programs | Where-Object { $_.Name -contains 'spotify' } )
    {
      throw 'Spotify wasn''t uninstalled.'
    }

    $apppath = "powershell.exe"
    $taskname = 'Spotify install'
    $action = New-ScheduledTaskAction -Execute $apppath -Argument "-Command & `'$env:OneDriveConsumer\PC\6 - Multimédia (MPC HC VLC Kodi Spotify)\spotify-1-0-80-474.exe`'"
    $trigger = New-ScheduledTaskTrigger -Once -At (Get-Date)
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskname
    Start-ScheduledTask -TaskName $taskname
    Start-Sleep -Seconds 2
    Wait-Process -Name *spotify-1-0-80-474* # Tady se mám PowerShell zastaví, dokud se tato aplikace neukončí.
  }

  # Zjištění nainstalovaných programů, které se hlásí v Programy Přidat/odebrat programy
  Get-Package -Provider Programs

  # Zjištění všech nainstalovaných komponentů
  Get-WmiObject -Class Win32_Product | Format-Table
  # (POZOR NEZBEZPEČÍ VEDLEJŠÍCH ÚČINKŮ)
  Start-Process -FilePath 'https://xkln.net/blog/please-stop-using-win32product-to-find-installed-software-alternatives-inside/'
  # Právně takto:
  function Get-InstalledApplications()
  {
    [cmdletbinding(DefaultParameterSetName = 'GlobalAndAllUsers')]

    Param (
      [Parameter(ParameterSetName = "Global")]
      [switch]$Global,
      [Parameter(ParameterSetName = "GlobalAndCurrentUser")]
      [switch]$GlobalAndCurrentUser,
      [Parameter(ParameterSetName = "GlobalAndAllUsers")]
      [switch]$GlobalAndAllUsers,
      [Parameter(ParameterSetName = "CurrentUser")]
      [switch]$CurrentUser,
      [Parameter(ParameterSetName = "AllUsers")]
      [switch]$AllUsers
    )

    # Explicitly set default param to True if used to allow conditionals to work
    if ($PSCmdlet.ParameterSetName -eq "GlobalAndAllUsers")
    {
      $GlobalAndAllUsers = $true
    }

    # Check if running with Administrative privileges if required
    if ($GlobalAndAllUsers -or $AllUsers)
    {
      $RunningAsAdmin = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
      if ($RunningAsAdmin -eq $false)
      {
        Write-Error "Finding all user applications requires administrative privileges"
        break
      }
    }

    # Empty array to store applications
    $Apps = [System.Collections.Generic.List[Object]]::new()
    $32BitPath = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
    $64BitPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"

    # Retrieve globally installed applications
    if ($Global -or $GlobalAndAllUsers -or $GlobalAndCurrentUser)
    {
      Write-Host "Processing global hive"
      $Apps.AddRange((Get-ItemProperty "HKLM:\$32BitPath"))
      $Apps.AddRange((Get-ItemProperty "HKLM:\$64BitPath"))
    }

    if ($CurrentUser -or $GlobalAndCurrentUser)
    {
      Write-Host "Processing current user hive"
      $Apps.AddRange((Get-ItemProperty "Registry::\HKEY_CURRENT_USER\$32BitPath"))
      $Apps.AddRange((Get-ItemProperty "Registry::\HKEY_CURRENT_USER\$64BitPath"))
    }

    if ($AllUsers -or $GlobalAndAllUsers)
    {
      Write-Host "Collecting hive data for all users"
      $AllProfiles = Get-CimInstance Win32_UserProfile |
      Select-Object LocalPath, SID, Loaded, Special |
      Where-Object { $_.SID -like "S-1-5-21-*" }
      $MountedProfiles = $AllProfiles | Where-Object { $_.Loaded -eq $true }
      $UnmountedProfiles = $AllProfiles | Where-Object { $_.Loaded -eq $false }

      Write-Host "Processing mounted hives"
      $MountedProfiles | ForEach-Object {
        $32bit = Get-ItemProperty -Path "Registry::\HKEY_USERS\$($_.SID)\$32BitPath"
        $64bit = Get-ItemProperty -Path "Registry::\HKEY_USERS\$($_.SID)\$64BitPath"
        if (![Object]::Equals($32bit, $null))
        {
          $Apps.AddRange($32bit)
        }
        if (![Object]::Equals($64bit, $null))
        {
          $Apps.AddRange($64bit)
        }
      }

      Write-Host "Processing unmounted hives"
      $UnmountedProfiles | ForEach-Object {

        $Hive = "$($_.LocalPath)\NTUSER.DAT"
        Write-Host " -> Mounting hive at $Hive"

        if (Test-Path $Hive)
        {
          REG LOAD HKU\temp $Hive
          $32bit = Get-ItemProperty -Path "Registry::\HKEY_USERS\temp\$32BitPath"
          $64bit = Get-ItemProperty -Path "Registry::\HKEY_USERS\temp\$64BitPath"
          if (![Object]::Equals($32bit, $null))
          {
            $Apps.AddRange($32bit)
          }
          if (![Object]::Equals($64bit, $null))
          {
            $Apps.AddRange($64bit)
          }

          # Run manual GC to allow hive to be unmounted
          [GC]::Collect()
          [GC]::WaitForPendingFinalizers()

          REG UNLOAD HKU\temp

        }
        else
        {
          Write-Warning "Unable to access registry hive at $Hive"
        }
      }
    }

    Write-Output $Apps
  }

  # Klasické schéma instalace aplikace
  # 1) Získat balíček (Choco, stáhnout z internetu, sítě...)
  # 2) Zkontrolovat předpoklady (stažení, funkčnost instalace služby, přítomnost redistribučních balíčků, pokud jsou potřeba, odinstalace předchozí verze pokud je nutná)
  # 3) Zjistit přepínače tiché instalace.
  # 4) Nadefinovat spuštění aplikace
  # 5) Kontrola výsledků, např. kontrola souborů, registrů atd.
  # 6) Kopie nastavení
}
####################################################


####################################################
# Závěr
####################################################
# 1. Ani v roce 2020 se situace okolo instalací software příliš nelepší
# 2. Jediné použitelné CLI pro Windows je Choco
# 3. OneGet je mrtvý projekt
# 4. Windows Package Manager je tak 2 roky vývoje od použitelné verze v praxi #IMHO
####################################################