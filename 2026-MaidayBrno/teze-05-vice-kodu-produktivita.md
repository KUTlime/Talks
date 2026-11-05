# Teze 5: „Více kódu znamená více produktivity.“

**Rozsah rešerše:** 2021-01-01 – 2026-10-24
**Datum zpracování:** 2026-10-24
**Autor rešerše:** samostatná hloubková analýza primárních zdrojů (DORA, SPACE, akademické studie, prvoplánová data GitClear/NBER)

---

## Verdikt (TL;DR)

**Teze je empiricky vyvrácena jako obecné tvrzení a potvrzena jen ve velmi úzkém, krátkodobém a izolovaném smyslu.**

- **Na úrovni jednotlivého, izolovaného úkolu** AI asistence skutečně zrychluje psaní kódu (např. +55,8 % rychlosti dokončení izolovaného úkolu v RCT Peng et al., 2023). To je ale měření *rychlosti psaní*, ne produktivity organizace.
- **Na úrovni commitů/PR jako proxy** je nárůst objemu reálný a velký (až stovky procent u autonomních agentů, NBER w35275, 2025/2026).
- **Jakmile se měří o úroveň výš** – projekty, vydání (releases), stabilita dodávek, udržitelnost kódu – **efekt se dramaticky zužuje nebo obrací v mínus**: +240 % commitů se redukuje na +30 % vydání (NBER w35275); 25% nárůst adopce AI koreluje s **poklesem** stability dodávek o 7,2 % a propustnosti o 1,5 % (DORA 2024); refaktoring klesá a duplicita/churn roste (GitClear 2025/2026).
- Objem vyprodukovaného kódu (řádky, commity, PR) je tedy **měřitelná, ale zavádějící proxy** – klasický příklad Goodhartova zákona: jakmile se metrika výstupu stane cílem, přestává dobře reprezentovat to, co chceme skutečně měřit (dodanou hodnotu, udržitelnost, spokojenost uživatele).
- **Přesný jmenovatel věty "více kódu = více produktivity" tedy neobstojí** pro žádnou rozumnou definici produktivity nad úrovní jednotlivého vývojáře/úkolu. Produktivita je vícerozměrná (SPACE) a nelze ji redukovat na jedno číslo výstupu.

---

## 1. Co studie skutečně měří – a proč na tom záleží

Klíčový metodologický problém této teze: "produktivita" se v různých studiích měří úplně jinými jmenovateli:

| Úroveň měření | Příklad metriky | Co to NEŘÍKÁ |
|---|---|---|
| Rychlost dokončení jednoho úkolu | čas na dokončení HTTP serveru v laboratoři | nic o údržbě, defektech, dlouhodobé rychlosti týmu |
| Objem výstupu | počet commitů/PR za týden | nic o tom, zda kód byl sloučen, nasazen, používán |
| Dodávka | počet projektů, počet vydání (releases) | nic o kvalitě, defektech po nasazení |
| Stabilita/kvalita provozu | change failure rate, lead time, MTTR (DORA) | nic o byznysové hodnotě dodaného |
| Udržitelnost kódu | churn, duplicita, poměr refaktoring/copy-paste | nic o rychlosti dodání |
| Výsledek uživatele/byznysu | retence, splnění cíle, spokojenost | zpravidla se vůbec neměří |

Teze "více kódu = více produktivity" implicitně směšuje první dva řádky s posledními třemi. Rešerše níže ukazuje, že efekt se mezi těmito úrovněmi **nepřenáší lineárně** a často se **obrací**.

---

## 2. Důkazy "pro" (v úzkém rozsahu)

### 2.1 Kontrolovaný experiment: GitHub Copilot a izolovaný úkol
**Zdroj:** Peng, S., Kalliamvakou, E., Cihon, P., Demirer, M. (2023). *The Impact of AI on Developer Productivity: Evidence from GitHub Copilot.* arXiv:2302.06590.
- RCT s náborovanými vývojáři: úkol implementovat HTTP server v JavaScriptu "co nejrychleji".
- Skupina s přístupem ke Copilotu dokončila úkol **o 55,8 % rychleji** než kontrolní skupina.
- Heterogenní efekty naznačují větší přínos pro méně zkušené vývojáře.
- **Limit:** jde o jeden uměle izolovaný, dobře definovaný úkol (ne reálný produkční vývoj), bez měření údržby, revizí kódu nebo dlouhodobého dopadu. Nelze z toho extrapolovat na "produktivitu týmu".

### 2.2 DORA 2024: dílčí kvalitativní přínosy AI
**Zdroj:** Google Cloud / DORA, *Accelerate State of DevOps Report 2024* (dora.dev/research/2024/dora-report/), shrnutí Google Cloud Blog, publikováno 2024.
- Přes 75 % respondentů používá AI alespoň pro jednu denní pracovní povinnost.
- Více než třetina respondentů uvádí "mírné" až "extrémní" zvýšení produktivity díky AI (subjektivní sebehodnocení).
- **25% nárůst v adopci AI je asociován s:**
  - **+7,5 %** kvalita dokumentace
  - **+3,4 %** kvalita kódu (subjektivní hodnocení)
  - **+3,1 %** rychlost code review
- Jmenovatel: self-reportovaný průzkum tisíců profesionálů v technických rolích (metoda strukturálního modelování, ne experiment).

### 2.3 Objem commitů prokazatelně roste
**Zdroj:** Demirer, M., Musolff, L., Yang, S. *Writing Code vs. Shipping Code: Productivity Effects Across Generations of AI Coding Tools.* NBER Working Paper No. 35275 (nber.org/papers/w35275).
- Dataset: přes 500 000 vývojářů na GitHubu, telemetrie AI nástrojů, matched event-study design.
- Autocomplete, interaktivní agenti a autonomní agenti zvyšují objem commitů s kumulativním efektem **+30 %, +180 %, +240 %** (podle generace nástroje).
- **Toto je nejsilnější přímý důkaz, že "psát více kódu" AI skutečně umožňuje.** Právě proto je důležité, co se stane v další sekci.

---

## 3. Důkazy "proti" – kde se teze láme

### 3.1 Stejná studie: efekt se v produkčním řetězci prudce tlumí
**Zdroj:** Demirer, Musolff, Yang, NBER w35275 (viz výše) – totéž paper jako důkaz "pro", ale klíčové zjištění je opačné:
- Kumulativní **+240 % commitů** (nejsilnější AI nástroje, autonomní agenti) se **redukuje na +80 % počtu projektů** a dále na **pouhých +30 % skutečně vydaných verzí (releases)**.
- Autoři to nazývají *weak-link hypothesis*: lidské úzké hrdlo (review, rozhodování, integrace) zeslabuje efekt AI na skutečný výstup. Odhadovaná elasticita substituce AI/lidská práce je 0,23 (silná komplementarita, ne substituce).
- Napříč čtyřmi velkými softwarovými tržišti (app stores) autoři pozorují prudký nárůst počtu nových aplikací, ale **žádný nárůst celkového používání**.
- **Závěr autorů doslova:** "Large task-level AI productivity gains have therefore translated only partially into shipped and used software thus far."
- Jmenovatel: commit → projekt → vydání → skutečné používání aplikace. Přesně ten řetězec, který teze "více kódu = více produktivity" ignoruje.

### 3.2 DORA 2024: AI zhoršuje stabilitu a propustnost dodávek
**Zdroj:** DORA 2024 Report / Google Cloud Blog (viz výše), oficiální shrnutí klíčových zjištění.
- Týž 25% nárůst adopce AI, který zlepšuje dokumentaci a code review (viz 2.2), je současně asociován s:
  - **-1,5 %** propustnost dodávek (delivery throughput)
  - **-7,2 %** stabilita dodávek (delivery stability)
- Citace reportu: "AI adoption may negatively impact software delivery performance... Our data suggest that improving the development process does not automatically improve software delivery — at least not without proper adherence to the basics of successful software delivery, like small batch sizes and robust testing mechanisms."
- 39 % respondentů uvádí malou nebo žádnou důvěru v AI vygenerovaný kód.
- Jmenovatel: n = tisíce respondentů, strukturální model (korelace, ne kauzalita), self-report.

### 3.3 GitClear: velká prvoplánová data o kvalitě kódu (2020–2026)
**Zdroj:** GitClear, *AI Assistant Code Quality: 2025 Look Back* (gitclear.com/ai_assistant_code_quality_2025_research, únor 2025) a navazující *The Maintainability Gap: AI Code Quality in 2026* (gitclear.com/the_ai_code_quality_maintainability_gap, červen 2026).
- Dataset 2025 reportu: **211 milionů změněných řádků kódu**, leden 2020 – prosinec 2024, repozitáře Google, Microsoft, Meta a enterprise firem.
- Dataset 2026 reportu: **623 milionů analyzovaných změn**, 2023–2026.
- Zjištění (jmenovatel = podíl na změněných řádcích / commitech, pokud není uvedeno jinak):
  - Podíl "přesunutého" (refaktorovaného) kódu klesl z **25 % (2021)** na **méně než 10 % (2024)**; v navazujícím reportu z **21 % (2022)** na **3,8 % (1. pol. 2026)**.
  - Podíl zkopírovaného/duplicitního ("copy/paste") kódu stoupl z **8,3 % (2021)** na **12,3 % (2024)**; v navazujícím reportu z 9,4 % (2022) na **15,7 % (1. pol. 2026)**.
  - Rok 2024 byl první rok v historii měření, kdy objem copy/paste kódu **převýšil** objem přesunutého/refaktorovaného kódu.
  - 2023→2026: duplicitní bloky kódu **+81 %**, dlouhodobá údržba legacy kódu **-74 %** (vs. 2022), chyby maskující konstrukce (error-masking) **+47 %**, two-week code churn **+15 %**.
- **Limit:** jde o soukromá (proprietární) analytická data firmy prodávající nástroje pro code review analytics – možný konflikt zájmů/výběrové zkreslení vzorku repozitářů. Metodika klasifikace "refaktoring vs. copy/paste" je založena na heuristice diffů, ne na manuálním review. Přesto je rozsah dat (stovky milionů řádků, víceleté okno) mimořádně silný signál směru trendu, nezávisle replikovaný mezi dvěma po sobě jdoucími reporty.

### 3.4 Objem výstupu jako matoucí proxy: korelace vs. kauzalita
**Zdroj:** GitClear, *AI Coding Tools Attract Top Performers — But Do They Create Them?* (gitclear.com/developer_ai_productivity_analysis_tools_research_2026, leden 2026).
- Vývojáři s nejvyšším využitím AI nástrojů (Cursor, GitHub Copilot, Claude Code; data přímo z poskytovatelů API) produkují **4–10× více** napříč 7 metrikami výstupu než "non-users".
- Ale: při porovnání **stejného vývojáře se sebou samým před a po** zvýšeném využití AI je skutečný (kauzální) nárůst rychlosti jen **~25 %**.
- Většina rozdílu mezi "power users" a "non-users" je tedy **selekční efekt** (zkušenější/produktivnější vývojáři AI více využívají), ne efekt AI samotné.
- Toto je přímý, datově podložený příklad, proč je "objem výstupu" jako metrika produktivity zavádějící bez kontroly na výběr vzorku.

---

## 4. SPACE framework: proč je "objem kódu" strukturálně špatná metrika

**Primární zdroj:** Forsgren, N., Storey, M-A., Peters, C., Zimmermann, T., Chandrasekhar, K., Vorvoreanu, M. (2021). *The SPACE of Developer Productivity: There's more to it than you think.* ACM Queue, Vol. 19, No. 1. DOI: 10.1145/3454122.3454124.

> **Poznámka k ověření:** přímý fulltext na queue.acm.org/dl.acm.org vrací HTTP 403 (blokace botů/paywall). Bibliografické údaje (autoři, název, ročník, DOI) jsou nicméně konzistentně citovány napříč sekundárními autoritativními zdroji (DORA program, jehož je Forsgren spoluautorkou; odborná literatura o developer productivity). Doporučeno ověřit fulltext manuálně přes institucionální přístup před použitím přímé citace na slidu.

Framework definuje 5 dimenzí produktivity, žádná z nich není "počet řádků":
1. **S – Satisfaction & well-being** (spokojenost, vyhoření)
2. **P – Performance** (výsledek práce – ne aktivita, ale výstup/dopad)
3. **A – Activity** (počet commitů, PR, řádků – **jen jedna z pěti dimenzí**, a autoři explicitně varují před jejím osamoceným použitím)
4. **C – Communication & collaboration**
5. **E – Efficiency & flow** (přerušení, čekací doby, plynulost práce)

Klíčová teze frameworku: **žádná jednotlivá metrika (včetně objemu kódu) produktivitu nevystihuje** a je třeba kombinovat metriky napříč alespoň 3 dimenzemi, včetně subjektivních (self-report) i objektivních dat.

---

## 5. Goodhartův zákon: teoretický rámec pro to, proč "více kódu" selže jako cíl

**Primární zdroj:** Goodhart, C. (1975). *Problems of Monetary Management: The U.K. Experience*, formulace parafrázovaná Strathern, M. (1997), *"Improving ratings: audit in the British University system"*, Social Anthropology.
- Nejcitovanější formulace (Strathern 1997): *"When a measure becomes a target, it ceases to be a good measure."*
- Goodhartova originální formulace (1975): *"Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes."*

**Aplikace na praxi (reálný případ):** McKinsey v roce 2023 publikoval článek *"Yes, you can measure software developer productivity"*, který vyvolal silnou kritiku. Kent Beck (tvůrce Extreme Programming) jej označil za *"tak absurdní a naivní, že nemá smysl ho detailně kritizovat"*. V navazujícím společném eseji (Beck & Orosz, *The Pragmatic Engineer*, newsletter.pragmaticengineer.com/p/measuring-developer-productivity) Beck popisuje z vlastní zkušenosti ve Facebooku, jak se zaváděním a sledováním "developer sentiment" skóre postupně metrika stala cílem pro hodnocení manažerů → manažeři začali vyjednávat s podřízenými o skóre → metrika přestala vypovídat o realitě. **Toto je živá ilustrace Goodhartova zákona přímo v kontextu "měření produktivity vývojářů".**

Pokud se "objem kódu" (řádky, commity, PR) stane cílem nebo součástí hodnocení výkonu, lze očekávat přesně to, co GitClear data už pozorují: nárůst copy/paste, pokles refaktoringu, růst duplicity – tedy chování optimalizované na metriku, ne na skutečnou hodnotu.

---

## 6. Limity rešerše a důkazní základny

1. **Observační vs. experimentální data.** Jediný skutečný randomizovaný experiment v této rešerši (Peng et al. 2023) měří izolovaný laboratorní úkol, ne reálný vývoj. DORA i NBER studie jsou z větší části observační/korelační (byť NBER používá matched event-study design pro kauzální přiblížení).
2. **Proprietární data a konflikt zájmů.** GitClear prodává nástroje analyzující přesně tyto metriky (code churn, duplicita) – motivace zdůrazňovat problém existuje. Zmírňující faktor: rozsah dat (211M–623M řádků) a konzistence mezi nezávislými vlnami reportu (2025 a 2026) snižuje riziko náhodného zkreslení, ne však systematické selekce repozitářů.
3. **Self-report zkreslení.** DORA report je z velké části založen na dotazníkovém šetření (subjektivní vnímání produktivity, kvality, spokojenosti) – silné pro zachycení vnímání, slabé pro objektivní výstup.
4. **Krátké časové okno pro AI efekty.** Masové nasazení AI coding nástrojů datuje reálně od 2022–2023; data do poloviny 2026 nemusí zachytit dlouhodobé (3–5leté) důsledky na údržbu kódu.
5. **SPACE a Goodhartův zákon nejsou empirické měřicí studie**, ale teoretické/metodologické rámce – použity zde jako interpretační nástroj, ne jako přímý zdroj čísel.
6. **Nepodařilo se nezávisle ověřit** dříve často citovanou studii Uplevel Data Labs o Copilotu a nárůstu chyb (časté sekundární citace, ale primární zdroj se nepodařilo dohledat/fetchnout v rámci této rešerše) – **proto není v rešerši použita** a neměla by se objevit na slidu bez dalšího ověření.
7. **Plný text SPACE frameworku (ACM Queue) nebyl přímo dostupný** (HTTP 403) – citace je na úrovni bibliografických metadat a obecně známé struktury frameworku, ne doslovných citací z textu.

---

## 7. Měřitelné alternativy k "objemu kódu"

| Místo | Měřit radši | Proč |
|---|---|---|
| Počet řádků/commitů/PR za sprint | **DORA 4 klíčové metriky:** lead time for changes, deployment frequency, change failure rate, time to restore service | Měří skutečnou dodávku a stabilitu, ne aktivitu |
| "Kolik AI vygenerovalo kódu" | **Podíl přežívajícího kódu po N týdnech** (code survival / churn rate) | Odlišuje trvalou hodnotu od zahozeného/přepsaného kódu |
| Rychlost psaní | **SPACE: kombinace Performance + Efficiency/Flow + Satisfaction** (min. 3 dimenze) | Zabraňuje optimalizaci na jednu snadno gamovatelnou metriku |
| Subjektivní "cítím se produktivně" | **Trojúhelníková verifikace:** self-report + systémová telemetrie (cycle time) + výstupní kvalita (defect escape rate, MTTR) | Snižuje riziko Goodhartova efektu u jediné metriky |
| Objem nových commitů/aplikací | **Počet skutečně vydaných verzí a jejich reálné používání** (NBER: commits → projects → releases → usage) | Právě tento řetězec ukázal největší útlum AI efektu |
| Duplicita/copy-paste jako vedlejší příznak | **Poměr refaktoring/moved-lines ku copy-paste lines** (GitClear signál) | Včasný indikátor rostoucího technického dluhu |

---

## 8. Návrh slidů (čeština)

**Slide 1 – Teze**
> "Více kódu znamená více produktivity."
> (uvést jako citaci/karikaturu rozšířeného přesvědčení, ne jako vlastní tvrzení)

**Slide 2 – Co se opravdu stane, když přidáte AI**
- Graf: NBER w35275 – sloupce +30 % / +180 % / +240 % commitů podle typu nástroje (autocomplete → interaktivní agent → autonomní agent)
- Caption: "Objem výstupu roste. Otázka zní: kam se ten objem poděje?"

**Slide 3 – Kam se poděje (ten samý graf, rozšířený)**
- Stejná data, přidán sloupec: +240 % commitů → **jen +80 % projektů → jen +30 % vydání**
- Citace: Demirer, Musolff, Yang, NBER Working Paper No. 35275, 2025/2026
- Caption: "Weak-link hypothesis: lidské review a rozhodování jsou úzké hrdlo."

**Slide 4 – DORA 2024: přínos i cena zároveň**
- Dva sloupce vedle sebe: zelené (+7,5 % dokumentace, +3,4 % kvalita kódu, +3,1 % rychlost review) vs. červené (−1,5 % propustnost, −7,2 % stabilita dodávek)
- Zdroj: DORA Accelerate State of DevOps Report 2024 (dora.dev)

**Slide 5 – Kvalita kódu v čase (GitClear)**
- Graf: podíl refaktoringu (25 %→10 %→3,8 %) vs. podíl copy/paste (8,3 %→12,3 %→15,7 %), 2021–2026
- Zdroj: GitClear, AI Assistant Code Quality 2025 + The Maintainability Gap 2026
- Caption: "2024: poprvé v historii copy/paste překonal refaktoring."

**Slide 6 – Proč je to tak: SPACE framework**
- 5 písmen S-P-A-C-E, zvýraznit "A = Activity" jako jen 1 z 5 dimenzí
- Zdroj: Forsgren et al., ACM Queue 19(1), 2021

**Slide 7 – Goodhartův zákon v praxi**
- Citát: "When a measure becomes a target, it ceases to be a good measure." (Strathern, 1997, parafráze Goodharta 1975)
- Reálný případ: McKinsey 2023 vs. reakce Kent Becka / Gergely Orosze (Pragmatic Engineer)

**Slide 8 – Verdikt + co měřit místo řádků**
- "Objem kódu ≠ produktivita. Měřte dodávku, stabilitu a přežití kódu, ne jeho množství."
- Tabulka z kapitoly 7 (zkrácená na 3–4 řádky)

---

## Zdroje (chronologicky dle data publikace)

1. Forsgren, N. et al. (2021). *The SPACE of Developer Productivity.* ACM Queue, 19(1). DOI: 10.1145/3454122.3454124. [fulltext 403 při ověřování, citace na úrovni metadat]
2. Peng, S., Kalliamvakou, E., Cihon, P., Demirer, M. (2023, 13. 2.). *The Impact of AI on Developer Productivity: Evidence from GitHub Copilot.* arXiv:2302.06590.
3. Beck, K., Orosz, G. *Measuring Developer Productivity? A Response to McKinsey.* The Pragmatic Engineer. newsletter.pragmaticengineer.com/p/measuring-developer-productivity (reakce na McKinsey 2023, "Yes, you can measure software developer productivity").
4. DORA / Google Cloud (2024). *Accelerate State of DevOps Report 2024.* dora.dev/research/2024/dora-report/; shrnutí: cloud.google.com/blog/products/devops-sre/announcing-the-2024-dora-report.
5. GitClear (únor 2025). *AI Assistant Code Quality: 2025 Look Back.* gitclear.com/ai_assistant_code_quality_2025_research.
6. GitClear (leden 2026). *AI Coding Tools Attract Top Performers – But Do They Create Them?* gitclear.com/developer_ai_productivity_analysis_tools_research_2026.
7. GitClear (červen 2026). *The Maintainability Gap: AI Code Quality in 2026.* gitclear.com/the_ai_code_quality_maintainability_gap.
8. Demirer, M., Musolff, L., Yang, S. (NBER Working Paper No. 35275). *Writing Code vs. Shipping Code: Productivity Effects Across Generations of AI Coding Tools.* nber.org/papers/w35275.
9. Goodhart, C. (1975). *Problems of Monetary Management: The U.K. Experience* — via Strathern, M. (1997). *Improving ratings: audit in the British university system.* Social Anthropology / Wikipedia (en.wikipedia.org/wiki/Goodhart%27s_law), ověřeno 2026-10-24.

---

*Poznámka: soubor vznikl jako samostatná rešerše pro Talks/2026-MaidayBrno. Žádné jiné soubory v repozitáři nebyly měněny.*
