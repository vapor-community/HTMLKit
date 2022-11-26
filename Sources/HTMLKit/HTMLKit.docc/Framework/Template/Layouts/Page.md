# ``HTMLKit/Page``

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
}

A page is a container that holds the views. You create a page by declaring a type that conforms to the Page protocol.

```swift
struct ExamplePage: Page {

    var body: AnyContent {
        Document(.html5)
        Html {
            Head {
                Title {
                    "ExamplePage"
                }
            }
            Body {
            }
        }
    }
}
```
