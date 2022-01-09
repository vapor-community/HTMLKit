# Installation

## Requirements

The requirements are

## Configuration

### Packages

To use HTMLKit in your project, you have to add the packages as dependecies first. Be sure to add it to your desired targets as well.

```swift
/// [Package.swift]

...
dependencies: [
    ...
    .package(name: "HTMLKit", url: "https://github.com/vapor-community/HTMLKit.git", from: "2.4.0"),
    .package(name: "HTMLKitVaporProvider", url: "https://github.com/vapor-community/htmlkit-vapor-provider.git", from: "1.2.1")
],
targets: [
    .target( 
    ...
        dependencies: [
            ...
            .product(name: "HTMLKit", package: "HTMLKit"),
            .product(name: "HTMLKitVaporProvider", package: "HTMLKitVaporProvider")
        ]
    ),
    ...
```

From time to time you want to update the packages. You can do it, by changing the version tags manually and saving it. You find the current version tag in the [release history](https://github.com/vapor-community/HTMLKit/releases). We recommand to read the release description first, to understand the possible changes.

### Import

Use the import keyword to load the module in your project files.

```swift
/// [SimpleTemplate.swift]

import HTMLKit
...
```

## Compatibiltiy

### Vapor 3

Check the [provider](https://github.com/vapor-community/htmlkit-vapor-provider) to learn more about supporting Vapor 3.
