# Teze 03: „Programování se stane komoditou; důležité budou jen nápady.“

> Hloubková analýza pro přípravu přednášky. Okno důkazů: 2021 – 24. 10. 2026.
> Metodická poznámka: Všechny odkazy níže byly cíleně dohledány a u drtivé většiny ověřeno,
> že URL existuje a odpovídá citovanému tvrzení (přímo nebo přes web.archive.org, pokud živý web
> blokuje automatizovaný přístup). Tam, kde se primární zdroj nepodařilo dohledat nebo ověřit,
> je to **explicitně napsáno** – žádné číslo v tomto dokumentu není vymyšlené ani „od oka“.

---

## 0. Jak s tezí pracovat – rozklad na tři oddělitelné výroky

Teze ve skutečnosti slučuje tři různé věci, které je pro poctivou diskuzi nutné rozpojit:

| # | Dílčí výrok | Typ výroku |
|---|---|---|
| A | „Psaní syntaxe/boilerplate kódu je dnes levnější a rychlejší než dřív (AI nástroje).“ | **Empiricky ověřitelné** (částečně ověřeno, viz kap. 3–4) |
| B | „Napsání *prototypu/first draftu* přestává být bottleneckem; těžiště nákladů je jinde (integrace, údržba, bezpečnost, posouzení kvality).“ | **Empiricky ověřitelné** (podloženo nepřímo, viz kap. 1–2, 5) |
| C | „Proto bude jediná vzácná a cenná věc nápad, a inženýrství přestane mít hodnotu.“ | **Čistá predikce / extrapolace** – není a nemůže být podloženo daty z let 2021–2026, protože jde o tvrzení o budoucí struktuře hodnoty, ne o měřitelný jev dneška |

Důkazy níže podporují A i B v omezené, kontextově podmíněné míře. Výrok C je hodnotový/strategický úsudek, který z A+B **nevyplývá logicky** – důkazy v kap. 5–6 ukazují opačný tlak: bottleneck se nepřesouvá k „nápadu“, ale k *review, integraci, bezpečnosti a posouzení, zda je výstup vůbec správný* – což je stále inženýrská dovednost.

---

## 1. Prototyp vs. integrace/produkce — náklady a čas

**Shrnutí:** Pro tvrdé, přímo citovatelné číslo typu „80 % nákladů je integrace, ne psaní kódu“ **nebyl v okně 2021–2026 nalezen žádný přímo ověřený primární zdroj**. Nejčastěji citované Gartner/McKinsey zdroje na toto téma blokují automatizovaný přístup (HTTP 403/timeout) a nelze je zde certifikovat jako ověřené – doporučuji je nepoužívat bez ručního dohledání na slide.

Nejbližší reálně ověřená data (jde o ML/data-science kontext, ne obecně o SW):

- **Algorithmia, „2020 State of Enterprise Machine Learning“** (sběr dat 2020, publikováno 2021)
  https://web.archive.org/web/20211209074252/https://algorithmia.com/state-of-ml
  - Zjištění: *36 % respondentů* uvedlo, že datoví vědci tráví čtvrtinu svého času nasazováním modelů do produkce; *57 % organizací* potřebuje déle než měsíc na nasazení modelu do škálované produkce (N≈637–647).
  - **Limity metodiky:** self-reported survey firmy, která sama prodává deployment nástroje (konflikt zájmů); data z roku 2020, mimo hlavní jádro okna.

- **Shankar, Garcia, Hellerstein, Parameswaran, „Operationalizing Machine Learning: An Interview Study“**, arXiv, 16. 9. 2022
  https://arxiv.org/abs/2209.09125
  - Zjištění: kvalitativní rozhovory s 18 ML inženýry potvrzují, že produkční nasazení (MLOps) je samostatná a časově náročná disciplína oddělená od tvorby modelu samotného.
  - **Limity:** N=18, čistě kvalitativní studie, **žádné finanční/procentuální vyčíslení** poměru prototyp:integrace.

**Co explicitně NEPOUŽÍVAT na slide bez výhrady:**
- „87 % data science projektů se nikdy nedostane do produkce“ – pochází z VentureBeat článku (2019, mimo okno), citujícího konferenční panel bez uvedené metodiky. https://web.archive.org/web/20231215052915/https://venturebeat.com/ai/why-do-87-of-data-science-projects-never-make-it-into-production/
- Gartner „30 % generativních AI projektů opuštěno po PoC do 2025“ – zdroj nebyl dohledatelný/ověřitelný (403).
- McKinsey „last mile“ čísla k nasazení AI – fetch selhal (timeout), nelze certifikovat.

**Závěr pro slide:** Tvrzení „prototyp je levný, integrace drahá“ je **kvalitativně dobře podložené** (ML operacionalizace je zdokumentovaný, uznávaný problém), ale **bez spolehlivého kvantitativního poměru** v daném okně. Prezentovat jako „odborný konsenzus bez tvrdého čísla“, ne jako statistiku.

---

## 2. Náklady na údržbu vs. počáteční vývoj

- **Boehm, *Software Engineering Economics* (1981)** – klasický, nejcitovanější údaj: **60–80 %** nákladů softwarového životního cyklu připadá na údržbu.
  **Mimo zadané okno (1981)** a originál se nepodařilo fetchnout přímo – citovat výhradně jako *historický referenční rámec*, ne jako aktuální ověřený primární zdroj.
- **Wikipedia, „Software maintenance“** (cituje Ulziit et al., 2015)
  https://en.wikipedia.org/wiki/Software_maintenance
  - Citace: *„maintenance is… comprising 80 to 90 percent of the lifecycle cost“*; *„Understanding has not changed significantly since the 1980s.“*
  - **Limity:** sekundární/terciární zdroj (Wikipedia → Ulziit et al. 2015); primární akademický článek nebyl v tomto běhu ověřen přímo.
- **Sommerville, *Software Engineering* (učebnice)** – konkrétní číslo se **nepodařilo ověřit** (dostupné kopie vyžadují JS/nejsou strojově čitelné). **Nepoužívat bez dalšího ručního ověření.**
- **Stripe, „The Developer Coefficient“ (2018)** – PDF existuje (https://stripe.com/files/reports/the-developer-coefficient.pdf), ale obsah nebylo možné strojově přečíst; často citovaných „33 % času vývojářů na technický dluh a špatný kód“ se **nepodařilo v tomto běhu znovu ověřit**. Navíc mimo okno (2018) a jde o komerční zdroj (platební firma propagující vlastní produktivitu vývojářů).
- **Stack Overflow Developer Survey 2024** – https://survey.stackoverflow.co/2024/ – nejbližší proxy: *61 % respondentů* tráví více než 30 minut denně hledáním řešení problémů. Žádná přímá otázka na podíl údržby vs. nového vývoje.

**Doporučení pro slide:** Použít Wikipedia/Ulziit (80–90 %) s jasnou poznámkou „sekundární citace akademické literatury“, vedle Boehm 1981 označeného jako „40+ let starý, ale dodnes citovaný rámec“. Poctivě přiznat, že novější, metodicky čistá replikace tohoto čísla pro okno 2021–2026 **nebyla nalezena**.

---

## 3. Produktivita vývojářů s AI — rychlost vs. kvalita (jádro empirické části)

Toto je nejsilněji podložená část teze a zároveň místo, kde jsou důkazy **nejrozporuplnější** — ideální materiál pro „pro i proti“ slide.

| Zdroj | Klíčové zjištění | Metodika | Limity |
|---|---|---|---|
| **METR (2025)**, „Measuring the Impact of Early-2025 AI on Experienced OS Developer Productivity“ https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/ (arXiv: https://arxiv.org/abs/2507.09089) | Zkušení vývojáři byli s AI nástroji **o 19 % POMALEJŠÍ**, přitom subjektivně věřili, že byli o 20 % rychlejší | Randomizovaná kontrolovaná studie (RCT), N=16 zkušených OSS vývojářů, 246 reálných issues ve velkém repozitáři (22k+ hvězd, 1M+ řádků kódu) | Malý vzorek; platí pro konkrétní kontext (velký, kvalitní, vývojářům již dobře známý codebase; Cursor + Claude 3.5/3.7); self-reported časová data; nezávislá nezisková organizace – nízký konflikt zájmů |
| **GitHub (2022)**, „Research: quantifying GitHub Copilot's impact…“ https://github.blog/news-insights/research/research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/ | Vývojáři s Copilotem **o 55 % rychlejší** při psaní izolovaného HTTP serveru v JS (1h11m vs. 2h41m), p=0,0017, 95% CI [21 %, 89 %] | RCT, N=95 profesionálních vývojářů, jeden jednoduchý, izolovaný úkol | Publikováno výrobcem produktu (jasný konflikt zájmů); úzký a nereprezentativně jednoduchý úkol; velmi široký konfidenční interval = vysoká nejistota |
| **McKinsey (2023)**, „Unleashing developer productivity with generative AI“ https://www.mckinsey.com/industries/technology-media-and-telecommunications/our-insights/unleashing-developer-productivity-with-generative-ai | Psaní dokumentace ~2× rychleji, nový kód ~2× rychleji, refaktoring ~1,5× rychleji — **ALE** u komplexních úkolů úspora <10 %, u junior vývojářů až −7 až −10 % (reálně POMALEJI) | Interní McKinsey experiment; přesná velikost vzorku v textu neuvedena | Komerční konzultační firma prodávající AI transformace; netransparentní metodika; možný pozitivní bias v prezentaci |
| **DORA Report 2024** (Google Cloud/DORA) https://cloud.google.com/blog/products/devops-sre/announcing-the-2024-dora-report | +25 % AI adopce → +3,4 % vnímaná kvalita kódu, +3,1 % rychlost code review, ale **−1,5 % delivery throughput a −7,2 % stabilita dodávek**; 39 % respondentů nedůvěřuje AI vygenerovanému kódu | Roční rozsáhlý self-reported survey (tisíce respondentů) | Korelační, nikoli kauzální data; spolufinancováno DevOps dodavateli (Datadog, Deloitte aj.) |
| **DORA Report 2025**, „State of AI-assisted Software Development“ https://dora.dev/ai/ | Navazuje konceptem „productivity dip“ (dočasný propad produktivity při zavádění AI do týmu) | Launch stránka ověřena; podrobná čísla z plného PDF nebyla v tomto běhu ověřena | Sponzoři zahrnují GitHub a GitLab — přímý komerční zájem na pozitivním vyznění |

**Narativ pro prezentaci (silný, dobře podložený kontrast):**
Na **jednoduchých, izolovaných úkolech** AI měřitelně zrychluje (GitHub, McKinsey). Na **komplexní reálné práci zkušených vývojářů ve velkých codebase** AI naopak **zpomaluje** (METR – nejmetodicky nejčistší studie, RCT). Na úrovni **organizací** subjektivní pocit produktivity roste, ale systémový throughput a stabilita dodávek klesají (DORA 2024) — klasický „productivity paradox“.

---

## 4. Adopce no-code/low-code a AI-generovaného kódu („non-programmer“ nástroje)

- **Gartner (tisková zpráva, 13. 12. 2022)**
  https://web.archive.org/web/20221214180739/https://www.gartner.com/en/newsroom/press-releases/2022-12-13-gartner-forecasts-worldwide-low-code-development-technologies-market-to-grow-20-percent-in-2023
  - Trh low-code v roce 2023: **26,9 mld. USD** (+19,6 % meziročně); predikce: **do roku 2026 budou vývojáři mimo formální IT útvary tvořit min. 80 % uživatelské základny low-code nástrojů** (nárůst z 60 % v roce 2021).
  - **Limity:** komerční forecast za paywallem; dostupná jsou pouze výstupní čísla bez podkladových dat a metodiky vzorkování.
- **GitHub Octoverse 2025**
  https://github.blog/news-insights/octoverse/octoverse-a-new-developer-joins-github-every-second-as-ai-leads-typescript-to-1/
  - **80 % nových vývojářů na GitHubu používá Copilot již v prvním týdnu**; 1,1 mil.+ veřejných repozitářů používá LLM SDK (+178 % meziročně); TypeScript poprvé předběhl Python i JavaScript (interpretováno jako důsledek agent-assisted codingu).
  - **Limity:** telemetrie výhradně z vlastní platformy GitHubu/Microsoftu – silný komerční zájem prezentovat růst adopce vlastního produktu.
- **Stack Overflow Developer Survey (2023/2024/2025)**
  - 2023 → 2024: podíl používajících/plánujících AI nástroje vzrostl ze 70 % na 76 %; denní uživatelé 44 % → 62 %. https://survey.stackoverflow.co/2024/ai
  - 2024: pozitivní sentiment k AI nástrojům 72 % (pokles z 77 % v 2023); 70 % profesionálů nevnímá AI jako hrozbu pro vlastní práci.
  - 2025: **84 %** respondentů používá/plánuje používat AI nástroje, ALE klesající důvěra ve výstupy. https://survey.stackoverflow.co/2025/ai
  - **Limity:** self-selected online vzorek, čistě self-reported data, žádné měření skutečného chování.
- **OutSystems / Mendix** (hlavní komerční low-code platformy) — **nebyl v tomto běhu dohledán ani ověřen žádný primární report s tvrdými adopčními čísly**; pokud je toto téma pro prezentaci klíčové, je nutné dohledat ručně (a počítat s tím, že jde o vendor-sponsored zdroje se silným biasem).

**Závěr pro slide:** Adopce AI/no-code nástrojů je **jednoznačně a dobře empiricky podložená** (GitHub, SO Survey – vysoká shoda napříč zdroji: 76–84 % adopce). Co **není** podložené, je tvrzení, že tato adopce = „programátoři jsou nahraditelní nápadem“ – survey data měří *používání nástroje*, ne *změnu struktury hodnoty v ekonomice softwaru*.

---

## 5. Kvalita a bezpečnost AI-generovaného kódu (klíčový protidůkaz k tezi)

- **GitClear, „AI Copilot Code Quality: 2025 Look Back“**
  https://www.gitclear.com/ai_assistant_code_quality_2025_research
  - Analýza 211 mil. změněných řádků kódu (firmy jako Google, Microsoft, Meta aj., 2020–2024): **podíl refaktoringu klesl z 25 % (2021) na méně než 10 % (2024)**; **duplikovaný/copy-paste kód vzrostl z 8,3 % na 12,3 %**.
  - **Limity:** komerční firma s obchodní incentivou k alarmujícím závěrům (prodává nástroj na měření code review); klasifikace „AI vs. non-AI commit“ je heuristická, ne přímo ověřená; observační, ne experimentální design. Pozn.: hlavní stránka gitclear.com v současnosti obsahuje i syntetická/demo data — pro slide použít výhradně výše uvedená konkrétní čísla, ne obecné dojmy ze stránky.
- **Perry, Srivastava, Kumar, Boneh (Stanford), „Do Users Write More Insecure Code with AI Assistants?“**, ACM CCS 2023
  https://arxiv.org/abs/2211.03622
  - Uživatelé s AI asistentem (codex-davinci-002) psali **méně bezpečný kód**, a přitom byli **přesvědčeni, že je bezpečnější** než bez AI.
  - **Limity:** starší model (2022), jde o user study s omezeným počtem úkolů.
- **Pearce et al., „Asleep at the Keyboard?“**, IEEE S&P 2022
  https://arxiv.org/abs/2108.09293
  - **Přibližně 40 % z 1 689 vygenerovaných programů bylo zranitelných** (scénáře podle CWE Top 25, raný GitHub Copilot z roku 2021).
  - **Limity:** záměrně rizikové/testovací scénáře, starý model – nereprezentuje nutně současný stav.
- **Kabir et al. (Purdue), „Is Stack Overflow Obsolete?“**, CHI 2024
  https://arxiv.org/abs/2308.02312
  - **52 % odpovědí ChatGPT na otázky ze Stack Overflow obsahovalo věcně nesprávné informace**, přesto byly preferovány lidskými hodnotiteli v 35 % případů a chyby přehlédnuty v 39 % případů.
  - **Limity:** N=517 otázek, konkrétní verze ChatGPT z roku 2023 – rychle zastarávající data.
- **Veracode, „2025 GenAI Code Security Report“**
  https://www.veracode.com/resources/analyst-reports/2025-genai-code-security-report/
  - **45 % testů AI-generovaného kódu obsahovalo bezpečnostní chyby**; nejhorší Java (72 % selhání); XSS (CWE-80) selhalo v 86 % relevantních případů; klíčové zjištění: **„větší/novější model ≠ bezpečnější kód“**.
  - **Limity:** komerční security firma (prodává scanning nástroje); přesná metodika sestavování promptů nebyla v souhrnné zprávě zveřejněna.
- Snyk report k tématu – **nebyl dohledán ověřitelný primární zdroj** (404), nepoužívat.

**Závěr pro slide:** Toto je **nejsilnější protidůkaz** k tezi „jen nápady budou důležité“ – napříč pěti nezávislými studiemi (akademické i komerční, 2021–2025) se opakovaně potvrzuje, že AI-generovaný kód je **měřitelně méně bezpečný a méně udržovatelný**, a že lidé mají **tendenci tento problém nevidět** (overconfidence efekt). Pokud „nápad“ nikdo neumí posoudit z hlediska bezpečnosti/kvality, komoditizace produkuje křehčí, ne levnější software.

---

## 6. Protiargumenty tezi „záleží jen na nápadu“ (kvalitativní, ale ze seriózních zdrojů)

- **Simon Willison** – https://simonwillison.net/2025/Mar/11/using-llms-for-code/
  - *„Using LLMs to write code is difficult and unintuitive… If someone tells you that coding with LLMs is easy they are (probably unintentionally) misleading you.“*
  - Koncept **„LLMs amplify existing expertise“** – AI zesiluje, nenahrazuje inženýrskou dovednost. Doplňkově: https://simonwillison.net/2023/Mar/27/ai-enhanced-development/ – AI snižuje bariéru realizace nápadu, ale vyhodnocení výstupu stále vyžaduje technickou expertízu.
- **Addy Osmani (ex-Google)**, „The Agent-Era Career“, 6. 7. 2026 – https://addyosmani.com/blog/career-advice-age-of-agents/
  - *„AI gets good at anything with an answer key. Your career is everything that doesn't have one.“*; *„solving problems went cheap while selecting them became scarce“* — úsudek a volba *správného* problému zůstávají vzácné, ne samotný „nápad“.
  - Doplňkově: https://addyosmani.com/blog/human-judgment-doesnt-leave-the-software/ (21. 8. 2026) – lidský úsudek se v softwarovém inženýrství **přesouvá**, nemizí.
- **Gergely Orosz / DHH debata**, podzim 2025 – https://blog.pragmaticengineer.com/the-pulse-ror-creator-sparks-new-death-of-coding-by-hand-debate/
  - DHH (tvůrce Ruby on Rails): *„Writing code by hand is no longer an economically productive enterprise… I have retired from being a professional programmer.“* — i zde ale DHH zdůrazňuje nutnost přehodnotit architekturu a dovednosti, ne zánik inženýrství jako takového.
  - Doplňkově: https://blog.pragmaticengineer.com/the-pulse-new-trend-concern-about-massive-increase-in-code-review-load/ – bottleneck se přesouvá z *psaní* kódu na **code review** („AI slop PRs“, vyhoření recenzentů) — přímý empirický protiargument komoditizaci: psaní zlevnilo, posouzení kvality nikoliv.
- **ACM/CACM** – pokus o fetch selhal (HTTP 403), žádný konkrétní článek zde necitovat jako ověřený.
- Výrok **„ideas are cheap, execution is everything“** – **nebyl nalezen ověřitelný primární autor/zdroj tohoto konkrétního citátu.** Na slide ho lze použít pouze jako obecně rozšířenou frázi (bez konkrétního přisouzení), ne jako citaci se jménem.

---

## 7. Shrnutí: co je ověřitelné a co je predikce

### Empiricky podložené (s uvedenými limity výše)
1. AI nástroje měřitelně zrychlují psaní **izolovaného, jednoduchého kódu** (GitHub 2022, McKinsey 2023).
2. AI nástroje **zpomalují** zkušené vývojáře na **komplexní práci ve velkých, známých codebase** (METR 2025 – metodicky nejsilnější studie v tomto přehledu).
3. Adopce AI/no-code nástrojů prudce roste a je široce rozšířená (76–84 % dle SO Survey 2024/2025; 80% adopce nových GitHub vývojářů dle Octoverse 2025).
4. AI-generovaný kód je opakovaně měřen jako **méně bezpečný a hůře udržovatelný** (Pearce 2022, Perry/Stanford 2023, Veracode 2025, GitClear 2025) a lidé tento pokles **systematicky podceňují**.
5. Na organizační úrovni roste subjektivní pocit produktivity, ale klesá stabilita a throughput dodávek (DORA 2024) – klasický produktivitní paradox.
6. Údržba historicky tvoří většinu nákladů softwarového životního cyklu (Boehm 1981, Ulziit 2015 via Wikipedia) – ale **chybí aktuální (2021–2026) kvantitativní replikace** tohoto čísla.

### Čistá predikce / nepodloženo daty z okna 2021–2026
- Že „jediné, na čem bude záležet, jsou nápady“ – jde o tvrzení o budoucí struktuře ekonomické hodnoty, které **není a nemůže být** měřeno dnešními daty o produktivitě nebo adopci nástrojů.
- Konkrétní čísla typu „80 % nákladů je integrace“ nebo „87 % projektů nikdy nejde do produkce“ – nenalezen ověřený primární zdroj v okně, nepoužívat jako fakt.
- Gartner odhady počtu opuštěných PoC projektů do 2025 – nebylo možné ověřit (403).

---

## 8. Zdrženlivý verdikt

**Teze je zavádějící ve své absolutní formě, ale obsahuje jádro pravdy, které je třeba přesně ohraničit.**

Je empiricky dobře podloženo, že **psaní prvotního kódu/prototypu se zlevňuje a zrychluje** pro jednoduché, dobře ohraničené úlohy, a že adopce AI/no-code nástrojů je masivní a rostoucí. To je reálný, měřitelný posun.

Není ale podloženo – a dostupné důkazy tomu spíše **odporují** –, že by se tím programování stávalo bezvýznamnou komoditou. Konkrétně:
- Na **komplexní, reálné práci** AI nástroje podle nejmetodicky čistší dostupné studie (METR 2025, RCT) vývojáře **zpomalují**, ne zrychlují.
- Bottleneck se nepřesouvá k „nápadu“, ale k **ověřování, integraci, bezpečnosti a code review** – tedy k jiné, stále hluboce inženýrské činnosti (DORA 2024, Orosz/pragmaticengineer.com, Veracode 2025).
- AI-generovaný kód je opakovaně měřen jako **méně bezpečný a hůře udržovatelný**, což generuje budoucí (dosud nevyčíslené) náklady – komoditizace psaní kódu tedy pravděpodobně *přesouvá*, nikoli *ruší* náklady softwarového inženýrství.
- Historicky (Boehm 1981, Ulziit 2015) stejně jako dnes (DORA, GitClear) je **údržba a posouzení kvality**, ne psaní prvotní verze, dominantní nákladovou položkou – a nic v datech 2021–2026 neukazuje, že by se tento poměr obrátil.

**Doporučená formulace verdiktu pro přednášku:**
„Psaní kódu se komoditizuje – ověřování, zda je to *správný* kód, zatím ne.“

---

## 9. Návrh slidů

**Slide 1 – Teze a její rozklad**
„Programování se stane komoditou; důležité budou jen nápady.“
→ 3 oddělené výroky: (A) psaní je levnější, (B) bottleneck se přesouvá, (C) nápad = jediná hodnota.
Vizuál: tři boxy, (A) a (B) zelenou/oranžovou (podloženo s výhradou), (C) červeně (predikce).

**Slide 2 – Rychlost ano, ale pro co?**
Kontrast GitHub 2022 (+55 % na jednoduchém úkolu) vs. METR 2025 (−19 % na komplexní práci zkušených vývojářů ve velkém repu).
Citát: „Developers believed they were 20 % faster, while they were actually 19 % slower.“ (METR, 2025)

**Slide 3 – Paradox na úrovni organizací**
DORA 2024: +25 % AI adopce → +3,4 % kvalita, ale −7,2 % stabilita, −1,5 % throughput.
Vizuál: dvě šipky opačným směrem.

**Slide 4 – Kam se bottleneck opravdu přesouvá**
Veracode 2025: 45 % AI kódu s bezpečnostní chybou. GitClear: refaktoring 25 %→<10 % (2021→2024).
Orosz/pragmaticengineer.com: „Code review load“ jako nový bottleneck.
Nadpis slidu: „Psaní zlevnilo. Posouzení ne.“

**Slide 5 – Co o tom říkají lidé z oboru**
DHH citát (+ kontext, že i on mluví o přehodnocení architektury, ne o konci inženýrství).
Willison: „LLMs amplify existing expertise.“
Osmani: „Solving problems went cheap while selecting them became scarce.“

**Slide 6 – Verdikt**
„Psaní kódu se komoditizuje. Ověřování, zda je to *správný* kód, zatím ne.“
+ jedna věta o tom, co NENÍ podloženo (predikce C) – transparentnost vůči publiku.

---

## 10. Použitelné české formulace (hotové věty do prezentace/mluveného slova)

- „Teze zní lákavě, ale slučuje tři různé věci: že psaní kódu zlevňuje, že se bottleneck přesouvá, a že na inženýrství už nebude záležet. První dvě jsou doložitelná. Třetí je predikce, ne fakt.“
- „Zkušení vývojáři byli s AI o 19 % pomalejší – a přitom si mysleli, že jsou o pětinu rychlejší. To je přesně ten typ přeceňování, který tezi o komoditizaci živí.“
- „Psaní prvního draftu kódu je dnes levnější. Posouzení, jestli je ten draft bezpečný, udržovatelný a správný, levnější není – a podle dat spíš dráží.“
- „Bottleneck se nepřesunul k nápadu. Přesunul se k code review.“
- „Čím levnější je vygenerovat kód, tím dražší je ho ověřit – a to je přesně opak komoditizace.“
- „Neptejme se, jestli bude programování komoditou. Ptejme se, která konkrétní část programování – psaní, ověřování, údržba – komoditou právě teď reálně je, a která zatím ne.“
- „Nejsilnější dostupná studie (METR, randomizovaná kontrolovaná studie) ukazuje opak toho, co si vývojáři sami o sobě myslí. To by nás mělo vést k opatrnosti i u téhle teze samotné.“

---

## Poznámka k nedohledaným zdrojům (transparentnost)

Následující často citovaná tvrzení **nebyla v tomto výzkumu ověřena** a neměla by být použita bez dalšího ručního dohledání a uvedení zdroje:
- „80 % nákladů softwaru je integrace, ne psaní kódu“ (žádný primární zdroj nalezen).
- „87 % data science projektů se nikdy nedostane do produkce“ (zdroj bez metodiky, mimo okno).
- Gartner „30 % generativních AI PoC opuštěno do 2025“ (fetch 403, neověřeno).
- Stripe „33 % času na technický dluh“ (PDF nebylo strojově čitelné, neověřeno v tomto běhu).
- Sommerville konkrétní procento nákladů na údržbu (zdroj nedostupný).
- OutSystems/Mendix konkrétní adopční čísla (nedohledán primární report).
- Citát „ideas are cheap, execution is everything“ s konkrétním autorem (nedohledán).

