// Případová studie - 1FP402 Investiční rozhodování a dlouhodobé financování
// Autor: Jakub David
// Verze: 3.0 - finální verze se zapracovaným review

#set document(
  title: "Případová studie - Financování startupu Resonect",
  author: "Jakub David",
)

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 1.5cm),
  numbering: "1",
)

#set text(
  size: 11pt,
  lang: "cs",
)

#set par(
  justify: true,
  leading: 0.8em,
)

#set heading(numbering: "1.1")

#set table(inset: 8pt)

// Vertical spacing around figures (tables)
#show figure: set block(above: 2em, below: 2em)

// Vertical spacing below headings
#show heading: set block(above: 1.5em, below: 1em)

// Title page
#align(center)[
  #text(size: 12pt)[VYSOKÁ ŠKOLA EKONOMICKÁ V PRAZE]

  Fakulta financí a účetnictví

  #v(2cm)

  #text(size: 16pt, weight: "bold")[PŘÍPADOVÁ STUDIE]

  #v(0.5cm)

  #text(size: 13pt)[Financování startupu v rámci programu Technologická Inkubace CzechInvest]

  #v(0.3cm)

  #text(style: "italic")[Case Study: Resonect Technology s.r.o. – projekt Hastr]

  #v(2cm)

  Předmět: 1FP402 Investiční rozhodování a dlouhodobé financování

  Cvičící: Ing. František Poborský, Ph.D.

  #v(3cm)

  #align(bottom + left)[
    Autor: Jakub David

    Obor: Vývoj informačních systémů (FIS)

    Vedlejší specializace: Manažerské účetnictví (FFÚ)

    Datum: Prosinec 2025
  ]
]

#pagebreak()

= Management Summary

Tato případová studie hodnotí ekonomickou efektivnost projektu Hastr společnosti Resonect Technology s.r.o., financovaného z programu Technologická Inkubace CzechInvest. Autor práce je CEO a zakladatel společnosti Resonect.

*Projekt:* Vývoj chytrého hladinoměru Hastr – IoT zařízení pro monitoring hladiny vody v nádržích a studnách. Produkt je určen pro distribuční prodej na českém a zahraničních trzích (DACH region).

*Financování:* Program Technologická Inkubace poskytuje podporu 1 000 000 Kč (přímá) + 500 000 Kč (nepřímá – mentoring). Jedná se o neekvitní dotaci, zakladatelé si zachovávají 100% podíl ve společnosti.

*Klíčové finanční ukazatele:*

#figure(
  table(
    columns: 3,
    align: (left, right, right),
    table.header([*Ukazatel*], [*Bez dotace*], [*S dotací*]),
    [Čistá současná hodnota], [391 025 Kč], [1 391 025 Kč],
    [Vnitřní výnosové procento], [23,3 %], [N/A],
    [Doba návratnosti], [2,3–2,5 roku], [okamžitá],
    [Index rentability], [1,39], [N/A],
  ),
)

*Hlavní závěry:*

- Projekt je ekonomicky efektivní – ČSH je kladná, VVP téměř 3× převyšuje požadovanou výnosnost 8 %
- Dotace z programu TI zvyšuje hodnotu projektu o 1 mil. Kč a eliminuje kapitálový výdaj
- Bod zvratu činí 73 % plánovaných prodejů, projekt má rozumnou rezervu
- Největším rizikem je citlivost na prodejní cenu a variabilní náklady

*Doporučení:* Program Technologická Inkubace představuje optimální způsob financování R&D fáze technologického startupu. Kombinuje dostupnost prostředků s nulovým nákladem kapitálu a zachováním kontroly zakladatelů.

#pagebreak()

= Úvod

Tato případová studie analyzuje financování vývoje IoT produktu Hastr společnosti Resonect Technology s.r.o. prostřednictvím programu Technologická Inkubace agentury CzechInvest. Cílem je zhodnotit zvolený způsob financování z pohledu investičního rozhodování a aplikovat metody hodnocení efektivnosti investičních projektů.

Resonect Technology s.r.o. je technologický startup založený meziuniverzitním týmem čtyř studentů. Společnost se zaměřuje na IoT řešení v oblasti vodohospodářství a působí v sektoru EcoTech. Autor této práce zastává ve společnosti pozici CEO a IoT architekta. Tým dále tvoří CTO zodpovědný za hardware a firmware a dva vývojáři zaměření na firmware a UI/UX design.

Jedním z produktů společnosti je chytrý hladinoměr Hastr, modulární systém pro monitorování hladiny vody v nádržích a studnách. Produkt reaguje na rostoucí potřebu hospodaření s vodou v kontextu častějších suchých období a legislativních požadavků na nakládání s dešťovou vodou u novostaveb.

Společnost Resonect je součástí programu Technologická Inkubace, kde patří mezi nejmladší účastníky. Věkový průměr účastníků programu je přibližně 35 let. Celková výše podpory pro projekt Hastr činí necelé 1,5 miliony korun.

= Popis investičního projektu

== Produkt a jeho komponenty

Hastr je modulární IoT systém skládající se z několika komponent. Hlavní jednotkou je Hastr-MB, která funguje jako koncentrátor dat a gateway pro komunikaci s cloudem. K této jednotce se připojují senzorové moduly FelMOD-WL pro měření hladiny a FelMOD-SW pro spínání a správu systémů dešťové vody. Celý systém je doplněn cloudovou platformou pro sběr, analýzu a vizualizaci dat.

Produkt bude nabízen ve dvou variantách. Hastr vz. 1 představuje levnější variantu komunikující pouze přes WiFi s kratším dosahem měření. Hastr vz. 2 je prémiová varianta využívající moderní komunikační technologie NB-IoT a LTE-M s maximálním dosahem měření. Obě varianty jsou navrženy pro odolnost v nepříznivých venkovních podmínkách.

Klíčovou konkurenční výhodou produktu je moderní přístup k IoT. Na rozdíl od stávajících řešení na trhu, která často využívají zastaralé 2G sítě určené k vypnutí, Hastr staví na perspektivních technologiích 5G a LoRa. Důraz je kladen na otevřenost systému, lokální funkčnost bez závislosti na cloudu a uživatelskou přívětivost.

== Struktura kapitálového výdaje

Vývoj produktu Hastr je financován z programu Technologická Inkubace. Celková přímá podpora činí 1 000 000 Kč a je rozdělena do sedmi aktivit podle inkubačního plánu.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, right, right),
    [*Aktivita*], [*Náklady (Kč)*], [*Podíl*],
    [Administrativní činnosti], [50 000], [5,0 %],
    [Vývoj Hastr-MB], [240 726], [24,0 %],
    [Optimalizace Cloudu], [100 000], [10,0 %],
    [Vývoj FelMOD], [200 000], [20,0 %],
    [Vývoj SW pro Hastra], [300 000], [30,0 %],
    [Testování], [50 000], [5,0 %],
    [Certifikace], [100 000], [10,0 %],
    [*Celkem*], [*1 000 000*], [*100 %*],
  ),
  caption: [Struktura nákladů projektu Hastr dle inkubačního plánu],
)

Největší položkou je vývoj software, který tvoří 30 % rozpočtu. Následuje vývoj hardwarových komponent Hastr-MB a FelMOD, každý s přibližně 20–24 % rozpočtu. Zbývající prostředky jsou určeny na optimalizaci cloudové infrastruktury, certifikace pro evropský trh, testování a administrativní činnosti.

K přímé podpoře je nutné připočíst nepřímou podporu ve výši 500 000 Kč, která zahrnuje mentoring, workshopy a konzultace. Celková hodnota podpory z programu TI tak činí 1 500 000 Kč.

Dle metodiky identifikace kapitálového výdaje platí vzorec K = I + O – P ± D, kde I je jednorázový investiční výdaj, O je výdaj na přírůstek čistého pracovního kapitálu, P je příjem z prodeje nahrazovaného majetku a D jsou daňové efekty. V případě projektu Hastr je kapitálový výdaj tvořen pouze jednorázovým investičním výdajem na služby (I = 1 000 000 Kč), ostatní složky jsou nulové.

== Časový harmonogram projektu

Vzhledem k tomu, že tým dokončuje magisterská/inženýrská studia, je vývoj pomalejší než za běžných okolností.

Doba inkubace je stanovena na 23 měsíců, od srpna 2024 do června 2026. Jednotlivé aktivity na sebe logicky navazují. V první fázi probíhá administrativní příprava a plánování. Od třetího měsíce začíná vývoj hlavní jednotky Hastr-MB, který trvá do desátého měsíce. Paralelně od sedmého měsíce probíhá vývoj software a od osmého měsíce vývoj senzorových modulů FelMOD.

Optimalizace cloudové infrastruktury je naplánována na měsíce 9 až 12. Po dokončení všech vývojových aktivit následuje fáze testování v měsících 12 až 14 a certifikace pro evropský trh v měsících 14 až 15. První tržby jsou očekávány od května 2026.

Z pohledu teorie kapitálového plánování projekt prochází všemi šesti etapami: stanovení cílů a strategie, vyhledání investiční příležitosti, vypracování rozpočtu, zhodnocení efektivnosti, výběr financování a následný audit realizace.

= Analýza financování

== Charakteristika programu Technologická Inkubace

Technologická Inkubace je program agentury CzechInvest financovaný z evropského programu Country for the Future pod záštitou Ministerstva průmyslu a obchodu. Program je zaměřen na podporu inovativních technologických startupů s vysokým růstovým potenciálem.

Od svého spuštění program podpořil 232 projektů s celkovou výší podpory 758 milionů korun. Jedná se o největší startupový inkubátor v České republice. Program je rozdělen do sedmi technologických sektorů (Hubů): AI, Mobility, Space, EcoTech, Advanced Tech & Materials, Creative a Tech4Life.

Klíčovou charakteristikou programu je neekvitní financování. Na rozdíl od investic rizikového kapitálu se jedná o dotaci v režimu de minimis, což znamená, že příjemce neztrácí žádný podíl ve společnosti. Maximální limit podpory de minimis je 300 000 EUR za tři roky.

Program nabízí dvě úrovně podpory. Inkubace STANDARD poskytuje až 1,6 milionu korun na 12–24 měsíců, z toho 1,1 milionu přímá podpora a 500 tisíc nepřímá podpora. Inkubace PLUS je určena pro kapitálově náročnější projekty s podporou až 5 milionů korun.

== Zařazení do zdrojů financování

Dle členění zdrojů financování investic (Valach, 2011, s. 288; přednáška č. 9) lze program Technologická Inkubace klasifikovat následovně. Z časového hlediska se jedná o dlouhodobý zdroj, protože doba inkubace činí 18–24 měsíců. Z vlastnického hlediska jde o vlastní kapitál, neboť dotace představuje dar, který nezvyšuje zadlužení podniku ani nevyžaduje splácení. Z hlediska způsobu získání se jedná o externí zdroj pocházející z veřejných prostředků.

Dotace z programu TI má oproti rizikovému kapitálu několik významných odlišností. Příjemce neztrácí žádnou ekvitu, zatímco VC investoři typicky požadují 15–40 % podíl. Náklad kapitálu je nulový, protože dotaci není třeba splácet ani z ní platit úroky. Očekávaná výnosnost VC fondů se pohybuje mezi 30–40 % ročně. Na druhou stranu program omezuje použití prostředků pouze na nákup služeb, nikoli hardwaru nebo materiálu. Administrativní náročnost je vysoká kvůli povinnosti realizovat výběrová řízení a reportovat čerpání.

== Struktura plateb a cash flow

Finanční prostředky z programu TI nejsou vypláceny jednorázově, ale postupně na základě plnění milníků. První platba ve formě zálohy činí 300 000 Kč a je vyplacena do 30 dnů od podpisu rozhodnutí o poskytnutí podpory. Druhá průběžná platba je poskytnuta po schválení průběžné zprávy a doložení vyčerpání zálohy. Třetí závěrečná platba je vyplacena zpětně (ex-post) až po schválení závěrečné zprávy.

Tato struktura plateb představuje významný praktický problém. Startup musí závěrečnou část projektu předfinancovat z vlastních zdrojů nebo krátkodobého úvěru, než obdrží refundaci. V případě projektu Hastr činí odhadovaná závěrečná platba přibližně 300 000 Kč. Při době čekání na refundaci 2–3 měsíce a případném krátkodobém úvěru s úrokovou sazbou 10 % p.a. by náklad předfinancování činil cca 7 500 Kč. Tento náklad je relativně nízký vzhledem k celkovému objemu podpory, nicméně vyžaduje buď dostupnost vlastních zdrojů, nebo přístup ke krátkodobému financování.

= Finanční hodnocení projektu

== Vstupní data pro výpočty

Pro hodnocení ekonomické efektivnosti projektu Hastr jsou použita následující vstupní data. Kapitálový výdaj odpovídá výši přímé podpory z TI, tedy 1 000 000 Kč. Produkt je prodáván prostřednictvím sítě distributorů za velkoobchodní cenu 4 500 Kč bez DPH. Koncová cena pro zákazníka činí 7 000 Kč s DPH, což distributorům poskytuje marži přibližně 28 %. Variabilní náklady na výrobu jednoho zařízení činí 3 000 Kč a zahrnují komponenty, osazení PCB a balení; tato částka odpovídá současné kusové výrobě a s rostoucím objemem produkce lze očekávat její pokles díky úsporám z rozsahu. Příspěvek na úhradu (marže Resonect) tak činí 1 500 Kč na kus.

Fixní náklady jsou odhadnuty na 3 000 Kč měsíčně, tedy 36 000 Kč ročně. Tyto náklady zahrnují především provoz cloudové infrastruktury. Sazba daně z příjmů právnických osob činí 21 %. Doba hodnocení projektu je stanovena na 3 roky od prvních tržeb, což odpovídá konzervativnímu odhadu životnosti produktu na trhu.

Všechny projekce jsou v běžných (nominálních) cenách. Vliv inflace na peněžní toky se projevuje růstem cen výrobků, ale zároveň růstem nákladů na materiál. U produktu Hastr lze předpokládat, že tyto vlivy se budou vzájemně kompenzovat, proto je výpočet proveden v konstantních cenách bez explicitního zohlednění inflace.

== Stanovení diskontní sazby

Pro stanovení diskontní sazby je použita metoda rizikových tříd dle Valacha (2011, s. 204; přednáška č. 6). Tato metoda kategorizuje investice podle míry rizika a přiřazuje jim odpovídající přirážku k bezrizikové sazbě.

Projekt Hastr spadá do kategorie 5 – nové výrobky na nový trh. IoT hladinoměry pro domácnosti a firmy představují nový produkt vstupující na dosud ne zcela etablovaný trh chytrého vodohospodářství. Tato kategorie odpovídá vysokému riziku s přirážkou 4 procentní body k bezrizikové sazbě.

Bezriziková sazba je odvozena od výnosu desetiletých českých státních dluhopisů a činí přibližně 4 %. Celková diskontní sazba pro hodnocení projektu je tedy stanovena na 8 %.

== Projekce peněžních toků a zdůvodnění předpokladů

Odhad prodejů vychází z realistického scénáře postupného růstu tržního podílu. V prvním roce (2026) je očekáván prodej 100 kusů, následovaný dynamickým růstem na 500 kusů v roce 2027 a 900 kusů v roce 2028.

První rok (2026) představuje testovací provoz na českém trhu s omezeným počtem pilotních zákazníků a distributorů. Od druhého roku je plánována expanze na zahraniční trhy, zejména DACH region (Německo, Rakousko, Švýcarsko), kde je poptávka po IoT řešeních pro vodohospodářství výrazně vyšší. Celkový prodej 1 500 kusů za 3 roky odpovídá konzervativnímu odhadu pro fázi vstupu na trh.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: (left, right, right, right, right, right),
    [*Rok*], [*Prodej (ks)*], [*Tržby*], [*Var. nákl.*], [*Fix. nákl.*], [*Zisk před zd.*],
    [2026], [100], [450 000], [300 000], [36 000], [114 000],
    [2027], [500], [2 250 000], [1 500 000], [36 000], [714 000],
    [2028], [900], [4 050 000], [2 700 000], [36 000], [1 314 000],
  ),
  caption: [Projekce tržeb a nákladů v Kč],
)

Roční peněžní tok je ztotožněn se ziskem po zdanění. Toto zjednodušení je oprávněné ze dvou důvodů. Zaprvé, kapitálový výdaj je tvořen výhradně službami, které se neodepisují. Zadruhé, změny čistého pracovního kapitálu (ČPK) nejsou významné – produkt Hastr je prodáván prostřednictvím sítě distributorů s fakturační lhůtou 30 dnů, avšak vzhledem k postupnému náběhu prodejů není vliv pohledávek na peněžní toky v této fázi významný. Zásoby hotových výrobků jsou minimální díky modelu výroby na zakázku (make-to-order).

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, right, right, right),
    [*Rok*], [*Zisk před zdaněním*], [*Daň 21 %*], [*Čistý peněžní tok*],
    [2026], [114 000], [23 940], [90 060],
    [2027], [714 000], [149 940], [564 060],
    [2028], [1 314 000], [275 940], [1 038 060],
  ),
  caption: [Výpočet ročních peněžních toků v Kč],
)

== Výpočet čisté současné hodnoty

Čistá současná hodnota (ČSH, anglicky NPV) je klíčovým kritériem hodnocení investičních projektů (přednáška č. 3). Projekt je přijatelný, pokud je ČSH kladná, což znamená, že projekt přispívá k růstu tržní hodnoty firmy.

Pro výpočet ČSH je třeba diskontovat budoucí peněžní toky na současnou hodnotu. Odúročitel pro jednotlivé roky při diskontní sazbě 8 % je vypočten jako 1/(1+i)^n.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, right, right, right),
    [*Rok*], [*CF*], [*Odúročitel (8 %)*], [*Diskontované CF*],
    [1], [90 060], [0,9259], [83 389],
    [2], [564 060], [0,8573], [483 591],
    [3], [1 038 060], [0,7938], [824 045],
    [*Σ*], [], [], [*1 391 025*],
  ),
  caption: [Výpočet současné hodnoty peněžních toků],
)

Současná hodnota peněžních toků činí 1 391 025 Kč. Čistá současná hodnota projektu bez uvažování dotace je:

$ "ČSH" = sum_(n=1)^3 "CF"_n / (1+i)^n - K = 1391025 - 1000000 = 391025 "Kč" $

ČSH je kladná, projekt je tedy ekonomicky efektivní a přijatelný.

== Upravená čistá současná hodnota

Upravená čistá současná hodnota (ANPV) zohledňuje finanční důsledky vyplývající z přijetí projektu, včetně poskytnutých dotací. V případě projektu Hastr dotace z programu TI plně pokrývá kapitálový výdaj.

Pro zjednodušení výpočtu je dotace uvažována v plné nominální hodnotě 1 000 000 Kč, bez diskontování podle časového rozložení jednotlivých plateb. Toto zjednodušení je přijatelné, protože většina prostředků (záloha 300 tis. Kč a průběžná platba cca 400 tis. Kč) je vyplacena v prvních měsících projektu, tedy blízko okamžiku zahájení investice.

$ "ANPV" = "ČSH" + "současná hodnota dotace" = 391025 + 1000000 = 1391025 "Kč" $

Alternativně lze ANPV interpretovat tak, že efektivní kapitálový výdaj pro podnik je nulový, protože je plně pokryt dotací. V tom případě ANPV odpovídá současné hodnotě všech budoucích peněžních toků.

Dotace z programu TI tak výrazně zlepšuje ekonomiku projektu a zvyšuje jeho hodnotu o 1 milion korun.

== Vnitřní výnosové procento

Vnitřní výnosové procento (VVP, anglicky IRR) je taková diskontní sazba, při které se ČSH rovná nule (přednáška č. 4). Pro výpočet VVP je použita metoda lineární interpolace.

Nejprve jsou vypočteny ČSH při dvou různých sazbách v okolí předpokládaného VVP:

#figure(
  table(
    columns: (auto, auto),
    align: (center, right),
    [*Diskontní sazba*], [*ČSH*],
    [20 %], [+67 488 Kč],
    [25 %], [-35 467 Kč],
  ),
  caption: [ČSH při různých diskontních sazbách],
)

Pro přesnější výpočet použijeme interpolaci mezi sazbami 20 % a 25 %:

$ "VVP" = i_1 + "ČSH"_1 / ("ČSH"_1 - "ČSH"_2) times (i_2 - i_1) $

$ "VVP" = 20 + 67488 / (67488 - (-35467)) times (25 - 20) $

$ "VVP" = 20 + 67488 / 102955 times 5 = 20 + 3,28 = 23,28 % $

Vnitřní výnosové procento projektu činí přibližně *23,3 %*. Tato hodnota převyšuje požadovanou výnosnost 8 % přibližně 2,9×, což potvrzuje ekonomickou efektivnost projektu.

Pro variantu s dotací (kapitálový výdaj = 0 Kč) nelze VVP vypočítat, protože všechny peněžní toky jsou kladné a rovnice ČSH = 0 nemá řešení. VVP je definováno pouze pro projekty, kde existuje alespoň jedna změna znaménka v řadě peněžních toků.

== Doba návratnosti

Prostá doba návratnosti udává, za jak dlouho se kapitálový výdaj vrátí z kumulovaných peněžních toků.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, right, right),
    [*Rok*], [*CF*], [*Kumulativní CF*],
    [0], [-1 000 000], [-1 000 000],
    [1], [90 060], [-909 940],
    [2], [564 060], [-345 880],
    [3], [1 038 060], [692 180],
  ),
  caption: [Výpočet prosté doby návratnosti],
)

Prostá doba návratnosti:

$ "DN" = 2 + 345880 / 1038060 = 2 + 0,33 = 2,33 "roku" $

Diskontovaná doba návratnosti zohledňuje časovou hodnotu peněz:

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, right, right),
    [*Rok*], [*Diskontované CF*], [*Kumulativní*],
    [0], [-1 000 000], [-1 000 000],
    [1], [83 389], [-916 611],
    [2], [483 591], [-433 020],
    [3], [824 045], [391 025],
  ),
  caption: [Výpočet diskontované doby návratnosti],
)

Diskontovaná doba návratnosti:

$ "DN"_"disk" = 2 + 433020 / 824045 = 2 + 0,53 = 2,53 "roku" $

Kapitálový výdaj se vrátí přibližně za 2,3 roku (prostá DN), respektive 2,5 roku při zohlednění časové hodnoty peněz.

== Index rentability

Index rentability (Profitability Index) vyjadřuje poměr současné hodnoty peněžních toků k současné hodnotě kapitálových výdajů:

$ "PI" = "SH peněžních toků" / "SH výdajů" = 1391025 / 1000000 = 1,39 $

Projekt vytváří 1,39 Kč současné hodnoty na každou investovanou korunu. Index rentability větší než 1 potvrzuje ekonomickou efektivnost projektu.

== Bod zvratu

Bod zvratu představuje takový objem produkce, při kterém se tržby rovnají nákladům.

*Provozní bod zvratu* udává minimální roční prodej pro dosažení provozního zisku:

$ "BZ"_"provozní" = "Fixní náklady" / "Marže na kus" = 36000 / 1500 = 24 "ks/rok" $

Při prodeji více než 24 kusů ročně je projekt provozně ziskový.

*Investiční bod zvratu* udává minimální celkový prodej za dobu životnosti, aby ČSH dosáhla nuly. Výpočtem bylo zjištěno, že pro ČSH = 0 je třeba dosáhnout přibližně 73 % plánovaných prodejů, což odpovídá celkem *1 099 kusů* za 3 roky.

To znamená, že i při nenaplnění prodejních plánů (pokles o 27 %) zůstává projekt ekonomicky efektivní.

== Citlivostní analýza

Citlivostní analýza zkoumá, jak změny klíčových vstupních parametrů ovlivňují výslednou ČSH projektu.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    inset: 7pt,
    align: (left, right, right, right),
    [*Parametr*], [*Změna*], [*ČSH (Kč)*], [*Změna ČSH*],
    [Základní scénář], [0 %], [391 025], [—],
    [Objem prodeje], [-20 %], [98 161], [-74,9 %],
    [Objem prodeje], [+20 %], [683 888], [+74,9 %],
    [Prodejní cena], [-10 %], [-48 270], [-112,3 %],
    [Prodejní cena], [+10 %], [830 320], [+112,3 %],
    [Variabilní náklady], [+15 %], [-48 270], [-112,3 %],
    [Variabilní náklady], [-15 %], [830 320], [+112,3 %],
  ),
  caption: [Citlivostní analýza ČSH na změny klíčových parametrů],
)

Z citlivostní analýzy vyplývá několik důležitých závěrů:

*Projekt je nejcitlivější na změnu prodejní ceny a variabilních nákladů.* Pokles ceny o 10 % nebo růst variabilních nákladů o 15 % způsobí, že ČSH se dostane do záporných hodnot. To je dáno tím, že při relativně nízké marži (1 500 Kč z ceny 4 500 Kč) má změna ceny nebo nákladů proporcionálně větší dopad na zisk.

*Změna objemu prodeje má také výrazný dopad.* Pokles prodejů o 20 % sníží ČSH o 75 %, ale projekt zůstává ekonomicky efektivní (ČSH = 98 161 Kč).

*Citlivostní analýza ukazuje na důležitost cenové politiky* a vyjednávání s dodavateli komponent. Vzhledem k tomu, že s rostoucím objemem výroby lze očekávat pokles variabilních nákladů, reálné riziko záporné ČSH je nižší, než naznačuje statická analýza.

== Citlivost na diskontní sazbu

Vzhledem k tomu, že diskontní sazba 8 % byla stanovena na základě expertního odhadu rizikové přirážky, je vhodné analyzovat citlivost ČSH na změnu této sazby.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (center, right, right),
    [*Diskontní sazba*], [*ČSH (Kč)*], [*Změna oproti 8 %*],
    [6 %], [458 549], [+17,3 %],
    [8 %], [391 025], [—],
    [10 %], [327 948], [-16,1 %],
    [12 %], [268 946], [-31,2 %],
    [15 %], [187 365], [-52,1 %],
  ),
  caption: [Citlivost ČSH na diskontní sazbu],
)

I při výrazném zvýšení diskontní sazby na 15 % (což by odpovídalo velmi vysokému riziku srovnatelnému s požadavky VC investorů) zůstává ČSH kladná. Projekt je tedy robustní i vůči případnému podcenění rizika při stanovení diskontní sazby.

== Scénářová analýza

Na rozdíl od citlivostní analýzy, která zkoumá změnu jednoho parametru při zachování ostatních, scénářová analýza kombinuje změny více parametrů současně a lépe tak zachycuje reálné situace.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, left, right),
    [*Scénář*], [*Předpoklady*], [*ČSH (Kč)*],
    [Optimistický], [+20 % objem, +5 % cena, −5 % var. náklady], [1 123 184],
    [Realistický (základní)], [dle plánu], [391 025],
    [Mírně pesimistický], [−10 % objem], [244 593],
    [Pesimistický], [−20 % objem, −5 % cena, +10 % var. náklady], [−311 848],
  ),
  caption: [Scénářová analýza],
)

*Pesimistický scénář* kombinuje tři nepříznivé faktory: nižší zájem trhu (−20 % objem), nutnost snížit cenu kvůli konkurenci (−5 %) a růst nákladů na komponenty (+10 %). V tomto extrémně nepříznivém scénáři vychází ČSH výrazně záporná (−311 848 Kč), což znamená, že při současném výskytu všech negativních faktorů by projekt nebyl ekonomicky efektivní.

*Mírně pesimistický scénář* s 10% poklesem objemu prodeje vede ke stále kladné ČSH (244 593 Kč), což ukazuje na rozumnou rezervu projektu.

*Optimistický scénář* předpokládá úspěšné přijetí produktu trhem, schopnost udržet prémiovou cenu a úspory z rozsahu při výrobě. V tomto případě by ČSH dosáhla více než 1,1 milionu korun.

Scénářová analýza ukazuje, že projekt je robustní vůči jednotlivým nepříznivým faktorům, ale kombinace více negativních vlivů současně může ohrozit jeho ekonomickou efektivnost. To zdůrazňuje důležitost aktivního řízení rizik a diverzifikace odběratelů.

== Shrnutí výsledků hodnocení

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, right, right),
    [*Ukazatel*], [*Bez dotace*], [*S dotací*],
    [Kapitálový výdaj], [1 000 000 Kč], [0 Kč],
    [ČSH (8 %)], [391 025 Kč], [1 391 025 Kč],
    [VVP], [23,3 %], [N/A#super[1]],
    [Prostá doba návratnosti], [2,33 roku], [okamžitá],
    [Diskontovaná doba návratnosti], [2,53 roku], [okamžitá],
    [Index rentability], [1,39], [N/A],
    [Bod zvratu (celkem za 3 roky)], [1 099 ks], [0 ks],
  ),
  caption: [Souhrn ukazatelů hodnocení efektivnosti],
)

#text(size: 9pt)[#super[1] VVP nelze vypočítat, pokud jsou všechny peněžní toky kladné (není záporný kapitálový výdaj).]

Všechny vypočtené ukazatele potvrzují ekonomickou efektivnost projektu. ČSH je kladná, VVP (23,3 %) převyšuje požadovanou výnosnost téměř 3× a doba návratnosti je kratší než doba hodnocení projektu. Citlivostní analýza ukázala vysokou citlivost na změnu ceny a variabilních nákladů, avšak mírně pesimistický scénář (−10 % objem) vede stále ke kladné ČSH. Scénářová analýza prokázala, že kombinace více negativních faktorů může ohrozit efektivnost projektu, což zdůrazňuje důležitost aktivního řízení rizik.

= Kritické zhodnocení

== Výhody programu Technologická Inkubace

Program TI přináší pro startup Resonect několik významných výhod. Zásadní je zachování 100 % ekvity, kdy zakladatelé neztrácí žádný podíl ve společnosti. Na rozdíl od financování rizikovým kapitálem tak mají plnou kontrolu nad strategickým směřováním firmy.

Náklad kapitálu je nulový, protože dotaci není třeba splácet ani z ní platit úroky. To výrazně zlepšuje ekonomiku projektu, jak bylo demonstrováno v předchozí kapitole – ANPV je o 1 milion korun vyšší než ČSH bez dotace.

Nepřímá podpora ve výši 500 tisíc korun poskytuje přístup k mentoringu, workshopům a konzultacím s odborníky. Tyto služby by si startup jinak musel hradit nebo by k nim neměl přístup vůbec.

Účast v programu TI také zvyšuje kredibilitu projektu. Schválení odbornou komisí představuje určitou validaci podnikatelského záměru, což může usnadnit jednání s dalšími partnery a investory.

== Nevýhody a omezení

Program má také významná omezení. Zásadním je, že podporu lze použít pouze na nákup služeb, nikoli hardwaru nebo materiálu. Pro hardwarový startup jako Resonect to znamená, že nelze přímo financovat výrobu prototypů nebo nákup komponent. Veškeré činnosti musí být nakupovány jako služby od externích dodavatelů.

Administrativní náročnost je značná. Příjemce musí realizovat výběrová řízení podle stanovených pravidel. Pro zakázky od 50 do 500 tisíc korun je nutné získat minimálně tři nabídky. Pro zakázky nad 500 tisíc korun je vyžadováno formální výběrové řízení publikované na portálu NEN. Tato pravidla jsou pochopitelná z hlediska nakládání s veřejnými prostředky, ale výrazně zpomalují realizaci projektu.

Struktura plateb s ex-post závěrečnou platbou vyžaduje předfinancování části projektu z vlastních zdrojů. Jak bylo kvantifikováno v kapitole 3.3, náklad předfinancování činí přibližně 7 500 Kč při využití krátkodobého úvěru, což je relativně nízká částka, ale vyžaduje plánování cash flow.

Doba schvalování žádosti činila v případě Resonectu přibližně 9 měsíců, což je značná nejistota pro plánování.

Po skončení inkubace platí pětiletá povinnost udržitelnosti, během které musí příjemce reportovat výsledky a uchovávat dokumentaci.

== Identifikace rizik projektu

Projekt Hastr čelí několika kategoriím rizik:

*Technologické riziko* spočívá v možném selhání hardwarového vývoje nebo nedosažení požadovaných parametrů. Toto riziko je částečně mitigováno modulární architekturou a využitím dostupných off-the-shelf komponent.

*Tržní riziko* představuje nejistotu ohledně adopce IoT řešení v segmentu vodohospodářství pro domácnosti. Scénářová analýza ukázala, že projekt zůstává ziskový i při kombinaci 20% poklesu prodejů s dalšími nepříznivými faktory. Startup plánuje toto riziko dále snižovat prostřednictvím pilotních projektů a B2B partnerství.

*Cenové riziko* je dle citlivostní analýzy nejvýznamnější. Pokles prodejní ceny o 10 % nebo růst variabilních nákladů o 15 % může vést k záporné ČSH. Je proto nutné pečlivě sledovat konkurenční prostředí, budovat hodnotu značky a optimalizovat výrobní náklady s rostoucím objemem produkce.

*Regulatorní riziko* souvisí s možným nesplněním podmínek programu TI, což by vedlo k povinnosti vrátit dotaci. Průběžná kontrola čerpání a spolupráce s inkubačním manažerem toto riziko minimalizuje.

*Finanční riziko* spočívá v nedostatku cash flow, zejména v období mezi vynaložením nákladů a obdržením refundace. Řešením je kombinace vlastních zdrojů a případně krátkodobého financování.

= Alternativní scénáře financování

Pro zasazení do kontextu je vhodné porovnat zvolené financování z TI s alternativami, které by byly k dispozici, pokud by program neexistoval (Valach, 2011, s. 288; přednáška č. 9).

*Bootstrapping* představuje financování čistě z vlastních zdrojů zakladatelů. Výhodou je zachování ekvity a nulová administrativa. Nevýhodou je omezený objem dostupných prostředků a pomalý růst. Pro studentský tým bez významných úspor je tato varianta reálně dostupná jen v omezeném rozsahu.

*Angel investor nebo fond rizikového kapitálu* by mohl poskytnout rychlejší přístup k většímu objemu prostředků. Nevýhodou je ztráta části ekvity (typicky 10–25 % pro anděla, 15–40 % pro VC) a požadovaný náklad kapitálu 30–40 % ročně formou očekávaného zhodnocení. Dle teorie hierarchického pořádku (přednáška č. 9) firmy preferují interní zdroje před externím vlastním kapitálem.

*Bankovní úvěr* je pro early-stage startup prakticky nedostupný. Banka by požadovala zajištění a historii hospodaření, kterou nově založená firma nemá.

Ve srovnání s těmito alternativami představuje program TI optimální řešení pro financování R&D fáze technologického startupu. Kombinuje dostupnost významného objemu prostředků s nulovým nákladem kapitálu a zachováním plné kontroly zakladatelů nad společností.

= Závěr

Případová studie analyzovala financování vývoje IoT produktu Hastr společnosti Resonect Technology prostřednictvím programu Technologická Inkubace CzechInvest z pohledu investičního rozhodování.

Finanční hodnocení projektu prokázalo jeho ekonomickou efektivnost. Čistá současná hodnota při diskontní sazbě 8 % činí 391 025 Kč bez uvažování dotace, respektive 1 391 025 Kč při zohlednění dotace jako kladného finančního důsledku. Vnitřní výnosové procento dosahuje 23,3 %, což téměř 3× převyšuje požadovanou výnosnost. Doba návratnosti 2,3–2,5 roku je příznivá vzhledem k tříleté době hodnocení. Index rentability 1,39 indikuje, že každá investovaná koruna vytváří téměř jedenapůlnásobnou současnou hodnotu.

Citlivostní analýza prokázala, že projekt je nejcitlivější na změnu prodejní ceny a variabilních nákladů. Analýza citlivosti na diskontní sazbu ukázala robustnost i při výrazném zvýšení rizikové přirážky. Scénářová analýza ukázala, že projekt je robustní vůči jednotlivým nepříznivým faktorům (mírně pesimistický scénář s −10 % objemu vede ke kladné ČSH 244 593 Kč), avšak kombinace více negativních vlivů současně (pesimistický scénář) vede k záporné ČSH, což zdůrazňuje důležitost aktivního řízení rizik. Bod zvratu 1 099 kusů za 3 roky představuje 73 % plánovaných prodejů.

Program Technologická Inkubace se ukázal jako vhodný nástroj pro financování výzkumné a vývojové fáze technologického startupu. Hlavní výhodou je neekvitní charakter podpory, který zakladatelům umožňuje zachovat plnou kontrolu nad společností při nulovém nákladu kapitálu. Dotace efektivně eliminuje kapitálový výdaj a výrazně zlepšuje ekonomiku projektu.

Mezi hlavní nevýhody patří administrativní náročnost spojená s výběrovými řízeními, omezení použití prostředků pouze na služby a nutnost předfinancování části projektu (odhadovaný náklad cca 7 500 Kč). Tyto nevýhody jsou však vyváženy přínosy programu.

Pro podobné projekty lze doporučit důkladné prostudování podmínek před podáním žádosti, přípravu na dlouhou dobu schvalování, zajištění zdrojů pro předfinancování závěrečné platby a maximální využití nepřímé podpory v podobě mentoringu a konzultací.

#v(1cm)

#align(center)[
  #block(
    inset: 12pt,
    width: 85%,
  )[
    _Tato případová studie vychází z reálných zkušeností autora jako zakladatele společnosti Resonect Technology s.r.o. a účastníka programu Technologická Inkubace._
  ]
]

#pagebreak()

= Literatura

HRDÝ, M. – STAŇKOVÁ, A. _Dlouhodobý finanční management._ 2. vydání. Praha: Wolters Kluwer ČR, 2023. 172 s. ISBN 978-80-7676-470-5.

VALACH, J. a kol. _Investiční rozhodování a dlouhodobé financování._ 3. vydání. Praha: Ekopress, 2011. 513 s. ISBN 978-80-86929-71-2.

Přednášky z předmětu 1FP402 Investiční rozhodování a dlouhodobé financování. VŠE Praha, Fakulta financí a účetnictví, 2025.

CzechInvest. _Technologická inkubace._ Dostupné z: https://technologickainkubace.org/

Interní dokumenty společnosti Resonect Technology s.r.o. – Inkubační plán projektu Hastr, 2024.
