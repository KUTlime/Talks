# Teze 08: „Open source díky AI zažívá renesanci“ (2021 – 24. 10. 2026)

Nezávislé ověření pro MaiDay 2026. **Stav ověření: 24. října 2026.** Kvantitativně rozlišuje **objem** (nové repozitáře, PR, kontributoři — primárně dle GitHub Octoverse) od **kvality a udržitelnosti** (merge-rate, zátěž maintainerů, bus factor — dle akademických studií a case studies konkrétních projektů). Cílem je oddělit tvrzení komerčního dodavatele nástroje (GitHub/Microsoft) od nezávisle ověřitelných dat.

## Verdikt

**Teze je částečně podložená v rovině objemu/kvantity, nikoli jako prokázaná příčinná souvislost s AI; v rovině kvality a udržitelnosti zůstává otevřená — záleží na tom, co slovem „renesance“ myslíme.** Počet repozitářů, kontributorů, pull requestů a projektů s generativní AI tematikou výrazně vzrostl podle vlastních dat GitHubu (Octoverse 2023–2025): **630 milionů** projektů celkem, **395 milionů** veřejných repozitářů v roce 2025 (+72 mil. meziročně), **518,7 milionu** mergnutých PR za rok (+29 % meziročně), **36+ milionů** nových účtů vývojářů za rok a **693 867** nových veřejných repozitářů využívajících LLM SDK za posledních 12 měsíců (+178 % meziročně). **Veřejný repozitář není automaticky aktivní OSS projekt a růst GitHubu nelze celý připsat AI.**

Pokud ale „renesance“ znamená zlepšení *zdraví* a *udržitelnosti* projektů — méně vyhořelých maintainerů, vyšší podíl kvalitních příspěvků, lepší dlouhodobou péči —, **takové plošné zlepšení doloženo není**. Akademická studie na 294 repozitářích a 2+ milionech PR/issues zjistila, že v roce 2025 objem PR rostl, ale **míra jejich mergování klesala**, s poklesem o **18,18 %** u jednorázových přispěvatelů oproti kontrafaktuálnímu trendu. Jde o omezený vzorek, nikoli o celkové zdraví OSS. Zdokumentovaný případ curl (2019–2026) ukazuje, že podíl reálných bezpečnostních nálezů v bug bounty reportech klesl z „nad 15 %“ na „pod 5 %“ v roce 2025; placený bug bounty program byl k lednu 2026 zrušen. Následný vývoj je nuancovaný: po změně procesu se kvalita vrátila na 15–16 %, přičemž objem práce maintainerů zůstává vysoký. Jeden projekt a jeden kanál hlášení nereprezentují všechny OSS příspěvky.

**Shrnutí v jedné větě:** Aktivita na GitHubu a počet projektů s AI tematikou rostou, ale **není prokázáno, že celkový růst způsobila AI ani že se zlepšila kvalita a udržitelnost open source**; vybrané studie a projekty dokládají i tlak na maintainery.

## (A) Kvantita — GitHub Octoverse (primární data dodavatele nástroje)

| Metrika | Rok reportu | Hodnota | Meziroční změna | Zdroj |
|---|---|---|---|---|
| Celkový počet projektů na GitHubu | 2024 | 518 milionů | +25 % | [Octoverse 2024](https://github.blog/news-insights/octoverse/octoverse-2024/) |
| Kontribuce do veřejných/OSS projektů | 2024 | ~1 miliarda | — | Octoverse 2024 |
| Veřejné generative-AI projekty | 2024 | 137 000 | +98 % (počet projektů) | Octoverse 2024 |
| Kontribuce do generative-AI projektů | 2024 | — | +59 % | Octoverse 2024 |
| Maintaineři/učitelé/studenti na Copilot free-access | 2024 | >1 milion | +100 % | Octoverse 2024 |
| Celkový počet vývojářů na GitHubu | 2025 | 180+ milionů | — | [Octoverse 2025](https://github.blog/news-insights/octoverse/octoverse-a-new-developer-joins-github-every-second-as-ai-leads-typescript-to-1/) |
| Noví vývojáři za rok | 2025 | 36+ milionů | +23 % | Octoverse 2025 |
| Celkový počet projektů | 2025 | 630 milionů | — | Octoverse 2025 |
| Veřejné/OSS repozitáře | 2025 | 395 milionů | +72 mil. (absolutně) | Octoverse 2025 |
| Mergnuté PR celkem za rok | 2025 | 518,7 milionu | +29 % | Octoverse 2025 |
| Mergnuté PR/měsíc (průměr) | 2025 | 43,2 milionu | +23 % | Octoverse 2025 |
| Pushnuté commity za rok | 2025 | ~1 miliarda | +25,1 % | Octoverse 2025 |
| AI projekty celkem | 2025 | 4,3 milionu | — | Octoverse 2025 |
| Veřejné repozitáře používající LLM SDK | 2025 | >1,1 milionu | — | Octoverse 2025 |
| Z toho vzniklé za posledních 12 měsíců | srpen 2025 vs. srpen 2024 | 693 867 | +178 % | Octoverse 2025 |
| Noví vývojáři používající Copilot v 1. týdnu | 2025 | 80 % | — | Octoverse 2025 |

Doplňkově **Octoverse 2023** ([github.blog, listopad 2023](https://github.blog/news-insights/research/the-state-of-open-source-and-ai/)): 2023 byl rokem s **nejvyšším počtem prvo-přispěvatelů do OSS** v historii GitHubu a generative-AI projekty poprvé vstoupily do TOP 10 nejpopulárnějších OSS projektů podle počtu kontributorů; 92 % vývojářů dle GitHubu používá nebo zkouší AI coding nástroje.

**Limity metodiky (platí pro celou sekci A):** Jde výhradně o **interní, nezávisle neauditovaná data komerčního subjektu**, který Copilot přímo prodává a má zjevný obchodní zájem prezentovat AI pozitivně. Metrika „repozitář“ nerozlišuje aktivní udržovaný projekt od prázdného forku, tutoriálového nebo opuštěného repozitáře. Metrika „kontribuce“/„PR“ nerozlišuje triviální (např. typo fix) od substantivní změny a nerozlišuje lidské PR od botem generovaných. GitHub sám v Octoverse 2024 explicitně tvrdí: *„But we aren't seeing signs that AI has hurt open source with low-quality contributions“* — to je ovšem tvrzení prodejce nástroje bez uvedené metodiky měření „poškození kvalitou“, v přímém rozporu s nezávislou akademickou studií o cca 20 měsíců později (viz sekce C).

## (B) OSSF / Census / Scorecard — mezera v ověření

Pokus o přímé ověření OpenSSF Census II/III (Linux Foundation Research) a OSSF Scorecard agregovaných dat **se nezdařil** — `census.openssf.org` byl při tomto ověření nedostupný, `openssf.org/blog` vrátil nečitelný šablonový obsah a přímé URL k PDF reportu vrátilo 404. Arxiv dotaz na „OSSF Scorecard“ nevrátil žádnou studii citující tuto metriku explicitně pod tímto názvem. **Toto je otevřená mezera** — doporučený další krok je zkusit Wayback Machine na `census.openssf.org` a `linuxfoundation.org/research/census-iii`, nebo přímo repozitář `ossf/scorecard` na GitHubu. Bez těchto dat nelze k tezi připojit nezávislou metriku „bus factor“ nebo bezpečnostního zdraví kritických závislostí v daném období.

## (C) AI PR acceptance rate a zátěž recenzentů — akademické studie

**1) Watanabe, Li, Kashiwa, Reid, Iida, Hassan (2025/2026), „On the Use of Agentic Coding: An Empirical Study of Pull Requests on GitHub“**, [arXiv:2509.14745](https://arxiv.org/abs/2509.14745) (v1: 18. 9. 2025, v3: 9. 2. 2026)
- Vzorek: **567 PR** generovaných nástrojem Claude Code napříč **157 open-source projekty**.
- **83,8 %** agent-asistovaných PR bylo nakonec přijato a mergnuto maintainery.
- Z mergnutých PR: **54,9 %** integrováno beze změny, **45,1 %** vyžadovalo dodatečnou lidskou úpravu (nejčastěji bug fixy, dokumentace, dodržení project-specific konvencí).
- **Limit:** malý vzorek (567 PR), jediný nástroj (Claude Code), selection bias — zahrnuje jen PR, která už byla skutečně podána (ne zahozené pokusy před odesláním).

**2) Baltes, Cheong, Treude (2026), „An Endless Stream of AI Slop: How Developers Discuss the Burden of AI-Assisted Software Development“**, [arXiv:2603.27249](https://arxiv.org/abs/2603.27249) (v1: 28. 3. 2026, v4: 28. 8. 2026)
- Kvalitativní analýza **1 154 příspěvků** z Redditu a Hacker News.
- Tři tematické klastry: *Review Friction* (zátěž recenzentů, eroze důvěry), *Quality Degradation* (poškození kódu i kompetencí vývojářů), *Forces and Consequences* (systémové pobídky k AI slopu).
- Rámuje problém jako „tragedy of the commons“: individuální produktivita jednoho přispěvatele externalizuje náklad recenze na komunitu/maintainery.
- **Limit:** čistě kvalitativní studie, žádná kvantifikace; vzorek ze self-selected online diskuzí, nikoli reprezentativní průzkum.

**3) Afroz, Miller, Menezes, Gilmour, Sarma, Feng (2026), „AI Slop is DDoSing Open Source: Understanding the Impact of AI-Generated Contributions on Open Source Sustainability“**, [arXiv:2607.04003](https://arxiv.org/abs/2607.04003) (4. 7. 2026) — **nejsilnější kvantitativní protidůkaz k tezi o „renesanci kvality“**
- Smíšená metoda: kvalitativní analýza (Reddit, OSS mentor mailing listy, blogy) → 6 témat/hypotéz, následně kvantitativní ověření pomocí **Bayesian Structural Time Series** napříč **294 repozitáři a 2+ miliony pull requestů a issues**.
- **Klíčový nález:** objem PR v roce 2025 rostl, ale **míra jejich mergování klesala**; **jednorázoví přispěvatelé** zaznamenali pokles merge-rate PR o **18,18 %** vůči kontrafaktuálnímu trendu.
- Identifikováno **11 remediačních strategií** (preservative/adaptive/transformative), validováno průzkumem **229 OSS praktiků**.
- Závěr autorů: jev je „sustainability trap“ — komunity volí krátkodobě levné obranné strategie (např. přísnější brány pro nové přispěvatele), které dlouhodobě podrývají otevřenost OSS.
- **Limit:** vzorek 294 repozitářů není nahodilý a pravděpodobně je vychýlen směrem k projektům s již pozorovaným problémem; BSTS kontrafaktuální modelování má vlastní metodologické předpoklady, které nebyly v tomto ověření prověřeny v plném textu PDF.

## (D) Case study maintainer burden: curl / Daniel Stenberg (2019–2026, nejpřesněji datovaná řada)

| Datum | Zdroj | Klíčové číslo |
|---|---|---|
| 2. 1. 2024 | [daniel.haxx.se](https://daniel.haxx.se/blog/2024/01/02/the-i-in-llm-stands-for-intelligence/) | Bug bounty od 2019: >70 000 USD vyplaceno, 415 reportů, 64 potvrzených vulnerabilit, 77 „informative“ → 66 % reportů nebylo ani vulnerabilita, ani běžný bug |
| 14. 7. 2025 | [daniel.haxx.se](https://daniel.haxx.se/blog/2025/07/14/death-by-a-thousand-slops/) | ~20 % všech submission v roce 2025 = „AI slop“; celkem 81 potvrzených vulnerabilit, >90 000 USD vyplaceno; security tým 7 lidí, každý report zabírá 3–4 lidi × 30 min–3 h |
| 26. 1. 2026 | [daniel.haxx.se](https://daniel.haxx.se/blog/2026/01/26/the-end-of-the-curl-bug-bounty/) | **Bug bounty program oficiálně ukončen k 31. 1. 2026.** Finální skóre 2019–2026: 87 potvrzených vulnerabilit, >100 000 USD. Confirmed-rate „sever od 15 %“ v dřívějších letech → **pod 5 %** od roku 2025 |
| 22. 4. 2026 | [daniel.haxx.se](https://daniel.haxx.se/blog/2026/04/22/high-quality-chaos/) | Po návratu na HackerOne (3/2026) frekvence reportů ~2× vyšší než 2025, ale **confirmed-rate se vrátil na 15–16 %** (pre-AI úroveň); projekce až ~50 CVE za curl v roce 2026 (rekord); citát: „This avalanche is going to make maintainer overload even worse“ |

Ověřeno přímým čtením zdrojového citátu z 26. 1. 2026: *„Previous years we have had a rate of somewhere north of 15% of the submissions ending up confirmed vulnerabilities. Starting 2025, the confirmed-rate plummeted to below 5%.“* Nová politika projektu (`curl.se/dev/vuln-disclosure.html`, nedatováno) explicitně žádá: *„Do not lazily paste massive, AI-generated explanations.“*

Neformální Mastodon anketa zmíněná v postu z dubna 2026 potvrzuje obdobný trend u dalších projektů (Apache httpd, BIND, Django, Firefox, git, glibc, Linux kernel, OpenLDAP, Python, Wireshark aj.) — **anekdotické, self-selected, nereprezentativní**, ale nasvědčuje tomu, že curl není izolovaný případ.

**Metodologický limit:** jde o data **jednoho projektu**, self-reportovaná samotným maintainerem, nikoli nezávisle auditovaná. Jejich hodnota je v přesnosti a délce časové řady (2019–2026) a v tom, že ukazují **proměnlivost v čase** — problém kvality reportů se v dubnu 2026 částečně zlepšil, zatímco objemová zátěž dál roste.

## (E) Protiargumenty a pozitivní případy

1. **GitHub Octoverse 2024** sám tvrdí, že nevidí důkazy o poškození OSS nekvalitními příspěvky — ale jde o tvrzení prodejce nástroje bez uvedené metodiky a v přímém rozporu s arXiv 2607.04003 publikovanou o necelé 2 roky později.
2. **arXiv 2509.14745** (Claude Code PR studie) nabízí nuancovaně pozitivní čtení: 83,8 % acceptance rate je relativně vysoká — AI-asistované PR *jsou* z větší části akceptovatelné, byť polovina potřebuje lidskou úpravu. To je argument pro „funguje to s lidským dohledem“, ne pro čistou autonomní renesanci.
3. **Curl, duben 2026** je sám o sobě nuancovaný protipříklad k jednoduché tezi „AI jen škodí“: po adaptivních opatřeních (konec bounty, změna platformy, explicitní pravidla proti AI-slopu) se confirmed-rate vrátil na pre-AI úroveň (15–16 %) a objem *reálných* nálezů bezpečnostních chyb prudce vzrostl — což je samo o sobě pozitivní bezpečnostní výsledek, i když zvyšuje pracovní zátěž.
4. **Nebyla nalezena** přímá kvantitativní studie o vyšší dlouhodobé retenci nových přispěvatelů díky AI nástrojům (např. zda first-time kontributoři používající Copilot zůstávají v projektech déle) — to zůstává otevřenou mezerou ve prospěch i proti tezi.
5. **Nižší bariéra vstupu** je věrohodně podpořena objemovými daty (80 % nových vývojářů používá Copilot v prvním týdnu, Octoverse 2025) i tím, že 2023 byl rokem rekordního počtu prvo-přispěvatelů (Octoverse 2023) — ale ani jedno z toho neprokazuje, že tito noví přispěvatelé produkují mergovatelné, udržitelné příspěvky ve vyšší míře než dřív; studie C3 naznačuje opak u jednorázových přispěvatelů.

## Limity tohoto ověření

- **OSSF Census II/III a Scorecard data se nepodařilo přímo ověřit** (viz sekce B) — to je nejvýznamnější mezera, protože jde o jediný zdroj v zadání zaměřený přímo na „kvalitně udržované projekty“ nezávisle na GitHubu samotném.
- Sekce D je postavena na **jediném, byť mimořádně podrobně zdokumentovaném projektu** (curl). Zobecnění na celý ekosystém OSS je podpořeno jen neformální, nereprezentativní anketou, ne systematickým průzkumem napříč projekty.
- Akademické studie v sekci C jsou **recentní (přelom 2025/2026)**, čerpají z málo set replikací nezávislými týmy; arXiv preprinty v době tohoto ověření z části ještě neprošly recenzovaným publikačním řízením (status peer review nebyl u všech tří ověřen).
- Octoverse data (sekce A) jsou interní a **nelze je nezávisle zrekonstruovat** z veřejně dostupných GitHub API agregací v rozsahu použitém GitHubem; přesná definice „veřejný repozitář“, „kontribuce“ a „generative-AI projekt“ v metodice GitHubu nebyla v tomto ověření dohledána v detailu (chybí metodický dodatek k Octoverse reportům).
- Nebyly dohledány **Tidelift State of the OSS Maintainer** reporty 2024/2025 ani data Linux Foundation o maintainer burnoutu mimo case study curl — vyhledávací nástroje (Google/Bing/DuckDuckGo) byly při tomto ověření nedostupné přes `web_fetch`, veškerý výzkum šel přes přímé URL a arXiv API.
- Časové ohraničení **2021–24. 10. 2026**: nejnovější datový bod (duben 2026, curl) je již 6 měsíců starý vůči datu ověření; vývoj mezi dubnem a říjnem 2026 nebyl samostatně dohledán.

## Použitelné slidy

**Slide A — Verdikt jednou větou**
> „Aktivita na GitHubu výrazně roste: 630 milionů projektů celkem a 519 milionů mergnutých PR za rok 2025 (Octoverse). To ale není samo o sobě renesance open source **díky AI**: celkovou příčinu ani lepší kvalitu a udržitelnost zatím neznáme; vybrané studie a projekty ukazují i zvýšené náklady review.“

**Slide B — Dvě čísla, jeden graf**
> GitHub 2025: +178 % meziročně nových repozitářů s LLM SDK podle jeho metodiky. Akademická studie 2026 (294 repozitářů, 2M+ PR/issues): merge-rate u jednorázových přispěvatelů −18,18 % oproti odhadovanému trendu. **Odlišné soubory a metriky: růst AI projektů není důkazem kvalitnějších OSS příspěvků.**

**Slide C — Curl jako laboratoř v reálném čase**
> 2024: confirmed-rate bug bounty „nad 15 %“. 2025: propad pod 5 % → program zrušen (leden 2026). Duben 2026: po změně procesu návrat na 15–16 %, ale **dvojnásobný objem** reportů — maintainer: „ještě větší přetížení“.

**Slide D — Kdo říká co a proč**
> GitHub (prodejce Copilotu): „nevidíme důkazy poškození kvalitou“. Nezávislá studie o 20 měsíců později (294 repo): měřitelný pokles merge-rate. Při citování GitHub dat vždy uvést, že jde o data prodejce nástroje.

**Slide E — Co říct na dotaz z publika**
> „Je to teda renesance, nebo krize?“ → „Obojí najednou: enormní nárůst objemu a participace je ověřený fakt. Zhoršená míra přijetí a zátěž recenzentů u nejlépe zdokumentovaných případů je taky ověřený fakt. Nejde o rozpor — jde o to, že objem a kvalita se v datech 2025–2026 rozešly.“

## Ověřené přímé odkazy

- GitHub, Octoverse 2023 — The State of Open Source and AI (listopad 2023): https://github.blog/news-insights/research/the-state-of-open-source-and-ai/
- GitHub, Octoverse 2024 (říjen 2024): https://github.blog/news-insights/octoverse/octoverse-2024/
- GitHub, Octoverse 2025 — A new developer joins GitHub every second (říjen 2025): https://github.blog/news-insights/octoverse/octoverse-a-new-developer-joins-github-every-second-as-ai-leads-typescript-to-1/
- Watanabe et al., „On the Use of Agentic Coding: An Empirical Study of Pull Requests on GitHub“, arXiv:2509.14745: https://arxiv.org/abs/2509.14745
- Baltes, Cheong, Treude, „An Endless Stream of AI Slop“, arXiv:2603.27249: https://arxiv.org/abs/2603.27249
- Afroz et al., „AI Slop is DDoSing Open Source“, arXiv:2607.04003 (4. 7. 2026): https://arxiv.org/abs/2607.04003
- Daniel Stenberg, „The I in LLM stands for intelligence“ (2. 1. 2024): https://daniel.haxx.se/blog/2024/01/02/the-i-in-llm-stands-for-intelligence/
- Daniel Stenberg, „Death by a thousand slops“ (14. 7. 2025): https://daniel.haxx.se/blog/2025/07/14/death-by-a-thousand-slops/
- Daniel Stenberg, „The end of the curl bug bounty“ (26. 1. 2026): https://daniel.haxx.se/blog/2026/01/26/the-end-of-the-curl-bug-bounty/
- Daniel Stenberg, „High quality chaos“ (22. 4. 2026): https://daniel.haxx.se/blog/2026/04/22/high-quality-chaos/
- curl, Vulnerability Disclosure Policy (nedatováno, aktuální): https://curl.se/dev/vuln-disclosure.html

## Vztah k ostatním tezím

Tato teze se **doplňuje s tezí 10** ([teze-10-vypadky-kvuli-ai.md](./teze-10-vypadky-kvuli-ai.md)): tam ověřená absence přímé kauzality mezi AI-generovaným kódem a velkými infrastrukturními výpadky je jiná otázka než zde řešená zátěž OSS maintainerů/recenzentů — jde o odlišné kauzální řetězce (provozní výpadek vs. udržitelnost komunitní péče), které by neměly být v prezentaci směšovány.
