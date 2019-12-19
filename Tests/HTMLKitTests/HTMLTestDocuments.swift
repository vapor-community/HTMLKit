import HTMLKit
import Foundation

struct MenuLink {
    let name: String
    let link: String
}

struct Properties {
    var header: Bool
    var links: [MenuLink]
    var text: String
    let runningAt: Date
}

let context = HTMLContext(Properties.self)

@available(OSX 10.15.0, *)
struct AMMenu: HTML {
    func applyStyle(to css: inout CSS) {
        // Has default implementation as nothing
        
    }
    
    var html: some HTML {
        Nav {
            context.links.forEach { link in
                A {
                    link.name
                }
                .class("selected")
                .href(link.link)
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
        IF(context.header) {
            Header {
                Img(src: "https://autimatisering.nl/img/AMLogo-Full-White.svg")
                    .id("logo")
            }
        }
        .else(if: context.text != "Test") {
            A {
                "Tap here"
            }
            .href("Some value")
        }
        .else {
            "None of them"
        }
        
        AMMenu()
        Header {
            Section {
                Embed().src("https://autimatisering.nl/styles/svg/pagehead-img-home.svg")
            }.id("banner-image-container")
            
            Article {
                H1 {
                    "WELKOM"
                }.id("banner-text-title")

                P {
                    context.runningAt
                        .formatted(date: .short, time: .short)
                }
                .enviroment(locale: "nb")

                P {
                    context.runningAt
                        .formatted(date: .short, time: .short)
                }
                .enviroment(locale: "en")
                
                P {
                    context.text
                    context.text
                    context.text
                    context.text
                }.id("banner-text-body")
            }.id("banner-text")
            
            Section().id("angle")
        }
    }
}
