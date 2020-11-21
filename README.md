<p align="center">
<img src="htmlkit.png" alt="HTMLKit logo"/>
</p>

# HTMLKit

Render dynamic HTML templates in a *typesafe* and **performant** way!
By using Swift's powerful language features and a pre-rendering algorithm, HTMLKit will render insanely fast templates but also catch bugs that otherwise might occur with other templating options.

## Getting Started

Add the following in your `Package.swift` file
```swift
.package(url: "https://github.com/vapor-community/HTMLKit.git", from: "2.0.0"),
```

You can use the following providers in order to use HTMLKit with [Vapor 3](https://github.com/MatsMoll/htmlkit-vapor-3-provider) and for [Vapor 4](https://github.com/MatsMoll/htmlkit-vapor-provider)

for instance for Vapor 4, you have to add the **HTMLKit** vapor provider like this

```swift
.package(name: "HTMLKitVaporProvider", url: "https://github.com/MatsMoll/htmlkit-vapor-provider.git", from: "1.0.0"),
...
.product(name: "HTMLKit", package: "HTMLKit"),
.product(name: "HTMLKitVaporProvider", package: "HTMLKitVaporProvider"),
```

## Usage

View the different tags and types defined in HTMLKit on the [Wiki page](https://github.com/vapor-community/HTMLKit/wiki).

To create a HTML template, conform to the `HTMLTemplate` protocol.

```swift
struct TemplateData {
    let name: String
    let handle: String
    let title: String?
}

struct SimpleTemplate: HTMLTemplate {

    @TemplateValue(TemplateData.self)
    var context

    var body: HTML {
        Document(type: .html5) {
            Head {
                Title { context.title }
                Author { context.name }
                    .twitter(handle: context.handle)
                Viewport(.acordingToDevice)
            }
            Body {
                Unwrap(context.title) { title in
                    P { title }
                }
            }
        }
    }
}

// For Vapor 4, you certainly want to preload the template in configure to optimize rendering.
// in configure.swift
import HTMLKitVaporProvider
...
public func configure(_ app: Application) throws {
    ...
    try app.htmlkit.add(view: SimpleTemplate())
    ...
}

// In one of your controllers
import HTMLKit
...
func get(req: Request) throws -> EventLoopFuture<View> {
    return Simple.query(on: req.db)
        .filter(...)
        .first()
        .unwrap(or: Abort(.notFound))
        .flatMap {
            SimpleTemplate().render(with: TemplateData(name: $0.name, ...), for: req)
        }
}
```

This will render something like this
```html
<!DOCTYPE html>
<html>
    <head>
        <title>Some Title</title>
        <meta property='og:title' content='Some Title'>
        <meta name='twitter:title' content='Some Title'>
        <meta name='author' content='Mats'>
        <meta name='twitter:creator' content='@SomeTwitterHandle'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    </head>
    <body>
        <p>Some Title</p>
    </body>
</html>
```

And to create a HTML component, just conform to the `HTMLComponent` protocol.

```swift
public struct Alert: HTMLComponent {

    let isDismissable: Conditionable // This is a protocol that makes it possible to optimize if's
    let message: HTML

    public var body: HTML {
        Div {
            message

            IF(isDismissable) {
                Button {
                    Span { "&times;" }
                        .aria(for: "hidden", value: true)
                }
                .type(.button)
                .class("close")
                .data("dismiss", value: "alert")
                .aria("label", value: "Close")
            }
        }
        .class("alert alert-danger bg-danger")
        .modify(if: isDismissable) {
            $0.class("fade show")
        }
        .role("alert")
    }
}
```
This can then be used in another template or a static html page like:
```swift
struct SomePage: HTMLPage {

    var body: HTML {
        Div {
            Alert(isDismissable: false) {
                H3 { "Some Title" }
            }
        }
    }
}
```

## Mixing HTMLKit with Leaf

You can easily mix Leaf and HTMLKit in the same project.

```swift
struct RenderingConfig: Content {
    let message: String
    let useHTMLKit: Bool
}

func renderLogin(on req: Request) -> Future<View> {
    let query = try req.query.decode(RenderingConfig.self)
    if config.useHTMLKit {
        return LoginPage().render(with: config, on: req)
    } else {
        return req.view().render("login-page", with: config)
    }
}
```

## Localization

Much like SwiftUI, you can localize text by passing the localization key as a parameter.

```swift
...
var body: HTML {
    P("hello.world")
        .class("text-white")
}
...
```
This requires the Lingo framework, so you will also need to register the `Lingo` struct on the renderer.
```swift
var renderer = HTMLRenderer()
try renderer.registerLocalization(atPath: "workDir", defaultLocale: "en")
```
And if the locale changes based on some user input, then you can change the used locale in the template.
This also effects how dates are presented to the user.
```swift
struct LocalizedDateView: HTMLTemplate {

    struct Context {
        let date: Date
        let locale: String
    }

    var body: HTML {
        Div {
            P {
                context.date
                    .style(date: .short, time: .short)
            }
            P {
                context.date
                    .formatted(string: "MM/dd/yyyy")
            }
        }
        .enviroment(locale: context.locale)
    }
}
```

## Useful Resources to Get Started

* [BootstrapKit](https://github.com/MatsMoll/BootstrapKit) - A higher level library that makes it easier to work with Boostrap 4.
* [Vapor TIL fork](https://github.com/MatsMoll/vapor-til) - Compare Leaf to HTMLKit in this fork of the TIL app.
* Convert pure HTML code to HTMLKit code using this [HTML-to-HTMLKit converter](https://github.com/MatsMoll/HTMLKit-code-converter).

## Known Issues

* Linux compiler can sometimes struggle with compiling the code when a combination of complex use of generics, default values or deeply nested function builders are used.
