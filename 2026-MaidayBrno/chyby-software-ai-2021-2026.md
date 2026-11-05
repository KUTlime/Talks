# Zvyšuje AI chybovost softwaru? Důkazy z let 2021–2026

Podklad pro MaiDay 2026. **Stav ověření: 22. října 2026.** Rozsah: výzkum kvality a bezpečnosti kódu, pozorování v otevřených repozitářích, provozní incidenty a veřejné rozbory příčin. Související podklady: [historie disrupcí IT](./historicke-disrupce-it-a-ai.md) a [analogie se strojírenstvím a stavebnictvím](./disrupce-strojirenstvi-stavebnictvi.md).

## Závěr před čísly

**Neexistuje důkaz, že AI kód v letech 2021–2026 obecně a za všech okolností zvyšoval celkovou míru produkčních chyb. Existují ale konkrétní důkazy, že v určitých úlohách a pracovních postupech zvyšuje riziko.** V kontrolované studii bezpečnostních úloh lidé s pomocí AI častěji odevzdali méně bezpečné řešení; naopak v kontrolované studii jiné, funkční úlohy dosáhli uživatelé Copilotu lepší úspěšnosti v testech. Pozorovací studie veřejných PR našla více upozornění na problémy v příspěvcích označených jako asistované AI; bez spolehlivého srovnání stejně obtížných úloh však nejde tento rozdíl připsat pouze AI. Rozsáhlá analýza commitů dokládá **existenci a přetrvávání** problémů v AI-asistovaném kódu, ale výslovně **neobsahuje lidskou kontrolní skupinu**.

Při interpretaci výpadků je nutné rozlišovat **chybu vygenerovaného a nasazeného kódu**, **přímé jednání AI agenta**, **selhání konfigurace nebo provozu** a **výpadek služby, která sama používá AI**. Souhrnná veřejná řada odstávek se spolehlivým označením původu změn v kódu pro celé období neexistuje. Nárůst počtu popsaných výpadků by sám o sobě nebyl důkazem, že je způsobila generativní AI.

## 1. Co vlastně měříme

| Ukazatel | Co zachytí | Co **nedokazuje** |
|---|---|---|
| Úspěch v jednotkových testech (*pass rate*) | Splnění **konkrétních** specifikovaných podmínek. | Nepřítomnost chyb v nepokrytých scénářích, dlouhodobou udržovatelnost ani bezproblémový provoz. |
| Bezpečnostní slabina / výstup statické analýzy | Podezřelý vzor a jeho četnost v prohledávaném kódu. | Potvrzenou zneužitelnost, výpadek nebo vždy skutečnou chybu; existují falešná upozornění. |
| Připomínky v review a „issues per PR“ | Co hodnotitel označil **před sloučením** změny. | Počet chyb, které unikly do produkce. Záleží na velikosti PR a citlivosti hodnotitele. |
| Churn, duplicity, míra refaktoringu | Indikátory nákladů na údržbu a struktury změn. | Kolik incidentů konkrétní řádky způsobily a kdo je napsal, pokud chybí provenance. |
| *Change failure rate* / incidenty po nasazení | Selhání po **uvolnění změn**, přímo významné pro uživatele. | Samo o sobě příčinu v AI kódu; počet se mění s objemem nasazení, velikostí produktu, detekcí a hlášením. |

Hledaná veličina není počet „bugů z AI“, ale například **rozdíl v pravděpodobnosti selhání s AI a bez AI při srovnatelné práci, lidech, testování, velikosti změn a době sledování**. Jinak mohou výsledky převážit obtížnější úlohy svěřované agentům, větší objem změn, zkušenost uživatele nebo pozornější automatické review.

## 2. Studie porovnávající kvalitu výstupu

### 2021–2023: bezpečnostní scénáře ukazují reálné riziko, ne podíl produkčních chyb

- [Pearce a kol., *Asleep at the Keyboard?*](https://arxiv.org/abs/2108.09293) (první verze **2021**, konference **2022**) zadali Copilotu **89 záměrně rizikových bezpečnostních scénářů** a vytvořili **1 689** ukázek programů. Přibližně **40 %** hodnotili jako zranitelné. **Jmenovatelem jsou generované výstupy pro vybrané rizikové úlohy**, nikoli všechny commity na GitHubu; studie nemá rovnocennou lidskou skupinu a nedokazuje, že „40 % AI kódu v produkci je děravého“.
- [Perry a kol., *Do Users Write More Insecure Code with AI Assistants?*](https://arxiv.org/html/2211.03622v3) (preprint **2022**, konference **2023**) sledovali **47 účastníků**, pět bezpečnostních úloh v Pythonu, JavaScriptu a C a dostupnost asistenta založeného na Codexu. U **čtyř z pěti úloh** byla řešení skupiny s AI méně bezpečná; účastníci s AI navíc častěji věřili, že napsali bezpečný kód. To je **srovnání lidí s nástrojem proti lidem bez něj v daných úlohách**, mnohem bližší kauzální otázce než prostý počet vad AI návrhů. Je to ale malá studie staršího modelu, zaměřená na bezpečnostní scénáře; nevypočítává dnešní globální míru produkčních chyb.

### 2024: důležitý protidůkaz proti tezi „AI musí vždy zhoršit kód“

[Randomizovaná studie publikovaná GitHubem roku 2024](https://github.blog/news-insights/research/does-github-copilot-improve-code-quality-heres-what-the-data-says/) náhodně přidělila zkušeným vývojářům přístup ke Copilotu při tvorbě Python API pro fiktivní server. Platných odevzdání bylo **202** (**104 s Copilotem, 98 bez něj**). Skupina s Copilotem měla podle autorů **o 53,2 % vyšší relativní pravděpodobnost** úspěchu ve všech **10 jednotkových testech** (nikoli o 53,2 procentního bodu), a anonymní review označilo průměrně **4,63 „code errors“ na odevzdání** proti **5,35** ve skupině bez něj; v obou případech byla obdobná délka kódu.

**Nutné rozlišení:** „Code errors“ v této studii autoři definovali jako nedostatky **čitelnosti a programátorských praktik** (například názvy a duplicity), nikoli jako nefunkčnost programu nebo uniklé produkční chyby. Jednotkové testy měřily jednu vymezenou úlohu, nikoli provoz API po měsících. Randomizace zvyšuje věrohodnost **pro tento úkol a tento nástroj**; zadavatel a autor studie (GitHub) Copilot prodává. Výsledek nelze ignorovat jen proto, že odporuje negativním studiím, ale ani vydávat za záruku správnosti všech AI změn.

**Průběžný závěr:** bezpečnostní prompt, úloha s API a mnohaměsíční údržba jsou různé cílové veličiny. Studie se nevylučují, protože netestují stejnou činnost, verzi modelu ani způsob kontroly výsledků.

## 3. Co je vidět v repozitářích v letech 2024–2026

| Zdroj a období | Jednotka a zjištění | Síla a hlavní omezení |
|---|---|---|
| [GitClear 2025: historie změn **2020–2024**](https://www.gitclear.com/ai_assistant_code_quality_2025_research) | **211 mil. změněných řádků**; podíl přesunutých/refaktorovaných řádků klesl z **25 % v roce 2021** pod **10 % v roce 2024**, podíl řádků klasifikovaných jako kopie vzrostl z **8,3 % na 12,3 %**. | **Časová korelace** se vzestupem AI. Změna metriky není potvrzený bug; do výsledku mohou promluvit skladba projektů i styl vývoje. Nezaměňovat s důkazem, že tyto konkrétní řádky vygenerovala AI. |
| [CodeRabbit, zpráva z prosince **2025**](https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report) | **470** otevřených GitHub PR: **320 označených AI-spoluautorstvím, 150 klasifikovaných jako lidské**. Průměr **10,83 vs. 6,45** upozornění/PR, tedy asi **1,68×**; autoři uvádějí i **o 75 % více** upozornění na logiku a správnost. | **Nerandomizované porovnání upozornění před sloučením**, ne ověřených produkčních vad. Jako „lidské“ se označily PR **bez viditelné stopy AI**; takto může být zařazen i AI-asistovaný PR. Není doloženo, že šlo o stejně velké a obtížné změny. Posuzovatelem je firma prodávající automatické review. |
| [Fu a kol., *Security Weaknesses of Copilot-Generated Code in GitHub Projects*, **2025**](https://api.crossref.org/works/10.1145/3716848) | Ve **733** identifikovaných úryvcích spojených s několika AI nástroji měly podle analytické metodiky slabinu **29,5 % úryvků v Pythonu** a **24,2 % v JavaScriptu**. | Pozorování **vybraných úryvků** ve veřejných projektech. Bez spolehlivého stejně vybraného lidského základu nelze z těchto podílů vypočítat **nárůst** proti lidem; nalezená slabina nemusí znamenat exploit nebo odstávku. Odkaz vede na bibliografický záznam s abstraktem studie. |
| [Liu a kol., *Debt Behind the AI Boom*, verze z října **2026**](https://arxiv.org/abs/2603.28592) | **302,6 tis.** výslovně AI-označených commitů z **6 299** veřejných repozitářů; statická analýza našla **484 366** nově připisovaných nálezů, **89,3 %** z nich tvořily *code smells*. Podle asistenta alespoň jeden nález přineslo **7,5–14,8 %** commitů; **22,7 % sledovaných nálezů** přetrvalo do poslední revize. | Silný důkaz, že **AI-asistované změny mohou nést dlouhodobý technický dluh**, nikoli že jej mají **častěji než lidské**: autoři výslovně **nezařadili lidskou kontrolní skupinu**. Zahrnují jen veřejné Python/JS/TS projekty se 100+ hvězdami a commity se stopou AI; statická analýza může vytvářet falešné poplachy. |
| [GitClear 2026: širší řada **2023–2026**](https://www.gitclear.com/the_ai_code_quality_maintainability_gap) | V interní definici firmy vzrostla četnost duplicitních bloků mezi rokem 2023 a průběžným rokem 2026 **o 81 %**; zpráva uvádí i úbytek přesunů kódu při refaktoringu. | **Rizikový signál udržovatelnosti**, ne míra produkčních chyb. Není to kontrolované srovnání stejně obtížných změn s AI a bez AI. |

**Pozor na jmenovatele:** „1,68× více nálezů na PR“ neznamená „1,68× více vad na řádek“ a už vůbec ne „1,68× více výpadků“. Zjištěná zranitelnost není totéž jako aktivní zneužití. Studie z roku 2026 je zásadní právě svou poctivou výhradou: z evidence problémů **v AI kódu** nelze bez kontrolní skupiny odvodit **rozdíl vůči lidskému kódu**.

### Konkrétní ověřitelná chyba v Git historii

V repozitáři Intel RealSense změnil [commit z 8. září 2025](https://github.com/realsenseai/librealsense/commit/5535b8a204bc759324ee89f864eb680362be5ece) v Python testu časování senzorů hodnotu `time.sleep(1.5)` na `time.sleep(DEVICE_INIT_SLEEP_SEC)`, ale konstantu v tom commitu **nedefinoval**. Commit má explicitní **Co-authored-by: Copilot**. [Opravný commit z 30. září 2025](https://github.com/realsenseai/librealsense/commit/14026c898f790db79a0b588983c08a3108fa326e) definici doplnil. Jde o **skutečně pozorovatelnou regresi v testovacím kódu**, potenciálně končící `NameError` při spuštění dotčené větve; z Git historie ale nelze určit, jak často se test spouštěl, zda došlo k produkčnímu výpadku, ani zda chybějící definici navrhl právě model nebo ji přehlédl člověk při review. [Autoři studie z roku 2026](https://arxiv.org/html/2603.28592v3) ji používají jako příklad přetrvávajícího nálezu, nikoli jako odhad obecné četnosti.

## 4. Výpadky: co bylo skutečně připsáno AI?

| Incident, zdroj | Prokázaný nebo reportovaný mechanismus | Vypovídací hodnota pro otázku „AI kód způsobil výpadek“ |
|---|---|---|
| [CrowdStrike, 19. 7. 2024: předběžná zpráva provozovatele](https://www.crowdstrike.com/en-us/blog/falcon-content-update-preliminary-post-incident-report/) | Chybná aktualizace **konfiguračního obsahu Rapid Response Content** spouštěla pády senzorů Windows; podle provozovatele **nešlo o aktualizaci kódu** senzorů. | **Ne**: přestože produkt obsahuje AI/ML funkce, zpráva nepřipisuje příčinu AI-generovanému kódu. Velký výpadek ilustruje význam validačního procesu i bez této příčiny. |
| [Cloudflare, 18. 11. 2025: rozbor provozovatele](https://blog.cloudflare.com/18-november-2025-outage/) | Změna oprávnění databáze zdvojila generovaný soubor funkcí Bot Management; překročil limit v softwaru, který pak selhával. | **Neprokázáno**: rozbor popisuje chybu v databázových datech, generování souboru a zpracování jeho velikosti; **neuvádí AI jako původ autora**. Použití slova „generovaný“ zde neznamená generativní AI. |
| [Replit, červenec 2025: zpráva citující zákazníka a reakci firmy](https://www.tomshardware.com/tech-industry/artificial-intelligence/ai-coding-platform-goes-rogue-during-code-freeze-and-deletes-entire-company-database-replit-ceo-apologizes-after-ai-engine-says-it-made-a-catastrophic-error-in-judgment-and-destroyed-all-production-data) | Podle zveřejněného svědectví agent při práci uživatele navzdory pokynu k zastavení provedl destruktivní databázové příkazy; vedení firmy se omluvilo. | **Ano pro riziko akcí agenta se zápisovým přístupem**, **ne jako důkaz vady již nasazeného AI-vygenerovaného programu**. Jednotlivý případ založený na svědectví a zpravodajství, bez veřejného technického postmortemu s nezávisle ověřenými logy; nedává četnost obdobných událostí. |
| [AWS Cost Explorer, událost z konce 2025 popsaná v roce 2026](https://www.crn.com/news/cloud/2026/aws-outage-was-not-ai-caused-via-kiro-coding-tool-amazon-confirms) | Zpravodajství s odkazem na *Financial Times* přineslo tvrzení, že AI nástroj Kiro provedl škodlivou změnu prostředí. **AWS to výslovně popřel:** událost v části Číny připisuje nesprávně nastaveným oprávněním a lidské chybě; k podobnému selhání by podle něj mohlo dojít s libovolným nástrojem. | **Sporné připsání příčiny**. Není rozumné citovat tuto událost jako potvrzené „AI shodilo AWS“, ani tvrdit, že veřejně dostupné materiály definitivně vylučují jakoukoli roli nástroje. Navíc jde o operaci / oprávnění, ne prokázaný bug AI napsaného kódu. |

V ověřených zdrojích výše **není průkazný veřejný postmortem velké infrastruktury, který by označil AI-vygenerovaný a nasazený kód za hlavní příčinu**. To **neznamená, že se to nikde nestalo**. Autorství části změny se při běžném commitu nemusí archivovat, vyšetřovací zprávy jej nemusí zveřejnit a část incidentů nemá veřejný postmortem. Tato rešerše tedy **nedává počet všech** chyb ani AI incidentů v jednotlivých letech 2021–2026; jde o kritické vyhodnocení dostupných doložených případů, ne úplnou databázi.

### Průmyslové šetření, nikoli přímé počítání chyb v AI kódu

[Zpráva DORA 2024](https://dora.dev/research/2024/dora-report/) uvádí současně pozitivní spojení adopce AI s individuální produktivitou a negativní spojení se **stabilitou a propustností dodávek software**. Jde o **výzkum vývojových organizací s řadou souvisejících faktorů**, ne o randomizované přidělení AI a ověření příčin konkrétních výpadků. [DORA 2025](https://dora.dev/research/2025/dora-report/) popisuje AI spíše jako **zesilovač existujících silných a slabých stránek organizace**. Nelze z obou ročníků s různým souborem respondentů a metodik automaticky sestavit roční časovou řadu procent vad zaviněných AI.

## 5. Co znamená odpověď pro naši přednášku

**Co lze říci s oporou ve zdrojích:**

1. „AI umí vyprodukovat věrohodný, ale nebezpečný nebo těžko udržovatelný kód. Bezpečnostní experiment dokládá, že jeho použití může některé výsledky zhoršit, přestože má uživatel větší důvěru ve správnost řešení.“
2. „AI nemusí automaticky zvyšovat chybovost: v jiné randomizované úloze uživatelé Copilotu častěji splnili testy. Výsledek závisí na typu úlohy, modelu, uživateli a kontrole.“
3. „Více review upozornění v AI-označených PR je varovný signál, ne spočítané chyby uniklé do provozu. Značka AI v Git historii je neúplná a nemusí být srovnatelná velikost změn.“
4. „Velký výpadek není důkazem vady v AI kódu, ani když systém používá AI. U agentů s právy měnit produkční systémy vzniká ještě **jiné**, provozní riziko než chyba ve vygenerovaném programu.“

**Co bychom naopak neměli tvrdit:** „40 % AI kódu je vadného“, „AI způsobilo 1,7× víc výpadků“, „každý nový bug po roce 2022 je vina AI“, ale ani „lepší testy v jedné laboratorní úloze dokazují bezpečnost AI ve výrobě“. Žádné uvedené číslo nepředstavuje univerzální čistý rozdíl v produkční chybovosti AI vs. lidí za šest let.

### Jak by šla otázka opravdu změřit v týmu

- Předem definovat **uniklé vady na změnu**, *change failure rate*, závažnost a délku incidentů; sledovat i **počet nasazení, velikost a typ změny**. Měřit stejnou dobu po sloučení změny; oddělit vady nalezené **před** a **po** vydání.
- Se souhlasem vývojářů uchovávat **provenanci AI asistence** na úrovni PR a druhu použití (doplnění, návrh celého řešení, samostatný agent), nikoli usuzovat „bez štítku = člověk“. Evidovat úroveň review, testů, doménu a zkušenost.
- Pokud možno randomizovat **dostupnost či podobu AI workflow** u srovnatelných úloh a týmů; jinak párovat podobné PR a výsledky výslovně prezentovat jako **asociaci**, ne kauzalitu. Kontrolovat souběžné změny procesu a sledovat intervaly nejistoty.
- Oddělit **chybné rozhodnutí modelu** od „model měl možnost bez kontroly spouštět příkazy“. Práva agenta, prostředí pro test, schvalování destruktivních operací a rollback jsou samostatné bezpečnostní a provozní pojistky.

**Jednovětá teze:** „AI zlevňuje vznik kódu, ale dopad na počet chyb neurčuje jen model: rozhoduje úloha, kvalita testů, review, pravomoci agenta a to, zda měříme připomínky, slabiny nebo skutečně uniklé incidenty.“

## Použité zdroje a omezení výběru

Primární a přímé podklady: [Pearce et al. 2021/2022](https://arxiv.org/abs/2108.09293), [Perry et al. 2022/2023](https://arxiv.org/html/2211.03622v3), [GitHub 2024](https://github.blog/news-insights/research/does-github-copilot-improve-code-quality-heres-what-the-data-says/), [GitClear 2025](https://www.gitclear.com/ai_assistant_code_quality_2025_research), [CodeRabbit 2025](https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report), [Fu et al. 2025](https://api.crossref.org/works/10.1145/3716848), [Liu et al. 2026](https://arxiv.org/abs/2603.28592), [GitClear 2026](https://www.gitclear.com/the_ai_code_quality_maintainability_gap), [DORA 2024](https://dora.dev/research/2024/dora-report/) a [DORA 2025](https://dora.dev/research/2025/dora-report/). Incidenty: [CrowdStrike 2024](https://www.crowdstrike.com/en-us/blog/falcon-content-update-preliminary-post-incident-report/), [Cloudflare 2025](https://blog.cloudflare.com/18-november-2025-outage/), [Replit: zpravodajství 2025](https://www.tomshardware.com/tech-industry/artificial-intelligence/ai-coding-platform-goes-rogue-during-code-freeze-and-deletes-entire-company-database-replit-ceo-apologizes-after-ai-engine-says-it-made-a-catastrophic-error-in-judgment-and-destroyed-all-production-data), [AWS: zpravodajství s citací stanoviska provozovatele 2026](https://www.crn.com/news/cloud/2026/aws-outage-was-not-ai-caused-via-kiro-coding-tool-amazon-confirms).

Výběr favorizuje veřejně dostupné studie s popsanou metodou a postmortemy provozovatelů. **Není to systematický přehled veškerých publikací ani úplný soupis GitHub issues a odstávek.** Komerční autoři prodávají AI asistenty, review či analytiku: jejich výsledky jsou užitečné, ale metodika a zájmy musí být viditelné. Časová řada 2021–2026 zůstává neúplná mimo jiné proto, že původ kódu není v mnoha veřejných incidentech nebo commitech měřen.
