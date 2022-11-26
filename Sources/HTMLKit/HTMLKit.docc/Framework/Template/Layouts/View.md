# ``HTMLKit/View``

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
}

A view is a single part of a page. You create a view by declaring a type that conforms to the View protocol.

```swift
struct ExampleView: View {

    var body: AnyContent {
        Heading1 {
            "Lorem ipsum..."
        }
    }
}
```
