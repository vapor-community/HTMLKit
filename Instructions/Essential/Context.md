# Context

The context is

## Essential

### Definition

```swift
/// [SimpleContext.swift]

struct SimpleContext: Codable {
    
    var headline: String
    var categories: [Category]
}
```

```swift
/// [SimpleView.swift]

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
