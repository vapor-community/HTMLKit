# Context

## Overview

```swift
struct SimpleContext: Codable {
    
    var headline: String
    var categories: [Category]
}
```

```swift
struct SimpleView: View {

    @TemplateValue(SimpleContext.self)
    var context

    var body: AnyContent {
        Heading1 {
            context.headline
        }
    }
}
```
