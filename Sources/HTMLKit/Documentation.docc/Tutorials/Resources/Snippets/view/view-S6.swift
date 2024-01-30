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
            }
            Body {
                Heading1("greeting.world")
            }
        }
    }
}
