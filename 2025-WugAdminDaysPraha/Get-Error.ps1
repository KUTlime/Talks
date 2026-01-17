<#
Osnova přednášky: PowerShell a zpracování chyb

Úvod (5 minut)
- Představení tématu a cíle přednášky
- Význam chyb v PowerShellu


Typy chyb v PowerShellu (10 minut)
- Terminální vs. neterminální chyby
- Jak PowerShell identifikuje chyby

Zpracování chyb v PowerShellu (15 minut)
- Základní přístupy k zpracování chyb
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
Get-Content -Path "C:\NeexistujiciSoubor.txt"  # Tato příkaz způsobí chybu

# Zde by skript pokračoval, ale chyba by byla zaznamenána v $Error
Write-Host "Tento řádek se stále vykoná."

# Zobrazení poslední chyby
Write-Host "Poslední chyba: $($Error[0])"

