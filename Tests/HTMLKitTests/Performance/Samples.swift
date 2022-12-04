import HTMLKit
import Foundation

struct SampleContext: Codable  {
    
    var id: Int
    var title: String
    var excerpt: String
    var modified: Date
    var posted: Date
}

struct MainView: View {

    var content: [Content]
    
    init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }

    var body: Content {
        Document(.html5)
        Html {
            Head {
                Meta()
                    .charset(.utf8)
                Meta()
                    .name(.viewport)
                    .content("width=device-width, initial-scale=1.0")
                Title {
                    "TestTemplatePage"
                }
                Link()
                    .relationship(.stylesheet)
                    .reference("/css/site.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("/bootstrap/css/all.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("/fontawesome/css/all.css")
            }
            Body {
                content
            }
        }
    }

}

struct ChildView: View {
    
    @TemplateValue(SampleContext.self)
    var context
    
    var body: Content {
        MainView {
            Header {
                Heading1 {
                    context.title
                }
                Heading3 {
                    context.excerpt
                }
            }
            Navigation {
                UnorderedList {
                    ListItem {
                        Anchor {
                            "Item"
                        }
                        .reference("#")
                    }
                    ListItem {
                        Anchor {
                            "Item"
                        }
                        .reference("#")
                    }
                    ListItem {
                        Anchor {
                            "Item"
                        }
                        .reference("#")
                    }
                    ListItem {
                        Anchor {
                            "Item"
                        }
                        .reference("#")
                    }
                    ListItem {
                        Anchor {
                            "Item"
                        }
                        .reference("#")
                    }
                }
            }
            Main {
                ComponentView()
            }
            Footer {
                Paragraph {
                    context.modified.style(date: .full, time: .full)
                }
            }
        }
    }
}

struct ComponentView: Component {
 
    var body: Content {
        Section {
            Heading1 {
                "Heading1"
            }
            Paragraph {
                "Paragraph"
            }
        }
    }
}
