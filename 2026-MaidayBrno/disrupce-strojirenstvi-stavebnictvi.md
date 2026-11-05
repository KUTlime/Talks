# Strojírenství a stavebnictví: jejich „LLM moment“?

Podklad pro MaiDay 2026. Stav zdrojů: **22. října 2026**. Zkoumá obdobu změny *práce v oboru*, nikoli tvrzení, že CNC, robot nebo BIM technicky fungují jako jazykový model. Souvislost s oborem IT: [historické disrupce](./historicke-disrupce-it-a-ai.md) a [rešerše propouštění](./propousteni-it-2024-2026.md).

## Krátká odpověď

**Jedna přesná historická obdoba LLM neexistuje.** Nejbližší zásah do *intelektuální* práce konstruktéra byl **CAD/CAM**: změnu návrhu lze provést v modelu a promítnout do výroby. Nejbližší zásah do *fyzického provádění* práce jsou **programovatelné obráběcí stroje a průmyslové roboty**: stroj přebírá opakovatelné pohyby, zatímco člověk připravuje zadání, seřizuje a kontroluje výsledek. Ve stavebnictví je nejlepší analogií **BIM**: místo izolovaných výkresů vzniká koordinovaný informační model stavby napříč profesemi a životním cyklem. Jde o rozdílné technologie, které zasáhly různé úlohy a měly různě silné doklady o dopadech.

| Technologie | Jakou dosavadní práci mění | Co zůstává nebo nově vzniká | Podobnost s LLM | Meze analogie |
|---|---|---|---|---|
| **CAD/CAM** | Ruční kreslení, úpravy výkresů, přepis návrhu pro výrobu. | Geometrie, simulace, dokumentace, správa modelu a ověřování vyrobitelnosti. | Digitální nástroj mění samotnou tvorbu profesního artefaktu. | Konstrukci určuje konstruktér; deterministický geometrický model není volně generovaný text. |
| **NC/CNC + roboty** | Ruční vedení nástroje, opakované pohyby a část manipulace. | Programování dráhy, upínání, seřízení, údržba, metrologie a bezpečnost. | Automatizace části původně lidských úloh a tlak na přeskupení profesí. | Vyžaduje stroje, materiál, prostor a kapitál; fyzická výroba má jiná omezení než generování kódu. |
| **BIM** | Oddělené výkresy, opakovaný přepis informací, nekonzistentní verze projektů. | Koordinace projektantů, pravidla předávání dat, správa změn a informací o stavbě v provozu. | Sdílený digitální artefakt mění spolupráci a kontrolu kvality. | BIM sám projekt „nevymyslí“; stavba je místně vázaná, regulovaná a musí se skutečně postavit. |

## 1. Strojírenství: od řemeslné operace k programu a modelu

### Jak se změnil pracovní postup

[Patent Johna T. Parsonse a Franka Stulena, podaný roku 1952 a vydaný roku 1958](https://patents.google.com/patent/US2820187A/en), popisuje řízení pohybu obráběcího stroje z uložených instrukcí na kartách či pásce. Cílem bylo nahradit část zdlouhavé ruční práce s přesnými šablonami a vedením stroje podle modelu. Šlo o rané **numerické řízení (NC)**, **nikoli o dnešní počítačem řízené CNC ani o AI**. [Computer History Museum datuje Sutherlandův Sketchpad a projekt automobilového CAD DAC-1 do roku 1963](https://www.computerhistory.org/timeline/1963/): návrh se mohl stát interaktivním digitálním objektem, ne jen čárou na papíře.

Praktický řetězec se postupně proměnil z „nakreslit → vyrobit šablonu → ručně opracovat → přeměřit“ na „navrhnout model → vytvořit výrobní postup/řídicí program → seřídit stroj → obrobit → přeměřit a upravit“. To je **zjednodušené schéma změny úloh**, ne tvrzení, že každá provozovna používá stejné vybavení. [Americká profesní databáze O*NET](https://www.onetonline.org/link/summary/51-9162.00) dnes výslovně rozlišuje **programátory CNC**, kteří plánují posloupnost operací, dráhy a zkušební běhy, od [operátorů CNC](https://www.onetonline.org/link/summary/51-9161.00), kteří stroje nastavují, měří výsledky a řeší závady. [Popis práce obráběčů](https://www.onetonline.org/link/summary/51-4041.00) zahrnuje i vlastní programování a kontrolu: hranice rolí není absolutní. To **dokládá změnu skladby úloh a specializaci**, nikoli počet lidí, kteří kvůli ní získali či ztratili práci.

Co se stalo s odpovědností? Chybně navržený díl lze z CAD/CAM vyrobit opakovaně velmi přesně, ale stále **chybně**. Rozměrové tolerance, vlastnosti materiálu, zkušební kus, měření, údržba a bezpečné zastavení procesu proto nezmizely. Analogie k softwaru: snadnější generování artefaktu zvětšuje význam jeho **ověření v reálném prostředí**.

### Robotizace: data o nasazení versus data o práci

[Mezinárodní federace robotiky (IFR) uvádí](https://ifr.org/ifr-press-releases/news/global-robot-demand-in-factories-doubles-over-10-years), že se roku **2024** v továrnách po celém světě instalovalo asi **542 000** průmyslových robotů, **více než dvojnásobek proti roku 2014**; provozní zásoba činila **4,664 milionu**. To dokládá rozsah a trvání automatizace. **Počet robotů ale není počet zrušených pracovních míst:** jeden robot se může nasadit při expanzi výroby, úspory nákladů mohou zvýšit poptávku a jiní zaměstnanci mohou být potřeba na jeho provoz.

Empirické dopady mohou být i **negativní** a záleží, koho měříme:

- [Acemoglu a Restrepo, *Robots and Jobs*](https://www.nber.org/papers/w23285), analyzovali **americké místní trhy práce v letech 1990–2007**. Jejich odhad: zvýšení expozice o **jednoho robota na 1 000 pracovníků** souvisí s kauzálně odhadovaným snížením **poměru zaměstnaných k populaci o 0,18–0,34 procentního bodu** a mezd o **0,25–0,5 %**. Jde o efekt **na lokální trh**, ne o pravidlo „jeden robot propustí X lidí“ v jedné továrně ani předpověď pro AI.
- [Acemoglu, LeLarge a Restrepo, *Competing with Robots*](https://www.nber.org/papers/w26738), zkoumali **francouzské výrobní podniky 2010–2015**. Z 55 390 sledovaných podniků roboty pořídilo 598; ty představovaly asi **20 % výrobní zaměstnanosti vzorku**. Robotizující podniky zvýšily produktivitu, přidanou hodnotu **i vlastní zaměstnanost**, ale současně se snížil podíl práce na jejich přidané hodnotě a ostatní konkurenti ztráceli: odhad **celkového dopadu na zaměstnanost odvětví je záporný**. Výsledek vyvrací jak „automatizující firma musí propouštět“, tak „když firma nabírá, automatizace neškodí trhu“.

Obě studie sledují **robotizaci ve výrobě** v různých zemích a obdobích; nejde o vyčíslení samotného přínosu CAD/CNC ani o statistiku českých strojírenských profesí. Ukazují rozdíl mezi **zájmem firmy, osudem konkurentů a místním pracovním trhem**. Tytéž rozdíly je nutné hlídat při výkladu dnešních AI investic a propouštění v IT.

## 2. Stavebnictví: BIM jako změna organizace informací, nikoli autonomní stavitel

### Co se změnilo

[Britský program Digital Built Britain](https://www.gov.uk/guidance/creating-a-digital-built-britain-what-you-need-to-know) popisuje BIM jako způsob vytváření a sdílení informací o stavbě v definovaných fázích projektu pro návrh, realizaci i údržbu. Nejde pouze o pěknou **3D vizualizaci**. Konstruktér, architekt, profese TZB, dodavatel a správce objektu potřebují pracovat s navazujícími údaji o prvcích, změnách a požadavcích na předání. Potenciálním přínosem je rozpoznat kolize před realizací a omezit opakované přepisování informací.

Podobně jako u software se tím mění hranice odpovědnosti: nestačí „vyprodukovat výkres“. Někdo musí definovat požadavky na data, koordinovat disciplíny, zkontrolovat model proti skutečnému stavu a předat ho použitelné podobě provozovateli. [Britský vládní program uvádí](https://www.gov.uk/guidance/creating-a-digital-built-britain-what-you-need-to-know), že centrálně financované vládní resorty používají tehdejší metodiku **BIM Level 2**, popsanou ve strategii 2016–2020. **Změna zadávání zakázek a pracovních procesů** je doložená; zákon z toho ale nečiní univerzální povinnost pro všechny stavby v Británii, natož v ČR.

### Dopady: adopce, možné úspory a nepohodlný výsledek za celý obor

1. **Rozšíření praxe:** [Britský průzkum NBS z roku 2020](https://www.thenbs.com/downloads/national-bim-report-2020) mezi **více než 1 000 respondenty z oboru** uvádí, že **73 % dotázaných používá BIM**. V roce 2011 podle téže zprávy **43 % dotázaných o BIM neslyšelo**. Jde o **dvě různé otázky** a vzorky respondentů, ne o pokus vypočítat „nárůst používání o 43 či 73 procentních bodů“ v celé britské ekonomice.
2. **Velikost problému, který digitalizace řešila:** [NIST v analýze z roku 2004](https://www.nist.gov/publications/inadequate-interoperability-closer-look-costs) odhadl náklady **nedostatečné interoperability** v americkém segmentu investičních staveb a jejich provozu na **15,8 mld. USD ročně** (v tehdejších cenách a metodice). **To není úspora dosažená BIM**, ani dnešní ztráta českého stavebnictví; jen vyčíslení výchozího problému.
3. **Přínosy v konkrétních projektech:** [Centre for Digital Built Britain (2018)](https://www.cdbb.cam.ac.uk/news/2018JuneBIMBenefits) zveřejnil rámec PwC pro měření přínosů. Cituje hlášené úspory britské Environment Agency kolem **600 tisíc liber ročně** při řízeném přenosu dat z projektů do provozu a u konkrétního silničního projektu **potenciální** úsporu kolem **1 milionu liber** díky koordinaci. První je vyjádření příslušné instituce, druhé **potenciál případové studie**: ani jedno není prokázaná průměrná úspora celého stavebního sektoru. Stejný přehled zmiňuje celkové úspory veřejných investičních projektů ve výši 3 mld. liber, ale **nelze je připsat pouze BIM**, protože probíhaly i jiné změny zadávání a řízení.
4. **Makro kontrola optimistického příběhu:** [Goolsbee a Syverson (NBER, 2023)](https://www.nber.org/papers/w30845) konstatují **dlouhodobý pokles měřené produktivity amerického stavebnictví**; problém přetrvává i při pohledu na fyzické ukazatele bytové výstavby, kde je vývoj klesající nebo v nejlepším případě stagnuje. Autoři řeší i možné chyby v měření a překážky přesunu práce ke schopnějším firmám. **Studie neprokazuje, že BIM produktivitu snížil**: naopak brání zkratce „digitální nástroj se rozšířil, proto už musela vzrůst produktivita celého oboru“.

Proč by mohl být dopad na staveništi jiný než v digitálním návrhu? Stavba je **jednorázová, místně vázaná, závislá na dodavatelském řetězci, povoleních, počasí a skutečném fyzickém provedení**. Lepší koordinace projektu není automaticky kratší betonáž ani hladké předání informací každému subdodavateli. To je **vysvětlující mechanismus**, nikoli naměřená dekompozice výpadku produktivity.

## 3. V čem je analogie k AI a vývoji software užitečná

| Otázka pro přednášku | Příklad z průmyslu a staveb | Co z toho *lze* přenést do IT |
|---|---|---|
| Kde se sníží cena jedné úlohy? | NC/CNC opakuje trajektorii; CAD umožňuje rychleji změnit model; BIM umožní sdílet tentýž model. | LLM zlevní první návrh kódu nebo textu; ještě to neměří cenu **správného a provozovatelného** řešení. |
| Kde vznikne nová zodpovědnost? | Upnutí dílu, tolerance a bezpečnost stroje; konzistence projektu a skutečného provedení stavby. | Testování, revize, integrace, provoz, bezpečnost a znalost domény nezmizí jen proto, že vznikl návrh. |
| Kdo získá produktivitu? | Robotizující továrna může růst, zatímco konkurenti ztrácejí; jednotlivý BIM projekt může šetřit, aniž roste celé odvětví. | Výsledek jedné firmy nelze vydávat za výsledek všech vývojářů, dodavatelů či regionů. |
| Co se stane s řemeslem? | Ruční dovednosti se částečně mění na programování, seřízení a metrologii; stavitel musí rozumět modelu i stavbě. | Dovednost vyprodukovat artefakt a dovednost **posoudit jeho správnost** nejsou totéž. Je nutné promyslet, kde se druhé dovednosti naučí začátečníci. |
| Kdy je technologie skutečně „game changer“? | Až když funguje se stroji, zakázkami, normami a lidmi; nikoli ve chvíli prvního dema či mandátu. | Hodnotit nasazení podle kvality výsledku, bezpečnosti, organizace práce a dopadu na lidi, nejen podle počtu generovaných řádků. |

**Důležitá hranice přenosu:** U robotů je nutné pořídit a fyzicky zapojit kapitálové vybavení; u BIM sladit mnoho firem kolem společných dat. LLM lze nasadit napříč kancelářskými úlohami mnohem snáz, ale jeho výstup může být věrohodný a přesto nesprávný. Historický výsledek ani rychlost změny proto nelze mechanicky extrapolovat.

### Teze použitelné na slide

> **„CNC nevymýtilo obrábění. Přesunulo část práce z ruky do programu, seřízení a kontroly. To ale neznamená, že na tom všichni pracovníci vydělali.“**

> **„BIM digitalizoval projekt a koordinaci; produktivita celého stavebnictví se tím automaticky nevyřešila. Úzké hrdlo se může přesunout od kreslení k odpovědnosti za skutečný výsledek.“**

> **„Firma, která dobře automatizuje, může sama nabírat a zároveň připravovat konkurenty o zakázky a zaměstnance. Dopad automatizace se proto musí hodnotit i mimo vlastní firmu.“**

## Metodika a zdroje

- Historie návrhu a výroby: [původní patent řízení obráběcího stroje (podán 1952)](https://patents.google.com/patent/US2820187A/en), [Computer History Museum: CAD a Sketchpad (1963)](https://www.computerhistory.org/timeline/1963/), [O*NET: programátoři CNC](https://www.onetonline.org/link/summary/51-9162.00), [O*NET: operátoři CNC](https://www.onetonline.org/link/summary/51-9161.00). **Popisy současných profesí nepředstavují historickou statistiku počtu pracovních míst.**
- Nasazení robotů: [IFR, World Robotics 2025](https://ifr.org/ifr-press-releases/news/global-robot-demand-in-factories-doubles-over-10-years) (globální instalace a zásoba za rok 2024). Dopady: [Acemoglu a Restrepo, USA 1990–2007](https://www.nber.org/papers/w23285) a [Acemoglu, LeLarge a Restrepo, Francie 2010–2015](https://www.nber.org/papers/w26738). **Instalace jsou kusy zařízení, ekonometrické odhady zaměstnanosti jsou jiné veličiny.**
- Stavby: [britský Digital Built Britain](https://www.gov.uk/guidance/creating-a-digital-built-britain-what-you-need-to-know), [NBS průzkum BIM 2020](https://www.thenbs.com/downloads/national-bim-report-2020), [NIST, odhad ztrát interoperability z roku 2004](https://www.nist.gov/publications/inadequate-interoperability-closer-look-costs), [Centre for Digital Built Britain, případové studie a metodika PwC 2018](https://www.cdbb.cam.ac.uk/news/2018JuneBIMBenefits), [NBER: produktivita amerického stavebnictví](https://www.nber.org/papers/w30845).
- **Geografie a kauzalita:** USA, Francie, Británie a globální instalace robotů nejsou českým průřezem trhu práce. Průzkum přijetí BIM, peněžní odhad nekompatibility a kauzální odhad účinku robotů mají **různé definice a odlišnou důkazní sílu**; nelze je sčítat nebo přenést jako prognózu propouštění kvůli LLM.
