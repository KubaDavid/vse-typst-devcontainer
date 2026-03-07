#import "template/lib.typ": vse-thesis, code-figure

#show: vse-thesis.with(
  title: "Název práce",
  author: "Bc. Jan Novák",
  submission-date: "květen 2026",
  supervisor: "doc. Ing. Jana Nováková, Ph.D.",
  study-program: "Aplikovaná informatika",
  specialization: "Softwarové inženýrství",
  thesis-type: "BP",
  language: "cze",
  consultant: "Ing. Petr Svoboda, Ph.D.",
  acknowledgements: [
    Rád bych poděkoval vedoucí práce doc. Ing. Janě Novákové, Ph.D. za cenné
    rady a připomínky při zpracování této práce.
  ],
  ai-declaration: [
    Při zpracování předložené práce *nebyly použity* žádné nástroje umělé
    inteligence.
  ],
  abstract-cz: [
    Tato práce se zabývá problematikou návrhu a implementace informačního
    systému pro správu dokumentů. V~teoretické části jsou analyzovány existující
    přístupy k~řešení dané problematiky. Praktická část obsahuje návrh
    a~implementaci prototypu systému s~využitím moderních technologií.
  ],
  abstract-en: [
    This thesis deals with the design and implementation of an information
    system for document management. The theoretical part analyzes existing
    approaches to solving the given problem. The practical part contains the
    design and implementation of a system prototype using modern technologies.
  ],
  keywords-cz: "informační systém, správa dokumentů, webová aplikace, návrh systému",
  keywords-en: "information system, document management, web application, system design",
  bibliography-file: "references.bib",
  show-list-of-figures: false,
  show-list-of-tables: false,
)

= Úvod

Tato kapitola obsahuje motivaci pro zpracování práce, její cíle a stručný
přehled metodiky. Úvod by měl čtenáře uvést do kontextu řešené problematiky
a~jasně definovat, čeho chce práce dosáhnout.

Cílem práce je navrhnout a implementovat prototyp informačního systému pro
správu dokumentů, který bude splňovat požadavky definované v~zadání práce.

== Struktura práce

Práce je rozdělena do následujících kapitol. V~první kapitole jsou uvedena
teoretická východiska. Druhá kapitola se zabývá analýzou požadavků. Třetí
kapitola popisuje návrh řešení a čtvrtá kapitola obsahuje implementaci
prototypu.

= Teoretická východiska

Tato kapitola shrnuje teoretické základy, na kterých práce staví. Jsou zde
popsány klíčové koncepty a existující přístupy k~řešení dané problematiky.

== Správa dokumentů

Správa dokumentů (anglicky _Document Management_) je proces organizace,
ukládání a vyhledávání elektronických dokumentů. Podle @Pecakova2018 je
důležité zvolit vhodný přístup k~organizaci dat.

== Webové technologie

Moderní webové aplikace využívají architekturu klient-server a komunikují
prostřednictvím protokolu HTTP. Pro vývoj serverové části se často používají
frameworky jako Django, Express.js nebo Spring Boot.

#figure(
  table(
    columns: 3,
    table.header(
      [*Technologie*], [*Jazyk*], [*Typ*],
    ),
    [Django], [Python], [Full-stack],
    [Express.js], [JavaScript], [Backend],
    [Spring Boot], [Java], [Backend],
    [React], [JavaScript], [Frontend],
  ),
  caption: [Přehled vybraných webových technologií],
) <tab-technologie>

V~@tab-technologie je uveden přehled vybraných webových technologií, které byly
zvažovány pro implementaci prototypu.

= Analýza a návrh

Na základě teoretických východisek byla provedena analýza požadavků a navržena
architektura systému.

== Funkční požadavky

Systém musí splňovat následující funkční požadavky:

- Správa uživatelských účtů
- Nahrávání a stahování dokumentů
- Fulltextové vyhledávání v~dokumentech
- Verzování dokumentů
- Řízení přístupových práv

== Nefunkční požadavky

Mezi nefunkční požadavky patří:

+ Doba odezvy systému do 2~sekund
+ Dostupnost minimálně 99,5~%
+ Podpora současného přístupu minimálně 100~uživatelů

= Závěr

V~této práci byl navržen a implementován prototyp informačního systému pro
správu dokumentů. Hlavní přínos práce spočívá v~návrhu architektury systému,
která umožňuje snadné rozšíření o~další funkcionality.
