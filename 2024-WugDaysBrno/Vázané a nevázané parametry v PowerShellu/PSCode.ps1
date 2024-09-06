# Co je vazba parametrů, k čemu je dobrá a proč se o ní zajímat?

# Vazba parametrů je proces,
# který PowerShell používá k určení,
# která sada parametrů se používá, a k přiřazení (vazbě) hodnot (argumentů) k parametrům příkazu.
# Tyto hodnoty mohou pocházet z příkazového řádku a z pipeline.

# Začneme s těmi nevázanými parametry...

# Budeme simulovat chování skriptu v PS1 souboru
$scriptBlock = {
  Write-Host "`$args type: $($args.GetType().FullName)"
  Write-Host 'Arguments passed to the script block:' -ForegroundColor:Magenta
  foreach ($arg in $args)
  {
    Write-Host "$arg of type: $($arg.GetType().FullName)"
  }
}

# Příklad použití
& $scriptBlock 'FirstArgument' 'SecondArgument' 'ThirdArgument'


# Co když změníme datové typy?
& $scriptBlock 'FirstArgument' 1 Get-Date

# A co když uděláme tohle... 🤔
& $scriptBlock 'FirstArgument' 1 (Get-Date)

#  A co třeba takto...?
# Hraje čárka rozdíl? 🤔🤔🤔
& $scriptBlock 'FirstArgument', 1, Get-Date

# $args toho věru moc nenabízí a je lepší se držet od něj dál
####################################################


# Pojďme si v rychlosti ukázat vazbu parametrů ve funkci.
function Show-ParameterStatus
{
  param (
    [Parameter(Mandatory)]
    [string]$MandatoryParam,

    [Parameter()]
    [string]$OptionalParam = 'DefaultValue'
  )

  # Zobrazíme funkční parametry
  Write-Host 'Function parameters:' -ForegroundColor:Magenta
  Write-Host "`$MandatoryParam: $MandatoryParam"
  Write-Host "`$OptionalParam: $OptionalParam"

  # Zobrazíme vázané parametry
  Write-Host "`nBound Parameters ($($PSBoundParameters.GetType().FullName)):" -ForegroundColor:Magenta
  foreach ($key in $PSBoundParameters.Keys)
  {
    Write-Host "$key = $($PSBoundParameters[$key])"
  }

  # Zobrazíme nevázané parametry (nenastavené, nebo implicitní)
  Write-Host "`nNon-Bound Parameters:" -ForegroundColor:Magenta
  $allParams = $MyInvocation.MyCommand.Parameters.Keys
  $nonBoundParams = $allParams | Where-Object { -not $PSBoundParameters.ContainsKey($_) }
  foreach ($param in $nonBoundParams)
  {
    Write-Host "$param = $($MyInvocation.BoundParameters[$param])"
  }
}

# Ukázka použití
Show-ParameterStatus -MandatoryParam 'PassedValue'

# Vazba parametrů v bloku kódu/PowerShell skriptu funguje stejně
# přes blok param
$scriptBlock = {
  param (
    [string]$StringParam,
    [int]$IntParam,
    [DateTime]$DateParam
  )

  Write-Host "String Parameter: $StringParam"
  Write-Host "Integer Parameter: $IntParam"
  Write-Host "DateTime Parameter: $DateParam"
}

# Example usage
& $scriptBlock -StringParam 'Hello' -IntParam 42 -DateParam (Get-Date)

# Pojďme si to ale trochu opepřit a přidáme si tam pro jistotu kontrolu, co nám všechno přišlo
$scriptBlock = {
  param (
    [string]$StringParam,
    [int]$IntParam,
    [DateTime]$DateParam
  )

  Write-Host "String Parameter: $StringParam"
  Write-Host "Integer Parameter: $IntParam"
  Write-Host "DateTime Parameter: $DateParam"
  Write-Host 'Arguments passed to the script block:' -ForegroundColor:Magenta
  foreach ($arg in $args)
  {
    Write-Host "$arg of type: $($arg.GetType().FullName)"
  }
}

# Tady zavoláme jak s parametry, tak předáme něco navíc
& $scriptBlock -StringParam 'Hello' -IntParam 42 -DateParam (Get-Date) 'Test' 'Test2'

# Při pohledu na výstup z volání ⬆️⬆️⬆️
# můžeme už konečně cca říci, co jsou vázané a nevázané argumenty.

# Pojďme ovšem dál, více do hloubky...

# Jak probíhá vazba?
####################################################
# 1. Proces vázání parametrů začíná vázáním argumentů příkazového řádku.
# 2. Vázání pojmenovaných parametrů:
#    - PS hledá neuzavřené tokeny na příkazovém řádku, které začínají pomlčkou.
#    - Pokud token končí dvojtečkou, je vyžadován argument.
#    - Pokud není dvojtečka, zkontroluje typ parametru a zjistí, zda je argument vyžadován.
#    - Pokud je vyžadována hodnota, pokusí se převést typ argumentu na požadovaný typ parametru
#      a pokud je převod úspěšný, parametr se naváže.
# 3. Vázání pozičních parametrů:
#    - Pokud existují nevyužité argumenty příkazového řádku, hledu nevyvázané parametry,
#      které přijímají poziční parametry, a pokuste se je vázat.
# 4. Po vázání argumentů příkazového řádku se PowerShell pokusí vázat jakýkoli vstup z pipeline.
# 5. Parametry, které přijímají vstup z pipeline, mají jednu nebo obě z následujících atributů:
#    - ValueFromPipeline: Hodnota z pipeline je vázána na parametr na základě jeho typu.
#    - ValueFromPipelineByPropertyName: Hodnota z pipeline je vázána na parametr na základě jeho názvu.
# 6. PowerShell se pokusí vázat vstup z pipeline v následujícím pořadí:
#    - Pokus o vázání parametrů ValueFromPipeline bez konverze typu.
#    - Pokus o vázání parametrů ValueFromPipelineByPropertyName bez konverze typu.
#    - Pokud vstup z pipeline nebyl vázán, pokus o vázání parametrů ValueFromPipeline s konverzí typu.
#    - Pokud vstup z pipeline nebyl vázán, pokus o vázání parametrů ValueFromPipelineByPropertyName s konverzí typu.

# Jak ladit vazbu parametrů?
Clear-Host; Trace-Command -PSHost -Name ParameterBinding -Expression {
  Get-Item *.txt | Remove-Item
}

# Srovnejme výstup, když předáme rovnou pole
Clear-Host; Trace-Command -PSHost -Name ParameterBinding -Expression {
  Get-Item @('*.txt') | Remove-Item
}

function Test-Pipeline1
{
  param (
    # Parametr, který přijímá hodnoty z pipeline
    [Parameter(ValueFromPipeline)]
    [string]$ValueFromPipeline,

    # Parametr, který přijímá hodnoty z vlastností objektů v pipeline
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]$ValueFromPipelineByPropertyName
  )

  process
  {
    Write-Host "ValueFromPipeline: $ValueFromPipeline"
    Write-Host "ValueFromPipelineByPropertyName: $ValueFromPipelineByPropertyName"
  }
}

# Příklad PSCustomObject
$psCustomObject = [PSCustomObject]@{
  ValueFromPipelineByPropertyName = 'PSCustomObject Property'
}

# Příklad Hashtable
$hashtable = @{
  ValueFromPipelineByPropertyName = 'Hashtable Property'
}

# Předání PSCustomObject
Clear-Host; $psCustomObject | Test-Pipeline1

# Předání Hashtable
Clear-Host; $hashtable | Test-Pipeline1

# Předání jednoduchého řetězce pro ValueFromPipeline
'Simple String' | Test-Pipeline1

# Pojďme si ukázat roli pozice...
function Get-DateMinus
{
  [CmdletBinding()] <# Přidá Common Parameters #>
  param ([double]$NumberOfDays, [string]$FormatData)
  (Get-Date).AddDays($NumberOfDays).ToString($FormatData)
}

Clear-Host; Get-DateMinus -NumberOfDays 10 -FormatData 'yyyyMMdd HH:mm:ss'
Clear-Host; Get-DateMinus 10 'yyyyMMdd HH:mm:ss'
Clear-Host; Get-DateMinus 'yyyyMMdd HH:mm:ss' 10 # Chyba, protože nedokáže převést "yyyyMMdd HH:mm:ss" na double.
Clear-Host; Get-DateMinus '10.5' 'yyyyMMdd HH:mm:ss' # Provede, protože "10.5" lze převést na double a tutíž použít vazbu dle pozice parametru.
Clear-Host; Get-DateMinus -FormatData 'yyyyMMdd HH:mm:ss' -NumberOfDays '10.5'
Clear-Host; Get-DateMinus -FormatData 'yyyyMMdd HH:mm:ss' '10.5' # Tady ukážeme explicitně na další parametr a druhý necháme navázat pozičně.

function Test-Pipeline2
{
  [CmdletBinding()]
  param (
    # Parametr, který přijímá hodnoty z pipeline
    [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
    [string]$ValueFromPipeline,

    # Parametr, který přijímá hodnoty z vlastností objektů v pipeline
    [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
    [string]$ValueFromPipelineByPropertyName
  )

  process
  {
    Write-Host "ValueFromPipeline: $ValueFromPipeline"
    Write-Host "ValueFromPipelineByPropertyName: $ValueFromPipelineByPropertyName"
  }
}

# Předání PSCustomObject
Clear-Host; $psCustomObject | Test-Pipeline2

# Předání Hashtable
Clear-Host; $hashtable | Test-Pipeline2

# Předání jednoduchého řetězce pro ValueFromPipeline
'Simple String' | Test-Pipeline2

Clear-Host; [PSCustomObject]@{
  ValueFromPipeline = 'ValueFromPipeline'
  ValueFromPipelineByPropertyName = 'ValueFromPipelineByPropertyName'
} | Test-Pipeline2

# Teď nakombinujeme ValueFromPipeline & ValueFromPipelineByPropertyName
function Test-Pipeline3
{
  [CmdletBinding()]
  param (
    # Parametr, který přijímá hodnoty z pipeline
    [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [string]$ValueFromPipeline,

    # Parametr, který přijímá hodnoty z vlastností objektů v pipeline
    [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
    [string]$ValueFromPipelineByPropertyName
  )

  process
  {
    Write-Host "ValueFromPipeline: $ValueFromPipeline"
    Write-Host "ValueFromPipelineByPropertyName: $ValueFromPipelineByPropertyName"
  }
}

$psCustomObject2 = [PSCustomObject]@{
  ValueFromPipeline = 'PSCustomObject: ValueFromPipeline property'
  ValueFromPipelineByPropertyName = 'PSCustomObject: ValueFromPipelineByPropertyName Property'
}

# Příklad Hashtable
$hashtable2 = @{
  ValueFromPipeline = 'Hashtable: ValueFromPipeline property'
  ValueFromPipelineByPropertyName = 'Hashtable: ValueFromPipelineByPropertyName Property'
}

# Předání PSCustomObject
Clear-Host; $psCustomObject | Test-Pipeline3
Clear-Host; $psCustomObject2 | Test-Pipeline3

# Předání Hashtable
Clear-Host; $hashtable | Test-Pipeline3
Clear-Host; $hashtable2 | Test-Pipeline3

# Předání jednoduchého řetězce pro ValueFromPipeline
'Simple String' | Test-Pipeline3

# Teď přidáme ValueFromPipeline na oba parametry
# a podíváme se, co nám to udělá.
function Test-Pipeline4
{
  [CmdletBinding()]
  param (
    # Parametr, který přijímá hodnoty z pipeline
    [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [string]$ValueFromPipeline,

    # Parametr, který přijímá hodnoty z vlastností objektů v pipeline
    [Parameter(Mandatory, Position = 1, ValueFromPipeline,  ValueFromPipelineByPropertyName)]
    [string]$ValueFromPipelineByPropertyName
  )

  process
  {
    Write-Host "ValueFromPipeline: $ValueFromPipeline"
    Write-Host "ValueFromPipelineByPropertyName: $ValueFromPipelineByPropertyName"
  }
}

# Předání PSCustomObject
Clear-Host; $psCustomObject | Test-Pipeline4
Clear-Host; $psCustomObject2 | Test-Pipeline4

# Předání Hashtable
Clear-Host; $hashtable | Test-Pipeline4
Clear-Host; $hashtable2 | Test-Pipeline4

# Předání jednoduchého řetězce pro ValueFromPipeline
'Simple String' | Test-Pipeline4

# Teď odebereme ValueFromPipeline úplně
# a podíváme, jak se nám to bude chovat.
function Test-Pipeline5
{
  [CmdletBinding()]
  param (
    # Parametr, který přijímá hodnoty z pipeline
    [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
    [string]$FirstParameter,

    # Parametr, který přijímá hodnoty z vlastností objektů v pipeline
    [Parameter(Mandatory, Position = 1,  ValueFromPipelineByPropertyName)]
    [string]$SecondParameter
  )

  process
  {
    Write-Host "ValueFromPipeline: $FirstParameter"
    Write-Host "ValueFromPipelineByPropertyName: $SecondParameter"
  }
}

Clear-Host; @{
  FirstParameter = "First parameter value"
  SecondParameter = "Second parameter value"
} | Test-Pipeline5

Clear-Host; [PSCustomObject]@{
  FirstParameter = "First parameter value"
  SecondParameter = "Second parameter value"
} | Test-Pipeline5

# Otázka: Takže kde by se měl ValueByPipeline nacházet?
# A kolik by tam toho mělo být?

# A nyní opravdu správné použití ValueByPipeline

function Get-UserInfo {
  [CmdletBinding(DefaultParameterSetName = 'ByName')]
  param (
      # Parametr pro první sadu, přijímá hodnoty z pipeline podle typu
      [Parameter(ValueFromPipeline, ParameterSetName = 'ByName')]
      [string]$UserName,

      # Parametr pro druhou sadu, přijímá hodnoty z pipeline podle typu
      [Parameter(ValueFromPipeline, ParameterSetName = 'ById')]
      [int]$UserId,

      # Společný parametr pro obě sady
      [Parameter(Mandatory, ParameterSetName = 'ByName')]
      [Parameter(Mandatory, ParameterSetName = 'ById')]
      [string]$Department
  )

  process {
      Write-Host "Parameter Set: $($PSCmdlet.ParameterSetName)"
      Write-Host "UserName: $UserName"
      Write-Host "UserId: $UserId"
      Write-Host "Department: $Department"
  }
}

# Příklad PSCustomObject pro sadu 'ByName'
$psCustomObjectByName = [PSCustomObject]@{
  UserName = "jdoe"
  Department = "IT"
}

# Příklad PSCustomObject pro sadu 'ById'
$psCustomObjectById = [PSCustomObject]@{
  UserId = 101
  Department = "HR"
}

# Předání PSCustomObject pro sadu 'ByName'
$psCustomObjectByName | Get-UserInfo

# Předání PSCustomObject pro sadu 'ById'
$psCustomObjectById | Get-UserInfo

# Předání jednoduchých hodnot pro sadu 'ByName'
"asmith" | Get-UserInfo -Department "Finance"

# Předání jednoduchých hodnot pro sadu 'ById'
202 | Get-UserInfo -Department "Marketing"

# Závěr: ValueByPipeline by měla být unikátní v rámci jedné sady parametrů.
# Každá sada parametrů by měla mít vždy unikátní kombinaci parametrů, aby byla přiřaditelná.
