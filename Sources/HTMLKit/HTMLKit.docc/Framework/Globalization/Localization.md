# ``HTMLKit/Localization``

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
}

```swift
struct IndexView: View {

    var body: AnyContent {
        Article {
            Heading1("Hallo.Welt")
        }
    }
}
```

Also the locale for the environment can be changed for example by user input. Use the environment modifier on the element and pass the specific local identifier for it.

```swift
struct IndexView: View {

    struct Context {
        let date: Date
        let locale: String
    }

    var body: AnyContent {
        Article {
            ...
        }
        .environment(locale: context.locale)
    }
}
