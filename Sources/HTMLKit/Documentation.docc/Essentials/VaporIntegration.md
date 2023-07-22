# Vapor integration

Use the framework together with Vapor.

## Overview

The HTMLKit framework uses the web framework [Vapor](https://swiftpackageindex.com/vapor/vapor) as its default view renderer.

### Request

Call the method *render(_:)* on a request in one of your controller handlers to render a instance of a view.

```swift
/// 1. Import the module
import HTMLKitVapor
import Vapor

final class ExampleController {

    func getIndex(_ request: Request) async throws -> View {

        /// 2. Name the view instance
        return try await request.htmlkit.render(ExampleView())
    }
}
```
