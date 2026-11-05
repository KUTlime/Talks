# Teze 01 — „AI už nahrazuje juniorní vývojáře“

> Podklad pro MaiDay 2026 (Brno). Rozsah: 2021 – 24. 10. 2026. Primárně trh USA; EU/ČR data odděleně v sekci E.
> Datum zpracování a ověření zdrojů: **24. 10. 2026**. Všechny uvedené odkazy byly k tomuto datu přímo načteny a čísla ověřena (ne jen dohledána v sekundárních shrnutích).

---

## 1. Teze

„AI (generativní nástroje, LLM coding asistenti typu GitHub Copilot/ChatGPT) už dnes reálně nahrazuje juniorní/entry-level vývojáře — firmy je přestávají najímat, protože práci zvládne AI.“

## 2. Verdikt: **ČÁSTEČNĚ POTVRZENO** — s přesnými podmínkami

Teze je **částečně potvrzena, ale pouze v omezeném a přesně vymezeném smyslu**:

- **Co je solidně doloženo (skutečná data o najímání/zaměstnanosti, ne inzerce):**
  Existuje ve více zdrojích (Stanford/ADP payroll data, Revelio Labs headcount data z bankovního sektoru) pozorovaný jev: **zaměstnanost/najímání mladých pracovníků (cca 22–25 let) v povoláních s vysokou expozicí vůči AI klesá relativně k jejich méně exponovaným vrstevníkům, a to primárně přes snížené najímání, ne přes vyšší propouštění.** Pozorovaná mezera se v průběhu 2025–2026 prohlubuje.

- **Co NENÍ prokázáno jako čistě kauzální AI efekt:**
  Žádný z nalezených zdrojů **neprokazuje čistou kauzalitu** „AI → nahrazení juniorů“ nezávisle na jiných vlivech. Autoři klíčové (Stanfordské) studie sami svá zjištění explicitně označují za **„canaries… rather than causal estimates“** (rané popisné indikátory, ne kauzální odhady). Pokles poptávky po juniorech (−35 % job postings od 1/2023 do 8/2025 dle Revelio) mohou spoluvysvětlovat **post-pandemický nadměrný nábor 2021–22 a jeho korekce, vyšší úrokové sazby a útlum VC/startup financování**. Podíl jednotlivých příčin z těchto dat neumíme spolehlivě vyčíslit.

- **Co je nutné přesně odlišit:**
  1. **Inzerce (job postings)** ≠ **skutečné najímání/headcount**. Inzertní data (Indeed, Revelio job-postings) ukazují prudký propad poptávky po juniorním software vývoji od vrcholu 2021/22 na historická minima do 2026 — ale samo o sobě to je z větší části **mean reversion** po přehřátí trhu, ne důkaz AI substituce.
  2. **Skutečná zaměstnanost/payroll data** (ADP, bankovní headcount) ukazují **užší, ale přetrvávající a sílící mezeru specificky u mladých v rolích klasifikovaných jako AI-substituční** — toto je silnější (byť ne kauzální) signál.
  3. **Korelace vs. kauzalita**: pouze Revelio regrese (kontrola na trend/odvětví/měsíc) a Stanford studie (kontrola na odvětví, úrokové sazby, remote práci, vzdělání) se **o separaci AI efektu od makro/cyklických vlivů aktivně pokoušejí** — a i ony samy přiznávají, že efekt **slábne po kontrole na vzdělání** a že **některé trendy předcházely nástupu generativní AI**.

- **Podmínky, za kterých teze platí:** Je podložena **pro AI-substituční povolání v USA, pro věkovou kohortu cca 22–25 let, měřeno jako pokles relativního najímání (ne absolutní nezaměstnanost celé populace)**, a to od cca 2023–2024 do poloviny 2026, s postupně sílícím trendem.

- **Podmínky, za kterých teze NEplatí / je nadsazená:** Jako **plošné tvrzení „AI už nahradila juniory“** (ve smyslu přímého, prokázaného, dominantního kauzálního mechanismu, platícího universálně a nezávisle na cyklu) **teze NENÍ prokázána** a dostupné studie ji takto samy neformulují.

---

## 3. Klíčové důkazy

### A) Stanford Digital Economy Lab — Brynjolfsson, Chandar & Chen (2025, revize 12. 8. 2026)

**„Canaries in the Coal Mine? Six Facts about the Recent Employment Effects of Artificial Intelligence“**
URL: https://digitaleconomy.stanford.edu/publication/canaries-in-the-coal-mine-six-facts-about-the-recent-employment-effects-of-artificial-intelligence/ (ověřeno přímým načtením 24. 10. 2026)

- **Data:** vysokofrekvenční **administrativní payroll data ADP** (miliony amerických zaměstnanců), data do **června 2026** — tedy **skutečná zaměstnanost/hiring**, NE inzerce. Doplněno o srovnání s CPS a vládními administrativními daty.
- **6 zjištění (doslovně přeloženo):**
  1. Žádný důkaz plošného, ekonomicky-širokého vytěsnění pracovních míst.
  2. Zaměstnanost mladých (**22–25 let**) v **AI-exponovaných povoláních** je nyní **19 % pod trendem**, odpovídajícím vývoji méně exponovaných vrstevníků; zkušení pracovníci srovnatelnou mezeru nemají.
  3. Mezera se od prvního zdokumentování (srpen 2025) postupně prohlubuje.
  4. Mechanismus: primárně **snížené najímání** mladých, ne zvýšené propouštění.
  5. Pokles koncentrován tam, kde AI **substituuje** lidské úkoly; kde AI **doplňuje** práci, je zaměstnanost stabilní/roste (zejména u zkušených).
  6. Přizpůsobení probíhá přes **počty míst**, ne přes mzdy.
- **Testy robustnosti (explicitní kontrola alternativních vysvětlení):** efekt přetrvává i po vyloučení technologických firem a počítačových povolání, po kontrole na expozici růstu úrokových sazeb a na remote práci, napříč alternativními měřítky AI expozice.
- **Přiznané limity autory:** vzorec **slábne při kontrole na vzdělání**; některé divergentní trendy existovaly **už před nástupem generativní AI**; efekt je výraznější v ADP vzorku než v národních survey datech. Autoři sami: *„we interpret these facts as early, descriptive indicators… rather than causal estimates.“*
- **Pozor na verzování:** studie je živý, průběžně revidovaný dokument (2025 → 8/2026) — citovat vždy konkrétní verzi/datum.

### B) BLS / NY Fed — nezaměstnanost CS/tech absolventů

**Nepodařilo se přímo ověřit** strukturovaná čísla: BLS OEWS stránka pro Software Developers (SOC 15-1252) vrací HTTP 403 (bot-blokace), NY Fed stránka `newyorkfed.org/research/college-labor-market` je JS-aplikace bez staticky fetchovatelných dat. **Toto je mezera — žádná konkrétní čísla z BLS/NY Fed zde NEJSOU uváděna**, protože by musela být vymyšlena. Pro přednášku: dohledat ručně v prohlížeči před použitím.

### C) Indeed Hiring Lab — Job Postings Index (JASNĚ: INZERCE, ne hiring)

**„US Labor Market Snapshot — October 2026“**, publikováno 22. 10. 2026.
URL: https://hiringlab.indeed.com/2026/10/22/us-labor-market-snapshot-october-2026/ (ověřeno přímým načtením 24. 10. 2026)

- **Typ dat:** Indeed Job Postings Index (JPI), baseline 1. 2. 2020 = 100 — **výhradně inzerce**, ne skutečné nástupy.
- Celkový JPI k 16. 10. 2026: **103,8** (≈ 4 % nad pre-pandemickou úrovní); meziročně +2,8 %.
- Sektor **Software Development**: vrchol **~235** (konec 2021/začátek 2022), pak prudký propad **pod baseline 100 do roku 2024**, k říjnu 2026 na **~78** — jediný z 5 sledovaných sektorů (Engineering, Healthcare, HR, Production & Manufacturing, Software Development) výrazně pod celkovou úrovní (Engineering naopak ~145).
- Regionálně nejslabší trhy: **Seattle (67), San Francisco (72), Santa Rosa (73)** — Indeed to popisuje jako obecný „pull-back in tech-related hiring“, **bez explicitního přisouzení AI** (otevřeno pro alternativní vysvětlení — korekce po přehřátí 2021–22).
- Zářijová zpráva (2. 10. 2026): celkový přírůstek pracovních míst v USA jen **+29 000**, nezaměstnanost **4,2 %**.

### D) Skutečný entry-level hiring a headcount — Revelio Labs

**D1 — „Is AI Responsible for the Rise in Entry-Level Unemployment?“** (s Bloombergem), publikováno srpen 2025, ověřeno 24. 10. 2026.
URL: https://www.reveliolabs.com/news/macro/is-ai-responsible-for-the-rise-in-entry-level-unemployment

- **Typ dat:** job postings (COSMOS dataset) + **regrese** s kontrolou na trend/odvětví/měsíc — pokus o oddělení AI efektu od cyklického poklesu.
- Poptávka po entry-level pozicích klesla za 18 měsíců do 8/2025 o **>35 %** oproti 1/2023 (přes **100 000 méně** měsíčních inzerátů). Mezi sektory s nejvyšším podílem absolventů VŠ má **tech nejostřejší pokles entry-level poptávky: ~25 %**.
- Rozpad: vysoce AI-exponované entry-level role poklesly o **>40 %**, nízko exponované o **33 %**; u non-entry rolí nízko exponované −16 %, vysoce exponované −27 %.
- **Regresní výsledek (klíčové pro kauzalitu):** nárůst AI expozice o 10 p.b. je spojen s **+7 % poptávky u non-entry** rolí, ale **−11 % u entry-level** rolí, po kontrole na čas/odvětví/měsíc.
- Vlastní rámování Revelio: debata je polarizovaná mezi „doomsayery“ a „skeptiky“ a jejich analýza nachází **statisticky odlišitelný, ale ne dominantní** AI efekt.

**D2 — „Banks Are Losing Interest in Junior Talent in the AI Era“**, publikováno 13. 10. 2026.
URL: https://www.reveliolabs.com/news/ai-and-work/ai-junior-bankers-hiring-data

- **Skutečná headcount data** (ne inzerce), analogie k softwarovým juniorům.
- Dekáda před ChatGPT (do 11/2022): banky přidávaly průměrně **99 200 míst/rok**. Po launchi ChatGPT tempo kleslo na dno **21 600 míst/rok (9/2024)**, zotavení na **~62 500 (6/2026)**.
- **Junior role jsou o 4,7 % pod úrovní z 10/2022**, senior role rostou srovnatelně nebo rychleji než před ChatGPT.
- Pokles **není způsoben vyšší fluktuací** juniorů (ta se vrátila k normálu) — jde o **pokles najímání**: podíl junior hiring na junior headcountu klesl z ~10,5 % (rok před ChatGPT) na ~8,5 % (2024–2025). Stejný mechanismus jako bod A4.

**D3 — „Is AI Just a Scapegoat For Layoffs?“** (s System2), publikováno 25. 8. 2026.
URL: https://www.reveliolabs.com/news/ai-and-work/is-ai-just-a-scapegoat-for-layoffs

- Firmy, které veřejně přisoudily propouštění AI (Duolingo, Block, Meta, Amazon, GM, Washington Post, UPS, McKinsey ad.), rostly v AI-rolích **mediánem 11 %** za 2 roky — **méně** než odvětvoví konkurenti (**13 %+**) bez AI-layoffs.
- Zároveň tyto firmy snížily **non-AI headcount o >3 %**, konkurenti ho drželi stabilní. Podíl AI rolí na headcountu byl u „layoff firem“ téměř dvojnásobný.
- **Implikace:** reálná AI-transformace workforce existuje, ale „AI-washing“ (přisuzování běžných škrtů AI kvůli reakci investorů — příklad: akcie Block +24 % po ohlášení) je datově nevyloučitelná alternativní hypotéza.

**D4 — „Tech Hiring Is Getting More Specialized“**, publikováno 1. 9. 2026.
URL: https://www.reveliolabs.com/news/tech/tech-hiring-specialized-job-market-2026

- Od konce 2024 klesl průměrný počet požadovaných skillů v tech inzerátech z ~30 na ~21, požadovaná praxe vzrostla ze 4,6 na 4,8 let. Obecné zmínky „software/application development“ klesly z 25,4 %/14 % (2023) na 16,5 %/6,4 % (2026). Nepřímý důkaz posunu poptávky od obecné juniorní „šíře“ k specializaci.

**D5 — AI Labor Market Tracker (Revelio), snapshot 9/2026.**
URL: https://www.reveliolabs.com/ai-labor-market-tracker

- 7,2 % pracovníků má aspoň jeden AI skill (mírně nahoru ze 7,1 % v 7/2026). Mezera v inzerci mezi nejvíc/nejméně AI-exponovanými povoláními: **−29 %** (zúžení z −40 % v 7/2026). 90 % meziroční změny obsahu práce probíhá uvnitř povolání.

### D6) GitHub Copilot — produktivita (kontrastní nález, pro-junior rámování)

Peng, S., Kalliamvakou, E., Cihon, P., Demirer, M. „The Impact of AI on Developer Productivity: Evidence from GitHub Copilot.“ arXiv:2302.06590 (13. 2. 2023). https://arxiv.org/abs/2302.06590

- **RCT**: skupina s GitHub Copilot dokončila úkol (HTTP server v JS) o **55,8 % rychleji**.
- Abstrakt explicitně: *„…show promise for AI pair programmers to help people transition into software development careers“* — původní rámování je **pro-junior** (AI jako usnadnění vstupu do oboru), v kontrastu s pozdější „AI nahrazuje juniory“ narativou. **Neměří zaměstnanost ani najímání.**

### D7) METR — produktivita zkušených vývojářů (kontrapunkt k přehnanému AI-optimismu)

METR, „Measuring the Impact of Early 2025 AI on Experienced Open-Source Developer Productivity“, 10. 7. 2025. https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/

- RCT, 16 zkušených OSS vývojářů, 246 reálných issues, náhodné povolení/zákaz AI (Cursor Pro + Claude 3.5/3.7 Sonnet).
- Vývojáři s AI byli **o 19 % POMALEJŠÍ** — v rozporu s očekáváním (+24 % rychlost) i se subjektivním dojmem (sami si mysleli, že byli o 20 % rychlejší).
- Explicitní limity: netýká se juniorů ani jiných domén/nástrojů; jde o konkrétní kontext zkušených OSS vývojářů.

### D8) METR — survey sebehodnocení (2026)

https://metr.org/blog/2026-05-11-ai-usage-survey/ (11. 5. 2026) — 349 respondentů (87 SW inženýrů): medián sebehodnocené změny hodnoty práce 1,4–2×, rychlosti 3×. METR varuje: v jejich RCT lidé **nadhodnocovali** efekt AI v průměru o **40 procentních bodů** — survey data systematicky nadhodnocují efekt oproti RCT.

---

## 4. EU / ČR — odděleně

- **Eurostat, „ICT specialists in employment“** (data 2025, extrakce 4/2026): https://ec.europa.eu/eurostat/statistics-explained/index.php?title=ICT_specialists_in_employment
  Počet ICT specialistů v EU vzrostl 2015–2025 o **59,4 %** (vs. +9,8 % celková zaměstnanost); 2025: **>10 mil.** ICT specialistů, **5,0 %** celkové zaměstnanosti EU. Nejvíc Německo (2,3 mil.), Francie (1,4 mil.).
  ⚠️ **Toto je čistě celkový agregát zaměstnanosti bez rozpadu podle seniority nebo AI-expozice — nelze z něj vyvodit NIC o dopadu AI na juniory v EU.**

- **ČSÚ (Český statistický úřad):** Nepodařilo se dohledat žádná relevantní specifická data o juniorním IT hiring vs. AI. Toto zůstává otevřenou mezerou.

- **Shrnutí pro ČR/EU:** Debata „AI nahrazuje juniory“ je k 24. 10. 2026 **převážně US-datově podložený fenomén** (ADP, Revelio, Indeed). Pro EU/ČR **srovnatelná granulární evidence chybí** — to je třeba na slidu explicitně přiznat, ne zaplňovat odhadem.

---

## 5. Protiargumenty a limity

1. **Většina poklesu poptávky po juniorech je pravděpodobně necyklicky-AI povahy.** Revelio: celkový pokles entry-level poptávky (−35 %) je mnohem větší než statisticky odlišitelná AI-specifická komponenta (−11 % vs. +7 % při 10p.b. rozdílu expozice) — hlavní váha je na post-covid over-hiring korekci, vyšších sazbách a útlumu VC financování.
2. **Stanfordská studie je sebekriticky nekauzální** — „canaries“, ne „causal estimates“; efekt slábne po kontrole na vzdělání; některé trendy předcházely generativní AI; silnější v ADP vzorku než v národních datech.
3. **„AI jako zástěrka pro propouštění“ (AI-washing)** — firmy mohou přisuzovat běžné restrukturalizace AI kvůli pozitivní reakci investorů (příklad: akcie Block +24 % po ohlášení AI-layoffs). Data (D3) ukazují smíšený obraz: part reálná transformace, part možný washing.
4. **METR RCT ukazuje, že u zkušených vývojářů AI nástroje produktivitu v reálných podmínkách SNIŽUJÍ (−19 %)** — podkopává jednoduchý mechanismus „AI zvyšuje produktivitu → firmy potřebují méně lidí“, přinejmenším jako univerzální vysvětlení.
5. **Sebehodnocení AI přínosu je systematicky nadhodnocené** (až o 40 p.b. dle METR) — jakékoli studie/ankety založené na subjektivním vnímání dopadu AI je třeba brát s rezervou.
6. **Indeed Hiring Lab** rámuje propad Software Development sektoru jako obecný „pull-back in tech-related hiring“ **bez** přisouzení AI — ponechává prostor pro čistě cyklické vysvětlení (mean reversion po vrcholu JPI ~235 v 2021/22).
7. **EU/ČR evidence chybí** — tvrzení o „globálním“ nahrazování juniorů AI je nadsazené, pokud je míněno mimo USA.

---

## 6. Co zůstává neprokázáno / otevřené otázky

- Chybí veřejně dostupný, přímo ověřený časový řad **BLS/NY Fed nezaměstnanosti specificky pro Software Developers (SOC 15-1252)** 2021–2026 — nutno dohledat ručně v prohlížeči před přednáškou (BLS/NY Fed blokují automatizovaný přístup).
- **SignalFire „State of Talent“** číslo o poklesu entry-level hiring (často citované v médiích, cca „−50 % podílu entry-level hiring v tech od 2019“) **se nepodařilo ověřit v primárním zdroji** — nebylo proto použito.
- Žádná nalezená studie neprovádí striktní diff-in-diff izolaci AI efektu od post-covid korekce **specificky pro softwarové vývojáře** (Stanford měří napříč více AI-exponovanými povoláními, i po vyloučení počítačových profesí zůstává efekt — ale přesné číslo „19 %“ nelze mechanicky převést na „19 % pokles jen pro junior software devs“).
- Revelio regrese je korelační (kontrola na pozorovatelné proměnné), ne přirozený experiment — zbytková endogenita nelze vyloučit.
- Stanfordská studie je živý dokument s opakovanými revizemi (8/2025 → 8/2026) — čísla se mohou dále měnit; nutno před akcí zkontrolovat nejnovější verzi.

---

## 7. Návrh slidů a citovatelné formulace

**Slide 1 — Teze a napětí:**
> „AI už nahrazuje juniorní vývojáře.“ — Je to pravda? Odpověď: ano i ne. Záleží, co měříme.

**Slide 2 — Tři různé věci, které se pletou dohromady:**
- Inzerce (kolik je nabídek práce)
- Skutečné nástupy / headcount (kolik lidí firmy fakticky najaly)
- Příčina: AI, nebo post-covid korekce a vyšší úrokové sazby?

**Slide 3 — Co ukazují tvrdá payroll data (citovatelné):**
> „Zaměstnanost mladých pracovníků (22–25 let) v AI-exponovaných povoláních je 19 % pod trendem oproti méně exponovaným vrstevníkům — efekt funguje primárně přes snížené najímání, ne přes propouštění.“
> (Brynjolfsson, Chandar, Chen — Stanford Digital Economy Lab, revize 12. 8. 2026, ADP payroll data do 6/2026)

**Slide 4 — Ale pozor, autoři sami říkají:**
> „We interpret these facts as early, descriptive indicators — canaries in the coal mine — rather than causal estimates.“

**Slide 5 — Inzerce ≠ realita (Indeed):**
> Index inzerce v softwarovém vývoji: vrchol ~235 (konec 2021), dnes ~78 (10/2026) — propad o víc než 2/3 z vrcholu. Ale „pull-back in tech-related hiring“ dle Indeed samotného — bez přiřčení viny AI.

**Slide 6 — Oddělený AI efekt existuje, ale je menší než celkový propad (Revelio):**
> Entry-level poptávka v tech −35 % (1/2023–8/2025). Po kontrole na čas/odvětví: +10 p.b. AI expozice = −11 % entry-level poptávky, ale +7 % non-entry poptávky.

**Slide 7 — Analogie z bankovnictví (ne tech, ale týž mechanismus):**
> Junior role v amerických bankách jsou 4,7 % pod úrovní z října 2022 — ne kvůli vyšší fluktuaci juniorů, ale kvůli nižšímu podílu nových juniorů v najímání (10,5 % → 8,5 %).

**Slide 8 — Kontrapunkt: AI nezrychluje vždy a všude:**
> METR RCT: zkušení open-source vývojáři byli s AI nástroji o 19 % POMALEJŠÍ, přestože sami věřili, že je AI zrychlilo o 20 %.

**Slide 9 — EU/ČR:**
> Pro Evropu/ČR srovnatelná data chybí. Eurostat ukazuje jen celkový růst ICT zaměstnanosti (+59 % 2015–2025) bez rozpadu na AI/seniority. Debata je zatím primárně americký fenomén.

**Slide 10 — Verdikt:**
> Částečně potvrzeno: AI je jedna z měřitelných, ale ne dominantní příčin poklesu najímání juniorů v USA. Většinu propadu způsobuje post-pandemická korekce trhu. Kauzalita AI → nahrazení juniorů není prokázána, pouze indikována („canaries, not causal estimates“).

---

## 8. Metodika tohoto ověření

- Provedeno formou dvoufázového ověření: (1) rešeršní subagent provedl 15+ přímých fetchů primárních zdrojů (studie, reporty, blogy institucí); (2) hlavní agent nezávisle znovu přímo načetl a ověřil klíčová tvrzení a čísla u tří nejdůležitějších zdrojů (Stanford studie, Revelio D1, Indeed Hiring Lab) porovnáním plného textu stránky s citovanými čísly — všechna sedí.
- Zdroje byly striktně rozlišeny podle typu dat: **job postings/inzerce** (Indeed, Revelio job-postings) vs. **skutečný headcount/payroll** (Stanford/ADP, Revelio bankovní data) vs. **laboratorní RCT produktivity** (GitHub Copilot studie, METR) — tyto kategorie se NESMÍ zaměňovat a v textu výše jsou vždy explicitně označeny.
- Zdroje, které nebylo možné přímo ověřit (BLS OEWS — HTTP 403, NY Fed college labor market — JS aplikace bez staticky dostupných dat, SignalFire State of Talent, LinkedIn Economic Graph, Burning Glass/Lightcast, ČSÚ), jsou explicitně označeny jako **neověřeno** a jejich čísla **nebyla** do textu doplněna ani odhadnuta.
- Žádné číslo v tomto dokumentu není vymyšlené ani extrapolované nad rámec toho, co bylo přímo nalezeno v citovaném zdroji.

## 9. Odkazy (ověřené zdroje)

1. Brynjolfsson, E., Chandar, B., Chen, R. (2025, revize 8/2026). *Canaries in the Coal Mine? Six Facts about the Recent Employment Effects of Artificial Intelligence.* Stanford Digital Economy Lab. https://digitaleconomy.stanford.edu/publication/canaries-in-the-coal-mine-six-facts-about-the-recent-employment-effects-of-artificial-intelligence/
2. Indeed Hiring Lab (22. 10. 2026). *US Labor Market Snapshot — October 2026.* https://hiringlab.indeed.com/2026/10/22/us-labor-market-snapshot-october-2026/
3. Indeed Hiring Lab (2. 10. 2026). *September 2026 Jobs Report: Steadiness Without a Spark.* https://hiringlab.indeed.com/2026/10/02/september-2026-jobs-report-steadiness-without-a-spark/
4. Revelio Labs × Bloomberg (8/2025). *Is AI Responsible for the Rise in Entry-Level Unemployment?* https://www.reveliolabs.com/news/macro/is-ai-responsible-for-the-rise-in-entry-level-unemployment
5. Revelio Labs (13. 10. 2026). *Banks Are Losing Interest in Junior Talent in the AI Era.* https://www.reveliolabs.com/news/ai-and-work/ai-junior-bankers-hiring-data
6. Revelio Labs × System2 (25. 8. 2026). *Is AI Just a Scapegoat For Layoffs?* https://www.reveliolabs.com/news/ai-and-work/is-ai-just-a-scapegoat-for-layoffs
7. Revelio Labs (1. 9. 2026). *Tech Hiring Is Getting More Specialized.* https://www.reveliolabs.com/news/tech/tech-hiring-specialized-job-market-2026
8. Revelio Labs. *AI Labor Market Tracker* (snapshot 9/2026). https://www.reveliolabs.com/ai-labor-market-tracker
9. Peng, S., Kalliamvakou, E., Cihon, P., Demirer, M. (13. 2. 2023). *The Impact of AI on Developer Productivity: Evidence from GitHub Copilot.* arXiv:2302.06590. https://arxiv.org/abs/2302.06590
10. METR (10. 7. 2025). *Measuring the Impact of Early 2025 AI on Experienced Open-Source Developer Productivity.* https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/
11. METR (11. 5. 2026). *AI Usage Survey.* https://metr.org/blog/2026-05-11-ai-usage-survey/
12. Eurostat (data 2025, extrakce 4/2026). *ICT specialists in employment.* https://ec.europa.eu/eurostat/statistics-explained/index.php?title=ICT_specialists_in_employment

**Neověřené / nedostupné zdroje (vědomě nepoužito pro čísla):** BLS OEWS SOC 15-1252 (HTTP 403), NY Fed „Labor Market for Recent College Graduates“ (JS-only stránka), SignalFire „State of Talent“ report, LinkedIn Economic Graph, Burning Glass Institute/Lightcast, ČSÚ (czso.cz).
