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
    .package(name: "HTMLKit", url: "https://github.com/vapor-community/HTMLKit.git", from: "2.4.5"),
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

Read the [installation instructions](/Instructions/Installation.md) for more information.

### Definition

Create a new file in your project. Add the import at the top of your file and declare a new structure. Extend your structure by adding a [layout definition](/Instructions/Essential/Layouts.md) to adopt the required properties and methods. Add your content to the `body` property.

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

HTMLKit offers localization by the help of the [Lingo framework](https://github.com/miroslavkovac/Lingo.git). See the [instructions](/Instructions/Features/Localization.md) for more information.

### Conversion

You dont have to rewrite your whole codebase to use HTMLKit. HTMLKit offers a converter to translate HTML into HTMLKit. See the [instructions](/Instructions/Features/Conversion.md) for more information.

### Validation

HTMLKit is build with the intention to lead you writing valid code. So you don't need to think about it in particular.

## Resources

### Instructions

See the [instructions](/Instructions/Overview.md) to learn more about the package and the features.

### Components

See the [package](https://github.com/vapor-community/HTMLKit-Components) to extend your experience with HTMLKit. The package is still work in progress, but
it will be available soon.

### Live Example

See the [package](https://github.com/mattesmohr/Website) of our contributor, how he uses HTMLKit in his website.
