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
* Klidný spánek
* Říci k tématu i něco jiného než hraběcí rady typu _nepoužívejte hesla v plaintextu_
* Usnadnit sám sobě práce

## Pro koho je tato přednáška určena

Seznamte se s Frantou...

![Seznamte se s Frantou...](.\assets\DALLE_2022-09-13_11.31.29_system_administrator_overworked_scheduled_tasks.png)

* ...Franta pracuje jako sysadmin ve veřejné zprávě/malé firmě/kolečko v korporátu,
* o Azure slyšel jenom v televizi,
* doma má dvě malé děti,
* děsí ho účty za elektřinu pro nadcházející zimu,
* je přepracovaný, unavený a nemá čas/peníze/motivaci na fancy řešení od bezpečnostních expertů

## Definice problému

Chci automatizovat, potřebuji vyrobit PSCredetials objekt a potřebuji k tomu citlivý údaj - heslo. Nejjednodušší řešení je mít heslo přímo ve skriptu, ale to není bezpečné.

```powershell
Send-VerificationEmail -MyPassword '123456'
Enter-PSSession -Credential $credential
```

Správné řešení je **bezpečné**, **jednoduché na použití** a **univerzální**.

Na rovinu si řekněme, že žádné takové řešení neexistuje.

Cílem této přednášky není vyřešit problematiku hesel, cílem je, co možná nejkreativněji zbavit hesel v prostém textu z PowerShell skriptů.  
Jinými slovy, aby to nebyl takový průšvih, když se ke skriptu dostane někdo, kdo nemá.
