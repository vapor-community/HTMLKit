# Localization

Use localization

## Overview

HTMLKit can render your content in different languages by using Localization.

### Registration

The localization is optional, so if you want to use it, you need to register it first. Pass the directory path and the local identifier to the renderer. Keep in mind, that the directory path is the root directory where your localization files are located.

```swift
try app.htmlkit.renderer.registerLocalization(atPath: path, defaultLocale: "en")
```

### Definition

Define your localizations in a .json file. If you want to get to know more about definitions, take a a look at the [Lingo library](https://github.com/miroslavkovac/Lingo#usage).

```json
{
    "Hallo.Welt": "Hello World"
}
```

### Implementation

You can retrieve the definition by calling the localized initialiser of a localizable element. Most of the phrasing elements in HTMLKit should be localizable and provide you with the specific initialiser. Please [open an issue](https://github.com/vapor-community/HTMLKit/issues), if you find an element without it.

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
```
