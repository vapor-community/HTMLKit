# Context

Add data to your template.

## Overview

The context holds the data for the content variables, wich get replaced when the template is evaulated.

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

## Topics

### Annotations

- ``HTMLKit/TemplateValue``
