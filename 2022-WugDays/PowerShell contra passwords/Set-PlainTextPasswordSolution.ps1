$mySecret = 'JP-a9\bq7}cL@9q7Sh8v' # <-- Potřebujeme se tady zbavit toho hesla v plaintextu
$rootPath = Resolve-Path -Path ([string]::IsNullOrWhiteSpace($PSScriptRoot) ? $PWD : $PSScriptRoot) -Relative
$assetPath = Get-ChildItem -Path $rootPath -Recurse -Directory -Filter 'assets' | Where-Object {$_.FullName -match 'password'}
# Nutná funkce pro integrační test
function Send-VerificationEmail
{
    param (
        # Parameter help description
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Secret
    )

    process
    {
        $userName = 'wug-test-2022@seznam.cz'
        $password = $Secret | ConvertTo-SecureString -AsPlainText -Force
        $credentials = New-Object System.Management.Automation.PSCredential($userName, $password)
        Send-MailMessage -From $userName -To 'radek.zahradnik@msn.com' -Subject 'Verification' -Body 'It works.' -SmtpServer 'smtp.seznam.cz' -UseSsl -Port 587 -Credential $credentials -WarningAction:SilentlyContinue
        Write-Host -Message 'The email has been send.' -ForegroundColor:Green
    }
}

# Definice problému - moje tajemství je definováno někde nahoře v plaintextu
Send-VerificationEmail -Secret $mySecret
# a) Víme, že ho musíme dostat mimo skript.
# b) Ideálně zašifrovat, ať není v plaintextu.

# Začneme s naivními řešeními...
#####################################################################################

#...ale nejprve nutná teorie na začátek

# Co je SecureString a k čemu je dobrý
'Ahoj WUGu!' | ConvertTo-SecureString -AsPlainText -Force # Nic nevrací, zcela schválně
'Ahoj WUGu!' | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString # Vrací smetí, zcela schválně. Tohle můžeme reálně někam uložit, popř. použít v našich skriptech.
[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR(('Ahoj WUGu!' | ConvertTo-SecureString -AsPlainText -Force)))
[pscredential]::new('user', ('Ahoj WUGu!' | ConvertTo-SecureString -AsPlainText -Force)).GetNetworkCredential().Password

# A k čemu je vlastně dobrý? Jak se to vezme...
Start-Process -FilePath 'https://github.com/dotnet/platform-compat/blob/master/docs/DE0001.md'

#...obecně vzato k tomu, aby se nám neválel string jen tak v paměti.
# Zachrání vás to před BFU. To je asi tak vše.

# Čtení od uživatele
Read-Host -AsSecureString

# macOS & Linux vsuvka
Start-Process -FilePath (Join-Path -Path $assetPath -ChildPath 'SecureString on macOS.png') # Nejsou ty hodnoty nějaké podezřelé?

# Zkusme si udělat funkci se parametrem "Password"

# K čemu slouží PSCredential
$credentials = [pscredential]::new('user', ('heslo v plaintextu' | ConvertTo-SecureString -AsPlainText -Force))
$credentials = [pscredential]::new('user', (Read-Host -AsSecureString))
$credentials = New-Object -TypeName ([pscredential]) -ArgumentList 'user', (Read-Host -AsSecureString)
$credentials = Get-Credential -UserName 'Doména\Administrator' -Message 'Bez hesla to nepůjde...' -Title 'Titulek funguje jenom v PowerShell, ne WPS.'
#...k uchování pověření, k účtu, emailu...

Get-Help ConvertFrom-SecureString -Online
Get-Help ConvertTo-SecureString -Online
Get-Help Get-Credential -Online

# A teď zpátky k tématu přednášky. Začneme naivními řešeními...
#####################################################################################

# Vstupní hodnota skriptu

# Na začátek skriptu vložíme blok param()
# Poznámka: Aby PS neřval, supluji to {}
$script = {
    param (
        [Parameter(Mandatory)]
        [string]
        $Secret
        )
        Send-VerificationEmail -Secret $Secret
    }
Invoke-Command -ScriptBlock $script -ArgumentList $mySecret

<# (Ne)Výhody

+ Mimo skript
+ Nikdo se k hodnotě nedostane
+ 0 Kč
+ Je multiplatformní řešení
- Lze obejít při úspěšném ladění, ale to nelze předpokládat
#>
#####################################################################################

# Systémová proměnná

## Permanentní nastavení
[Environment]::SetEnvironmentVariable('MySecret', $mySecret, [EnvironmentVariableTarget]::User)

# Pro aktuální řešení
$env:MySecret = $mySecret
[Environment]::SetEnvironmentVariable('MySecret', '', [EnvironmentVariableTarget]::User) # Smazání

# Použití
Send-VerificationEmail -Secret $env:MySecret

<# (Ne)Výhody

+ Mimo skript
+ Jiní uživatelé téhož počítače se k hodnotě nedostanou (asi, někde ta hodnota být uložena musí)
+ 0 Kč
- Není multiplatformní řešení
- Člověk s přístupem k účtu se dostane i k proměnné
- Lze obejít při ladění
#>
#####################################################################################

# Soubor (někde) na souborovém systému

# Jednorázový export
$settingsFilePath = Join-Path -Path $assetPath -ChildPath 'Settings.json'
@{Secret = $mySecret} | ConvertTo-Json | Out-File -FilePath $settingsFilePath -Encoding:unicode

# Použití
$setting = Get-Content -Path $settingsFilePath -Raw | ConvertFrom-Json
Send-VerificationEmail -Secret $setting.Secret
# Teď je na nás, kam soubor dáme. Čím kreativnější člověk bude, tím horší to bude zjistit.

<# Nějaké nápady:

- Síťové úložiště
- USB klíč
- Spojení systémové proměnné a souboru dohromady.
  (část hesla v souboru, část v proměnné)
- Soubor jako mezivrstva, kde bude jenom umístění souboru s heslem.
  Skript 1 ví, kde je soubor s heslem/hesly.
  Skript 1 vytvoří soubor PathToSecret.txt a zapíše cestu k souboru s heslem/hesly.
  Skript 1 spustí Skript 2.
  Skript 2 si přečte z PathToSecret.txt cestu k heslům a načte hesla do paměti.
  Skript 2 udělá, co má a skončí.
  Skript 1 smaže PathToSecret.txt a skončí.
#>

<# (Ne)Výhody

+ Mimo skript
+ Jiní uživatelé téhož počítače se k hodnotě nedostanou (asi, někde ta hodnota být uložena musí)
+ I při kompromitování účtu se nemusí nutně kompromitování hesla
+ Multiplatformní řešení
+ 0 Kč
- Člověk s přístupem k účtu se může dostat i k proměnné
- Lze obejít při úspěšném ladění
#>

# A teď něco méně kreativního, ale více bezpečnějšího...
#####################################################################################

# PS SecretManagement

# Instalace potřebných modulů
Install-Module Microsoft.PowerShell.SecretManagement, Microsoft.PowerShell.SecretStore -PassThru | Import-Module

# S čím si můžeme hrát
Get-Command -Module Microsoft.PowerShell.SecretManagement, Microsoft.PowerShell.SecretStore

# V základu žádné trezory k dispozici nejsou
Get-SecretVault

# Musíme si je zaregistrovat k použití
Register-SecretVault -Name SecretStore -ModuleName Microsoft.PowerShell.SecretStore -DefaultVault

# Když se podíváme na konfiguraci...
Get-SecretStoreConfiguration
# ...zjistíme, že potřebujeme nějaké heslo k trezoru jako takovému.
# Tím pádem jsme tam, kde jsme byli, teda vlastně ještě hůř.

# Uložíme tajemství
Set-Secret -Name 'MySecret' -Secret $mySecret -Vault:SecretStore -Metadata @{EmailProvider = 'Seznam.cz'; TypeOfSecret = 'PlainTextPassword'}

# Ověříme skrze výpis me
Get-SecretInfo | Select-Object -Property Name, Metadata
Get-SecretInfo | Select-Object -ExpandProperty Metadata

# Použití
Send-VerificationEmail -Secret (Get-Secret -Name 'MySecret' -AsPlainText)

# Pro automatizaci, mohu na začátku odemknout trezor
Unlock-SecretStore -Password $secureString

# Trezor můžu překonfigurovat na hogofogo úložiště tajemství pod daným uživatelským účtem
Set-SecretStoreConfiguration -Scope:CurrentUser -Authentication:None -Interaction:None -Password ('123456' | ConvertTo-SecureString -AsPlainText -Force)

# Můžu pouze vypnout výzvy na zadání hesla. Pokud bude potřeba zadat heslo, skončí to s chybou
Set-SecretStoreConfiguration -Scope:CurrentUser -Interaction:None -Password ('123456' | ConvertTo-SecureString -AsPlainText -Force)

<# Co můžeme uložit do trezoru?
- byte[]
- string
- SecureString
- PSCredential
- Hashtable
#>

# Microsoft.PowerShell.CredManStore - rozšíření, které používá Správce pověření Windows pro ukládání tajemství

<# (Ne)Výhody

+ Mimo skript
+ Jiní uživatelé téhož počítače se k hodnotě nedostanou
+ Multiplatformní řešení
+ 0 Kč
+ Bezpečné úložiště hesel pod uživatelským účtem
+ Potencionálně jsme snížili počet výzev
- Nic jsme v podstatě nevyřešili, stále potřebujeme vyřešit heslo k trezoru
- Člověk s přístupem k účtu se může dostat k celému trezoru (!!!)
- Lze obejít při úspěšném ladění na cílovém počítači pod účtem, pokud uložíme jako plaintext
#>
#####################################################################################

# Řešení na bázi Azure
Install-Module Az.KeyVault

# Registrace trezoru v Azure
Register-SecretVault -Module Az.KeyVault -Name AzKV -VaultParameters @{AZKVaultName = $vaultName; SubscriptionId = $subID}
# Pro funkčnost musíme nejprve provést autentifikaci do kontextu AZ skrze PowerShell.
# Detaily na
Start-Process -FilePath 'https://github.com/Azure/azure-powershell'

<# (Ne)Výhody

+ Mimo skript
+ Jiní uživatelé téhož počítače se k hodnotě nedostanou
+ Multiplatformní řešení
+ Bezpečné úložiště hesel
+ Potencionálně jsme snížili počet výzev na minimum
- Je potřeba vyřešit autorizaci v AZ v kontextu skriptu
- x Kč
- Člověk s přístupem se může dostat k celému trezoru
- Lze obejít při úspěšném ladění na cílovém počítači pod účtem
#>
#####################################################################################

# Co třeba ad hoc řešení?
Start-Process -FilePath 'https://kutlime.visualstudio.com/'

# Task scheduler umí ukládat pověření
Start-Process -FilePath (Join-Path -Path $assetPath -ChildPath '2022-09-14-12-54-12.png')
#####################################################################################

# Co třeba komerční řešení?
Start-Process -FilePath 'https://geekflare.com/secret-management-software/'
Start-Process -FilePath 'https://secrethub.io/'

# Závěrečné shrnutí a rady
# Hesla jsou zlo. Nutné, ale stále zlo. Viz https://www.wug.cz/zaznamy/677-WUG-Days-2020-Svet-bez-hesel-Uz-tam-budem
# Nikdy nezadávejte plainstring, použijte SecureString. -> Historie zadávání
# SecretManagement by měl být základ pro uložení hesel.
# Nebuďte líní, buďte kreativní.