# Getting started

Learn how to use the framework.

> Important: The framework requires Swift 5.6 or higher. 

### Manifest

To use the the framework in your project you need to add it to the package manifest first.

```swift
let package = Package(
    ...
    dependencies: [
        // 1. Add the package
        .package(url: "https://github.com/vapor-community/HTMLKit.git", from: "2.8.0"),
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

Import the module in one of your files next.
