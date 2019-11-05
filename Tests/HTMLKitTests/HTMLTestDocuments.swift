import HTMLKit

struct MenuLink: HTMLProperty {
    let name: String
    let link: String
}

struct Properties: HTMLProperty {
    var links: [MenuLink]
}

let context = HTMLContext<Properties>()

@available(OSX 10.15.0, *)
struct AMMenu: HTML {
    var html: some HTML {
        Nav {
            context.links.forEach { link in
                A {
                    link.name
                }.href(link.link).class("selected")
            }
        }.id("menu")
    }
}

@available(OSX 10.15.0, *)
let page = Root {
    Head {
        Title("Welkom bij Autimatisering")
        Meta.charset(.utf8)
        Meta.viewport(content: "width=device-width, initial-scale=1")
        Link.stylesheet("https://autimatisering.nl/styles/template.css")
        Link.stylesheet("https://autimatisering.nl/styles/content.css")
    }
    Body {
        Header {
            Img(src: "https://autimatisering.nl/img/AMLogo-Full-White.svg")
                .id("logo")
        }
        
        AMMenu()
//        Header {
//            
//        }
    }
}

//<!DOCTYPE html>
//<html lang="nl">
//
//    <head>
//        <link rel="icon" sizes="16x16 32x32" type="image/png" href="img/favicon.png"/>
//        <link rel="icon" sizes="180x180" href="img/favicon-mobile.png">
//        <link rel="apple-touch-icon" href="img/favicon-mobile.png">
//    </head>
//
//    <body>
//
//        <!-- Logo -->
//        <header>
//            <img id="logo" src="https://autimatisering.nl/img/AMLogo-Full-White.svg" alt="" />
//        </header>
//
//        <!-- Menu -->
//        <nav id="menu">
//            <a href="index.html" class="selected">WELKOM</a>
//            <a href="overons.html" class="">WIE WIJ ZIJN</a>
//            <a href="watwijdoen.html" class="">WAT WIJ DOEN</a>
//            <a href="contact.html" class="">CONTACT</a>
//        </nav>
//
//        <!-- Header/intro -->
//        <header>
//            <section id="banner-image-container">
//                <embed id="banner-image" src="./styles/svg/pagehead-img-home.svg" />
//            </section>
//
//            <article id="banner-text">
//                <h1 id="banner-text-title">WELKOM</h1>
//                <p id="banner-text-body">
//                    Wij zijn een jonge non-profit organisatie die zich richt op het helpen van personen
//                    met een afstand tot de arbeidsmarkt, deze te verkleinen. Gedurende een 8-tal jaar is
//                    er op dit gebied veel ervaring opgedaan wat resulteert is een directe en zo praktisch
//                    mogelijke aanpak. Binnen de wereld van de computers is er veel te doen waar onze doelgroep
//                    een reuze affiniteit heeft. Onze aanpak is gericht op een veilige en zo praktisch mogelijke
//                    manier te leren binnen een dagbesteding en dat wat geleerd is toe te passen in de praktijk.
//                    Natuurlijk is er binnen onze stichting veel inhoudelijke kennis aanwezig op gebied van
//                    programmeren, networking & security.
//                </p>
//            </article>
//
//            <!-- Decorative triangle -->
//            <section id="angle"></section>
//        </header>
//
//
//
//        <!-- Main content -->
//        <section id="wrapper">
//
//            <!-- Intro text -->
//            <article class="center-content">
//                <h1>Welkom bij Stichting Autimatisering</h1>
//                <p>
//                    Fijn dat je ons hebt gevonden. Wij zijn een non-profit stichting die zich inzet voor jongeren met een blik naar de toekomst maar met
//                    helaas een afstand tot de arbeidsmarkt. Dit is vaak een vervelende moeilijk te doorbreken situatie voor jou en je omgeving.
//                    Wij helpen hierbij door op een zo praktisch mogelijke manier invulling te gaan geven aan iemands bestaan.
//                    Door middel van een programma wat 3 maanden duurt leer jij (en ook wij) wat je nu echt leuk vind aan ict.
//                    We behandelen hardware, software, design, communicatie, organiseren, calculeren en security.
//                    Als er ergens in dit programma blijkt dat er een match ontstaat gaan we met jou die richting op,
//                    de diepte in. Zo raak je gemotiveerd en zet je concrete stappen richting een betere toekomst.
//                </p>
//            </article>
//
//
//            <!-- Quote -->
//            <section class="quote">
//                <img src="img/seperator.png" alt=""><br />
//                <span>“Leren en lesgeven, verzinnen en maken, bij Autimatisering doen we het allemaal”</span>
//            </section>
//
//
//            <!-- Three blocks of text -->
//            <section class="grid grid-triple" id="home-grid-triple">
//
//                <!-- Block the first -->
//                <article class="grid-block-left grid-block">
//                    <h3>Wie wij zijn</h3>
//                    <p>
//                        Wij zijn geen zorg professionals. Wij zijn pragmatische ingestelde, ict-minnende mensen met ieder onze eigen specialisaties. Verder hebben we allemaal als persoonlijke eigenschap dat we gelukkig worden van het helpen van andere mensen. Zo kunnen we van elkaar leren en elkaar naar een hoger niveau tillen.
//                    </p>
//                    <a class="item-link" href="overons.html"> Klik hier om verder te lezen.</a>
//                </article>
//
//                <!-- Block the middlest block -->
//                <article class="grid-block-middle grid-block">
//                    <h3>Wat wij doen</h3>
//                    <p>
//                        Dagopvang, lesgeven, ontwerpen, logo's, apps, websites. Zoek je nog een team die iets gaafs voor je kunnen maken?
//                        Wil je bij onze dagopvang komen zitten en leren over allerlei slimme dingen?
//                        Heb je een basisschool en zoek je nog programmeer lessen?
//                    </p>
//                    <a class="item-link" href="watwijdoen.html"> Lees dan hier meer over wat wij doen.</a>
//                </article>
//
//                <!-- Block the final block block -->
//                <article class="grid-block-right grid-block">
//                    <h3>Nu al enthousiast?</h3>
//                    <p>
//                        Ben je nu al enthousiast over wat wij doen? Neem dan hier contact op met ons, we praten graag met je over alle gave
//                        ideeën die je allemaal hebt verzonnen.
//                        <br /><br />Wil je ons meehelpen allerlei gave dingen te bouwen en leren? Neem dan ook contact met ons op, wij zijn altijd opzoek naar
//                        mensen die onze visie delen.
//                    </p>
//                    <a class="item-link" href="contact.html"> Neem contact met ons op.</a>
//                </article>
//            </section>
//        </section>
//
//
//
//        <!-- Footer -->
//        <footer class="footer">
//            <nav class="footer-nav">
//                <span>STICHTING AUTIMATISERING</span>
//                <span>Schootsestraat 124a, 5616 RG Eindhoven</span>
//                <span>Contact: <a href="mailto:hoi@autimatisering.nl">hoi@autimatisering.nl</a></span>
//                <span>KvK: 67802346 </span>
//                <a href="https://autimatisering.nl/static/algemene-voorwaarden-2017.pdf">Algemene Voorwaarden ></a>
//                <a href="https://selfservice.autimatisering.nl/">WiCCS Selfservice ></a>
//            </nav>
//            <div class="backtotop" onclick="back_to_top();">BACK TO TOP</div>
//            <div class="copyright">COPYRIGHT AUTIMATISERING</div>
//        </footer>
//
//        <!-- JS  -->
//        <script>
//            function back_to_top() {
//                var scrollStep = -window.scrollY / 16,
//                scrollInterval = setInterval(function(){
//                    if ( window.scrollY != 0 )
//                        window.scrollBy( 0, scrollStep );
//                    else
//                        clearInterval(scrollInterval);
//                },15);
//            }
//        </script>
//    </body>
//</html>
