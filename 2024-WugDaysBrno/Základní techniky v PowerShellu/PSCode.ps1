# Kolekce typu "Pole"
####################################################
{
  <# Co je nutné vědět o poli:
    Výchozí hodnota je $Null
    Pole je číslováno OD NULY!!!
    Index pole určuje vzdálenost od prvního prvku v poli.
    Z cmdletů se nám často vrací pole objektů.
  #>

  # Definice pole:
  $array = @(1, 2, 3)

  # Pole lze jednodušeji definovat i takto:
  $array = 1, 2, 3

  # Index pole - přístup k položkám v poli
  # Je to operátor, píše se jako [] a určujeme ním vzdálenost položky,
  # se kterou chceme pracovat od první položky v poli.
  # První položka má vzdálenost 0 od první položky v poli,
  # druhá položka má vzdálenost 1 od první položky v poli, atd.
  Clear-Host; $array[0] # 1
  Clear-Host; $array[1] # 2
  Clear-Host; $array[2] # 3
  Clear-Host; $array[-1] # 3
  Clear-Host; $array[-2] # 2
  Clear-Host; $array[-3] # 1

  # Jak si představit +/- indexování pro $array
  $array = 8, 6, 4
  #                    Indexy:       -3  -2  -1   0   1   2
  # Hodnoty pro + část indexu:                    8   6   4
  # Hodnoty pro - část indexu:        8   6   4

  # Lze použít a často se používá i jiná proměnná jako index
  # viz kapitola smyčky.
  $i = 1
  Clear-Host; $array[$i] # přístup s použitím proměnné

  # Sladké tajemství PowerShellu
  # [0] můžeme použít i proměnných, nehledě na to, že nejsou pole.
  $sweetSecret = 12
  Clear-Host; $sweetSecret[0]  # Vrátí 12
  Clear-Host; $sweetSecret[1]  # Nic nevrací
  Clear-Host; $sweetSecret[-1] # Vrátí 12

  # Pokud neřekneme jinak, můžeme motat prvky dohromady
  $array = 1, 'Tento string', [DateTime]::UtcNow
  Clear-Host; $array[0] # 1
  Clear-Host; $array[1] # "Tento string"
  Clear-Host; $array[2] # Vepíše se aktuální datum a čas do pole a tato hodnota zůstává stejná.
  # Když nyní zapíšeme
  $array[2] = 10 # změníme bez problémů datový typ v 3. položce pole

  # Dvojrozměrné pole
  $array2D = (1, 2, 3) , (4, 5, 6, "$env:TEMP") , (7, 8, 9, 'Světe', 1.1)
  Clear-Host; $array2D[1][0] # Vypíše 4, protože bere 2. položku z 1. dimenze a potom 1. položku z 2. dimenze.

  # Trojrozměrné pole
  $array3D = ((1, 2, 3), (4, 5, 6), (7, 8, 9)),
    ((11, 12, 13), (14, 15, 16), (17, 18, 19)),
    ((21, 22, 23), (24, 25, 26), (27, 28, 29))
  Clear-Host; $array3D[1][0][2] # Vypíše 13, protože bere 2. položku z 1. dimenze a potom 1. položku z 2. dimenze a poté 3. položku z 3. dimenze

  # Vynucení explicitního typu pole
  $array = 1..10
  Clear-Host; $array.GetType()            # Object[]
  [Int32[]] $array = 1..10    # Int32[]
  [String[]] $array = 1..10   # String[]
  Clear-Host; $array[0] = 'Test'          # Vložení stringu do Int32 => vyhození výjimky.
  Clear-Host; $array[0] = 1               # Vložení čísla do string => OK, protože číslo se převede na text.

  # Co vám PS (bohužel) dovolí
  [Int32[]] $array = 1..10
  $array[0] = 1
  $array[0] = '1'
  Clear-Host; $array[0] = '1.6'; $array[0]
  Clear-Host; $array[0] = '1,6'; $array[0]

  # Pole integerů výčtem (operátor ..)
  [Int32[]] $f = 1..9
  [string[]] $f = 1..9
  'a'..'z'

  # Implicitní vytvoření prázdného pole
  $colors = @()
  $paterns = @('modrá')

  # Přidání položky do pole přes Add NELZE, viz kapitola seznam.
  Clear-Host; $colors.Add('žlutá')

  # Přidáním pomocí operátoru + (ale je to strašně neefektivní)
  Clear-Host; $colors = $colors + 'oranžová'

  # Přidáním pomocí přetížení operátoru +=
  Clear-Host; $colors += 'oranžová' # $colors = $colors + 'oranžová'

  # Sečtení 2 polí
  $colors += $paterns

  # Sečtení silně typových polí
  [int[]]$arrInt1 = 1,2,3
  [int[]]$arrInt2 = 4,5,6
  [string[]]$arrString1 = 'abc', 'def', 'ghi'
  [string[]]$arrString2 = '7', '8', '9'

  $arrInt1 += $arrInt2 # Int32 + Int32 => Není co řešit, přidá položky z arrInt2 do arrInt1
  $arrInt1 += $arrString1 # Neprojde, protože řetězce "abc" nejde převést do Int32.
  $arrInt1 += $arrString2 # Projde, protože vyjde skrze implicitní konverzi z string -> Int32
  $arrString1 += $arrInt1 # Projde, protože cokoliv lze (nějak) převést na string, takže výsledek je string.

  # Worst practise
  # Jednak motáme C# metodu z .NETu dohromady s PowerShell
  # a jednak odebírání něčeho v poli bez toho, aniž bych si to ověřil, že to tam je.
  $colors.RemoveAt($colors.IndexOf('zelená'))
  # Jak se to dělá správně, si ukážeme později.

  # Co nám vrátí IndexOf pokud jsou duplicitní položky v poli?
  $colors = @('modrá', 'modrá')
  $colors.IndexOf('modrá')

  # Pokročilý přístup k položkám
  $colors = 'black', 'white', 'yellow', 'blue'
  Clear-Host; $colors[0]
  Clear-Host; $colors[1, 4, 7]
  Clear-Host; $colors[2..6]
  Clear-Host; $colors[10]   # Vrací $null!!!
  Clear-Host; $colors[1][0] # 'w' [char], protože 'white' -> 'w'

  # Přístup k vlastnostem a metodám položek v poli
  Clear-Host; $colors[0].Length # Načtení vlastnosti délka - rovna 5
  Clear-Host; $colors[0].Count  # Načtení vlastnosti počet - rovna 1
  Clear-Host; $colors[0].ToString() # Zavolání metody ToString na 1. položkou poli s indexem 0.

  # Přístup k .NET vlastnostem a metodám pole
  Clear-Host; $colors.Length # Načtení vlastnosti délka na objektu pole - 4 prvky = délka 4
  Clear-Host; $colors.Count  # Načtení vlastnosti počet na objektu pole - 4 prvky = počet 4
  Clear-Host; $colors.ToString()  # Načtení vlastnosti počet na objektu pole - 4 prvky = počet 4

  # Hledání
  $computerNames = 'host001', 'host002', '', 'host008', 'host011', 'host081', 'dc1', 'Dc1'
  $computerNames[0..3] -like '*host*'

  # Extrakce unikátních hodnot
  $a = @(, 1, , 5, 1, 2, 3, 4, 1, 5, 2, 3, 4)
  $a | Select-Object -Unique # Obecná varianta, použitelná vždy.
  $a | Get-Unique # Alternativa, ale musí být nejprve setříděn.
  $computerNames | Select-Object -Unique # Case sensitivity (vrátí jak dc1, tak Dc1).

  # Úplné řešení s case sensitivitou
  $computerNames
  | ForEach-Object { $_.ToLower() }
  | Where-Object { [String]::IsNullOrWhiteSpace($_) -eq $false }
  | Select-Object -Unique

  # Spojení pole do jednoho textového řetězce
  $numberList = 1, 2, 3, 4, 5 # pole pevně dané velikosti
  Clear-Host; $numberList -join '--' # 1--2--3--4--5
  Clear-Host; $numberList -join '|' # 1|2|3|4|5

  # Rozdělení jednoho textového řetězce na pole stringů
  $someString = 'Toto je nějaký dlouhý string'
  $someString -split ' ' # Vrátí pole stringů String[]
  $someString = 'C:\Users\W10\AppData\Local\Microsoft\'
  $someString -split '\\' # Vrátí pole stringů String[]
}
####################################################


# Dynamické pole (ArrayList) a seznam (List)
####################################################
{
  $array = 1, 2, 3, 4, 5    # Pole má pevně danou velikost.
  $array.Add(6)             # Tento pokus skončí runtime chybou.

  # Schopnost přidávat položky do pole je jeho největší slabina.
  # Naštěstí, pole není jediná kolekce.

  # Definice dynamického pole
  $arrayList = New-Object ([System.Collections.ArrayList])

  # Alternativní způsob
  $arrayList = New-Object -TypeName 'System.Collections.ArrayList'

  # Aby těch alternativních způsobů nebylo málo
  $arrayList = [System.Collections.ArrayList]::new();

  # $arrayList je nyní prázdný
  $arrayList.Count # vrací 0.

  # Rozdíl pole vs. dynamické pole (Array vs. ArrayList)
  Clear-Host; $array.IsFixedSize          # True
  Clear-Host; $arrayList.IsFixedSize      # False
  Clear-Host; $array.IsFixedSize = $true  # Tohle neklapne.
  Clear-Host; $arrayList.Add(6)

  # Potlačení návratové hodnoty
  Clear-Host; $arrayList.Add(6) | Out-Null

  # Test výkonu
  # Pole jsou immutable => nelze je modifikovat.
  # Vždy se vytváří nové.
  {
    $arrayList = New-Object -TypeName System.Collections.ArrayList
    $testArray = @()
    $list = New-Object ([System.Collections.Generic.List[System.String]])
    Write-Host 'Results for array:'
    Measure-Command {
      for ($i = 0; $i -lt 10000; $i++) {
        $testArray += "Adding item $i"
      }
    }
    Write-Host 'Results for Arraylist:'
    Measure-Command {
      for ($i = 0; $i -lt 10000; $i++) {
        $arrayList.Add("Adding item $i") | Out-Null
      }
    }
    Write-Host 'Results for list:'
    Measure-Command {
      for ($i = 0; $i -lt 10000; $i++) {
        $list.Add("Adding item $i") | Out-Null
      }
    }
  }

  # Vícerozměrné dynamické pole
  $list2D = New-Object ([System.Collections.ArrayList])
  $internalList = New-Object ([System.Collections.ArrayList])
  $anotherInternalList = New-Object ([System.Collections.ArrayList])
  $list2D.Add($internalList)
  $list2D[0].Add(1) # Reálně vkládáme do $internalList proměnné
  $list2D[0].Add(2) # Reálně vkládáme do $internalList proměnné
  $list2D[0].Add(3) # Reálně vkládáme do $internalList proměnné
  $list2D.Add($anotherInternalList)
  $list2D[1].Add(4) # Reálně vkládáme do $anotherInternalList proměnné
  $list2D[1].Add(5) # Reálně vkládáme do $anotherInternalList proměnné
  $list2D[1].Add(6) # Reálně vkládáme do $anotherInternalList proměnné
  $list2D[0][2] # vrátí 3
  $list2D[1][1] # vrátí 5

  # Dnes preferovanou variantou je Seznam (List)
  # Seznam čísel
  $mylist = [System.Collections.Generic.List[int]]::new()

  # Alternativní způsob vytvoření pole s pomocí cmdletu New-Object
  $mylist = New-Object ([System.Collections.Generic.List[int]])

  # Další možnost, ale ne příliš hezká
  $mylist = New-Object -TypeName 'System.Collections.Generic.List`1[int]'

  # Seznam čísel s několika hodnotami do začátku.
  $mylist = [System.Collections.Generic.List[int]]@(1, 2, 3)

  # Seznam stringů
  $mylist = [System.Collections.Generic.List[string]]::new()

  # Seznam libovolného objektu. Do tohoto objektu můžeme uložit cokoliv.
  $mylist = [System.Collections.Generic.List[object]]::new()

  # 2D list čísel
  $mylist2D = [System.Collections.Generic.List[[System.Collections.Generic.List[int]]]]::new()
  $mylist2D = [System.Collections.Generic.List[[System.Collections.Generic.List[int]]]]@((1,2,3), (4,5,6), (7,8,9))

  # Ve skriptu lze použít i using (musí přijít na začátek skriptu a nikam jinam).
  # using namespace System.Collections.Generic
  $myList = [List[int]]@(1, 2, 3)
  $myList = [List[object]]@()

  # Seznam dokáže plně zastoupil pole, je generický
  # a nemá žádné nevýhody.
  # ArrayList je především nejvýkonnější kolekci,
  # kterou v PS máme, ale není generický.
}
####################################################


# Hash tabulka (hashTable)
####################################################
{
  # Kolekce typu slovník. Ukládá dvojice klíč-hodnota,
  # klíč musí být unikátní, hodnota nikoliv.

  $emptyHashTable = @{} # Prázdná hashtabulka

  $aHashtable = @{ name1 = 'val1'; name2 = 'val2' }
  $aHashtable = @{ name1 = 'val1'; name2 = 'val1' }
  $aHashtable = @{ name1 = 'val1'; name1 = 'val2' } # Tohle už neklapne

  # Častěji zapisujeme spíše takto (klíče s hodnotou na samostatné řádky):
  $someHashTable = @{
    Path    = $PWD
    Filter  = '*.ps1'
    Recurse = $true
  }

  # Když chci seřazené
  $someOrderedHashTable = [ordered]@{
    Path    = $PWD
    Filter  = '*.ps1'
    Recurse = $true
  }
  $someHashTable[0]
  $someOrderedHashTable[0]

  # Přístup
  Clear-Host; $aHashtable.name1
  Clear-Host; $aHashtable['name1']
  Clear-Host; $key = 'name1'
  Clear-Host; $aHashtable[$key]

  # Význam:
  # Především kvůli výkonu, protože prohledáváme konstantně.
  # Je zaručena unikátnost dané položky.

  # Využití:
  # Splatting

  # a další
  Send-MailMessage -From 'test@email.com' -To 'example@email.com' -Subject 'Verification' -Body 'It works.' -SmtpServer 'smtp.seznam.cz' -UseSsl -Port 587 -Credential $credentials -WarningAction:SilentlyContinue
  # vs. splatting forma
  $ht = @{
    From = 'test@email.com'
    To = 'example@email.com'
    Subject = 'Verification'
    Body = 'It works.'
    SmtpServer = 'smtp.seznam.cz'
    UseSsl = $true
    Port = 587
    Credential  = $credentials
    WarningAction = 'SilentlyContinue'
  }
  Send-MailMessage @ht

  # Sečtení dvou tabulek
  $htFist = @{firstKey = 'firstValue' }
  $htSecond = @{secondKey = 'secondValue' }
  $htFist += $htSecond
  $htFist # Nyní obsahuje oba klíče
}
####################################################


# "Eskejpování" uvnitř stringů
Clear-Host; "My full name is $fullName with length $fullName.Length characters."
Clear-Host; "My full name is $fullName with length $($fullName.Length) characters."
Clear-Host; 'My full name is {0} with length {1} characters.' -f $fullName, $fullName.Length

Clear-Host; "Escaping $ inside string" # Zde netřeba eskejpovat, protože $ stojí samostatně.
Clear-Host; "Escaping `$fullName=$fullName inside string" # Zde potřeba eskejpovat, protože $ má za sebou nějaký text, který by se jinak interpretoval jako proměnná.
####################################################

# UTF-8 (bez BOM) pro PS1 soubory
$filePath = 'TestEncoding.ps1'
'Get-Content -Path "C:\Users\radek\Nějaká složka\Nějaký soubor.txt"' | Out-File -FilePath $filePath -Encoding:utf8NoBOM
Get-Content -Path $filePath
[System.IO.FileInfo]$fileInfo = $filePath

Start-Process -FilePath 'powershell' -ArgumentList " -NoLogo -NoProfile -Command {Get-Content -Path ""$($filePath.FullName)""}" -NoNewWindow -Wait