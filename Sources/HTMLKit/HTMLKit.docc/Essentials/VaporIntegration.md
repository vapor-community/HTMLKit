# Vapor integration

Use the framework together with Vapor.

## Overview

The HTMLKit framework uses the web framework [Vapor](https://swiftpackageindex.com/vapor/vapor) as its standard view renderer.

### Configure

Before you can use the view renderer, you need to do some adjustments in the *configure.swift* file of your Vapor project:

```swift
/// 1. Load the module
import HTMLKitVapor
import Vapor

public func configure(_ app: Application) throws {

    /// 2. Specify the view renderer
    app.views.use(.htmlkit)
    
    /// 3. Add the layout
    app.htmlkit.views.add(view: ExampleTemplate.ExampleView())

    try routes(app)
}
```

### Request

Now you can call the method *render* on the request in one of your controllers:

```swift
import Vapor

final class ExampleController {

    func getIndex(_ request: Request) async throws -> View {

        /// 1. Name the layout
        return try await request.view.render("ExampleTemplate.IndexView")
    }
}
```
