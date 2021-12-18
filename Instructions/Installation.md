# Installation

## Essential

### Packages

Add the packages as dependecies to your package.

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

## Vapor 3

Check the [provider](https://github.com/vapor-community/htmlkit-vapor-provider) to learn more about supporting Vapor 3.
