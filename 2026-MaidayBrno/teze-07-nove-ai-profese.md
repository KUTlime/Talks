# Teze: „AI bere práci vývojářům, ale vytváří stejně mnoho AI pozic“

Pracovní rešerše pro MaiDay 2026. Stav zdrojů k **24. říjnu 2026**. Navazuje kontextově na [rešerši propouštění](../2026-MaidayBrno/propousteni-it-2024-2026.md) a [rešerši nabídek práce](../2026-MaidayBrno/nabidky-prace-it-2015-2026.md), ale je samostatná: cílem je ověřit **skutečné nástupy/odchody a stavy zaměstnanosti podle povolání**, nikoli počet inzerátů, a důsledně oddělit **prognózu** od **pozorování**.

## Verdikt

**Teze je ve své kompenzační podobě („1 : 1 náhrada, stejně mnoho AI pozic kolik zanikne vývojářských“) nepodložená a pravděpodobně nepravdivá jako přesná bilance; jako hrubý směr („vedle úbytku v části vývojářských rolí reálně rostou nové datové/AI role“) je podložená, ale s podstatně odlišnou dynamikou v USA, EU a ČR a s jasnou převahou prognóz nad pozorováním.**

1. **Skutečně pozorovaná zaměstnanost** v americkém odvětví počítačových služeb (NAICS 5415, BLS/FRED) **klesá** od vrcholu prosince 2022 (2 483,0 tis.) na 2 355,4 tis. v září 2026 (**−127,6 tis., −5,1 %**), ale je stále o **+122,8 tis. (+5,5 %) výš** než v lednu 2021 — čistý propad existuje, ale menší než kumulativní nárůst z předchozích let.
2. **Skutečně pozorovaná zaměstnanost ICT specialistů v EU27** (Eurostat, šetření pracovních sil) v letech 2021–2025 naopak **nepřetržitě rostla** z 8 920,3 na 10 450,8 tis. (**+1 530,5 tis., +17,2 %**) — opačný směr než americký odvětvový ukazatel. V **ČR** totéž číslo mezitím **kleslo** z 240,6 tis. (2021) na 217,9 tis. (2023, **−9,4 %**) a pak se vrátilo na 248,2 tis. (2025) — tvar písmene V, ne přímá linie.
3. **Žádný z citovaných čísel o „nových AI pozicích“ v řádu desítek až stovek milionů (WEF, IMF, OECD) není pozorování** — jde o prognózy/odhady expozice k roku 2030, postavené na anketách zaměstnavatelů nebo na analýze obsahu pracovních úkolů, nikoli na sečtení skutečných nástupů.
4. **Oficiální statistiky (BLS, Eurostat) zatím nemají samostatnou kategorii „AI inženýr“ nebo „prompt engineer“** — tyto role se schovávají uvnitř starších kategorií (Software Developers, Data Scientists, Computer and Information Research Scientists, ICT specialists), takže přímé přičtení „nové AI pozice = kompenzace za zaniklou vývojářskou pozici“ **nelze z veřejných čísel ověřit ani vyvrátit na úrovni jednotlivých osob**.
5. Existují **reálná (pozorovaná) data o mzdovém rozevírání**: PwC AI Jobs Barometer na datech ze skutečných pracovních inzerátů a firemních výkazů ukazuje rychlejší růst mezd i počtu zaměstnanců ve firmách silně vystavených AI, ale také vznik „dvoukolejného“ trhu, kde se nůžky mezi „zprofesionalizovanými“ a „zdemokratizovanými“ pozicemi rozevírají a juniorní pozice v nejvíce AI-exponovaných odvětvích dlouhodobě stagnují.

## Co přesně rozlišujeme

| Typ zdroje | Co měří | Je to pozorování, nebo prognóza? |
|---|---|---|
| BLS CES / FRED (USA), NAICS 5415 | Skutečný měsíční stav zaměstnanců v odvětví „Computer Systems Design and Related Services“, sezónně očištěno | **Pozorování** (administrativní výkazy zaměstnavatelů) |
| Eurostat `isoc_sks_itspt` (EU/ČR) | Skutečný roční stav zaměstnaných „ICT specialistů“ napříč odvětvími podle sebehodnocení v šetření pracovních sil | **Pozorování**, ale jde o sebezařazení do povolání ve výběrovém šetření, ne o administrativní mzdové výkazy jako u BLS CES — čísla nejsou metodicky identická |
| BLS OOH (Occupational Outlook Handbook), *Job Outlook* | Projektovaný růst zaměstnanosti 2023/24–2033/34 podle povolání (Software Developers, Data Scientists, Computer and Information Research Scientists) | **Prognóza** (desetiletá projekce); výchozí úroveň zaměstnanosti v tabulkách je ale **pozorování** (OEWS, konkrétní rok) |
| WEF Future of Jobs Report 2025 | Očekávání přes 1 000 zaměstnavatelů (55 ekonomik, 14 mil. pracovníků) kombinovaná s daty ILO o zaměstnanosti | **Prognóza** založená na anketě záměrů, ne na měření skutečných toků |
| OECD Employment Outlook 2023 (kapitola o AI) | Podíl pracovních míst v povoláních s „vysokým rizikem automatizace“ AI a dalšími technologiemi (27 %) | **Odhad expozice** podle obsahu úkolů, ne pozorovaný počet ztracených míst |
| IMF Staff Discussion Note (leden 2024) | Podíl globální zaměstnanosti „vystavené“ AI (celosvětově ~40 %, ve vyspělých ekonomikách ~60 %) | **Odhad expozice/scénář**, autoři sami používají slova „could“/„may“ |
| PwC AI Jobs Barometer | Analýza skutečných pracovních inzerátů a firemních finančních výkazů napříč odvětvími a zeměmi | **Pozorování** (retrospektivní analýza reálných dat), ne anketa očekávání |

## 1. USA: skutečná zaměstnanost v „počítačových službách“ klesá od konce 2022 — ale méně, než naznačují titulky o propouštění

[BLS CES, řada `CES6054150001`](https://fred.stlouisfed.org/graph/fredgraph.csv?id=CES6054150001&cosd=2019-01-01&coed=2026-09-01) (přes FRED) měří **skutečný měsíční, sezónně očištěný stav zaměstnanců** v odvětví *Computer Systems Design and Related Services* (NAICS 5415) — nejbližší dostupná administrativní (ne self-report, ne inzertní) aproximace pro „lidi, kteří programují, dělají IT poradenství a podobné služby“ v USA. Nejde o jedno povolání „vývojář“, ale o celé odvětví IT služeb.

| Datum | Zaměstnanost (tis., sez. očištěno) | Komentář |
|---|---:|---|
| 2019-01 | 2 153,6 | Před pandemií |
| 2021-01 | 2 232,6 | Začátek sledovaného období teze |
| 2022-12 | **2 483,0** | **Historické maximum** řady |
| 2023-12 | 2 449,8 | Po prvních vlnách propouštění 2022–2023 |
| 2024-06 | 2 444,7 | |
| 2025-12 | 2 380,6 | |
| 2026-09 | **2 355,4** | Poslední dostupný měsíc |

**Čtení:** Od vrcholu (prosinec 2022) do září 2026 odvětví ztratilo **127,6 tis. míst (−5,1 %)** — to je skutečný, administrativně zaznamenaný, ne jen ohlášený pokles, a časově odpovídá období masivních oznámení o propouštění v technologických firmách i nástupu generativní AI do firemního provozu. Zároveň je ale zaměstnanost v září 2026 **stále o 122,8 tis. (+5,5 %) vyšší** než v lednu 2021, tedy před boomem generativní AI — **čistá ztráta pracovních míst za celé sledované období 2021–2026 v tomto odvětví neexistuje**, existuje jen ztráta oproti dřívějšímu vrcholu. Odvětví navíc zahrnuje mnohem víc rolí než „vývojáře“ (QA, konzultanty, provoz datových center, projektové řízení), takže z něj nelze přímo odvodit osud jedné konkrétní profese.

Zdroj dat: [FRED, série CES6054150001](https://fred.stlouisfed.org/series/CES6054150001), primárně [BLS Current Employment Statistics](https://www.bls.gov/ces/).

## 2. EU a ČR: počet ICT specialistů (Eurostat) nepadá — ale ČR má jiný tvar křivky než USA

[Eurostat, `isoc_sks_itspt`](https://ec.europa.eu/eurostat/databrowser/view/isoc_sks_itspt/default/table) měří **skutečný roční stav zaměstnaných ICT specialistů** (tisíce osob) napříč všemi odvětvími ekonomiky, na základě šetření pracovních sil (LFS) — respondent sám uvádí povolání a dovednosti, nejde o mzdové výkazy jako u BLS CES. **Agregát je proto metodicky odlišný od amerického čísla výše a nelze je přímo sčítat ani poměřovat jako jednotky stejné váhy.**

| Rok | EU27 (tis.) | Meziroční změna EU27 | ČR (tis.) | Meziroční změna ČR |
|---|---:|---:|---:|---:|
| 2019 | 7 880,4 | — | 213,8 | — |
| 2020 | 8 442,4 | +7,1 % | 219,8 | +2,8 % |
| **2021** | **8 920,3** | +5,7 % | **240,6** | +9,5 % |
| 2022 | 9 370,1 | +5,0 % | 232,9 | **−3,2 %** |
| 2023 | 9 749,5 | +4,0 % | 217,9 | **−6,4 %** |
| 2024 | 10 189,9 | +4,5 % | 234,6 | +7,7 % |
| 2025 | 10 450,8 | +2,6 % | 248,2 | +5,8 % |

**Čtení:** V **EU27 jako celku** počet ICT specialistů **rostl v každém jednotlivém roce 2021–2025** o 2,6 až 5,7 % ročně — ani jeden rok poklesu, souhrnně **+1 530,5 tis. osob (+17,2 %)** za pět let. To je přímo v rozporu s obrazem plošného úbytku IT pozic z amerických titulků o propouštění. V **ČR** je ale vidět jiný vzorec: **dvouletý pokles 2021→2023 (−22,7 tis., −9,4 %)**, přesně v období, kdy globální technologické firmy nejvíc propouštěly, následovaný návratem na nové maximum v roce 2025. **ČR tedy zažila reálný, byť dočasný a menší pokles, který EU agregát jako celek nezažil** — rozdíl mezi zeměmi uvnitř EU je podstatný a nelze mluvit o jednotném „evropském“ vývoji.

Datový zdroj: [Eurostat API `isoc_sks_itspt`](https://ec.europa.eu/eurostat/api/dissemination/statistics/1.0/data/isoc_sks_itspt?format=JSON&lang=EN), jednotka `THS_PER` (tisíce osob), kód zemí `EU27_2020` a `CZ`.

## 3. USA: co BLS skutečně projektuje pro vývojáře a „AI profese“ — a proč je to prognóza, ne pozorování

[BLS Occupational Outlook Handbook](https://www.bls.gov/ooh/) (ověřeno přes archivované kopie, protože aktuální web BLS blokuje automatizované stahování) uvádí pro tři klíčová povolání **výchozí (pozorovanou) zaměstnanost** a **desetiletou projekci růstu**, nikoli dosavadní vývoj:

| Povolání | Zaměstnanost (výchozí rok) | Projektovaný růst | Medián mzdy 2024 | Průměrný počet volných míst/rok |
|---|---:|---:|---:|---:|
| Software Developers, QA Analysts and Testers | 1 895 500 (2024) | **+15 %** 2024–2034 („mnohem rychleji než průměr“) | 131 450 USD (SW developers samotní: 133 080 USD) | ~129 200 |
| Data Scientists | 202 900 (2023) | **+36 %** 2023–2033 | 112 590 USD | ~20 800 |
| Computer and Information Research Scientists | 36 600 | **+26 %** 2023–2033 | 140 910 USD | ~3 400 |

**Klíčové upozornění:** Toto jsou **projekce**, založené na ekonometrickém modelu BLS (ne na pozorovaném vývoji 2024–2026), a „počet volných míst ročně“ zahrnuje i **náhradu za odchody a změny povolání**, ne jen čistý růst. Zároveň **BLS dosud nemá samostatný kód SOC pro „AI engineer“, „machine learning engineer“ ani „prompt engineer“** — tyto pracovní tituly se v datech schovávají uvnitř kategorií výše (nejčastěji Computer and Information Research Scientists nebo Software Developers) nebo pod obecnějšími IT kategoriemi. **Z veřejných čísel proto nelze spočítat, kolik konkrétních „AI pozic“ v USA skutečně vzniklo** — jen to, že kategorie, do kterých by spadaly, rostou rychleji než průměr ekonomiky. Navíc BLS u Software Developers neprojektuje pokles, ale růst — to je přímo v rozporu s populární verzí teze, že „AI убere práci vývojářům“ jako povolání jako celku; realitou je spíš posun uvnitř povolání (QA/testing vs. seniorní vývoj vs. nové nástroje), který agregátní číslo nezachytí.

Zdroje: [archiv OOH Software Developers](https://web.archive.org/web/20251231232808/https://www.bls.gov/ooh/computer-and-information-technology/software-developers.htm), [archiv OOH Data Scientists](https://web.archive.org/web/20250816123734/https://www.bls.gov/ooh/math/data-scientists.htm), [archiv OOH Computer and Information Research Scientists](https://web.archive.org/web/20250814154447/https://www.bls.gov/ooh/computer-and-information-technology/computer-and-information-research-scientists.htm).

## 4. WEF Future of Jobs Report 2025: „170 milionů nových pracovních míst díky AI“ je nesprávná parafráze

[World Economic Forum, Future of Jobs Report 2025](https://www3.weforum.org/docs/WEF_Future_of_Jobs_Report_2025.pdf) (leden 2025) je **anketa očekávání přes 1 000+ zaměstnavatelů** reprezentujících 14 milionů pracovníků ve 22 odvětvových klastrech a 55 ekonomikách, kombinovaná se statistikami zaměstnanosti ILO — **jde o prognózu do roku 2030 na základě subjektivních očekávání zaměstnavatelů**, ne o měření skutečných toků.

- Souhrn **přes všech pět makrotrendů** (technologie, geoekonomická fragmentace, zelená tranzice, demografie, ekonomická nejistota): **170 mil. nově vytvořených míst, 92 mil. zaniklých, čistě +78 mil. (7 % dnešní zaměstnanosti)** do roku 2030. *Toto číslo se v médiích často zjednodušuje na „AI vytvoří 170 milionů pracovních míst“ — není to správně, jde o souhrn přes všechny trendy, ne jen AI.*
- **Konkrétně trend „AI a technologie na zpracování informací“** má podle zprávy vytvořit **11 mil.** a zrušit **9 mil.** pracovních míst — tedy **čistě jen +2 mil. globálně do roku 2030**, mnohem méně než u „rozšiřujícího se digitálního přístupu“ (+19 mil./−9 mil.) nebo než záporný čistý efekt robotiky a autonomních systémů (−5 mil. čistě).
- Mezi **procentuálně nejrychleji rostoucí role** 2025–2030 patří dle zaměstnavatelů Big Data Specialists, FinTech Engineers, AI and Machine Learning Specialists a **Software and Applications Developers** — vývojářská role je zde řazena mezi **rostoucí**, ne mezi klesající profese.
- Mezi **absolutně největší přírůstky pracovních míst** (ne jen v %) figurují vedle pečovatelských a vzdělávacích rolí i **Software and Applications Developers, General and Operations Managers a Project Managers** — opět na straně růstu. Naopak mezi absolutně nejvíc klesajícími rolemi dominují administrativní/úřednické profese (pokladní, asistentky, účetní referenti), ne vývojáři.

**Shrnutí rizika špatné citace:** Prezentovat „WEF: AI vytvoří 170 milionů pracovních míst“ je **chybná parafráze** — správně je to „170 mil. míst vznikne z kombinace pěti trendů, z toho AI specificky čistě jen 2 miliony navíc, podle očekávání zaměstnavatelů, ne podle pozorovaného vývoje“.

## 5. OECD a IMF: „expozice“ není totéž co ztráta práce

- [OECD Employment Outlook 2023](https://web.archive.org/web/20231129012706/https://www.oecd.org/employment-outlook/2023/): „When considering all automation technologies including AI, **27 % jobs are in occupations at high-risk of automation**.“ Jde o odhad podílu pracovních míst v povoláních, jejichž pracovní úkoly jsou technicky nahraditelné — **ne o pozorovaný počet skutečně ztracených míst**. Ze stejné zprávy: šetření OECD mezi pracovníky a zaměstnavateli ve výrobě a financích v sedmi zemích (2022) zjistilo, že používání AI v práci je spojeno i s **pozitivními dopady** na spokojenost, zdraví a mzdy, vedle rizik (soukromí, intenzita práce, zkreslení).
- [IMF Staff Discussion Note, leden 2024](https://www.imf.org/en/Blogs/Articles/2024/01/14/ai-will-transform-the-global-economy-lets-make-sure-it-benefits-humanity): „almost **40 percent of global employment is exposed to AI**“; ve vyspělých ekonomikách až **60 %**, v rozvíjejících se trzích 40 % a v zemích s nízkými příjmy 26 %. Autoři explicitně používají slova „**could**“/„**may**“ — jde o scénář/odhad expozice, ne o měřený výsledek. Zpráva zdůrazňuje distribuční efekt: polovina exponovaných míst může z AI těžit (produktivita), druhá polovina může čelit nižší poptávce po práci a mzdách, v krajním případě zániku místa — **tedy ani uvnitř jednoho zdroje není jednoznačný závěr „AI bere, nebo dává“**.

Obě čísla jsou cenná pro odhad **rizika/potenciálu**, ale nelze je číst jako „27 % (nebo 40 %, 60 %) lidí už přišlo o práci kvůli AI“.

## 6. PwC AI Jobs Barometer: skutečná (pozorovaná) data o mzdách, náborech a dvoukolejném trhu

[PwC AI Jobs Barometer](https://www.pwc.com/gx/en/1/services/ai/ai-jobs-barometer.html) je na rozdíl od WEF/OECD/IMF výše založen na **analýze skutečných pracovních inzerátů a firemních finančních výkazů**, ne na anketě očekávání:

- **Headcount roste rychleji** ve firmách nejvíc vystavených AI než v nejméně vystavených firmách; PwC to interpretuje jako důkaz, že AI „není jen zabiják pracovních míst“, pokud je používána k růstu, ne jen k úsporám.
- **Mzdy rostou rychleji** ve firmách nejvíc vystavených AI; PwC to čte jako signál, že část zisků z produktivity se sdílí se zaměstnanci — ale jde o vlastní interpretaci PwC, ne o nezávisle ověřenou kauzalitu.
- Vzniká **„dvoukolejný“ trh práce**: AI „zprofesionalizovává“ některé pozice (vyžadují víc lidské expertizy) a „demokratizuje“ jiné (zpřístupňuje je i neexpertům). Počet zprofesionalizovaných pozic roste **2× rychleji** než demokratizovaných a s **o 42 % vyšším** mzdovým růstem — jde o konkrétní, reálně měřený **mzdový mismatch** uvnitř stejné sady povolání, ne o prognózu.
- **Nástupní/juniorní pozice v nejvíc AI-exponovaných odvětvích stagnují** (počty inzerátů na vstupní pozice se od roku 2019 v těchto odvětvích v podstatě nehýbou), zatímco „zseniorizované“ vstupní pozice (vyžadující i juniorské úkoly dřívější seniorské dovednosti, např. vedení lidí) rostou od roku 2019 o **+35 %**. To je přímý doklad **skill mismatchu**: vstupní úroveň zůstává formálně otevřená, ale nároky na dovednosti rostou, takže se skutečně reálně zužuje počet pozic dostupných čerstvým absolventům bez praxe.

**Limit:** Přesnou metodiku (počet analyzovaných inzerátů, počet zemí, přesné období) se nepodařilo z veřejně dostupné stránky bez omezení ověřit do detailu — citovaná tvrzení pocházejí přímo z oficiální prezentace zprávy na pwc.com, ne z nezávislého auditu dat. Berte je jako **firemní analytický produkt s komerčním zájmem (prodej poradenství k AI)**, ne jako nezávislou akademickou studii.

## 7. Mzdový, regionální a skill mismatch — souhrn napříč zdroji

1. **Mzdový mismatch:** PwC (bod 6) ukazuje reálně měřený rozdíl mezd mezi „AI-exponovanými“ a ostatními pozicemi (+42 % rychlejší růst mezd u „zprofesionalizovaných“ rolí). BLS OOH navíc ukazuje, že already dnes má Computer and Information Research Scientists medián mzdy 140 910 USD/rok oproti 112 590 USD/rok u Data Scientists a 131 450 USD/rok u Software Developers — i uvnitř „nových AI profesí“ existuje výrazné mzdové rozpětí, ne jednotná „AI prémie“.
2. **Regionální mismatch:** USA (odvětvový pokles −5,1 % od vrcholu 2022) a EU27 (nepřetržitý růst ICT specialistů +17,2 % 2021–2025) se v pozorovaném období pohybují **opačnými směry**; uvnitř EU má ČR vlastní dočasný propad 2021–2023 (−9,4 %), který se liší od agregátu EU27 i od USA. Z toho plyne, že **globální tvrzení o „AI bere práci všude stejně“ nebo „nové pozice vznikají všude stejně“ neplatí** — dynamika je národní/odvětvová, ne univerzální.
3. **Skill/úrovňový mismatch:** PwC data o stagnujících juniorních inzerátech v AI-exponovaných odvětvích (bod 6) a BLS projekce rostoucí poptávky po Data Scientists (+36 %, vyžaduje bakalářský/magisterský titul) společně naznačují, že **růst „nových AI pozic“ se koncentruje do seniorních/specializovaných rolí s vyššími kvalifikačními nároky**, zatímco plošný vstup do IT (juniorní vývojářské pozice) je podle dřívější rešerše nabídek práce pod tlakem — jde o kvalitativně jiný typ práce, ne o přímou substituci „jedna zaniklá juniorská pozice = jedna nová AI pozice“.
4. **Chybějící přímý most mezi odvětvími:** Žádný z výše uvedených zdrojů neumí ukázat **kolik konkrétních propuštěných vývojářů skutečně přešlo do nové „AI pozice“**. Existují jen dvě oddělené časové řady (klesající odvětví u jedněch povolání/zemí, rostoucí kategorie u jiných povolání/zemí) — jejich souběh je **korelace v agregátních datech, ne vysledovaný přechod konkrétních lidí**.

## 8. Limity a co z dostupných dat nelze tvrdit

- **Nelze tvrdit, že počet nových AI pozic se rovná počtu zaniklých vývojářských pozic** — žádný citovaný zdroj takovou bilanci na úrovni jednotlivců neměří; dostupná jsou jen agregátní, metodicky nesourodá čísla pro různé definice povolání, odvětví a zemí.
- **Nelze mechanicky sčítat BLS CES (odvětví), Eurostat ICT specialisty (napříč odvětvími, sebehodnocení povolání) a WEF/OECD/IMF odhady expozice (globální, na základě anket nebo analýzy úkolů)** — liší se jednotka, metoda sběru, geografické pokrytí i to, zda jde o pozorování, nebo prognózu.
- **BLS ani Eurostat nemají samostatnou kategorii pro „AI engineer“/„prompt engineer“** — proto nelze izolovaně spočítat přírůstek čistě „AI pozic“ odděleně od obecnějšího růstu kategorií Data Scientists / Computer and Information Research Scientists / ICT specialists.
- **WEF, OECD i IMF čísla jsou prognózy/odhady expozice s horizontem do roku 2030-33**, ne měření let 2021–2026; nelze je citovat jako „už se to stalo“.
- **PwC AI Jobs Barometer je firemní produkt** s jasným komerčním zájmem (AI poradenství); jeho zjištění jsou věrohodnější jako **pozorování směru** (rychlejší růst mezd/headcountu u AI-exponovaných firem) než jako přesná čísla k citaci na desetinná místa.
- Americký pokles v NAICS 5415 a evropský růst ICT specialistů **nejsou navzájem kompenzační páry** — nejde o tutéž populaci lidí ani o tutéž definici profese; jde o dva samostatné, paralelně platné nálezy.
- CZ ICT specialisté dle Eurostatu jsou malá absolutní čísla (řádově 200–250 tisíc) s velkou meziroční volatilitou u relativně malého vzorku v šetření pracovních sil — jednoroční výkyvy (zejména pokles 2022–2023) je třeba brát s rezervou, ne jako jistý důkaz vlny propouštění v ČR.

## 9. Formulace pro slide

> „Americká IT odvětví po vrcholu 2022 skutečně hubnou (−5 % zaměstnanců do 2026), ale evropští ICT specialisté za stejnou dobu rostou o +17 %. Teze ‚AI bere práci vývojářům a vytváří stejně AI pozic‘ je špatně položená otázka: nejde o jednu bilanci, ale o dvě různé, geograficky i metodicky nesrovnatelné časové řady.“

> „170 milionů nových pracovních míst do roku 2030 z WEF není predikce o AI — je to součet pěti různých trendů (technologie, geopolitika, zelená tranzice, demografie, ekonomika). Čistě na konto AI a zpracování informací zůstává podle stejné zprávy jen +2 miliony čistě nových míst globálně, a to jen jako odhad z ankety zaměstnavatelů, ne jako naměřený fakt.“

> „Žádná oficiální statistika — americká, evropská ani česká — dnes neumí spočítat, kolik konkrétních ‚AI pozic‘ vzniklo, protože BLS ani Eurostat nemají pro ně samostatnou kategorii. Co lze měřit, je rychlejší růst mezd a počtu zaměstnanců ve firmách, které AI nejvíc využívají (PwC) — ale to je důkaz o přerozdělení uvnitř trhu práce, ne o přesné náhradě jedné pozice druhou.“

## Seznam ověřených přímých zdrojů

- BLS Current Employment Statistics, NAICS 5415, série [`CES6054150001`](https://fred.stlouisfed.org/series/CES6054150001) (přes FRED, data stažena přímo z [`fredgraph.csv`](https://fred.stlouisfed.org/graph/fredgraph.csv?id=CES6054150001&cosd=2019-01-01&coed=2026-09-01))
- Eurostat, [`isoc_sks_itspt`](https://ec.europa.eu/eurostat/databrowser/view/isoc_sks_itspt/default/table) — Employed ICT specialists, přímé stažení přes [Eurostat API](https://ec.europa.eu/eurostat/api/dissemination/statistics/1.0/data/isoc_sks_itspt?format=JSON&lang=EN)
- BLS Occupational Outlook Handbook: [Software Developers, QA Analysts and Testers](https://web.archive.org/web/20251231232808/https://www.bls.gov/ooh/computer-and-information-technology/software-developers.htm) (archiv, protože živý web BLS blokuje automatizované stahování), [Data Scientists](https://web.archive.org/web/20250816123734/https://www.bls.gov/ooh/math/data-scientists.htm), [Computer and Information Research Scientists](https://web.archive.org/web/20250814154447/https://www.bls.gov/ooh/computer-and-information-technology/computer-and-information-research-scientists.htm)
- World Economic Forum, [Future of Jobs Report 2025](https://www3.weforum.org/docs/WEF_Future_of_Jobs_Report_2025.pdf) (PDF, leden 2025), str. 18–23 (Figure 2.1–2.6)
- OECD, [Employment Outlook 2023 — Artificial Intelligence and the Labour Market](https://web.archive.org/web/20231129012706/https://www.oecd.org/employment-outlook/2023/) (archiv)
- IMF, [AI Will Transform the Global Economy. Let's Make Sure It Benefits Humanity](https://www.imf.org/en/Blogs/Articles/2024/01/14/ai-will-transform-the-global-economy-lets-make-sure-it-benefits-humanity) (blog shrnující Staff Discussion Note, leden 2024)
- PwC, [AI Jobs Barometer](https://www.pwc.com/gx/en/1/services/ai/ai-jobs-barometer.html)

*Odkazy a hodnoty ověřeny 24. 10. 2026; živé zdroje (zejména WEF, OECD, BLS) se mohou měnit nebo aktualizovat — u BLS stránek bylo nutné použít archivované kopie, protože aktuální web blokuje automatizovaný přístup (HTTP 403).*
