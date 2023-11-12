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
                Heading1("greeting.person", interpolation: "John Doe")
                Script {
                }
                .source("/htmlkit/all.js")
            }
        }
    }
}
