# Getting started

Learn how to use it.

### Requirements

HTMLKit requires Swift 5.6 or higher.

### Installation

To use HTMLKit in your project, you have to add the package as dependency to your package description first. Be sure to add it as your desired targets as well.

```swift
let package = Package(
    ...
    dependencies: [
        // 1. Add the package
        .package(url: "https://github.com/vapor-community/HTMLKit.git", from: "2.6.0"),
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

From time to time you want to update the package. You can do it, by changing the version tag manually and saving it. You find the current version tag in the [release history](https://github.com/vapor-community/HTMLKit/releases). We recommand to read the release description first, to understand the possible changes.

### Usage

Use the import keyword to load the module in your project files.

```swift
import HTMLKit
...
```
