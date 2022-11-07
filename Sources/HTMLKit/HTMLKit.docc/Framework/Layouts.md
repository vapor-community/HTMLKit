# Template

Scaffold the content


## Overview

You can embed the view in the page structure.

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

You can extend the page in the view structure.

```swift
struct IndexView: View {

    var body: AnyContent {
        SimplePage {
            Heading1 {
                "Hello World!"
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
