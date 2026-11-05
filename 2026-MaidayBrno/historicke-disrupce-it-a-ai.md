# Prodělalo IT už podobnou disrupci? Internet, dot-com a cloud jako kontext AI

Podklad pro MaiDay 2026. Stav ověřených zdrojů: **22. října 2026**. Předmětem je vývoj oboru a práce v něm, nikoli předpověď počtu pracovních míst způsobená AI. Související aktuální čísla jsou v [rešerši propouštění](./propousteni-it-2024-2026.md).

## Stručná odpověď

**Ano, ale nikoli ve všem stejnou.** Web v 90. letech změnil, *pro koho, kde a jak* se software vytváří a distribuuje. Dot-com boom a pád ukázaly, že skutečná technologická změna může současně přinést spekulativní investice, rychlé nábory a tvrdé propouštění. Cloud změnil, *kdo a jak* provozuje infrastrukturu. Generativní AI navíc zasahuje přímo do *výroby artefaktů* vývojářské práce: návrhu, kódu, testů, dokumentace a analýzy. Minulost proto dokládá možnost hluboké proměny rolí, **nikoli pravidlo, že po dnešním propouštění automaticky vznikne dost náhradních míst**.

| Změna | Co zlevnila / zpřístupnila | Co přibylo jako práce a omezení | Historický výsledek |
|---|---|---|---|
| PC a hotový software (80. léta) | Výpočetní techniku blíže uživateli | Integrace, podpora, použitelnost, správa verzí a koncových zařízení | Východisko pro pozdější síťování; nejde o přímou statistickou analogii k AI. |
| Web a komerční internet (90. léta) | Publikování a globální distribuci aplikací | Webové rozhraní, služby, škálování, bezpečnost, přístupnost a provoz | Růst i spekulativní boom, následovaný propadem IT pracovních míst v určitém odvětví. |
| Cloud (od druhé poloviny 00. let) | Pořízení a změnu výpočetní kapacity | Architektura služeb, automatizace provozu, spolehlivost, náklady a zabezpečení | Neodstranil nutnost provozu; změnil jeho umístění a charakter. |
| Generativní AI (současnost) | Vytvoření první verze textu, kódu či návrhu | Ověření správnosti, znalost domény, integrace, kontrola chyb a odpovědnost za důsledky | Produktivita některých úloh doložena; čistý dlouhodobý účinek na zaměstnanost vývojářů zatím nejde z těchto důkazů vyvodit. |

První řádek je typologické srovnání, nikoli doložený příběh zaměstnanosti v 80. letech; podrobně a s čísly rozebíráme především web.

## 1. Internet: nový distribuční kanál se stal novou architekturou

[Berners-Leeho návrh v CERN z roku 1989](https://www.w3.org/History/1989/proposal.html) řešil sdílení a propojování informací ve složité organizaci. [Chronologie W3C](https://www.w3.org/History.html) zachycuje první webový server (1990), prohlížeč Mosaic a rozhodnutí CERN poskytnout webovou technologii bez licenčních poplatků (1993) i založení W3C (1994). **Internet jako síť existoval před webem**: příchod webu není datum „vzniku internetu“.

Nový distribuční kanál postupně změnil očekávání: uživatel chtěl přístup odkudkoli, aktuální data, propojení služeb a později nepřetržitou dostupnost. Místo samotného dodání instalovaného programu bylo nutné navrhovat klienta a server, spravovat identitu a stav, nasazovat změny a reagovat na incidenty. Pravidla webu se vyvíjela průběžně: [CSS1 se stalo doporučením W3C v roce 1996](https://www.w3.org/Style/CSS/history.html) a [iniciativa Web Accessibility Initiative vznikala od roku 1996](https://www.w3.org/WAI/history). To jsou **doložené příklady nové specializace a nových požadavků**, nikoli statistika počtu nově vzniklých profesí.

Poptávka pokračovala i po odeznění investičního boomu. [Pew Research Center](https://www.pewresearch.org/internet/fact-sheet/internet-broadband/) uvádí, že internet používalo **52 % dospělých Američanů v roce 2000 a 68 % v roce 2005**. Jde o průzkum uživatelů v USA, nikoli o počet vývojářů nebo měřítko adopce v ČR.

### Kolik pracovních míst boom a následný propad skutečně znamenaly?

Srovnatelná odvětvová řada amerického [BLS / Current Employment Statistics: *Computer Systems Design and Related Services*](https://fred.stlouisfed.org/series/CES6054150001) (NAICS 5415, **počet zaměstnanců v tisících, sezónně očištěný měsíční stav**) umožňuje oddělit silný růst, propad a dlouhý návrat:

| Měsíc | Zaměstnanci v odvětví v USA | Co pozorujeme |
|---|---:|---|
| prosinec 1995 | 657 500 | Výchozí bod před silnou expanzí. |
| prosinec 2000 | 1 319 800 | **+100,7 %** vůči prosinci 1995; stav se přibližně zdvojnásobil. |
| březen 2001 | 1 358 300 | Lokální vrchol řady před propadem. |
| srpen 2003 | 1 106 700 | Lokální minimum: **−251 600 míst (−18,5 %)** vůči březnu 2001. |
| květen 2007 | 1 368 600 | Poprvé opět nad úrovní března 2001 v této sérii. |
| prosinec 2025 | 2 380 600 | Výrazně nad historickým vrcholem; to samo o sobě neříká, jak se dařilo každému tehdejšímu pracovníkovi. |

Vlastní výpočet z měsíčních pozorování [BLS 1995–2003](https://api.bls.gov/publicAPI/v2/timeseries/data/CES6054150001?startyear=1995&endyear=2003), [2004–2008](https://api.bls.gov/publicAPI/v2/timeseries/data/CES6054150001?startyear=2004&endyear=2008) a [2023–2026](https://api.bls.gov/publicAPI/v2/timeseries/data/CES6054150001?startyear=2023&endyear=2026). Definici, sezónní očištění a jednotky uvádí [FRED k téže řadě](https://fred.stlouisfed.org/series/CES6054150001). Tato kategorie zaměstnává také analytiky, projektové pracovníky a jiné nevývojářské profese; **nejde o počet programátorů ani o celý technologický sektor**. Jde o *stav pracovních míst*, nikoli o hrubý počet přijatých či propuštěných. Dlouhou řadu mohou ovlivnit revize a změny klasifikace; pozorovaný pohyb nelze celý kauzálně připsat jedinému vynálezu.

**Důležitá nuance:** [NBER datuje americkou hospodářskou recesi od března do listopadu 2001](https://www.nber.org/news/business-cycle-dating-committee-announcement-july-17-2003), ale minimum výše uvedené oborové zaměstnanosti nastalo až v **srpnu 2003**. Trh práce v určitém oboru se může zotavovat déle než celá ekonomika. Web přitom nezmizel: vzrostlo jeho používání i pozdější zaměstnanost v počítačových službách. **Nevyplývá z toho**, že všichni propuštění se vrátili na podobná místa, že o ztráty míst způsobil výhradně web nebo že se dnešní AI vlna vyvine stejně.

### Co přesně nám ukazuje dot-com epizoda

- **Technologie a ocenění firem jsou dvě různé věci.** Trvalá užitečnost webu neochránila každý tehdejší obchodní model či tým. Z dat lze doložit rychlý růst, propad a pozdější obnovu zaměstnanosti v odvětví; „AI je nová dot-com bublina“ by byla hypotéza, nikoli závěr z těchto dat.
- **Rozdíl mezi čistou změnou stavu a propouštěním:** Pokles o 251 600 zaměstnanců neznamená „251 600 propuštěných“: mezitím probíhaly nástupy, odchody i reorganizace.
- **Obor se nezachránil pouhým přejmenováním pracovních míst:** Nové požadavky na bezpečnost, přístupnost, provoz a interoperabilitu znamenaly skutečnou technickou práci. To, kdo ji vykonával a kdo za ni platil, se však měnilo.

## 2. Cloud: automatizace jedné vrstvy přesunula práci jinam

[NIST v roce 2011](https://www.nist.gov/publications/nist-definition-cloud-computing) definoval cloud jako samoobslužný síťový přístup ke sdíleným zdrojům s rychlou elasticitou a měřenou spotřebou; rozlišuje SaaS, PaaS a IaaS. Pro tým to znamená, že nemusí pro každý nový experiment vlastnit a fyzicky zprovoznit server. **Neznamená to však konec odpovědnosti** za architekturu, data, identitu, dostupnost a cenu. [První konference DevOpsDays (Gent 2009)](https://legacy.devopsdays.org/events/2009-ghent/) dokládá, že sbližování vývoje a provozu bylo explicitním tématem této éry; nejde o důkaz, že cloud sám vytvořil konkrétní počet nových míst.

Interpretace pro přednášku: technologie zpravidla zlevní určitou *jednotkovou úlohu*, ale zároveň umožní více projektů a zvýší požadavky jinde. Tento **komplementární efekt je možnost, ne zákon**. Kolik lidí je nakonec potřeba, závisí na poptávce, organizaci práce a tom, kdo zachytí úspory.

## 3. Kde analogie s dnešní AI drží a kde se láme

| Mechanismus | Internet / cloud | Generativní AI | Co lze tvrdit bezpečně |
|---|---|---|---|
| Pokles ceny | Distribuce aplikace a kapacita pro její provoz. | První návrh kódu, textu, testů nebo analýzy. | Levnější krok procesu může zvýšit objem tvorby, ale také usnadnit redukci týmu. |
| Nové úzké hrdlo | Škálování, přístupnost, provoz a bezpečnost dostupných aplikací. | Ověřování správnosti, bezpečné změny, integrace, doménový kontext a odpovědnost za výsledek. | Mapa úzkých hrdel je analytická hypotéza, nikoli naměřený čistý přírůstek pracovních míst. |
| Přeskupení kompetencí | Webové a provozní znalosti vedle původních dovedností. | Schopnost formulovat zadání, prověřit výsledek, rozumět systému a navrhnout kontroly. | Rutinní část práce se může změnit dříve než formální názvy profesí. |
| Investiční tlak | Při dot-com boomu rychlý růst a pozdější korekce. | Investice do modelů a infrastruktury souběžně s redukcemi některých týmů. | Souběh událostí není důkaz, že každé propuštění způsobila AI ani že sledujeme totožný investiční cyklus. |
| Působnost | Web změnil rozhraní, distribuci a propojení služeb; cloud provoz. | Nástroj může zasáhnout přímo do psaní a kontroly kódu a napříč netechnickými profesemi. | Analogii nelze převést na jednoduché „historie se opakuje“. |

Co říkají novější empirické studie, **nikoli historická analogie**: [Brynjolfsson, Li a Raymond](https://www.nber.org/papers/w31161) měřili nasazení AI asistenta u **5 179 pracovníků zákaznické podpory**; produktivita podle počtu vyřešených případů na hodinu vzrostla v průměru o **14 %**, více u začátečníků. **Nešlo o vývojáře ani o měření počtu zrušených míst.** [Hampole a kol.](https://www.nber.org/papers/w33509) nalézají nižší poptávku po úlohách více vystavených AI, ale v jejich vzorku jsou celkové efekty na zaměstnanost skromnější díky přeskupení práce a poptávce v adoptujících firmách. Tyto výsledky ukazují, proč je třeba současně sledovat *úlohy, produktivitu a skutečnou zaměstnanost*; samy nepředpovídají osud softwarových vývojářů v ČR.

## Teze a otázky, které lze převést do přednášky

1. **„Internet přežil dot-com firmy; to však neznamená, že přežila všechna jejich pracovní místa.“** Podloženo dlouhou řadou BLS; nevydávat pokles stavu za počet propuštěných.
2. **„Disrupce nebyla okamžik, ale sled přestaveb.“** Standardy webu, šíření uživatelů, investiční cyklus i vznik provozních praktik se odehrávaly v různých letech.
3. **„AI může změnit samotnou učňovskou cestu k řemeslu.“** Pokud stroj přebírá první návrhy a jednoduché opravy, kde bude nová generace získávat zkušenost s chybou, testem a provozem? Jde o otázku pro diskusi, nikoli doložené tvrzení o zániku juniorských pozic.
4. **„Generování software není totéž co zodpovědnost za software.“** Historie webu i cloudu připomíná, že s dostupnější tvorbou roste význam provozu, kvality a správy komplexity. Není zatím doloženo, zda tento růst absorbuje lidi uvolněné generováním.
5. **„Koho změna zvýhodní?“** Zda úspory získá zákazník, malý tým, vlastník platformy či investor, nelze určit jen z technických možností nástroje; jde i o tržní a organizační volby.

### Formulace, kterým se raději vyhnout

- „Internet zrušil programátory a pak je znovu vytvořil.“ **Ne:** uvedená řada sleduje zaměstnance jednoho odvětví, ne životní dráhy lidí ani všechny programátory.
- „Po každé automatizaci vznikne více míst.“ **Ne:** historický příklad je slučitelný s pozdějším růstem i s dlouhou škodou pro konkrétní pracovníky.
- „Propouštění v technologických firmách dokazuje, že AI už nahrazuje vývojáře.“ **Ne:** [globální tracker propouštění](./propousteni-it-2024-2026.md) neidentifikuje profese ani příčinu každého ukončení.
- „Dot-com krach = zánik internetu; dnešní propady = konec AI.“ **Ne:** adopce technologie a finanční výsledky firem jsou odlišné veličiny.

## Zdroje a omezení

Historická chronologie a vznik standardů: [návrh webu (CERN / W3C)](https://www.w3.org/History/1989/proposal.html), [chronologie W3C](https://www.w3.org/History.html), [historie CSS](https://www.w3.org/Style/CSS/history.html), [historie WAI](https://www.w3.org/WAI/history). Adopce: [Pew, dlouhodobá řada používání internetu v USA](https://www.pewresearch.org/internet/fact-sheet/internet-broadband/). Pracovní trh: [BLS CES řada 5415 přes FRED](https://fred.stlouisfed.org/series/CES6054150001) a výše uvedené přímé odkazy na měsíční data, [NBER: recese 2001](https://www.nber.org/news/business-cycle-dating-committee-announcement-july-17-2003). Další disrupce: [NIST SP 800-145](https://www.nist.gov/publications/nist-definition-cloud-computing), [DevOpsDays 2009](https://legacy.devopsdays.org/events/2009-ghent/). AI: [experiment s pracovníky podpory](https://www.nber.org/papers/w31161), [studie poptávky po pracovních úlohách](https://www.nber.org/papers/w33509).

**Geografické omezení:** číselná zaměstnanost a adopce jsou z **USA**; nelze je prezentovat jako světová či česká čísla. **Metodické omezení:** BLS CES popisuje měsíční stav zaměstnanců v sektoru, nikoli hrubé nábory nebo propouštění; dlouhodobé porovnání neizoluje vliv webu od hospodářského cyklu, dalších inovací a změn ve firmách. Řada je průběžně revidována. Výše uvedené analogie k AI jsou interpretací nad zdroji, nikoli měřeným scénářem budoucnosti.
