# EnvironmentObject

Summary

## Overview

```swift
struct MainView: View {

    var body: Content {
        Division {
            "Lorem ipsum..."
        }
        .environment(object: Object())
    }
}
```

```swift
struct ChildView: View {

    @EnvironmentObject(Object.self) 
    var object

    var body: Content {
        MainView {
            Paragraph {
                object.property
            }
        }
    }
}
```
