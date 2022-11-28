# Layouts

Embed or extend views to create a layout.


## Overview

There will be situations, where you would like to use certain views at multiple places in your project and that's where the layout system comes in handy. You can embed the view in another or extend the view to be used for a different view.

### Embed the view

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

### Extend the page

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

### Layouts

- <doc:Page>
- <doc:View>
