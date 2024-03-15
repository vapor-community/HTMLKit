import HTMLKit
import HTMLKitComponents

struct ExampleView: View {

    var body: Content {
        Document(.html5)
        Html {
            Head {
                Title {
                    "Example"
                }
                Link()
                    .relationship(.stylesheet)
                    .reference("/htmlkit/all.css")
                Script {
                }
                .source("/htmlkit/query.js")
            }
            Body {
                Card {
                    Heading1("greeting.world")
                }
                Script {
                }
                .source("/htmlkit/all.js")
            }
        }
    }
}
