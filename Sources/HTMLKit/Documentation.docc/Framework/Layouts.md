# Layouts

Embed or extend views to create a layout.


## Overview

There will be situations, where you would like to use certain views at multiple places in your project and that's where the layout system comes in handy. You can embed the view in another or extend the view to be used for a different view.

### Embed a view

Embed a view by calling an another view in the content body.

```swift
struct ChildView: View {

    var body: Content {
        Paragraph {
            "Hello World!"
        }
    }
}
```

```swift
struct MainView: View {

    var body: Content {
        Document(.html5)
        Head {
            Title {
                "MainView"
            }
        }
        Body {
            /// 1. Embed the child view
            ChildView()
        }
    }
}
```

### Extend a view

Extend a view by using the trailing closure of a view.

```swift
struct MainView: View {

    var content: [BodyElement]

    init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content
    }

    var body: Content {
        Document(.html5)
        Head {
            Title {
                "MainView"
            }
        }
        Body {
            content
        }
    }
}
```

```swift
struct ChildView: View {

    var body: Content {
        /// 1. Extend the main view
        MainView {
            Paragraph {
                "Hello World!"
            }
        }
    }
}
```

## Topics

### Layouts

- <doc:View>
