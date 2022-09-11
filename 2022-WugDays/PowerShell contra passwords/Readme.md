# PowerShell vs. hesla

> Přednáška o tom, jak se vypořádat s hesly v prostém textu v PS skriptech pro WUG Days 2022, FEKT VUT Brno za období říjen 2020 až září 2022.

## Obsah

* Motivace
* Definice problému
* Naivní řešení
* Použití SecretManagement & SecretStore
* Komerční řešení

## Motivace

* Sdílení skriptu (v organizaci, na GitHubu)

## Definice problému

Chci automatizovat, potřebuji vyrobit PSCredetials objekt a potřebuji k tomu citlivý údaj - heslo. Nejjednodušší řešení je mít heslo přímo ve skriptu, ale to není bezpečné.

```powershell
Send-VerificationEmail -MyPassword '123456'
Enter-PSSession -Credential $credential
```

Správné řešení je **bezpečné**, **jednoduché na použití** a **univerzální**.

Na rovinu si řekněme, že žádné takové řešení neexistuje.