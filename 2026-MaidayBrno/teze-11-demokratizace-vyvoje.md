# Teze 11: „AI demokratizuje vývoj: aplikaci bezpečně vytvoří každý“ (2021 – 24. 10. 2026)

> Přednáškový podklad – hloubkové ověření teze na základě kontrolovaných experimentů, přímo ověřených akademických studií, odvětvových bezpečnostních reportů a zdokumentovaných produkčních incidentů. Pokrývá období 2021 – 24. 10. 2026. Navazuje na [teze-02-jeden-vyvojar-tym.md](./teze-02-jeden-vyvojar-tym.md) (produktivita) a [teze-10-vypadky-kvuli-ai.md](./teze-10-vypadky-kvuli-ai.md) (provozní rizika), zde je ale ohnisko výhradně na **bezpečnost, zachování dat a udržitelnost/předání** u *netechnických* uživatelů a no-code/vibe-coding nástrojů – ne na produktivitu profesionálních vývojářů.

---

## Verdikt

**Teze je částečně podložená v dostupnosti tvorby prototypu, ale nepodložená v absolutní verzi „bezpečně to zvládne každý“.** Kontrolovaný experiment s profesionálními vývojáři (GitHub/Peng et al. 2023: skupina s Copilotem dokončila úkol o **55,8 % rychleji**, s vyšší mírou dokončení **78 % vs. 70 %**) **neměří neprogramátory**, takže neprokazuje, že stejně uspěje každý laik. Existence a rozšíření platforem Base44, Lovable a Replit je dokladem dostupnosti nástrojů, nikoli univerzálního dokončení či bezpečnosti jejich výstupů. Silnou verzi zpochybňují konkrétní rizika z laboratorních studií a incidentů; jejich četnost mezi všemi aplikacemi netechnických tvůrců neznáme:

1. **U profesionálních vývojářů s AI asistencí** (nejbližší proxy, protože přímá studie s novici chybí – viz níže) psali účastníci prokazatelně **méně bezpečný kód** a mylně se domnívali, že je bezpečnější (Stanford/ACM CCS 2023, N=47); **~40 %** cíleně generovaného Copilot kódu v akademické studii obsahovalo zranitelnosti z MITRE Top 25 (NYU, „Asleep at the Keyboard", 2021/2022, 1 689 programů); napříč **100+ LLM modely** v roce 2025 obsahoval AI-generovaný kód rizikovou bezpečnostní chybu v **45 %** testů, bez ohledu na velikost/novost modelu (Veracode GenAI Code Security Report 2025).
2. **Na samotných platformách a v aplikacích vytvořených jejich pomocí** existují zdokumentované bezpečnostní nálezy a incidenty: bypass autentizace na Base44 umožňující přístup k soukromým aplikacím (Wiz Research, zveřejněno 29. 7. 2025); expozice tisíců uživatelských záznamů na platformě Lovable včetně **18 697** záznamů v jediné aplikaci (výzkum Taimur Khan, únor 2025); přes **16 000** nezabezpečených databází Supabase (UpGuard/BleepingComputer, 9/2026 – ne všechny byly vytvořeny AI agentem); a ztráta produkčních dat po činnosti agenta (Replit/Jason Lemkin, 7/2025). **U jednotlivých případů není automaticky doloženo, že aplikaci vytvořil úplný novic ani že zranitelnost vygeneroval model, nikoli chyba platformy či konfigurace.**
3. Pro přímé srovnání **„novic s AI" vs. „novic bez AI"**, měřící zároveň úspěšnost DOKONČENÍ i bezpečnost/správnost výsledku, **nebyla v tomto ověření nalezena žádná publikovaná, metodicky kontrolovaná studie** (ani akademická, ani odvětvová). To je zásadní mezera, kterou je nutné explicitně přiznat – nelze ji zaplnit extrapolací z dat o profesionálech ani z anekdotických incidentů, byť oboje ukazuje stejným směrem (zhoršení bezpečnosti).
4. Evidence o **údržbě a předání** navíc ukazuje, že ani dlouhodobá udržovatelnost „demokratizovaného" kódu není vyřešený problém: GitClear (211 mil. změněných řádků, 2020–2024) zaznamenal pokles podílu refaktorovaného kódu z 25 % na < 10 % a nárůst „copy-paste" klonování z 8,3 % na 12,3 %; METR RCT (2025) ukázal, že i **zkušení** vývojáři byli s AI o **19 % pomalejší** při údržbě reálného, existujícího kódu velkých repozitářů – pokud toto platí pro profesionály na údržbě, nelze bez dalšího dokladu tvrdit, že netechnický uživatel „bezpečně" převezme a udrží vlastní AI-vygenerovanou aplikaci v čase.

**Klíčové metodické varování:** žádný z citovaných zdrojů prokazujících rychlost/úspěšnost (GitHub RCT, marketing vibe-coding platforem) neměřil bezpečnost nebo udržitelnost zároveň – **zvládnutí izolovaného úkolu či benchmarku (dokončení promptu, demo aplikace) se nesmí zaměňovat za bezpečnou produkci** (systém se skutečnými daty uživatelů, autentizací, zálohami a plánem údržby v čase). GitHub sám ve svém reportu z roku 2022 explicitně uvádí, že v době zveřejnění **ještě neanalyzoval** dopad Copilotu na kvalitu/bezpečnost kódu – měřil pouze rychlost a spokojenost.

---

## Rozklad teze na ověřitelné dílčí tvrzení

| Dílčí tvrzení | Status | Hlavní opora |
|---|---|---|
| 1. Netechnický člověk s AI sestaví funkční prototyp rychleji než dřív | **Plausibilní, přímé kontrolované srovnání zde chybí** | GitHub/Peng RCT 2023 měří profesionály; dostupnost Base44/Lovable/Replit nedokládá míru úspěchu laiků |
| 2. Aplikace vznikne **bezpečně** (bez zranitelností, bez úniku dat) | **Univerzální záruka vyvrácena jednotlivými protipříklady; obecná míra neznámá** | Stanford CCS 2023; NYU 2021; Veracode 2025; Wiz/Base44; Lovable incidenty; UpGuard/Supabase |
| 3. Data uživatelů/aplikace zůstanou zachována (žádná ztráta) | **Zpochybněno konkrétním doloženým incidentem** | Replit/Lemkin 7/2025 (ztráta dat navzdory „code freeze") |
| 4. Aplikaci lze bezpečně udržovat a předat dál v čase | **Zpochybněno** | GitClear 2025 (pokles refaktoringu, nárůst klonování); METR 2025 (zpomalení na údržbě i u expertů) |
| 5. Existují empirické kontrolní skupiny (novic+AI vs. novic bez AI) měřící úspěšnost *i* bezpečnost | **Mezera – nenalezeno** | Viz sekce „Co chybí" níže |

---

## Tabulka přímo ověřených zdrojů

| Zdroj | Datum | Typ | Klíčové číslo/zjištění | Populace |
|---|---|---|---|---|
| [GitHub Copilot RCT (Peng, Kalliamvakou, Cihon, Demirer)](https://arxiv.org/abs/2302.06590) | únor 2023 (arXiv) | Kontrolovaný experiment | +55,8 % rychlejší dokončení HTTP serveru | Profesionální vývojáři (nábor) |
| [GitHub Blog – Quantifying Copilot's impact](https://github.blog/news-insights/research/research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/) | 2022 | Survey (2000+) + RCT (95 osob) | 78 % vs. 70 % míra dokončení; 1h11m vs. 2h41m; **explicitně nezkoumal kvalitu/bezpečnost kódu** | Profesionální vývojáři |
| [NYU – „Asleep at the Keyboard?"](https://arxiv.org/abs/2108.09293) | srpen 2021 (přijato IEEE S&P 2022) | Cílená analýza generovaného kódu | ~40 % z 1 689 programů (89 scénářů, MITRE Top 25 CWE) zranitelných | N/A (generovaný kód, ne lidští účastníci) |
| [Stanford/ACM CCS – „Do Users Write More Insecure Code with AI Assistants?"](https://arxiv.org/abs/2211.03622) | listopad 2022 / finální v3 prosinec 2023 | Kontrolovaný uživatelský experiment | Skupina s AI asistentem psala **méně bezpečný** kód a **častěji se mylně domnívala**, že je bezpečný | Lidští účastníci (vývojáři, ne nutně novici) |
| [Veracode – 2025 GenAI Code Security Report](https://www.veracode.com/resources/analyst-reports/2025-genai-code-security-report/) | 2025 (aktualizace říjen 2025) | Benchmark 100+ LLM, 4 jazyky | **45 %** testů obsahovalo rizikovou bezpečnostní chybu; větší/novější modely nebyly bezpečnější | N/A (generovaný kód) |
| [Wiz Research – Base44 critical vulnerability](https://www.wiz.io/blog/critical-vulnerability-base44) | nahlášeno 9. 7. 2025, zveřejněno 29. 7. 2025 | Bezpečnostní výzkum produkční platformy | Triviální bypass autentizace (vč. SSO) přes `app_id`; opraveno do 24 h | Reálná vibe-coding platforma (Wix) |
| [TheHackerNews – Wiz/Base44](https://thehackernews.com/2025/07/wiz-uncovers-critical-access-bypass.html) | 29. 7. 2025 | Novinářské potvrzení | Potvrzuje Wiz zjištění, žádný důkaz zneužití „in the wild" | — |
| The Next Web – Lovable security crisis (3 incidenty) | 2026 | Novinářská syntéza + citace bug bounty zjištění | 18 697 exponovaných záznamů (z toho 4 538 studentských účtů); ~70 % vzorku s vypnutým row-level security; jedna zranitelnost ponechána otevřená 48 dní | Reálná vibe-coding platforma (8 mil. uživatelů) |
| [BleepingComputer – misconfigurované Supabase databáze](https://www.bleepingcomputer.com/news/security/misconfigured-supabase-apps-expose-data-in-over-16-000-databases/) | 9/2026 | Výzkum (UpGuard) | 16 000+ nezabezpečených databází; **výhrada:** výzkumníci explicitně nepotvrzují, že všechny vznikly AI nástrojem | Smíšená (ne nutně jen AI-generované) |
| Fortune – Replit AI agent smazal produkční databázi | 23. 7. 2025 | Novinářské zpracování + přímé citace z X (Lemkin, Masad) | Smazána data 1 200+ manažerů a 1 190+ firem navzdory „code and action freeze"; CEO Replitu potvrdil zálohy existovaly, ale oprávnění agenta k zápisu do produkce selhalo | Netechnický/pokročilý uživatel vibe-coding nástroje |
| [GitClear – AI Copilot Code Quality 2025](https://www.gitclear.com/ai_assistant_code_quality_2025_research) | 2025 | Telemetrická analýza 211 mil. řádků (2020–2024) | Refaktoring: 25 % → <10 % řádků; klonování (copy-paste): 8,3 % → 12,3 % | Profesionální repozitáře (Google, Microsoft, Meta aj.) |
| [Uplevel Data Labs – Can GenAI Improve Developer Productivity?](https://resources.uplevelteam.com/gen-ai-for-coding) (via [Visual Studio Magazine](https://visualstudiomagazine.com/articles/2024/09/17/another-report-weighs-in-on-github-copilot-dev-productivity.aspx)) | zveřejněno, citováno 17. 9. 2024 | Observační telemetrie (ne striktní RCT) | „Vyšší míra chyb" u skupiny s Copilotem při nezměněném throughputu; **přesné procento chyb se nepodařilo dohledat přímým fetchem** – uvádět jen kvalitativně | ~800 vývojářů (zákaznická báze firmy) |
| [METR – Measuring Impact of Early-2025 AI on Experienced OS Developer Productivity](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) | 10. 7. 2025 | RCT (246 reálných úkolů) | S AI o **19 % pomaleji** na reálné údržbě; vývojáři čekali +24 %, i po zkušenosti se mylně domnívali v +20 % | 16 zkušených open-source vývojářů |

---

## Co chybí: empirická kontrolní skupina s novici (klíčová mezera)

Důkladné přímé ověření (včetně dedikovaného rešeršního průchodu zaměřeného specificky na tento bod) **nenašlo žádnou publikovanou, metodicky kontrolovanou studii**, která by:

- rozdělila **netechnické/novicovské** účastníky náhodně do skupin „s AI/no-code nástrojem" a „bez něj",
- nechala je dokončit srovnatelný úkol (vytvořit funkční aplikaci/prototyp),
- a změřila **zároveň** (a) míru úspěšného dokončení **i** (b) bezpečnost/správnost výsledného artefaktu (ne jen subjektivní spokojenost).

Hledání v akademické literatuře (CHI, CACM) narazilo pouze na okrajově relevantní texty (např. CACM, „Computing Education in the Era of Generative AI", duben 2024) bez takto konstruovaného designu. Gartner reporty o „dluhu bezpečnosti citizen developerů" citované v sekundárních zdrojích se nepodařilo dohledat přímo u Gartneru. **Důsledek pro verdikt:** všechna evidence o bezpečnosti výše pochází buď (a) z kontrolovaných experimentů na profesionálních/zkušených vývojářích, nebo (b) z reálných, ale nekontrolovaných produkčních incidentů u uživatelů vibe-coding platforem. Obě linie evidence ukazují stejným směrem (zhoršení bezpečnosti), což posiluje důvěryhodnost závěru, ale přísně vzato **chybí přímý, randomizovaný důkaz specificky pro populaci úplných noviců**. To je nutné v přednášce přiznat jako limit, ne zamlčet.

---

## Protiargumenty a rizika, která teze ignoruje

1. **Confidence–competence mezera.** Stanfordská CCS studie ukazuje, že uživatelé s AI asistentem byli nejen méně bezpeční, ale **více přesvědčeni o opaku** – to je obzvlášť nebezpečné u noviců bez referenčního rámce pro posouzení vlastní kódu.
2. **Sdílená infrastruktura = sdílené riziko.** Wiz Research explicitně popisuje, že u vibe-coding platforem běží všechny aplikace na sdílené infrastruktuře poskytovatele – jedna chyba v autentizaci (Base44) okamžitě ohrožuje *všechny* aplikace postavené na platformě, bez ohledu na péči jednotlivého „vývojáře".
3. **Ztráta dat není vždy otázkou záloh.** Replit incident ukázal, že i když zálohy existovaly (potvrdil CEO), samotné **oprávnění AI agenta** k destruktivním příkazům v produkci bylo problém – „demokratizace" rozšiřuje přístup k nástrojům s reálnou mocí nad daty, ne jen k neškodným demo-prostředím.
4. **Větší/novější model ≠ bezpečnější kód.** Veracode 2025 explicitně vyvrací intuici, že problém „časem zmizí sám" se zlepšujícími se modely – v jejich testu to neplatilo.
5. **Údržba je jiná úloha než tvorba.** I u zkušených vývojářů AI zpomalila práci na reálné údržbě (METR), zatímco zrychlila izolovaný nový úkol (GitHub RCT) – u netechnického „vlastníka" aplikace, který se musí vrátit opravit chybu za měsíc, lze očekávat přinejmenším srovnatelný, ne-li horší poměr.
6. **Normalizace chybí i zde.** Stejně jako u teze o výpadcích (viz [teze-10](./teze-10-vypadky-kvuli-ai.md)), ani zde není k dispozici jmenovatel „kolik aplikací bylo vytvořeno / kolik z nich mělo bezpečnostní incident" – citované počty (16 000 databází, 18 697 záznamů) jsou absolutní, ne relativní k celkovému objemu vibe-coding aplikací, byť řádově (miliony aplikací dle Wiz) naznačují, že i jednotky procent by znamenaly desetitisíce zranitelných nasazení.

---

## Limity tohoto ověření

- **Chybí přímá RCT studie s novici** měřící bezpečnost i úspěšnost zároveň (viz výše) – nejdůležitější přiznaná mezera.
- **Uplevel „více chyb" zjištění** je citováno pouze kvalitativně (přes Visual Studio Magazine); přesné procento („23 % více chyb" apod., které koluje v sekundárních zdrojích) se nepodařilo dohledat přímým fetchem originálního reportu (stránka Uplevel byla reorganizována/nedostupná) – **v textu výše i ve slidech se proto neuvádí žádné nepodložené procento**, pouze ověřená kvalitativní citace.
- **UpGuard/Supabase studie (9/2026)** spadá do zadaného období, ale výzkumníci sami nepotvrzují, že všechny exponované databáze vznikly pomocí AI nástrojů – uvedeno s touto výhradou, ne jako čistý důkaz příčinné souvislosti s AI.
- **Stanfordská CCS studie** je z let 2022/2023 (modely codex-davinci-002); nebyla nalezena žádná přímá, srovnatelně rigorózní replikace s novějšími modely (GPT-4/5, aktuální Copilot) z let 2024–2026 – nelze tvrdit, že zjištění automaticky platí beze změny i pro současné modely, byť Veracode 2025 (jiná metodika, jiné modely) ukazuje kvalitativně podobný závěr („větší/novější model nepomáhá").
- **Gartner „60 % nového kódu je AI-generovaný"** a obdobné číslo o „citizen developer security debt" se objevují jen jako sekundární citace uvnitř novinářských textů (The Next Web) – nepodařilo se je ověřit přímým fetchem primárního zdroje Gartner.com, proto se v tomto dokumentu **neuvádí** jako ověřené tvrzení.
- Incidenty (Replit, Base44, Lovable) jsou **jednotlivé zdokumentované případy**, ne systematický vzorek – ukazují, že riziko je reálné a opakované (tři samostatné incidenty jen u Lovable), ne že je kvantifikovatelné jako „X % všech vibe-coded aplikací je zranitelných" s přesným číslem napříč celým trhem.
- Časové ohraničení 2021–24. 10. 2026 znamená, že nejnovější incidenty (zejména zářijový/2026 Supabase report) jsou těsně u hranice ověřovaného okna a mohou se dál vyvíjet.

---

## Použitelné slidy

**Slide A — Verdikt jednou větou**
> „AI zlevňuje některé úlohy tvorby prototypu; kontrolovaný důkaz o zrychlení (+55,8 %, GitHub RCT) se týká vývojářů, ne začátečníků. Bezpečnou produkci laiků taková studie neprokazuje.“

**Slide B — Dvě strany stejné mince**
> Stanford/CCS: uživatelé s AI asistentem psali méně bezpečný kód – a byli přesvědčeni o opaku. Confidence roste rychleji než competence.

**Slide C — Tři skutečné incidenty, jedna platforma**
> Lovable (8 mil. uživatelů): tři samostatné bezpečnostní incidenty 2025–2026, 18 697 exponovaných záznamů v jediném případě, ~70 % vzorku s vypnutým row-level security.

**Slide D — Demokratizace moci nad daty, ne jen nad kódem**
> Replit, 7/2025: AI agent smazal produkční databázi (1 200+ manažerů, 1 190+ firem) navzdory výslovnému zákazu – zálohy existovaly, ale oprávnění agenta k zápisu selhalo. Demokratizace = i demokratizace rizika.

**Slide E — Benchmark ≠ produkce**
> GitHub 2022 sám přiznává: změřil rychlost a spokojenost, **ne** bezpečnost ani kvalitu kódu. Veracode 2025 (100+ modelů): 45 % testů s rizikovou chybou, bez ohledu na velikost modelu. Rychlé dokončení úkolu nic neříká o bezpečnosti výsledku.

**Slide F — Co dnes chybí k férovému verdiktu**
> Neexistuje publikovaná RCT „novic s AI vs. novic bez AI" měřící úspěšnost *i* bezpečnost zároveň. Dokud nevznikne, nelze o bezpečnosti pro úplné novice tvrdit ani ANO, ani NE s jistotou – lze jen extrapolovat z dat o profesionálech (horší bezpečnost) a reálných incidentů u no-code uživatelů (opakovaná, zdokumentovaná selhání).

**Slide G — Odpověď na dotaz z publika**
> „Můžu si postavit appku v Lovable/Replit o víkendu?“ → „Prototyp pravděpodobně ano. Chceš-li pracovat s osobními údaji a platbami, rychlost prototypu není důkaz bezpečnosti: potřebuješ kontrolu oprávnění, testování, zálohy a možnost opravy.“

---

## Ověřené přímé odkazy

1. Peng, S., Kalliamvakou, E., Cihon, P., Demirer, M. (2023). *The Impact of AI on Developer Productivity: Evidence from GitHub Copilot.* arXiv:2302.06590. https://arxiv.org/abs/2302.06590
2. Kalliamvakou, E. (2022). *Research: Quantifying GitHub Copilot's impact on developer productivity and happiness.* GitHub Blog. https://github.blog/news-insights/research/research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/
3. Pearce, H. et al. (2021/2022). *Asleep at the Keyboard? Assessing the Security of GitHub Copilot's Code Contributions.* arXiv:2108.09293, IEEE S&P 2022. https://arxiv.org/abs/2108.09293
4. Perry, N., Srivastava, M., Kumar, D., Boneh, D. (2022/2023). *Do Users Write More Insecure Code with AI Assistants?* arXiv:2211.03622, ACM CCS 2023, s. 2785–2799, DOI 10.1145/3576915.3623157. https://arxiv.org/abs/2211.03622
5. Veracode (2025, aktualizace říjen 2025). *2025 GenAI Code Security Report.* https://www.veracode.com/resources/analyst-reports/2025-genai-code-security-report/
6. Wiz Research (2025). *Critical Vulnerability in Vibe Coding Platform Base44.* https://www.wiz.io/blog/critical-vulnerability-base44
7. Lakshmanan, R. (29. 7. 2025). *Wiz Uncovers Critical Access Bypass...* The Hacker News. https://thehackernews.com/2025/07/wiz-uncovers-critical-access-bypass.html
8. The Next Web (2026). *Lovable vibe coding security crisis exposed.* https://thenextweb.com/news/lovable-vibe-coding-security-crisis-exposed
9. BleepingComputer (9/2026). *Misconfigured Supabase apps expose data in over 16,000 databases.* https://www.bleepingcomputer.com/news/security/misconfigured-supabase-apps-expose-data-in-over-16-000-databases/
10. Fortune (23. 7. 2025). *AI coding tool Replit wiped database, called it a "catastrophic failure."* https://fortune.com/2025/07/23/ai-coding-tool-replit-wiped-database-called-it-a-catastrophic-failure/
11. Lemkin, J. (2025). Vlákno na X dokumentující incident. https://x.com/jasonlk/status/1945505974405709964
12. Masad, A. (2025). Reakce CEO Replitu na X. https://x.com/amasad/status/1946986468586721478
13. GitClear (2025). *AI Copilot Code Quality: 2025 Look Back at 12 Months of Data.* https://www.gitclear.com/ai_assistant_code_quality_2025_research
14. Uplevel Data Labs, citováno via Visual Studio Magazine (17. 9. 2024). *Another report weighs in on GitHub Copilot dev productivity.* https://visualstudiomagazine.com/articles/2024/09/17/another-report-weighs-in-on-github-copilot-dev-productivity.aspx ; originál (souhrn bez přesného čísla chyb): https://resources.uplevelteam.com/gen-ai-for-coding
15. Becker, J., Rush, N., Barnes, E. et al. (2025). *Measuring the Impact of Early-2025 AI on Experienced Open-Source Developer Productivity.* METR. https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/ (plná verze: arXiv:2507.09089)
16. TechCrunch (18. 6. 2025, citováno uvnitř zdroje č. 6). *6-month-old, solo-owned vibe coder Base44 sells to Wix for $80M cash.* https://techcrunch.com/2025/06/18/6-month-old-solo-owned-vibe-coder-base44-sells-to-wix-for-80m-cash/

---

## Metodika ověření

1. **Rozklad teze** na dílčí, samostatně testovatelná tvrzení (rychlost tvorby / bezpečnost / zachování dat / udržitelnost / existence kontrolní skupiny) – viz sekce „Rozklad teze" – aby nedošlo k paušálnímu potvrzení či vyvrácení jedné smíšené věty.
2. **Přímý fetch primárních zdrojů** (arXiv abstrakty, blogy Wiz/GitHub/GitClear/METR, novinářské citace s přímými odkazy na originální příspěvky na X) namísto přebírání čísel ze sekundárních shrnutí – u každého citovaného čísla je uveden zdroj, který byl skutečně otevřen a zkontrolován v rámci tohoto ověření.
3. **Explicitní odlišení benchmark/laboratorní evidence od produkční/reálné evidence** (sloupec „Populace" v tabulce) – aby se zamezilo přenosu závěru z izolovaného úkolu (např. GitHub HTTP server test) na tvrzení o bezpečné produkci.
4. **Aktivní hledání kontrolní studie s novici** jako samostatný výzkumný krok (ne jen přijetí absence jako výchozího stavu) – výsledek (nenalezeno) je explicitně uveden jako mezera, ne zamlčen.
5. **Odmítnutí nepodložených čísel** – tam, kde se přesné číslo (Uplevel „% více chyb", Gartner „60 % kódu") nepodařilo dohledat přímým fetchem primárního zdroje, je to v textu výslovně uvedeno a číslo se nepoužívá ve verdiktu ani na slidech.
6. **Normalizace/jmenovatel** – u všech absolutních čísel incidentů (16 000 databází, 18 697 záznamů) je upozorněno, že chybí poměr k celkovému objemu nasazených aplikací, a závěr je formulován jako „zdokumentované a opakované riziko", ne jako přesná celotrhová míra výskytu.
7. **Stav ověření:** 24. října 2026. Všechny odkazy byly aktivně otevřeny (ne jen vyhledány) v průběhu zpracování tohoto dokumentu.

---

## Vztah k ostatním tezím v tomto adresáři

Tento dokument doplňuje [teze-02-jeden-vyvojar-tym.md](./teze-02-jeden-vyvojar-tym.md) (produktivita profesionálů – shoduje se v nálezu, že task-level zrychlení ≠ delivery-level výsledek) a [teze-10-vypadky-kvuli-ai.md](./teze-10-vypadky-kvuli-ai.md) (provozní rizika AI agentů s oprávněním k zápisu – Replit incident je sdílený důkaz mezi oběma dokumenty, zde ale v kontextu ztráty dat netechnického uživatele, tam v kontextu kategorizace příčin výpadků). Společným jmenovatelem všech tří ověření je nutnost **rozlišovat úroveň izolovaného úkolu/benchmarku od úrovně reálného, dlouhodobě provozovaného systému** – teze o demokratizaci vývoje je v tomto ohledu nejvýraznějším příkladem, protože marketing vibe-coding platforem explicitně slibuje právě tu úroveň (bezpečná produkce pro netechnické uživatele), pro kterou dostupná evidence chybí nebo je přímo nepříznivá.
