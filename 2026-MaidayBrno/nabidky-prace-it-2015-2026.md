# Nabídky práce v IT: srovnání 2015–2016 a červen 2024 – říjen 2026

Podklad pro MaiDay 2026; **stav dat ověřen 22. října 2026**, poslední dostupný den v indexech Indeed je **16. října 2026**. Navazuje na [rešerši propouštění](./propousteni-it-2024-2026.md). Čísla níže popisují **inzerovanou poptávku**, nikoli skutečné nástupy do práce. U historického období je podstatné přiznat, kde časová řada inzerátů **neexistuje**.

## Hlavní zjištění

1. **USA, stejná platforma a stejné názvy kategorií (Indeed):** Index *aktivních* inzerátů v kategorii **Software Development** byl 16. 10. 2026 **78,86** při základně 100 k 1. 2. 2020. V červnu 2024 byl **70,15**, v prosinci 2025 **66,64**. Od června 2024 tedy **+12,4 %**, ale stále **−21,1 % proti předpandemické základně** a **−66,3 % proti mimořádnému vrcholu z února 2022**. Index všech inzerátů v USA byl ve stejných dnech **114,80**, **102,24**, **103,80**. Současný útlum softwarové inzerce je tedy jiný než pohyb celého trhu, ale od roku 2025 je ve stejné kategorii vidět částečné zotavení. [Zdroj a metodika Indeed](https://github.com/hiring-lab/job_postings_tracker).
2. **Není to jen USA, ale není to ani jednotný globální trend:** K 16. 10. 2026 byla softwarová inzerce na Indeed proti vlastní základně z února 2020 v **Německu 47,69**, **Británii 59,98**, **Francii 51,26**, **Kanadě 75,45** a **Austrálii 105,67**. Index není počet míst a hodnoty 47,69 v Německu a 78,86 v USA **neříkají, kde je více volných míst**; porovnat lze vývoj uvnitř každé země. ČR v této publikované sadě chybí.
3. **ČR, přímé zprávy provozovatele Jobs.cz:** [Alma Career porovnává 2016 a 2025](https://magazin.almacareer.com/cz/analyza-jobs-cz-od-it-boomu-ke-stavebnictvi-jak-se-za-posledni-dekadu-zmenil-trh-prace): roku 2016 byly samostatné IS/IT kategorie výrazněji v top 10 inzerovaných oborů, v roce 2025 se v popředí objevuje stavebnictví a další technické obory. Nezveřejňuje však v tomto srovnání přesný počet IT inzerátů pro oba roky; **nelze z něj vyčíst procentní pokles IT inzerce za deset let**.
4. **Skutečná inzerce za 2015–2016 proti 2024–2026:** Veřejně dostupná řada Indeed **začíná 1. 2. 2020**. Starší srovnání Jobs.cz je kvalitativní a [evropský Cedefop](https://www.cedefop.europa.eu/en/tools/skills-online-vacancies) poskytuje aktuální, nikoli jednotnou otevřenou řadu přes celé zadané období. Nemáme tedy ověřený počet softwarových *inzerátů* v roce 2015/2016 a 2025/2026 podle shodné definice a geografického pokrytí. **Vymýšlet globální procento změny by bylo zavádějící.**

## Co přesně je zveřejněná nabídka?

| Veličina | Co počítá | Dá se porovnat s propouštěním? |
|---|---|---|
| **Aktivní inzeráty** (*total postings*, Indeed) | Index množství viditelných inzerátů, sezónně očištěný sedmidenní klouzavý průměr, únor 2020 = 100. | Ne přímo: jde o nabídku zveřejněnou na platformě, ne o člověka přijatého na místo. |
| **Nově zveřejněné inzeráty** (*new postings*, Indeed) | Index inzerátů viditelných na platformě **7 dní nebo méně**; opět základna 100, nikoli počet nových pracovních poměrů. | Rovněž ne; nové inzeráty nejsou dokončené nábory. |
| **Otevřená místa** (*job openings*, BLS JOLTS) | Měsíční **stav** neobsazených pozic hlášených zaměstnavateli v USA na konci měsíce; nejde o webové inzeráty. | Jen se stejným odvětvím, zemí a časem, navíc pozor na **stav** otevřených míst proti **toku** ukončení. |
| **Skutečné nábory / ukončení** (BLS JOLTS) | Měsíční **tok** uskutečněných nástupů / ukončení. | Tyto veličiny lze při shodné populaci porovnávat navzájem; zůstávají jiné než inzerce. |

[Indeed popisuje](https://hiringlab.indeed.com/indeed-data-faq-2/), že stejné místo může být na různých webech (platforma zobrazení deduplikuje), jeden inzerát může pokrývat více míst, některé pozice se online vůbec nevystaví a inzerát může zůstat viditelný i po obsazení. Různý počet nebo délka inzerátů se proto nerovná počtu lidí, kteří práci našli. [Dokumentace dat](https://github.com/hiring-lab/job_postings_tracker) říká, že odvětvové skupiny jsou založené na normalizovaných názvech pozic; **Software Development není totéž co zaměstnanci technologických firem**.

## 1. USA: skutečně zveřejněné nabídky, stejná řada od roku 2020

Tabulka je výběrem několika **pozorovaných dnů**, ne ročním součtem inzerátů. Každá řada má vlastní základnu **100 k 1. 2. 2020**. Vše jsou indexy aktivních nabídek, nikoli tisíce míst. Zdroj: [Indeed Hiring Lab, sektorové řady USA](https://github.com/hiring-lab/job_postings_tracker/blob/master/US/job_postings_by_sector_US.csv) a [celková řada USA](https://github.com/hiring-lab/job_postings_tracker/blob/master/US/aggregate_job_postings_US.csv); metodika a revize na [stránce projektu](https://github.com/hiring-lab/job_postings_tracker).

| Datum | Software Development | Data & Analytics | IT Infrastructure, Operations & Support | IT Systems & Solutions | Electrical Engineering | Všechny inzeráty USA |
|---|---:|---:|---:|---:|---:|---:|
| 2020-02-01 | 100,00 | 100,00 | 100,00 | 100,00 | 100,00 | 100,00 |
| 2022-04-01 | 225,61 | 202,34 | 157,86 | 194,87 | 179,96 | 161,11 |
| **2024-06-01** | **70,15** | **71,16** | **79,16** | **79,59** | **131,71** | **114,80** |
| 2024-12-01 | 67,45 | 68,01 | 74,38 | 80,87 | 119,05 | 110,29 |
| 2025-06-01 | 64,08 | 60,81 | 69,28 | 67,72 | 115,62 | 105,51 |
| **2025-12-01** | **66,64** | **60,50** | **64,32** | **68,85** | **118,83** | **102,24** |
| 2026-06-01 | 73,41 | 61,36 | 68,16 | 69,55 | 129,41 | 100,07 |
| **2026-10-16** | **78,86** | **63,63** | **68,48** | **77,56** | **152,13** | **103,80** |

**Čtení čísel:** 78,86 znamená index aktivních softwarových inzerátů v USA o **21,14 % níže** než k 1. 2. 2020, ne „78,86 nabídek“. Nejvyšší hodnota této řady mezi roky 2021 a 2023 byla **233,83 dne 28. 2. 2022**; proti tomuto *pandemickému maximu* je říjen 2026 níže o **66,3 %**. Volba vrcholu dramatizuje propad oproti přehřátému trhu: vůči **červnu 2024** už index stoupl o **12,4 %**. Mezitím index celého trhu mezi červnem 2024 a říjnem 2026 klesl o **9,6 %**. Tvrzení „nabídky softwarové práce stále klesají“ proto **neplatí pro celou dobu 2024–2026 v USA**.

**Kontrola nových nabídek:** Ve stejných datech byl index *nově zveřejněných* softwarových inzerátů **75,77** (1. 6. 2024), **82,02** (1. 12. 2025) a **79,92** (16. 10. 2026), vedle indexu aktivních nabídek **70,15 / 66,64 / 78,86**. Ani tato nezávislá definice neznamená počet uskutečněných náborů; rozdílný pohyb zásoby a nových inzerátů může souviset také s délkou zobrazení. **Nepřepočítávat indexy na absolutní počet míst bez zveřejněné absolutní základny.**

Kontrast *Electrical Engineering* není důkaz, že právě propuštění softwaroví vývojáři přecházejí do elektrooboru: kategorie profesí nejsou zaměnitelné, každá řada má svou vlastní základnu a není k dispozici počet přechodů mezi nimi. Pouze ukazuje, že „technické profese“ nelze popsat jedním směrem vývoje.

**Co z tabulky nezjistíme:** Senioritu uchazečů, zda inzerát uváděl AI dovednosti, počet skutečně obsazených míst ani to, jestli vypsanou pozici nakonec dostal interní kandidát. Tvrzení o zániku juniorských míst by vyžadovalo zvláštní historicky konzistentní řadu takových inzerátů; z agregované kategorie Software Development nevyplývá.

## 2. Zahraničí: pět dalších trhů na stejné platformě

Každá země používá **svůj** index k únoru 2020. Srovnání *uvnitř země* je informativní; indexy *mezi zeměmi* nepředstavují srovnatelné absolutní počty inzerátů. Británie **není** členem EU. Zdroj: [veřejný repozitář Indeed pro DE/GB/FR/CA/AU](https://github.com/hiring-lab/job_postings_tracker), soubory `job_postings_by_sector_*.csv` a `aggregate_job_postings_*.csv` v jednotlivých složkách.

| Země | Software 2024-06-01 | Software 2025-12-01 | Software 2026-10-16 | Všechny obory 2026-10-16 |
|---|---:|---:|---:|---:|
| USA | 70,15 | 66,64 | 78,86 | 103,80 |
| Německo | 86,41 | 57,51 | 47,69 | 101,78 |
| Británie | 63,42 | 62,76 | 59,98 | 68,87 |
| Francie | 90,22 | 55,98 | 51,26 | 89,07 |
| Kanada | 70,49 | 83,20 | 75,45 | 104,20 |
| Austrálie | 103,47 | 112,23 | 105,67 | 152,39 |

Německá softwarová řada je mezi červnem 2024 a říjnem 2026 **−44,8 %**, francouzská **−43,2 %**, zatímco americká **+12,4 %**; stejné příběhy tedy nelze automaticky promítat z USA do evropského pracovního trhu. Austrálie je i nad svou základnou z roku 2020, ačkoli zaostává za růstem svého celkového indexu. Jsou to indikátory **inzerce na Indeed**, nikoli úplná národní sčítání. Změny dosahu portálu či chování zaměstnavatelů mohou časové i mezinárodní porovnání ovlivnit.

## 3. Česko: přímý portálový pohled na rok 2016 a novější změny

**Dlouhé srovnání:** [Alma Career, provozovatel Jobs.cz, v dubnu 2026 porovnal roky 2016 a 2025](https://magazin.almacareer.com/cz/analyza-jobs-cz-od-it-boomu-ke-stavebnictvi-jak-se-za-posledni-dekadu-zmenil-trh-prace). V roce 2016 byly ve skupině nejčastěji inzerovaných oborů více vidět samostatné oblasti IS/IT; v roce 2025 výrazněji vystupují stavebnictví, reality a další technické obory. Jde o **změnu pořadí a skladby nabídek na konkrétním portálu**, ne o číslo počtu všech českých volných IT pracovních míst. Článek neobsahuje konzistentní absolutní počet inzerátů vývojářů pro oba srovnávané roky.

**Změna ještě před červnem 2024:** [Jobs.cz dne 29. 4. 2024](https://www.jobs.cz/poradna/jaky-je-zajem-firem-o-ruzne-pozice-a-kolik-se-na-ne-hlasi-lidi/) uváděl u **programátorů pokles poptávky o 36 %** a přibližně **9 reakcí na inzerát namísto dřívějších zhruba 5**; u **softwarových architektů meziročně o 27 % méně vypsaných pozic**. Provozovatel ve zprávě současně zmiňuje škrty nákladů a AI. Příspěvek však nepublikuje podkladovou měsíční řadu, přesnou absolutní základnu ani přesný interval pro každý údaj: **tato procenta neřadit mechanicky do měsíční tabulky Indeed a neprohlašovat AI za prokázanou příčinu**. Zpráva předchází červnu 2024 a ukazuje, že část ochlazení již probíhala před začátkem sledované vlny propouštění.

**EU jako celek:** [Cedefop Skills-OVATE](https://www.cedefop.europa.eu/en/tools/skills-online-vacancies) sbírá miliony online inzerátů napříč evropskými zeměmi, ale veřejný dashboard zobrazuje zejména **poslední čtyři čtvrtletí**; portály s nestabilním přísunem dat ze srovnatelných řad vylučuje. Rok spuštění iniciativy **2015 není důkazem**, že máme přístup ke srovnatelné otevřené řadě IT inzerátů od roku 2015. Německo a Francie v předchozí tabulce nejsou reprezentativním součtem EU.

## 4. Samostatná historická kontrola: otevřená místa ve stejném americkém odvětví jako u layoffs

Pro roky **2015–2016** existuje státní ukazatel, ale **není to statistika zveřejněných inzerátů**. BLS JOLTS měří **stav volných míst** v odvětví **Information (NAICS 51)** v USA. Toto odvětví zahrnuje například telekomunikace a vydavatelství, ale nezahrnuje veškerý vývoj software v podnikových IT týmech či v oboru *computer systems design* (NAICS 5415). Průměrujeme měsíční **sezónně neočištěné** stavy (v tisících), **nesčítáme je**: stejné místo může být otevřené ve více měsících.

| USA, Information: průměrný měsíční stav otevřených míst | Celý rok | Leden–srpen |
|---|---:|---:|
| 2015 | 110,8 tis. | 115,1 tis. |
| 2016 | 90,9 tis. | 92,9 tis. |
| 2024 | 122,5 tis. | 121,8 tis. |
| 2025 | 121,2 tis. | 129,4 tis. |
| 2026 (zatím leden–srpen) | — | 88,4 tis. |

Zdrojem jsou měsíční hodnoty BLS `JTU510000000000000JOL`: [2015–2016](https://api.bls.gov/publicAPI/v2/timeseries/data/JTU510000000000000JOL?startyear=2015&endyear=2016), [2024–2025](https://api.bls.gov/publicAPI/v2/timeseries/data/JTU510000000000000JOL?startyear=2024&endyear=2025), [2026](https://api.bls.gov/publicAPI/v2/timeseries/data/JTU510000000000000JOL?startyear=2026&endyear=2026) (poslední dostupný srpen 2026 je předběžný). Celoroční průměr 2025 je proti 2016 vyšší o **33,3 %**, avšak leden–srpen 2026 je proti stejným měsícům 2016 nižší o **4,8 %**. Výrazná změna během roku ilustruje, proč se nesmí srovnávat neúplný rok s celým rokem nebo vyvozovat stav vývojářských nabídek z jediného širokého odvětví.

Ve [srovnání uskutečněných náborů a ukončení téhož odvětví](./propousteni-it-2024-2026.md) za rok 2016 činily skutečné nábory **979 tisíc** a nedobrovolná ukončení **306 tisíc**; za rok 2025 **903 tisíc** a **447 tisíc**. **Nedělit tyto roční toky průměrným stavem volných míst jako „úspěšnost inzerátu“**: měří něco jiného. Nelze je ani párovat se součtem propouštění technologických firem z celého světa.

## Metodické a interpretační hranice

- **Čas:** Relevantní historická základna je 2015–2016, aktuální období začíná v červnu 2024. Indeed umožňuje konzistentní číselný pohled teprve **od 1. 2. 2020**; číselné srovnání se staršími lety nahradit pouze výslovně odlišným ukazatelem JOLTS a kvalitativním přímým srovnáním Jobs.cz. Rok 2026 je průběžný (Indeed do 16. října, JOLTS do srpna).
- **Index versus počet:** Indeed publikuje **relativní indexy**, nikoli v použitých souborech absolutní počty inzerátů podle kategorií. Indexy různých profesí a zemí nesčítat, nedělit jako tržní podíly ani neodečítat od počtů propouštěných lidí.
- **Příčiny:** Propad inzerce může odrážet korekci po náborové špičce 2022, makroekonomické prostředí, investiční rozhodnutí, změnu náborových kanálů i AI. Z časového souběhu s AI nelze vyvodit, jaká část poklesu je jí způsobena. Obnova inzerce v USA od konce roku 2025 rovněž **neprokazuje** obdobný růst uskutečněných náborů.
- **Revize a pokrytí:** [Indeed průběžně aktualizuje a zpětně přepočítává metodiku](https://github.com/hiring-lab/job_postings_tracker#methodology). Uvedené hodnoty jsou snímkem publikovaných souborů k 22. 10. 2026; při použití na pódiu hodnoty znovu ověřit. Pro EU/ČR nemáme otevřený stejný panel portálů za obě období.
- **Reprezentativnost:** [Cedefop porovnal evropské online inzeráty s šetřeními zaměstnanosti a volných míst](https://www.cedefop.europa.eu/en/publications/6217) a upozorňuje na pokrytí lišící se podle odvětví, profesí a regionů. Publikovaný portálový index proto nevydávat za úplnou statistiku všech volných míst.
- **Bezpečná věta pro slide:** „Veřejný index Indeed ukazuje, že v USA bylo 16. října 2026 aktivních inzerátů v kategorii Software Development o zhruba pětinu méně než na počátku února 2020, ale o 12 % více než v červnu 2024. Německo a Francie ve stejné kategorii vykazují od června 2024 výrazně jiný vývoj. Pro české IT inzeráty nemáme otevřenou souvislou řadu srovnatelnou mezi lety 2016 a 2026.“

**Atribuce dat:** Vypočtené a vybrané hodnoty indexů: [Indeed Hiring Lab, Job Postings Index](https://github.com/hiring-lab/job_postings_tracker), veřejný repozitář [CC BY 4.0](https://github.com/hiring-lab/job_postings_tracker/blob/master/LICENSE), přístup 22. 10. 2026. Výsledné tabulky jsou omezené výběry/druhotné výpočty, nikoli přetisk zdrojové databáze. Česká část: [Jobs.cz, duben 2024](https://www.jobs.cz/poradna/jaky-je-zajem-firem-o-ruzne-pozice-a-kolik-se-na-ne-hlasi-lidi/) a [Alma Career, duben 2026](https://magazin.almacareer.com/cz/analyza-jobs-cz-od-it-boomu-ke-stavebnictvi-jak-se-za-posledni-dekadu-zmenil-trh-prace). Starší americká odvětvová kontrola: [BLS JOLTS](https://www.bls.gov/jlt/) a přímé odkazy na data výše.
