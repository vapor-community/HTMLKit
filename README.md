<p align="center">
<img src="htmlkit.png" alt="HTMLKit logo"/>
</p>

# HTMLKit

Render dynamic HTML templates in a *typesafe* and **performant** way!
By using Swift's powerful language features and a pre-rendering algorithm, HTMLKit will render insanely fast templates but also catch bugs that otherwise might occur with other templating options.

## Getting Started

Add the following in your `Package.swift` file
```swift
.package(url: "https://github.com/vapor-community/HTMLKit.git", from: "2.0.0-alpha.9"),
```
And register the provider and the different templates with in `configure.swift`
```swift
try services.register(HTMLKitProvider())

// Or you can do it manually with
let renderer = HTMLRenderer()
try renderer.add(view: MyTemplate())
services.register(renderer)
```

## Usage

To create a HTML template, conform to the `HTMLTemplate` protocol.

```swift
struct SimpleTemplate: HTMLTemplate {

    @TemplateValue(String?.self)
    var context

    var body: HTML {
        Document(type: .html5) {
            Head {
                Title { context }
            }
            Body {
                Unwrap(context) { string in
                    P { string }
                }
            }
        }
    }
}

...
try SimpleTemplate().render(with: "Some string", for: req)
```

And to create a HTML component, just comform to the `HTMLComponent` protocol. 

```swift
public struct Alert: HTMLComponent {

    let isDisimissable: Conditionable // This is a protocol that makes it possible to optimize if's
    let message: HTML

    public var body: HTML {
        Div {
            message
            
            IF(isDisimissable) {
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
        .modify(if: isDisimissable) {
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
                H3("Some Title")
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
This also effects how dates are presentet to the user.
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
