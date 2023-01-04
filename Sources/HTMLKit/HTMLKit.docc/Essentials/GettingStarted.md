# Getting started

Learn how to use the framework.

> Important: The framework requires Swift 5.7 or higher. 

### Manifest

To use the the framework in your project you need to add it to the package manifest first.

```swift
let package = Package(
    ...
    dependencies: [
        // 1. Add the package
        .package(url: "https://github.com/vapor-community/HTMLKit.git", from: "3.0.0"),
    ],
    targets: [
        .target(
            ...
            dependencies: [
                /// 2. Add the product
                .product(name: "HTMLKit", package: "HTMLKit"),
            ]
        ),
        ...
    ]
)
```

### Imports

Import one of the modules, by using the import declaration in one of your files next.

```swift
/// Loads the html abstraction
import HTMLKit

/// Loads the component library
import HTMLKitComponents

/// Loads the vapor intergration
import HTMLKitVapor
```
