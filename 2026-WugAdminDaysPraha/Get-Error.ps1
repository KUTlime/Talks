<#
Osnova přednášky: PowerShell a zpracování chyb

Úvod (5 minut)
- Představení tématu a cíle přednášky
- Význam chyb v PowerShellu
- Význam proudů v PowerShellu

Typy chyb v PowerShellu (10 minut)
- Terminální vs. neterminální chyby
- Jak PowerShell identifikuje chyby

Chování chyb v PowerShellu (15 minut)
- Základní přístupy k nastavení chování chyb
- Použití parametrů cmdletů pro ošetření chyb

Pokročilé techniky (20 minut)
- Konstrukce try/catch/finally
- Příklady použití a best practices

Praktické ukázky (15 minut)
- Demonstrace různých scénářů zpracování chyb
- Analýza chybových hlášení a jejich řešení

Diskuze a dotazy (10-15 minut)
- Odpovědi na dotazy účastníků
- Shrnutí klíčových bodů
#>

# Význam chyb v PowerShellu
# - Chyby jako signál jak skript vlastně (ne)dopadl.
# - Chyby jako signály pro zlepšení skriptů.
# - Pomáhají identifikovat slabá místa v kódu.
# - Umožňují psát robustnější a spolehlivější skripty.

# Příklad jednoduché chyby:
Get-Content -Path 'C:\NeexistujiciSoubor.txt'  # Tato příkaz způsobí chybu

# Zde by skript pokračoval, ale chyba by byla zaznamenána v $Error
Write-Host 'Tento řádek se stále vykoná.'

# Zobrazení poslední chyby
Write-Host "Poslední chyba: $($Error[0])"

# Význam proudů v PowerShellu
# PowerShell má několik proudů: Výstup, Chyby, Varování, Informace, Debug.
# Proudy jsou klíčové pro pochopení, jak PowerShell zpracovává chyby.
# Chybový proud se totiž často zneužívá pro logování.

Clear-Host; Get-Command -Verb 'Write' -Module Microsoft.PowerShell.Utility # Různé formy zápisu.

Clear-Host; Write-Output 'Zpráva' # Zápis do výstupního proudu, zpravidla konzole.
Clear-Host; Write-Host 'Zpráva' # Zápis hlášení na hostitele (může být vzdálený).
Clear-Host; Write-Error 'Zpráva' # Zapíše se chybového hlášení do konzole
Clear-Host; Write-Warning 'Zpráva' # Zapíše se varování do konzole
Clear-Host; Write-Information 'Zpráva' # Zapíše se informační hlášení do konzole
Clear-Host; Write-Verbose 'Zpráva' # Zapíše se informační hlášení do konzole, dostupné pouze pro příznak -Verbose
Clear-Host; Write-Debug 'Zpráva' # Zapíše se debug hlášení do konzole, dostupné pouze pro příznak debug.
1..100 | ForEach-Object { Write-Progress -Activity 'Search in Progress' -Status "$_ % Complete:" -PercentComplete $_; Start-Sleep -Milliseconds 100 }

# Každý proud má své nastavení chování v rámci instance PowerShellu.
# Nastavení preferencí pro jednotlivé proudy

# Chybový proud (Error Stream) - ErrorActionPreference
$ErrorActionPreference

# Varovný proud (Warning Stream) - WarningPreference
$WarningPreference

# Informační proud (Information Stream) - InformationPreference
$InformationPreference

# Verbose proud (Verbose Stream) - VerbosePreference
$VerbosePreference

# Debug proud (Debug Stream) - DebugPreference
$DebugPreference

# Co je to ActionPreference?
# ActionPreference je enumerace, která definuje možné hodnoty pro nastavení chování
$VerbosePreference.GetType().FullName

# Nastavení preferencí pro jednotlivé proudy buď pomocí stringu
$ErrorActionPreference = 'Stop'
# Použití běžného stringu, který si PS sám převede.

# Nebo pomocí enumu
$ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop

# Výchozí hodnota pro ErrorActionPreference je 'Continue'

# A k čemu to globální nastavení je vlastně dobré?
# Nastavení určuje chování PowerShellu při zápisu do daného proudu, včetně chybového proudu.
# Může ovlivnit, zda skript pokračuje, zastaví se, nebo potlačí chyby.

# Hodnota 'Continue' (výchozí):
# - Chyba je zaznamenána, ale skript pokračuje dál.
# Hodnota 'Stop':
# - Chyba zastaví provádění skriptu okamžitě.
# Hodnota 'SilentlyContinue':
# - Chyba je zaznamenána, ale není zobrazena uživateli, skript pokračuje dál.
# Hodnota 'Inquire':
# - Uživatel je vyzván k rozhodnutí, jak pokračovat při chybě.
# Hodnota 'Ignore':
# - Chyba je zcela ignorována, ani nezaznamenána.

# Úplný soupis, co dělá ErrorAction:
Start-Process -FilePath 'https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters'

# Chybový proud (Error Stream) je klíčový pro zpracování chyb.
# Chybový proud je proud číslo 2 a lze jej přesměrovat nebo zachytit.

# Příklad přesměrování chybového proudu do souboru:
Get-Content -Path 'C:\NeexistujiciSoubor.txt' 2> 'C:\ChybovyLog.txt'¨

# Za mne je tento zápis nesrozumitelný a nešťastný.

# Terminální vs. neterminální chyby
# Terminální chyby: Zastaví provádění skriptu okamžitě. Používá se pro kritické chyby.
# Neterminální chyby: Zaznamenají chybu, ale skript pokračuje. Výchozí chování.

# Příklad neterminální chyby (skript pokračuje):
Write-Host 'Začátek skriptu'
Get-Content -Path 'C:\NeexistujiciSoubor.txt' -ErrorAction:Continue  # Neterminální
Write-Host 'Tento řádek se vykoná i po chybě.'

# Příklad terminální chyby (skript se zastaví):
# Throw "Kritická chyba!"  # Tento řádek by zastavil skript, pokud by nebyl zakomentovaný

# Použití Write-Error s -ErrorAction Stop pro terminální chybu:
# Write-Error "Chyba" -ErrorAction Stop  # Zastaví skript

# Rozdíl v ErrorAction:
# - Continue: Neterminální, pokračuje
# - Stop: Terminální, zastaví
# - SilentlyContinue: Neterminální, bez výpisu chyby

# Rozdíl mezi výjimkou a chybou:
# - Výjimka je objekt, který obsahuje informace o chybě a jejím kontextu.
# - Výjimka bez zachycení vede k přerušení skriptu (terminální chyba).


# Jak PowerShell identifikuje chyby

# PowerShell identifikuje chyby pomocí objektů ErrorRecord.
# ErrorRecord je strukturovaný objekt, který obsahuje podrobné informace o chybě.

# Příklad: Získání ErrorRecord z $Error
Get-Content -Path 'C:\NeexistujiciSoubor.txt'  # Způsobí chybu
$lastError = $Error[0]
Write-Host "Typ chyby: $($lastError.GetType().FullName)"  # System.Management.Automation.ErrorRecord

# Klíčové vlastnosti ErrorRecord:
# - Exception: Objekt výjimky s detaily o chybě
# - InvocationInfo: Informace o tom, kde a jak byla chyba vyvolána (řádek, příkaz, atd.)
# - TargetObject: Objekt, na kterém chyba nastala
# - CategoryInfo: Kategorie chyby (např. ObjectNotFound)

# Zobrazení detailů poslední chyby:
Write-Host "Exception: $($lastError.Exception.Message)"
Write-Host "TargetObject: $($lastError.TargetObject)"
Write-Host "InvocationInfo: $($lastError.InvocationInfo.ScriptLineNumber)"
Write-Host "Category: $($lastError.CategoryInfo.Category)"

# PowerShell používá ErrorRecord pro konzistentní zpracování chyb napříč cmdlety a skripty.
# To umožňuje pokročilé zpracování, jako filtrování nebo logování specifických typů chyb.

# Lokální chování chyb pomocí Common Parameters

# Mnoho cmdletů v PowerShellu podporuje parametry pro řízení chování chyb.
# Nejčastěji používané parametry jsou:
# -ErrorAction: Určuje, jak se má cmdlet chovat při chybě (Continue, Stop, SilentlyContinue, Inquire, Ignore).
# -ErrorVariable: Umožňuje zachytit chyby do specifikované proměnné.
# -WarningAction, -WarningVariable: Podobné pro varování.
# -InformationAction, -InformationVariable: Podobné pro informační zprávy.

# Příklad použití -ErrorAction a -ErrorVariable kdy je chyba zachycena do proměnné $someVar
Get-ChildItem "$env:USERPROFILE" -Recurse -ErrorAction:SilentlyContinue -ErrorVariable $someVar -InformationAction:Continue

# Zobrazení zachycených chyb z proměnné $someVar
$someVar | ForEach-Object { Write-Host "Chyby zachycené v proměnné someVar: $_" }

# Tyto přepínače jsou tzn. Common Parameters a jsou dostupné u všech cmdletů.
# Pozor, všechny příkazy v PowerShellu nejsou cmdlety (např. vestavěné funkce nebo skripty nemusí tyto parametry podporovat).
# Musíme rozlišovat mezi cmdlety, funkcemi, pokročilými funkcemi a skripty.
# Cmdlet je příkaz PowerShellu, který umí napřímo pracovat s rourou. |
# Funkce je příkaz napsaný v jazyce PowerShell.
# Pokročilá funkce je funkce, která využívá [CmdletBinding()] nebo neprázdný param() a podporuje Common Parameters, ale může i nemusí podporovat všechny Common Parameters.
# Skript je soubor s příkazy PowerShellu, který může, ale nemusí podporovat Common Parameters.

# Příklad "pokročilé funkce", která je cmdlet, ale nepodporuje Common Parameters
function Get-SampleOne {
    param () <# Chybí [CmdletBinding()], prázdný param je k ničemu.#>
    process {
        Write-Host 'Test'
    }
}
1..10 | Get-SampleOne
Get-Help 'Get-SampleOne'

# Příklad "pokročilé funkce", která není cmdlet a podporuje Common Parameters
function Get-SampleTwo {
    [CmdletBinding()]
    param ()
    process {
        Write-Verbose 'Test'
    }
}
1..10 | Get-SampleTwo -Verbose
Get-Help 'Get-SampleTwo'

# Příklad "pokročilé funkce", která je cmdlet a podporuje Common Parameters
function Get-SampleThree {
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]
        $Input
    )
    process {
        Write-Host $Input
    }
}
1..10 | Get-SampleThree
Get-Help 'Get-SampleThree'

# Script může mít také Common Parameters
# Příklad skriptu s Common Parameters
Get-ChildItem -File -Recurse -Filter 'Test-Param.ps1' | ForEach-Object {
    Start-Process -FilePath pwsh.exe -ArgumentList @(
        "-NoProfile",
        "-NoLogo",
        "-File",
        "$($_.FullName) -InputValue ""Testovací hodnota""-Verbose -InformationAction:Continue"
    ) -NoNewWindow -Wait
}

# Chování chyb je taky možné měnit globálně pro konkrétní příkazy pomocí $PSDefaultParameterValues
# Nastavení globálních výchozích hodnot pro parametry Common Parameters
$PSDefaultParameterValues['*:ErrorAction'] = 'Stop'

$PSDefaultParameterValues = @{
  'Send-MailMessage:SmtpServer' = 'Server123'
  'Get-WinEvent:LogName' = 'Microsoft-Windows-PrintService/Operational'
  'Get-*:Verbose' = $true
}

# Příklad: Nastavení globálního ErrorAction pro Get-ChildItem na SilentlyContinue v rámci celé relace PowerShellu nebo skriptu
$PSDefaultParameterValues['Get-ChildItem:ErrorAction'] = 'SilentlyContinue'

# Výjimky
# Základní konstrukce se skládá z těchto tří částí:
try {} catch {} finally {}
# try - tady se o něco snažíme
# catch - pokud naše snaha vyvolala nějakou výjimku (chybu)
# finally - část bloku, která se provede vždy, nehledě na to, jestli výjimka nastala nebo nenastala.

# Zkrácené (obvyklejší použití)
try {} catch {}

# Chycení speciálního druhu výjimky
# Výjimky se musí chytat od nejpřesnějšího typu k nejvšeobecnějšímu.
# Je potřeba znát hierarchii výjimek v .NET, protože PowerShell je na .NET postavený.
# Hierarchie výjimek: https://learn.microsoft.com/en-us/dotnet/api/system.exception
# Předek všech výjimek je System.Exception.
# Jakýkoliv předek zachytí i potomky.
try
{
    # Content
    throw New-Object ([System.ArgumentNullException])
    throw [System.IO.IOException]::new()
    throw New-Object -TypeName 'System.FormatException'
    [Int32]::Parse($null)
    [Byte]::Parse(-1)
    throw [System.NullReferenceException] 'NullReferenceException occurred.'

}
catch [System.ArgumentNullException]
{
    Write-Host 'Argument je null'
}
catch [System.FormatException]
{
    Write-Host 'Špatný format'
}
catch [System.NullReferenceException]
{
    # Zachycení specifické výjimky.
    Write-Output $_.Exception | Format-List -Force
}
catch
{
    # Často se stává, že nevíme, jakou výjimku může nějaký kód vyhodit.
    # V takovém případě můžeme použít obecný catch a podívat se na typ výjimky.
    Write-Output $_.Exception | Format-List -Force
}

# ISE Steroid přidávají tento způsob zpracování v catch
try
{
    # Content
    throw
}
catch
{
    "Error was $_"
    $line = $_.InvocationInfo.ScriptLineNumber
    "Error was in Line $line"
}

# Když chci pouze zalogovat
try
{
    # Nějaký nebezpečný kód...
    # ...vyskočí výjimka, která to pošle do catch.
}
catch
{
    Write-Log "Error was $_"
    $line = $_.InvocationInfo.ScriptLineNumber
    Write-Log "Error was in Line $line"
    throw # Znova vyhodím, ať zastavím skript.
}

# Kdy se výjimky, resp. chyby nejčastěji vyskytují?
<#
    Kdy používat try/catch?
    - Když přistupujeme na souborový systém (obecně I/O operace)
    -- Soubor může být používaný.
    -- Soubor může být skrytý.
    -- Soubor tam vůbec nemusí být.
    -- Soubor může být šifrovaný.
    -- Atd.
    - Přistupujeme přes síť na nějaké zdroje
    -- Síť může vypadnout.
    -- Síťová karta může zlobit.
    -- Síťová politika může mít něco proti.
    -- Atd.
    - Databáze
    -- Databáze může být nedosažitelná.
    -- Nemusím mít otevřené připojení do DB.
    -- Samotná databáze může být poškozená.
    -- Atd.
    - Formátování
    -- Uživatel má zadat číslo, ale zadal text.
    -- Uživatel měl zadat desetinné číslo, ale 15,5 místo 15.5.
    -- Špatně formátovaný sloupec v Excelu.
    -- Atd.
#>

# Jak zpracovat výjimku?
# Např. chci zapsat do souboru a BUM... Už víme, co se stane, ale co s tím?
# Jaké máme možnosti pro tento konkrétní případ?
<#

#>
# Nucený zápis do souboru s přepsáním existujícího souboru přes -Force
New-Item -Path 'Smazat.txt' -ItemType File -Force

# Vygenerování unikátní cesty pro nový soubor s pomocí GUID
$uniqueFilePath = Join-Path -Path $env:TEMP -ChildPath ("Log_{0}.txt" -f [guid]::NewGuid().ToString())

# Při problémech se zápisem přes síť můžeme
# - Zkusit znovu po krátké pauze (retry logic) a zkusit N pokusů.
# - Použít algoritmus exponenciálního backoffu pro zpoždění mezi pokusy.
# - V případě selhání primárního DNS, použít alternativní DNS.
# - V případě selhání DHCP, přepnout na statickou IP adresu pro dočasný přístup k síti, pokud je známa.
# - Připravím si alternativní poskytovatele služeb (redundance), která je sakra drahá na údržbu i vývoj.

# Co když si výjimkou nevím rady?
# Takovou výjimku necháváme být.

