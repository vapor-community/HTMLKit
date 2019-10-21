<p align="center">
<img src="htmlkit.png" alt="HTMLKit logo"/>
</p>

# HTMLKit

Render **lightning fast** HTML templates in a *typesafe* way!
By using Swift's powerful language features and a pre-rendering algorithm, HTMLKit will render insanely fast templates but also catch bugs that otherwise might occur with other templating options.

## Getting Started

Add the following in your `Package.swift` file
```swift
.package(url: "https://github.com/vapor-community/HTMLKit.git", from: "2.0.0-alpha.1"),
```
And register the provider and the different templates with in `configure.swift`
```swift
var renderer = HTMLRenderer()
try renderer.add(view: MyTemplate())

try services.register(HTMLKitProvider())
services.register(renderer)
```

## Usage

To create a view component, conform to the `StaticView` protocol. Look at the example above for an Alert component.

```swift
public struct Alert: StaticView {

    let message: View
    let isDisimissable: Conditionable

    public init(isDisimissable: Conditionable = true, @HTMLBuilder message: () -> View) {
        self.isDisimissable = isDisimissable
        self.message = message()
    }

    public var body: View {
        Div {
            message
            IF(isDisimissable) {
                Button {
                    Span { "&times;" }
                        .aria(for: "hidden", value: true)
                }
                .type(.button)
                .class("close")
                .data(for: "dismiss", value: "alert")
                .aria(for: "label", value: "Close")
            }
        }
        .class("alert alert-danger bg-danger" + IF(isDisimissable) { " fade show" })
        .role("alert")
    }
}
...
try renderer.render(Alert.self)
```

If you need a page that changes based on runtime given values. Then a `TemplateView` could be more appropriate. Here you will need to pass the context when rendering.

```swift
struct SimpleData {
    let string: String
    let int: Int?
}

struct DummyPage: TemplateView {

    var context: RootValue<SimpleData> = .root()

    var body: View {
        Div {
            P { context.string }
            IF(context.int.isDefined) {
                Small { context.int }
            }
        }
    }
}
...
let values = SimpleData(string: "Some string", int: nil)
try renderer.render(DummyPage.self, with: values)
```

## Localization

Much like SwiftUI, you can localize text by passing the localization key as a parameter.

```swift
...
var body: View {
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
```swift
...
let locale: RootValue<String>

var body: View {
    Div {
        P("hello.world")
            .class("text-white")
    }
    .enviroment(local: locale)
}
...
```
This also effects how dates are presentet to the user.
```swift
struct LocalizedDateView: TemplateView {

    struct Context {
        let date: Date
        let locale: String
    }

    let context: RootValue<Context> = .root()

    var body: View {
        Div {
            P {
                context.date
                    .style(dateStyle: .short, timeStyle: .short)
            }
            P {
                context.date
                    .formating(string: "MM/dd/yyyy")
            }
        }
        .enviroment(local: context.locale)
    }
}
```

## Useful Resources to Get Started

* [BootstrapKit](https://github.com/MatsMoll/BootstrapKit) - A higher level library that makes it easier to work with Boostrap 4.

* [Vapor TIL fork](https://github.com/MatsMoll/vapor-til) - Compare Leaf to HTMLKit in this fork of the TIL app.
* Convert pure HTML code to HTMLKit code using this [HTML-to-HTMLKit converter](https://github.com/MatsMoll/HTMLKit-code-converter).
