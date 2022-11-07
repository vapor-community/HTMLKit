# Globalization

Localize the content.

## Overview

> Note: The chapter is only, when you use the vapor framework. 

The framework uses the framework [Lingo](https://github.com/miroslavkovac/Lingo) to translate and formate the content by the local language and culture.

### Configure

The localization is optional. If you want to use it, you need to set it up in the file *configure.swift* of your Vapor project:

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

### Definition

In order to make the template translatable, you have to create a file. 

```json
{
    "Hallo.Welt": "Hello World"
}
```

## Topics

### Localization

- <doc:Localization>
