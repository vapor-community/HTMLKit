# Installation

## Essential

### Packages

Add the packages as dependecies to your package. The provider is the bridge between `HTMLKit` and `Vapor`.

```swift
/// [Package.swift]

...
dependencies: [
    ...
    .package(name: "HTMLKit", url: "https://github.com/vapor-community/HTMLKit.git", from: "2.4.0"),
    .package(name: "HTMLKitVaporProvider", url: "https://github.com/MatsMoll/htmlkit-vapor-provider.git", from: "1.1.0")
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
