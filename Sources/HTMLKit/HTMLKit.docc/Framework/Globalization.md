# Globalization

Localize your content for a wider audience.

## Overview

The framework uses the localization framework [Lingo](https://swiftpackageindex.com/miroslavkovac/Lingo) to translate and formate the content by  local language and culture.

### Configure

Before you can use the localization, you need to set it up in the *configure.swift* file of your Vapor project:

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
    "Hallo Welt": "Hello World"
}
```

## Topics

### Localization

- <doc:Localization>
