import HTMLKit
import Foundation

struct SampleContext {
    
    var id: Int
    var title: String
    var excerpt: String
    var modified: Date
    var posted: Date
}

struct SamplePage: View {

    var content: [BodyElement]
    
    init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
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

struct SampleView: View {
    
    var context: SampleContext
    
    var body: Content {
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
                    context.modified
                }
            }
        }
    }
}

struct SampleComponent: View {
 
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

struct MarkdownView: View {
    
    var context: SampleContext
    
    var body: Content {
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
                Section {
                    Heading1 {
                        "Heading1"
                    }
                    Paragraph {
                        "**This text is _extremely_ important.**"
                    }
                }
            }
            Footer {
                Paragraph {
                    context.modified
                }
            }
        }
    }
}
