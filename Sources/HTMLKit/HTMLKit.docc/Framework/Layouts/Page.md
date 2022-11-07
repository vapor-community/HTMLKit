# ``HTMLKit/Page``

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
}

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
