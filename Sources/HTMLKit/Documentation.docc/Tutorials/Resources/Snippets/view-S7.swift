import HTMLKit
import HTMLKitComponents

struct ExampleView: View {

    var body: Content {
        Card {
            Heading1("greeting.person", interpolation: "John Doe")
        }
        .borderShape(.smallrounded)
    }
}
