import HTMLKit
import Foundation

struct SampleContext {
    
    var id: Int
    var title: String
    var excerpt: String
    var modified: Date
    var posted: Date
}

struct SamplePage: Page {

    var content: [BodyElement]
    
    init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }

    var body: AnyContent {
        Document(type: .html5)
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

struct SampleView: View {
    
    @TemplateValue(SampleContext.self) var context
    
    var body: AnyContent {
        SamplePage {
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
                SampleComponent()
            }
            Footer {
                Paragraph {
                    context.modified.style(date: .full, time: .full)
                }
            }
        }
    }
}

struct SampleComponent: Component {
 
    var body: AnyContent {
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
