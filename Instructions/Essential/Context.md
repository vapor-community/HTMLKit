# Context

The context is

## Essential

### Definition

```swift
/// [IndexContext.swift]

struct IndexContext {
    
    var headline: String
    var categories: [Category]
}
```

```swift
/// [SimpleView.swift]

struct SimpleView: View {

    var context: TemplateValue<IndexContext>

    var body: AnyContent {
        Heading1 {
            context.headline
        }
    }
}
```
