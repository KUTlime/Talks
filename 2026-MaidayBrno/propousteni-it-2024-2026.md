# Propouštění v IT od června 2024: co lze a nelze spočítat

Pracovní rešerše pro MaiDay 2026. Stav zdrojů k **22. říjnu 2026**. Jde o podklad k diskusi, nikoli o důkaz, že konkrétní propuštění způsobila AI.

## Závěry pro přednášku

1. [Layoffs.fyi](https://layoffs.fyi/press/) sleduje **veřejně ohlášená nebo ověřená propouštění v technologických firmách po celém světě**. Součet jeho měsíčních údajů od června 2024 do průběžného října 2026 je **319 742 nahlášených zrušených míst**: 62 219 v červnu až prosinci 2024, 122 606 za celý rok 2025 a 134 917 v lednu až průběžném říjnu 2026. Jde o součet záznamů, ne o počet unikátních osob ani úplné sčítání celého IT světa. Říjen 2026 je neúplný.
2. **Přesný počet jednotlivých „masivních layoffů“ bez stanoveného prahu nelze z veřejných souhrnných grafů vyčíst.** V uvedených 29 měsících vykazují grafy 972 výskytů *firma–měsíc* (283 + 322 + 367); stejná firma se může opakovat a v jednom měsíci může oznámit více kol. **972 není počet událostí ani unikátních firem.** Nejvyšší měsíční součty byly v červnu 2026 (26 663), srpnu 2024 (25 944), dubnu 2025 (25 220), lednu 2026 (25 183) a květnu 2026 (24 242). Jednotlivé doložené velké vlny jsou níže.
3. Pro **skutečné hrubé nábory proti propouštění** existuje srovnatelná statistika pro **USA, odvětví Information (NAICS 51)**: [BLS JOLTS](https://www.bls.gov/jlt/). V roce 2016 vykazuje **979 tisíc náborů a 306 tisíc propuštění / nedobrovolných ukončení**; v roce 2025 **903 tisíc náborů a 447 tisíc těchto ukončení**. Tedy o 76 tisíc méně náborů (−7,8 %) a o 141 tisíc více ukončení (+46,1 %). **Nejde o všechny vývojáře** ani o všechny zaměstnance technologických společností; americká odvětvová čísla nelze odečítat od globálních údajů Layoffs.fyi.
4. Pro **globální technologické firmy ani pro IT profese napříč všemi odvětvími** se nepodařilo doložit veřejnou, vzájemně srovnatelnou dvojici *skutečně přijatí versus propuštění* za obě období. Počet inzerátů není počet přijatých a změna stavu zaměstnanců není počet propuštěných.

## 1. Celosvětově hlášené propouštění v technologických firmách

Zdrojem součtů je [aktuální měsíční datový zdroj grafu Layoffs.fyi](https://layoffs-fyi.onrender.com/api/chart-data?view=monthly), na který odkazuje [graf přímo na webu projektu](https://layoffsfyi.netlify.app/charts/monthly.html). Tento zdroj začíná až listopadem 2024. Hodnoty za červen až říjen 2024 proto pocházejí ze [staršího veřejného měsíčního grafu téhož projektu](https://docs.google.com/spreadsheets/d/e/2PACX-1vRluXcoyZOl3YRgzY_FSdeyu1t1dPNjs39KQjxhCq7aP1V9QmlvJ9XdfpBR49dBT894gVXipjEAcazG/pubchart?oid=204936261&format=interactive). Součty těchto pěti měsíců odpovídají příslušným čtvrtletním údajům v [aktuálním čtvrtletním zdroji](https://layoffs-fyi.onrender.com/api/chart-data?view=quarterly): červen 2024 10 083; červenec–září 39 031; říjen 3 782. Při aktualizaci zdrojů se součty mohou změnit.

| Měsíc | Nahlášená zrušená místa | Firmy s propouštěním v měsíci |
|---|---:|---:|
| 2024-06 | 10 083 | 46 |
| 2024-07 | 9 051 | 39 |
| 2024-08 | 25 944 | 50 |
| 2024-09 | 4 036 | 37 |
| 2024-10 | 3 782 | 40 |
| 2024-11 | 6 755 | 43 |
| 2024-12 | 2 568 | 28 |
| **2024-06 až 2024-12** | **62 219** | **283 firma–měsíců** |
| 2025-01 | 2 537 | 31 |
| 2025-02 | 16 474 | 51 |
| 2025-03 | 8 914 | 22 |
| 2025-04 | 25 220 | 28 |
| 2025-05 | 10 577 | 27 |
| 2025-06 | 1 606 | 14 |
| 2025-07 | 16 648 | 31 |
| 2025-08 | 6 452 | 23 |
| 2025-09 | 4 454 | 25 |
| 2025-10 | 19 240 | 24 |
| 2025-11 | 8 932 | 25 |
| 2025-12 | 1 552 | 21 |
| **2025 celkem** | **122 606** | **322 firma–měsíců** |
| 2026-01 | 25 183 | 32 |
| 2026-02 | 11 349 | 29 |
| 2026-03 | 16 698 | 35 |
| 2026-04 | 5 085 | 36 |
| 2026-05 | 24 242 | 49 |
| 2026-06 | 26 663 | 50 |
| 2026-07 | 11 000 | 43 |
| 2026-08 | 3 555 | 43 |
| 2026-09 | 6 947 | 31 |
| 2026-10 (průběžně) | 4 195 | 19 |
| **2026-01 až průběžný 2026-10** | **134 917** | **367 firma–měsíců** |
| **Sledované období celkem** | **319 742** | **972 firma–měsíců** |

Příklady **samostatných oznámení**, nikoli další položky k přičtení k souhrnům výše:

| Kdy | Firma | Doložený rozsah a stav | Zdroj |
|---|---|---|---|
| srpen 2024 | Intel | Plán snížit stav o přibližně **15 000 rolí**, 15 % zaměstnanců; zahrnoval i nabídky dobrovolného odchodu. Není to přesný počet již propuštěných. | [Sdělení Intelu z 1. 8. 2024](https://www.intel.com/content/www/us/en/newsroom/news/actions-accelerate-our-progress.html) |
| květen a červenec 2025 | Microsoft | Podle vyjádření firmy přibližně **7 000** míst v květnu a dalších **9 000** v červenci; dvě odlišné vlny, nikoli součet pro celý rok. Přímá souvislost těchto škrtů s AI nebyla doložena. | [CNN s vyjádřením Microsoftu, 2. 7. 2025](https://www.cnn.com/2025/07/02/tech/microsoft-layoffs-9000-employees) |
| květen 2026 | Cisco | Oznámené snížení o **méně než 4 000** míst ve 4. fiskálním čtvrtletí; horní mez/plán, nikoli dokončené propouštění. | [Sdělení Cisco zaměstnancům](https://blogs.cisco.com/news/our-path-forward) |
| květen 2026 | Cloudflare | Firma oznámila rozhodnutí propustit **více než 1 100** zaměstnanců po celém světě. Své rozhodnutí výslovně spojuje se změnou způsobu práce s AI; jde o její interpretaci příčiny. | [Sdělení Cloudflare](https://blog.cloudflare.com/building-for-the-future/) |
| září 2026 | Uber | Firma oznámila zásah do přibližně **10 % týmu**; absolutní počet ve vlastním sdělení neuvádí. Zdůvodňuje reorganizací a investicemi do dalšího růstu, ne automaticky nahrazením vývojářů AI. | [Sdělení Uberu zaměstnancům](https://www.uber.com/us/en/newsroom/simplerfasteruber/) |
| září 2026 | Xbox / Microsoft | **268 rušených rolí** podle přímého sdělení. Nezapočítávat znovu dříve oznámené restrukturalizace ani prodej studií jako nové propuštěné. | [Xbox Wire, 22. 9. 2026](https://news.xbox.com/en-us/2026/09/22/continuing-our-reset/) |

Rozdíly mezi agregátory jsou podstatné: [Yahoo ve svém přehledu cituje TrueUp](https://tech.yahoo.com/general/breaking-news/article/tech-layoffs-2026-tracking-all-the-job-losses-across-netflix-amazon-apple-oracle-tiktok-meta-and-others-122031518.html) s údajem **více než 245 tisíc za rok 2025**, kdežto výše uvedený Layoffs.fyi vykazuje **122 606**. Bez sladění pokrytí, definic a pravidel revize **nejde tato čísla zaměňovat ani sčítat**. Stejně tak není správné zaměnit meziroční pokles stavu firmy (například u Oracle) za počet osob propuštěných: stav mění i nábory, přirozené odchody a prodeje divizí.

## 2. Kolik se opravdu nabralo versus propustilo? Srovnatelný výřez: USA

[Americký Bureau of Labor Statistics, JOLTS](https://www.bls.gov/jlt/) měří **měsíční toky pracovních míst v amerických podnicích**. Níže jde o odvětví **Information (NAICS 51)**: obsahuje například vydavatelství, audiovizuální průmysl, telekomunikace a poskytovatele datových/informačních služeb. Naopak nezahrnuje všechny IT pozice v bankách, výrobě či veřejné správě; konkrétní velké technologické firmy mohou být zařazeny do jiného odvětví. Jednotkou jsou **tisíce osobních nástupů nebo ukončení v daném měsíci** (nikoli jedinečné osoby za rok). Při sčítání jsou použity **sezónně neočištěné** řady BLS `JTU510000000000000HIL` (hires) a `JTU510000000000000LDL` (layoffs and discharges); nejde o dobrovolné výpovědi (*quits*). Rok 2026 je zatím zveřejněn pouze **leden–srpen**, poslední měsíc je předběžný.

| Stejné měřítko: USA, Information | Skutečné hrubé nábory | Layoffs and discharges | Nábory / tato ukončení |
|---|---:|---:|---:|
| 2015 celý rok | 976 tis. | 344 tis. | 2,84 |
| 2016 celý rok | 979 tis. | 306 tis. | 3,20 |
| 2024 celý rok | 904 tis. | 395 tis. | 2,29 |
| 2025 celý rok | 903 tis. | 447 tis. | 2,02 |
| 2016 leden–srpen | 667 tis. | 226 tis. | 2,95 |
| 2026 leden–srpen | 607 tis. | 392 tis. | 1,55 |

Při srovnání **celých roků 2015 → 2024** klesly nábory o 72 tisíc (−7,4 %) a ukončení vzrostla o 51 tisíc (+14,8 %). Pro **2016 → 2025** klesly nábory o 76 tisíc (−7,8 %) a ukončení vzrostla o 141 tisíc (+46,1 %). Při srovnání **ledna–srpna 2016 → ledna–srpna 2026** poklesly nábory o 60 tisíc (−9,0 %) a ukončení vzrostla o 166 tisíc (+73,5 %). Srovnání dílčího roku 2026 s celým rokem 2016 by bylo zavádějící.

Za **červen 2024 až srpen 2026** JOLTS v tomto **americkém odvětví** vykazuje 2 030 tisíc hrubých náborů a 1 091 tisíc ukončení typu *layoffs and discharges*. Tato čísla se **nesmějí srovnávat jako čitatel a jmenovatel** s globálními 319 742 z Layoffs.fyi: odlišná populace, definice, data i koncový měsíc. Rozdíl náborů a těchto ukončení také **není čistá změna zaměstnanosti**; chybějí mj. dobrovolné odchody, odchody do důchodu a další druhy ukončení.

### Ověřitelná data BLS

Všechna čísla v tabulce jsou součty hodnot měsíčních pozorování z veřejného BLS API (jednotka „tisíce“); odkazy obsahují přesné kódy řad a období:

- Nábory: [2015–2016](https://api.bls.gov/publicAPI/v2/timeseries/data/JTU510000000000000HIL?startyear=2015&endyear=2016), [2024–2025](https://api.bls.gov/publicAPI/v2/timeseries/data/JTU510000000000000HIL?startyear=2024&endyear=2025), [2026](https://api.bls.gov/publicAPI/v2/timeseries/data/JTU510000000000000HIL?startyear=2026&endyear=2026).
- Propuštění a další nedobrovolná ukončení: [2015–2016](https://api.bls.gov/publicAPI/v2/timeseries/data/JTU510000000000000LDL?startyear=2015&endyear=2016), [2024–2025](https://api.bls.gov/publicAPI/v2/timeseries/data/JTU510000000000000LDL?startyear=2024&endyear=2025), [2026](https://api.bls.gov/publicAPI/v2/timeseries/data/JTU510000000000000LDL?startyear=2026&endyear=2026).

## 3. Co víme o IT profesích napříč odvětvími a o ČR/EU?

**Povolání nejsou odvětví.** [CompTIA vysvětluje](https://www.comptia.org/en-us/resources/research/state-of-the-tech-workforce-2024/), že podle její metodiky pracuje mnoho amerických technických specialistů mimo technologické firmy (ve zprávě uvádí 55 %); zaměstnanci těchto firem naopak zahrnují i obchod, marketing a HR. To ukazuje, proč by statistika propouštění ve firmách sama o sobě nezodpověděla otázku „kolik vývojářů přišlo o práci“. Jde o údaj z metodiky zprávy 2024, ne o ověřený podíl vývojářů v roce 2026.

Pro **ČR/EU a IT profese napříč odvětvími** zde nemáme ověřenou harmonizovanou řadu skutečných **hrubých náborů a propuštění** porovnatelnou s globálním trackerem pro 2015–2016 a 2024–2026. [Databáze Eurostatu pro digitální ekonomiku](https://ec.europa.eu/eurostat/web/digital-economy-and-society/database) může poskytnout *stav* zaměstnaných ICT specialistů, ne však sama o sobě odpověď na počet jejich skutečných nástupů a propuštění. Číslo pro ČR ani EU proto bez ověření konkrétní srovnatelné řady nedopočítáváme z inzerátů nebo rozdílu stavů.

Totéž platí pro **globální srovnání s lety 2015–2016**: Layoffs.fyi [podle vlastní metodiky](https://layoffs.fyi/press/) sleduje události až od roku 2020 a zahrnuje jen zveřejněná/ověřená propouštění. U staršího období tedy nemáme stejnou globální řadu, natož srovnatelné skutečné nábory. Srovnání v části 2 je **jiná, užší a výslovně označená americká statistika**, nikoli pokračování globální tabulky.

## 4. Metodika a bezpečné formulace

- **Jednotka a úplnost:** Layoffs.fyi je průběžně aktualizovaný mediální tracker; sám [upozorňuje](https://layoffs.fyi/press/), že nezveřejněná propouštění chybějí. Měsíční počet firem není počet propouštěcích kol; u některých oznámení je počet pracovníků neznámý. Globální součet představuje evidovaná místa/oznámení, nikoli zaručeně unikátní bývalé zaměstnance.
- **Časování:** Tabulky vycházejí z měsíců evidovaných zdroji, ne vždy z měsíce skutečného posledního pracovního dne. Budoucí plánované škrty (např. Cisco) neprezentovat jako dokončené; neodečítat plány znovu vedle celkového trackeru. Přehled je snímek k 22. 10. 2026; roku 2026 v JOLTS chybí září a říjen.
- **Příčinná souvislost:** Současný výskyt AI investic a škrtů neprokazuje, že AI jednotlivým zaměstnancům vzala práci. Zprávy firem někdy mluví o reorganizaci, efektivitě, nákladech nebo investicích; [Intelův plán z roku 2024](https://www.intel.com/content/www/us/en/newsroom/news/actions-accelerate-our-progress.html) například explicitně odkazuje na náklady a slabší tržby.
- **Nábor versus stav:** BLS měří hrubé nástupy i nedobrovolná ukončení ve stejné odvětvové populaci, ale jednoho člověka může v různých měsících započítat vícekrát. Zaměstnanecký stav či počet pracovních inzerátů **nejsou** měřítka uskutečněných hrubých náborů.
- **Věta použitelná na slidu:** „Veřejný tracker Layoffs.fyi eviduje od června 2024 do průběžného října 2026 téměř 320 tisíc nahlášených zrušených míst v technologických firmách po světě; není to úplný počet propuštěných vývojářů. Ve srovnatelných amerických statistikách širšího odvětví Information bylo v roce 2025 skutečně přijato 903 tisíc lidí a zaznamenáno 447 tisíc nedobrovolných ukončení. Tato čísla nelze mezi sebou přímo dělit.“ 

*Odkazy a hodnoty ověřeny 22. 10. 2026; živé zdroje se mohou změnit. Jako další krok pro přednášku má smysl vybrat jednu konkrétní definici „IT profese“ a doplnit zvlášť česká data, pokud se podaří najít srovnatelnou časovou řadu pracovních toků.*
