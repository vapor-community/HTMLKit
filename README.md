# HTMLKit

Render dynamic HTML templates in a typesafe and performant way! By using Swift's powerful language features and a pre-rendering algorithm, HTMLKit will render insanely fast templates but also catch bugs that otherwise might occur with other templating options.

## Getting Started

### Installation

Add the packages as dependecies and targets to your package file.

```swift
/// [Package.swift]

...
dependencies: [
    ...
    ///1. Add the packages
    .package(name: "HTMLKit", url: "https://github.com/vapor-community/HTMLKit.git", from: "2.4.0"),
    .package(name: "HTMLKitVaporProvider", url: "https://github.com/vapor-community/htmlkit-vapor-provider.git", from: "1.2.1")
],
targets: [
    .target( 
    ...
        dependencies: [
            ...
            /// 2. Add the products
            .product(name: "HTMLKit", package: "HTMLKit"),
            .product(name: "HTMLKitVaporProvider", package: "HTMLKitVaporProvider")
        ]
    ),
    ...
```

Read the [installation instructions](https://github.com/vapor-community/HTMLKit/blob/main/Instructions/Installation.md) for more information.

### Definition

Create a new file in your project. Add the import at the top of your file and declare a new structure. Extend your structure by adding a [layout definition](https://github.com/vapor-community/HTMLKit/blob/main/Instructions/Essential/Layouts.md) to adopt the required properties and methods. Add your content to the `body` property.

```swift
/// [SimplePage.swift]

/// 1. Add the import
import HTMLKit

/// 2. Define a new structure
struct SimplePage: Page {

    /// 3. Add some content
    var body: AnyContent {
        Document(type: .html5)
        Html {
            Head {
                Title { 
                    "SimplePage"
                }
            }
            Body {
                Paragraph {
                    "Hello World!"
                }
            }
        }
    }
}
```

### Implementation

Call the structure you have created in your controller handler and use the render method to render the view for the request.

```swift
/// [SimpleController.swift]

...
final class SimpleController {
    ...
    func getPage(req: Request) throws -> EventLoopFuture<View> {
        /// 1. Call the structure
        return SimplePage().render(for: req)
    }
    ...
}
```

## Features

### Localization

### Conversion

### Validation

## Resources

### Instructions

See the [instructions](https://github.com/vapor-community/HTMLKit/blob/main/Instructions/Overview.md) to learn more about the library and the features.
