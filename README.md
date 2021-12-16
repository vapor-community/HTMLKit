# HTMLKit

Render dynamic HTML templates in a *typesafe* and **performant** way!
By using Swift's powerful language features and a pre-rendering algorithm, HTMLKit will render insanely fast templates but also catch bugs that otherwise might occur with other templating options.

## Getting Started

### Installation

Add the packages as dependecies to your package.

```swift
/// [Package.swift]

...
dependencies: [
    ...
    ///1. Add the packages
    .package(name: "HTMLKit", url: "https://github.com/vapor-community/HTMLKit.git", from: "2.4.0"),
    .package(name: "HTMLKitVaporProvider", url: "https://github.com/MatsMoll/htmlkit-vapor-provider.git", from: "1.2.0")
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

### Definition

Create a new file. Add the import and declare a new structure with the Protocol `Page`. Add some content to the `body` property. If you want to learn more about the definitions, take a look here.

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

Add the import to your controller and call the structure in your handler. Use the `render(for:)` method to render the structure for the request.

```swift
/// [SimpleController.swift]

...
/// 1. Add the import
import HTMLKit

final class SimpleController {
    ...
    func getPage(req: Request) throws -> EventLoopFuture<View> {
        /// 2. Call the structure
        return SimplePage().render(for: req)
    }
    ...
}
```

## Features

### Localization

### Conversion

## Resources
