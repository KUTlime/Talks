# Teze 2: „Jeden vývojář s AI zastane práci celého týmu“

> Přednáškový podklad – hloubkové ověření teze na základě kontrolovaných experimentů, DORA/METR výzkumu a end-to-end dat o dodávce softwaru. Pokrývá období 2021 – 24. 10. 2026. Pouze ověřitelné, dohledatelné zdroje (akademické studie, RCT, oficiální reporty).

---

## VERDIKT: **Neprokázáno (v silné verzi) / Částečně potvrzeno (ve slabé verzi)**

Teze „jeden vývojář s AI zastane práci celého týmu“ se v doslovném znění **neopírá o předložený kontrolovaný experiment ani provozní (DORA) data** – studie METR z roku 2025 ukazuje u zkušených vývojářů na reálných projektech **zpomalení o 19 %**, nikoli několikanásobné zrychlení, které by teze vyžadovala. Tam, kde AI prokazatelně zrychluje **izolovaný, krátký, dobře definovaný úkol** (GitHub Copilot RCT: o 55,8 % kratší čas), nelze efekt **přenést 1:1 do end-to-end dodávky**: DORA 2024 uvádí, že růst AI adopce o 25 % je statisticky spojen se zlepšením dílčích metrik (kvalita dokumentace +7,5 %, kvalita kódu +3,4 %), ale zároveň s **nižším throughputem dodávky o 1,5 % a stabilitou o 7,2 %**. Jde o asociaci v daném šetření, ne důkaz, že AI tyto poklesy způsobila. Silná verze teze (1 člověk = celý tým) je tedy **neprokázaná a nepodpořená těmito měřeními**; slabá verze („AI může měřitelně zrychlit jednotlivce na vymezených úkolech“) je **potvrzena**, ale s jiným rozsahem, než teze předpokládá.

---

## 1. Proč je nutné rozlišit „rychlost úkolu“ od „dokončeného a provozovaného produktu“

Teze míchá dvě zcela odlišné veličiny:

| | Rychlost úkolu (task-level) | Dodávka produktu (delivery-level) |
|---|---|---|
| Co se měří | Čas na vyřešení izolovaného, předem definovaného úkolu (často < 1 den) | Lead time, deployment frequency, change failure rate, MTTR, dlouhodobá udržitelnost kódu |
| Typická metoda | Laboratorní RCT, benchmark | Telemetrie z produkčních repozitářů, DORA metriky, roční survey |
| Co ignoruje | Code review, integraci, testování, provoz, údržbu, bezpečnost, znalost kontextu | — |
| Příklad zdroje | GitHub Copilot RCT (95 vývojářů, HTTP server) | DORA State of DevOps 2024/2025 |

Marketingová tvrzení o „1 developer = tým“ typicky extrapolují z task-level dat (rychlé demo, benchmark, krátký úkol) na delivery-level tvrzení (celý produkt, celý tým, celý životní cyklus). Právě tahle mezera je metodicky nejslabší místo celé teze a klíčový bod pro přednášku.

---

## 2. METR 2025 – kontrolovaný experiment na zkušených vývojářích a reálných úkolech

**Zdroj:** Becker, Rush, Barnes et al., „Measuring the Impact of Early-2025 AI on Experienced Open-Source Developer Productivity“, METR, červenec 2025. [metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) a arXiv:2507.09089.

**Metodika:**
- 16 zkušených open-source vývojářů (průměr 5 let zkušeností s daným repozitářem; repozitáře průměrně 22 tis.+ GitHub hvězd, 1 M+ řádků kódu).
- 246 reálných úkolů (bugfixy, feature, refaktoring) – ne syntetické benchmarky.
- Randomizované přiřazení „smíš použít AI“ vs. „nesmíš použít AI“ pro každý úkol.
- Nástroje: primárně Cursor Pro + Claude 3.5/3.7 Sonnet (tehdejší frontier modely).
- Úkoly v průměru ~2 hodiny; vývojáři natáčeli obrazovku a sami reportovali čas.

**Klíčový výsledek:**
- Když vývojáři směli použít AI, **úkol jim trval o 19 % déle**, ne kratší.
- Před studií vývojáři **očekávali zrychlení o 24 %**; experti v ekonomii čekali zrychlení o 39 %, experti v ML o 38 %.
- I **po** zažití zpomalení si vývojáři subjektivně mysleli, že jim AI ušetřila 20 % času – tedy **systematické zkreslení vnímání (perception gap)** mezi domnělým a skutečným přínosem AI.
- METR explicitně testovala 20 možných vysvětlení (zkušenost s nástroji, velikost projektu, kvalita standardů...) – efekt zpomalení byl robustní napříč analýzami.

> **Citovatelný slide:** „Vývojáři čekali o 24 % rychlejší práci s AI. Ve skutečnosti byli o 19 % pomalejší.“ (METR, 2025)

**Co studie explicitně NEtvrdí** (METR sama uvádí v tabulce limitů): netvrdí, že AI nezrychluje většinu vývojářů obecně, netvrdí nic o jiných doménách než SW vývoj, netvrdí že AI nebude rychlejší v budoucnu, ani že neexistuje efektivnější způsob použití týchž nástrojů. Je to evidence pro **konkrétní kontext**: zkušení vývojáři, velké/staré/komplexní open-source repozitáře, nástroje z první poloviny 2025.

---

## 3. METR – limity generalizace capabilities (time horizons)

**Zdroj:** Kwa, West et al., „Measuring AI Ability to Complete Long Software Tasks“, METR, březen 2025. [metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks](https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/)

- METR definuje **„time horizon“** modelu: délku úkolu (měřeno lidským časem řešení), kterou model zvládne dokončit se spolehlivostí 50 %.
- Časový horizont **se zdvojnásobuje přibližně každých 7 měsíců** (v roce 2024 možná zrychlení na ~4 měsíce) za posledních 6 let (2019–2025).
- Současné frontier modely (stav 2025): téměř 100% úspěšnost na úkolech do 4 minut lidské práce, ale **méně než 10% úspěšnost na úkolech nad ~4 hodiny**.
- Návazná studie (červenec 2025, „How does time horizon vary across domains“) potvrzuje podobný exponenciální trend napříč doménami, ale s řádovými rozdíly (vizuální computer-use úlohy mají 40–100× kratší horizont než SW úlohy).

**Důsledek pro tezi:** Nahrazení „celého týmu“ by vyžadovalo autonomní zvládnutí úkolů v řádu dnů až týdnů lidské práce (plánování, architektura, integrace napříč systémy, provoz). Dle METR extrapolace exponenciálního trendu bychom se k takovým horizontům (~dny) mohli přiblížit **za několik let, ne nyní** – a i to je extrapolace, ne změřený fakt. K 24. 10. 2026 nejsou veřejně ověřené time-horizon hodnoty v řádu „týdny“ pro autonomní dokončení software úkolů.

---

## 4. DORA State of DevOps 2024 – první velký kvantitativní pohled na AI a dodávku (ne jen úkol)

**Zdroj:** Google Cloud / DORA, „Accelerate State of DevOps Report 2024“. [dora.dev/research/2024/dora-report](https://dora.dev/research/2024/dora-report/), shrnutí: [cloud.google.com/blog/products/devops-sre/announcing-the-2024-dora-report](https://cloud.google.com/blog/products/devops-sre/announcing-the-2024-dora-report)

- Více než 75 % respondentů se při práci denně spoléhá na AI alespoň pro jednu profesní odpovědnost (psaní kódu, sumarizace, vysvětlování kódu).
- Přes jednu třetinu respondentů zaznamenala „střední“ až „extrémní“ nárůst produktivity díky AI.
- **Nárůst AI adopce o 25 % koreluje s:**
  - +7,5 % kvalita dokumentace
  - +3,4 % kvalita kódu
  - +3,1 % rychlost code review
- **Ale zároveň koreluje s:**
  - **−1,5 % propustnost (throughput) dodávky**
  - **−7,2 % stabilita dodávky** (change failure rate / stabilita změn)
- 39 % respondentů reportovalo malou až žádnou důvěru v AI-generovaný kód.
- Závěr DORA doslova: „AI má pozitivní dopady na mnoho důležitých individuálních a organizačních faktorů, ale **AI není all-in-one řešení** (`not a panacea`). Zlepšení v jedné části procesu automaticky nezlepšuje software delivery jako celek – pokud chybí základy jako malé dávky změn a robustní testování.“

> **Citovatelný slide:** „+25 % AI adopce → +3,4 % kvalita kódu, ale −7,2 % stabilita dodávky a −1,5 % propustnost.“ (DORA 2024)

---

## 5. DORA State of AI-Assisted Software Development 2025 – adopce masivní, důvěra a stabilita stále problém

**Zdroj:** Google Cloud / DORA, „State of AI-assisted Software Development“, září 2025. [dora.dev/research/2025/dora-report](https://dora.dev/research/2025/dora-report/); reportáže s čísly: CNN (23. 9. 2025, [edition.cnn.com/2025/09/23/tech/google-study-90-percent-tech-jobs-ai](https://edition.cnn.com/2025/09/23/tech/google-study-90-percent-tech-jobs-ai)), Business Insider (23. 9. 2025).

- Vzorek: 5 000 technologických profesionálů celosvětově + 100+ hodin kvalitativních rozhovorů.
- **90 % respondentů používá AI v práci** (meziroční nárůst o 14 procentních bodů oproti 2024).
- Medián: **2 hodiny denně** strávené s AI v rámci core workflow.
- Důvěra v kvalitu AI kódu zůstává rozdělená: 46 % „trochu“ důvěřuje, 23 % „málo“, 20 % „hodně“; 31 % říká, že AI kód „mírně zlepšila“, 30 % „žádný dopad“.
- 30 % respondentů AI „málo“ nebo „vůbec“ nedůvěřuje.
- Zajímavý (proti-intuitivní) nález: vnímaná důležitost znalosti syntaxe programovacích jazyků **vzrostla**, nikoli klesla, i v éře AI asistentů – lidé stále potřebují umět kód posoudit/opravit.
- Google interně (Sundar Pichai, veřejný podcast červen 2025) uvádí **10% nárůst „engineering velocity“** díky AI – řádově jiné číslo než marketingové „1 člověk = tým“ (10× by znamenalo zrychlení o 900 %, realita je jedna desetina procenta tohoto řádu).

> **Citovatelný slide:** „90 % vývojářů používá AI denně. Jen 20 % jim ‚hodně‘ důvěřuje. Google reportuje +10 % velocity, ne +900 %.“

---

## 6. Kontrolované laboratorní experimenty, které tezi (v omezeném rozsahu) podporují

### 6.1 GitHub Copilot RCT (Peng, Kalliamvakou, Cihon, Demirer, 2023 + GitHub výzkum 2022)

**Zdroje:**
- Peng, S., Kalliamvakou, E., Cihon, P., Demirer, M. (2023). „The Impact of AI on Developer Productivity: Evidence from GitHub Copilot“. arXiv:2302.06590.
- Kalliamvakou, E. (2022). „Research: Quantifying GitHub Copilot's impact on developer productivity and happiness“. [github.blog/news-insights/research/research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness](https://github.blog/news-insights/research/research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/)

- 95 profesionálních vývojářů, náhodně rozděleni do dvou skupin, úkol: napsat HTTP server v JavaScriptu „co nejrychleji“.
- Skupina s Copilotem dokončila úkol **o 55,8 % rychleji** (GitHub blog uvádí 55 %, konkrétně 1 h 11 min vs. 2 h 41 min, p = 0,0017, 95% CI [21 %, 89 %]).
- Skupina s Copilotem měla i vyšší úspěšnost dokončení úkolu (78 % vs. 70 %).
- **Metodický limit:** jde o jeden uzavřený, krátký, dobře definovaný, nezávislý úkol bez nutnosti porozumění rozsáhlé cizí kódové základně, bez code review, bez provozu a údržby – přesně opak podmínek METR 2025 studie (dlouhodobé repozitáře, reálná integrace). To vysvětluje, proč oba rigorózní RCT dochází k **opačným závěrům** – neměří totéž.

### 6.2 Rozsáhlá observační studie přijetí (Peng/Iansiti et al., 2023)

**Zdroj:** „Sea Change in Software Development: Economic and Productivity Analysis of the AI-Powered Developer Lifecycle“, arXiv:2306.15033 (934 533 uživatelů GitHub Copilot).

- Uživatelé v průměru přijímají ~30 % navrhovaného kódu Copilotem; míra přijetí roste s časem a je vyšší u méně zkušených vývojářů.
- Studie je **observační, ne kontrolovaná** – neumožňuje kauzální závěr o „produktivitě týmu“, pouze popisuje chování a extrapoluje makroekonomický dopad (odhad +1,5 bilionu USD globálního HDP do 2030) – jde o ekonomickou projekci, ne o měřený fakt dodávky softwaru.

---

## 7. Protidůkazy: kvalita, bezpečnost a udržitelnost kódu

### 7.1 GitClear – 211 milionů řádků kódu, 2020–2024

**Zdroj:** GitClear, „AI Copilot Code Quality: 2025 Look Back at 12 Months of Data“. [gitclear.com/ai_assistant_code_quality_2025_research](https://www.gitclear.com/ai_assistant_code_quality_2025_research)

- Analýza 211 milionů změněných řádků kódu z repozitářů Google, Microsoft, Meta a dalších enterprise firem, 2020–2024.
- Podíl „refaktorovaných“ (přesunutých/reorganizovaných) řádků klesl z **25 % (2021) na < 10 % (2024)**.
- Podíl „copy/paste“ (klonovaného) kódu vzrostl z **8,3 % na 12,3 %** ve stejném období.
- 2024/2025: poprvé v historii měření objem kopírovaného („copy/paste“) kódu **převýšil** objem přesouvaného/refaktorovaného kódu – signál zhoršující se udržovatelnosti, ne jen rychlosti psaní.

> **Citovatelný slide:** „Refaktoring kódu klesl z 25 % na <10 % řádků (2021→2024), zatímco kopírovaný kód vzrostl na 12,3 %. Více kódu neznamená lepší kód.“

### 7.2 Bezpečnost: AI asistenti a zranitelnosti

**Zdroj:** Perry, N. et al. (2023), „Do Users Write More Insecure Code with AI Assistants?“, ACM CCS 2023, arXiv:2211.03622.

- První rozsáhlá uživatelská studie (Codex-davinci-002 jako AI asistent) napříč bezpečnostně citlivými úkoly a jazyky.
- Účastníci **s přístupem k AI asistentovi psali signifikantně méně bezpečný kód** než účastníci bez něj.
- Zároveň účastníci s AI asistentem **byli přesvědčenější, že jejich kód je bezpečný**, než účastníci bez AI – tedy nejen horší výsledek, ale i horší kalibrace vlastního úsudku (overconfidence).
- Vývojáři, kteří AI „méně důvěřovali“ a aktivněji upravovali prompty, produkovali bezpečnější kód – důvěra bez verifikace je rizikový faktor.

### 7.3 Stack Overflow Developer Survey 2025 (51 000+ respondentů)

**Zdroj:** [survey.stackoverflow.co/2025/ai](https://survey.stackoverflow.co/2025/ai)

- 84 % vývojářů používá nebo plánuje používat AI nástroje (nárůst z 76 % v 2024), 51 % profesionálů denně.
- **Pozitivní sentiment k AI nástrojům klesl** z 70%+ (2023, 2024) na **60 %** v roce 2025 – adopce roste, důvěra klesá.
- 46 % vývojářů **aktivně nedůvěřuje** přesnosti výstupů AI, jen 33 % důvěřuje (3 % „plně“). Zkušení vývojáři jsou nejskeptičtější (20 % „silně nedůvěřuje“).
- Hlavní frustrace: „AI řešení jsou skoro správná, ale ne tak úplně“ (66 %), „ladění AI kódu je časově náročnější“ (45 %).
- 76 % se brání nasazení AI na „deployment & monitoring“, 69 % na „project planning“ – tedy přesně na úkoly, které by „nahrazení celého týmu“ vyžadovalo.
- 75 % by se v budoucnu i přes pokročilé AI stále obrátilo na člověka, „když AI odpovědi nedůvěřují“.

---

## 8. Mediální/produktová tvrzení o „AI agentovi nahrazujícím inženýra“ – realitní check

**Zdroj:** Answer.AI, „Devin can't actually do that (yet)“, leden 2025. [answer.ai/posts/2025-01-08-devin.html](https://www.answer.ai/posts/2025-01-08-devin.html)

- Devin (Cognition Labs) byl prezentován jako „první plně autonomní AI software inženýr“ s tvrzením o vyřešení 13,86 % reálných GitHub issues na SWE-bench (3× lepší než předchozí systémy) – marketingové číslo blízké duchu teze.
- Nezávislý tým (Answer.AI) při praktickém testování zjistil: jednoduché, izolované úkoly (stažení dat z Notion do Sheets) zvládal dobře; **u složitějších, víceúrovňových úkolů docházelo k uváznutí ve slepých uličkách, „halucinaci“ neexistujících funkcí a úkoly trvající dny místo hodin**.
- Ukazuje prakticky totéž, co METR time-horizon data: autonomní agenti fungují na krátkých, izolovaných úlohách, selhávají na delších, kontextově bohatých úlohách vyžadujících integraci a úsudek.

---

## 9. Metodické limity napříč zdroji (nutné zmínit v přednášce)

1. **Task vs. delivery mismatch** – RCT s krátkými úkoly (Copilot, 55,8 %) měří jinou věc než RCT s reálnými úkoly ve velkých repozitářích (METR, −19 %). Nelze je zprůměrovat ani extrapolovat jedno na druhé.
2. **Self-reported čas** – METR i GitHub RCT se z části opírají o sebehodnocený čas vývojářů; obě studie ale ukazují, že **subjektivní odhad produktivity je systematicky zkreslený** (METR: lidé si mysleli, že zrychlili o 20 %, ve skutečnosti zpomalili o 19 %) – to relativizuje i veškeré „pocitové“ reporty produktivity v průmyslu (DORA survey, Stack Overflow survey) jako měkká data.
3. **Velikost a selekce vzorku** – METR: 16 vývojářů / 246 úkolů – silný interní design (randomizace), ale omezená generalizace (velké, zralé open-source projekty, konkrétní nástroje z 1. poloviny 2025). GitHub Copilot RCT: 95 vývojářů, jediný typ úlohy (HTTP server v JS).
4. **Observační korelace ≠ kauzalita** – DORA report i GitClear jsou observační/survey data (nikoli RCT); korelace AI adopce s metrikami delivery (throughput, stabilita) nelze interpretovat jako čistě kauzální efekt AI – mohou hrát roli matoucí proměnné (firmy s tlakem na rychlost adoptují AI i mění procesy současně).
5. **Rychlý vývoj nástrojů** – data z 2022–2023 (Copilot RCT) používají jiné modely než METR 2025 (Claude 3.5/3.7 Sonnet) a DORA 2025 (agentické nástroje, Gemini Code Assist). Výsledky **nejsou přímo srovnatelné v čase** – to, co platilo pro GPT-3.5 éru, nemusí platit pro agentické modely 2025/2026, a naopak starší pozitivní čísla nelze mechanicky aktualizovat na dnešní nástroje bez nového měření.
6. **Publikační a komerční zájem** – GitHub Copilot RCT spolufinancoval/vedl GitHub (výrobce testovaného produktu) ve spolupráci s Microsoft Office of the Chief Economist; DORA report sponzorují GitHub, GitLab a AI-adopční firmy (SkillBench, Workhelix) – nejde o důvod odmítnout data, ale o nutnost transparentně uvést možný střet zájmů vedle nezávislé METR studie (nezávislý neziskový výzkumný ústav bez komerčního zájmu na výsledku).
7. **Chybí přímé end-to-end měření „1 developer nahradil tým“** – k 24. 10. 2026 nebyla nalezena žádná recenzovaná/kontrolovaná studie, která by přímo měřila scénář „jeden člověk + AI dodal produkt srovnatelné kvality/rozsahu jako celý tým ve srovnatelném čase“. Veškerá dostupná evidence je buď (a) task-level rychlost, nebo (b) survey/telemetrická korelace na úrovni organizace, nikoli kontrolovaný test ekvivalence 1 osoba vs. tým.

---

## 10. Sada citovatelných slidů (shrnutí pro prezentaci)

1. „Teze: 1 vývojář + AI = celý tým. Realita (METR 2025, RCT): AI zpomalila zkušené vývojáře o 19 % na reálných úkolech.“
2. „Vývojáři čekali +24 % rychlosti s AI. Dostali −19 %. Mezera mezi očekáváním a realitou je sama o sobě datový nález.“
3. „Na krátkém izolovaném úkolu (HTTP server, GitHub RCT) AI zrychlila o 55,8 %. Na reálné údržbě velkého repozitáře (METR RCT) zpomalila o 19 %. Kontext rozhoduje víc než nástroj.“
4. „DORA 2024: +25 % AI adopce → +3,4 % kvalita kódu, ale −7,2 % stabilita dodávky a −1,5 % throughput. Lokální zlepšení ≠ lepší dodávka.“
5. „2025: 90 % vývojářů AI používá denně (DORA). Jen 20 % jí ‚hodně‘ důvěřuje. Adopce ≠ důvěra ≠ nahraditelnost.“
6. „GitClear, 211 mil. řádků: refaktoring kódu klesl z 25 % na <10 % řádků (2021→24), copy-paste vzrostl na 12,3 %. Víc kódu psaného rychleji ≠ udržovatelnější systém.“
7. „Stanford/ACM CCS: uživatelé s AI asistentem psali méně bezpečný kód – a zároveň si mysleli, že je bezpečnější, než ve skutečnosti byl.“
8. „METR time horizons: autonomní AI zvládá spolehlivě úkoly do ~4 minut lidské práce, ale <10% úspěšnost nad ~4 hodiny. Nahrazení týmu vyžaduje horizonty v řádu dnů/týdnů – to dnes změřeno není.“
9. „Devin (2024), marketing: 13,86 % vyřešených GitHub issues end-to-end. Realita v praxi (Answer.AI, 2025): funguje na izolovaných úkolech, uvázne a halucinuje na komplexních.“
10. „Verdikt: silná verze teze (1 = tým) nemá k 10/2026 průkaznou oporu. Slabá verze (AI měřitelně pomáhá na některých vymezených úkolech) je potvrzena; na dodávku a provoz se ale zrychlení samo nepřenáší.“

---

## 11. Seznam přímých zdrojů

### Kontrolované experimenty (RCT)
1. Becker, J., Rush, N., Barnes, E. et al. (2025). *Measuring the Impact of Early-2025 AI on Experienced Open-Source Developer Productivity.* METR. https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/ (plná verze: arXiv:2507.09089, https://arxiv.org/abs/2507.09089)
2. Peng, S., Kalliamvakou, E., Cihon, P., Demirer, M. (2023). *The Impact of AI on Developer Productivity: Evidence from GitHub Copilot.* arXiv:2302.06590. https://arxiv.org/abs/2302.06590
3. Kalliamvakou, E. (2022). *Research: Quantifying GitHub Copilot's impact on developer productivity and happiness.* GitHub Blog. https://github.blog/news-insights/research/research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/
4. Perry, N., Srivastava, M., Kumar, D., Boneh, D. (2023). *Do Users Write More Insecure Code with AI Assistants?* ACM CCS 2023. arXiv:2211.03622. https://arxiv.org/abs/2211.03622

### Observační / telemetrická data o produktivitě a přijetí
5. Cihon, P. et al. / Iansiti, M. et al. (2023). *Sea Change in Software Development: Economic and Productivity Analysis of the AI-Powered Developer Lifecycle.* arXiv:2306.15033. https://arxiv.org/abs/2306.15033

### DORA (Google Cloud DevOps Research and Assessment)
6. DORA / Google Cloud (2024). *Accelerate State of DevOps Report 2024.* https://dora.dev/research/2024/dora-report/
7. Google Cloud Blog (2024). *Announcing the 2024 DORA Report.* https://cloud.google.com/blog/products/devops-sre/announcing-the-2024-dora-report
8. DORA / Google Cloud (2025). *State of AI-assisted Software Development.* https://dora.dev/research/2025/dora-report/
9. DORA (2026). *DORA 2025: Year in review* (shrnutí trilogie reportů 2025 – Impact of Generative AI, State of AI-assisted SW Development, AI Capabilities Model). https://dora.dev/insights/dora-2025-year-in-review/

### Žurnalistické shrnutí DORA 2025 dat (s konkrétními čísly z reportu)
10. CNN (23. 9. 2025). *Google study: 90% of tech workers use AI.* https://edition.cnn.com/2025/09/23/tech/google-study-90-percent-tech-jobs-ai
11. Business Insider (23. 9. 2025). *Google's senior director of product explains how software engineering jobs are changing in the AI era.* https://www.businessinsider.com/google-study-software-engineering-changing-ai-2025-9

### Kvalita a udržovatelnost kódu
12. GitClear (2025). *AI Copilot Code Quality: 2025 Look Back at 12 Months of Data.* https://www.gitclear.com/ai_assistant_code_quality_2025_research

### Limity schopností / generalizace AI agentů
13. Kwa, T., West, B. et al. (2025). *Measuring AI Ability to Complete Long Software Tasks.* METR. https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/
14. METR (2025). *How does time horizon vary across domains?* https://metr.org/blog/2025-07-14-how-does-time-horizon-vary-across-domains/

### Vnímání vývojářů / důvěra v AI (survey data)
15. Stack Overflow (2025). *Stack Overflow Developer Survey 2025 – AI section.* https://survey.stackoverflow.co/2025/ai

### Case study „AI agent nahrazuje inženýra“ – realitní ověření
16. Answer.AI (2025). *Devin can't actually do that (yet).* https://www.answer.ai/posts/2025-01-08-devin.html

---

*Poznámka k datům: Všechny číselné údaje v tomto dokumentu jsou přímo citovány z uvedených zdrojů s datem publikace do 24. 10. 2026. Tam, kde se odhady/extrapolace (McKinsey-style projekce HDP, Pichai „10% velocity“ apod.) liší povahou od měřených experimentálních dat, je to v textu explicitně označeno.*
