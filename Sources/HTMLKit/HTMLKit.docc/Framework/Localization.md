# Localization

Localize your content for a wider audience.

## Overview

The framework uses the localization framework [Lingo](https://swiftpackageindex.com/miroslavkovac/Lingo) to translate and formate the content by  local language and culture.

### Configure

Before you can use the localization, you need to set up the directory path for the message files and the default language in the *configure.swift* file of your Vapor project.

```swift
import HTMLKitVapor
import Vapor

public func configure(_ app: Application) throws {

    /// 1. Specify the directory path
    app.htmlkit.lingo.set(directory: currentDirectory)

    /// 2. Specify the default language
    app.htmlkit.lingo.set(locale: .english)

    try routes(app)
}
```

### Message file

Next you have to create a message file (for example en.json), wich contains the the translations strings for the given language.

```json
{
    "greeting.world": "Hello World",
    "greeting.person": "Hello %{name}"
}
```

### String key

Then you can use the string key on a paragraph element to get the localized string.

```swift
struct IndexView: View {

    var body: AnyContent {
        Article {
            Heading1("greeting.world")
        }
    }
}
```

### String interpolation

Or interpolate the localized string.

```swift
struct IndexView: View {

    var body: AnyContent {
        Article {
            Heading1("greeting.person", with: ["name": "Tim Cook"])
        }
    }
}
```
