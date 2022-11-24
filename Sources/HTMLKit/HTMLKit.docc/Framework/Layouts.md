# Template

Embed or extend views to create templates.


## Overview

There will be situations, where you would like to use certain views at multiple places in your project and that's where the template systems comes in handy. You can embed the view in another or extend the view to be used for a different view.

```swift
struct SimplePage: Page {

    var body: AnyContent {
        Document(type: .html5)
        Head {
            Title {
                "SimplePage"
            }
        }
        Body {
            SimpleView(context: "Hello World!")
        }
    }
}
```

```swift
struct SimpleView: View {

    var context: String

    var body: AnyContent {
        SimplePage {
            Heading1 {
                context
            }
        }
    }
}
```

## Topics

### Template layouts

- <doc:Page>
- <doc:View>
- <doc:Component>

### Template value

- <doc:Context>
