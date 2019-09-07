<p align="center">
<img src="htmlkit.png" alt="HTMLKit logo"/>
</p>

# HTMLKit

Render **lightning fast** HTML templates in a *typesafe* way!
By using Swift's powerful language features and a pre-rendering algorithm, HTMLKit will render insanely fast templates but also catch bugs that otherwise might occur with other templating options.

## Features

* **Pre-rendering** - Pre-render all your HTML templates for better performance
* **Type safety** - Be confident that your templates work as intended
* **Dynamic** - Render dynamic templates that adopt to the context
* **Localization** - Dynamicaly render localized content in your templates
* **Markdown** - You can easily combine markdown and HTML syntax in the same template

## Getting Started

Add the following in your `Package.swift` file
```swift
.package(url: "https://github.com/vapor-community/HTMLKit.git", .branch("feature/htmlkit-2.0")),
```
And register the provider and the different templates with in `configure.swift`
```swift
var renderer = HTMLRenderer()
try renderer.add(view: MyTemplate())

try services.register(HTMLKitProvider())
services.register(renderer)
```

## Some benchmarks ⚡

As mentioned, HTMLKit is extremely fast since it pre-renders most of the template, and uses `KeyPath`'s instead of decoding the context with `Codable`. But how much will faster will this make the rendering?
Using the *Leaf* templating language as a benchmark, HTMLKit was **150x** faster, and compared to *Pointfree* **16-25x** faster.

The *Leaf* template used was a fairly complex template and HTMLKit rendered 128 documents in *0.00548 sec*.

## How do you use it? 🔧

### The basics

Let's get started with the three main protocols:

- `ContextualTemplate`: This protocol makes it easy to render HTML views by giving you access to a lot of helper functions. It needs a `Context` to render; this could be a struct, protocol etc.
- `StaticView`: This protocol conforms to `ContextualTemplate` but does not need a `Context` to render.
- `LocalizedTemplate`: The same as `ContextualTemplate`, but it allows localized output.

When creating a view, it is recommended to use either `StaticView` of `ContextualTemplate`, since the `HTMLRenderer` has functions tailored for these two protocols.

The building of a view is done in the `build()` function. Here you will need to return a `CompiledTemplate` which is fancy talk for something that can be represented as HTML.
By default some base types like `String`, `Int`, `Bool`, `Optional`, `UUID` and `Array<Compiledtemplate>`.  This means you can return a pure `String` as the view, although this is not recommended.

You also get access to some more interesting structs that represent the different HTML tags and attributes. The tags are computed variables and you can therefore access them by typing something like `div`.
This will return an empty div tag like `<div></div>`. In order to add attributes, you can call `div.class("simple-view")`, this will result in `<div class="simple-view"></div>`. And lastly, in those tags that can contain a children, you can call `div.class("simple-view").child("Hello World")` and this will result in `<div class='simple-view'>Hello World</div>`.

### Create a Template

When rendering a template you usually want some dynamic content and not only pure static HTML tags, so what does HTMLKit offer.

- If statements: You can render an if wherever you like. Want to render a cookie message? HTMLKit has you covered. Want to add a class based on a context? HTMLKit has you covered here also.
- For each loops: In some instances you might want to render a list of objects, and HTMLKit provides the tools for this.
- Representing variables:  Again, HTMLKit has the tools for the job. Even raw or safely formatted HTML variables.

But if you would like do some manipulation on the variable, how would this work?
Since HTMLKit uses `KeyPath`s to represent variables, it is possible to reference a computed variable of any type. This means that you can capitalize a pure swift string by calling `variable(\.string.capitalized)`. Done!
This means you can add any extension to a swift type and use it in the template.

So let's render a simple template that needs one `String` value and will place the string value in a `<div>` that has a class attribute and a `<p>` tag.
```swift
struct SimpleView: TemplateView {

    // Defining the context type with generics
    let context: ContextVariable<String> = .root() 

    var body: View {
        Div {
            P { context.capalized }
        }.class("simple-view")
    }
}
```

Note: You can also use `+` or in most cases `,` to concatinate multiple elements. Eg:
```swift
// Using `+`
Div {
    "Some text " + context.name + P { "View More" }
}
```

### Now to render the views

In order to render the views effectively and cleanly, we need to add all the different views to a render struct.
Below is an example of how to render a view with a context:
```swift
var renderer = HTMLRenderer()
try renderer.add(view: SimpleView())
...
try req.renderer().render(SimpleView.self, with: "hello world")
```
This would render: 
```html
<div class="simple-view">
    <p>
        Hello World
    </p>
</div>
```

You register and optimize the rendering by calling the `add(view: StaticView)` or `add(template: ContextualTemplate)`. Then render the view with the with `render(TemplateBuilder.Type)` or `render(ContextualTemplate.Type, with: ContextualTemplate.Context)`.

Now since that was so simple. Let's step it up a bit by creating a base template and a view that renders some content, based on the input.


```swift
struct BaseView: StaticView {

    let title: String
    let content: View
    
    init(title: String, @HTMLBuilder content: () -> View) {
        self.title = title
        self.content = content()
    }

    // New Code
    var body: View {
        HTMLNode {
            Head {
                Title { title }
            }
            Body { content }
        }
    }
    
    // Old code
    func build() -> View {
        return
            html.child(
                head.child(
                    title.child(
                        title
                    )
                ),
                body.child(
                    body
                )
            )
    }
}

struct SomeView: TemplateView {

    struct Context {
        let name: String
        let values: [String]
    }
    
    // Defining the context type with generics
    let context: ContextVariable<Context> = .root()
    
    // New Code
    var body: View {
        
        BaseView(title: "Welcome") {
            
            P { "Hello " + context.name + "!" }
            
            IF(context.values.count > 0) {
                
                ForEach(context.values) { value in
                    
                    Div {
                        P { value.capalized }
                    }
                }
            }.else {
                P { "There are no values!" }
            }
            
            Footer {
                "This is a footer"
            }.class("always")
        }
    }

    // Old code
    func build() -> View {
        
        return
            BaseView(
                title: "Welcome"
                body:
                    
                    p.child( "Hello ", variable(\.name), "!" ),
                    
                    renderIf(
                        \.values.count > 0,
                        
                        forEach(
                            in:     \.values,
                            render: SimpleView()
                        )
                    ).else(
                        p.child( "There are no values!" )
                    ),
                    
                    footer.class("always").child(
                            "This is a footer"
                    )
            )
    }
}

...

renderer.add(template: SomeView())
renderer.render(SomeView.self, with: .init(name: "Mats", values: ["First", "Second", "Third"])
```
This would render:
```html
<html>
    <head>
        <title>
            Welcome
        </title>
    </head>
    <body>
        <p>Hello Mats!</p>
        <div class="simple-view">
            <p>
                First
            </p>
        </div>
        <div class="simple-view">
            <p>
                Second
            </p>
        </div>
        <div class="simple-view">
            <p>
                Third
            </p>
        </div>
        <footer class="always">
            This is a footer
        </footer>
    </body>
</html>
```

## Localization
In order to add localization you will need to conform the template to `LocalizedTemplate`, and add the localization folder to the renderer.
You can specify a custom path and the default locale to use.
```swift
try renderer.registerLocalization() // Using "Resources/Localization" and "en"
try renderer.registerLocalization(atPath: "Localization", defaultLocale: "nb")
```

Using the template above as an example, the localization could look something like this.
```swift
struct SomeView: LocalizedTemplate {

    /// Used to identify the locale
    static let localePath: KeyPath<Context, String>? = \.locale

    enum LocalizationKeys: String {
        case hello
        case missingValues = "missing.values"
        case footer
    }

    struct Context: Encodable {
        let locale: String
        let name: String
        let values: [SimpleView.Context]

        init(name: String, values: [String]) -> Context {
            return .init(
                name: name, 
                values: values.enumerated().map { .init(value: $0.element) }
            )
        }
    }

    func build() -> CompiledTemplate {
        return
            BaseView(
                title: "Welcome"
                body:
                    p.child(
                        // Uses the `Context` struct as the localization data
                        localizeWithContext(.hello)  
                    ),
                    renderIf(
                        \.values.count > 0,

                        forEach(
                            in:     \.values, 
                            render: SimpleView()
                        )
                    ).else(
                        p.child(
                            localize(.missingValues)
                        )
                    ),
                    footer.class("always")
                        .if(\.name.isEmpty, add: .class("empty-nav")).child(
                            localize(.footer)
                    )
            )
    }
}
```

The  `LocalizedTemplate` protocol also supports localization for dates. This means that if you add a date with `date(\.createdAt, dateStyle: .short, timeStyle: .short)`, the output will be formated into the wanted locale automaticaly.  

## More Syntax

- Variables:
    * A variable that is HTML safe = `variable(\.title)`
    * A variable that does not escape anything = `variable(\.title, escaping: .unsafeNone)`
    * A variable that is not in the current `Context` (example get a variable in superview) `unsafeVariable(in: BaseTemplate.self, for: \.title)` or  `unsafeVariable(... escaping: .unsafeNone)`

- Embed:
    * Where the subview's `Context` is equal to the superview's `Context` = `embed(SubView())`
    * Where the subview's `Context`is variable of the superview's `Context`= `embed(Subview(), withPath: \.subContext)`

- ForEach:
    * Where the superview's `Context` is an array of the subview's `Context` = `forEach(render: SubView())`
    * Where the superview's `Context` variable is an array of the subview's `Context`  = `forEach(in \.subContext, render: Subview()`

- If:
    * If the value is a `Bool` = `renderIf(\.bool, div.child(...))`
    * If the value is `nil` = `renderIf(isNil: \.optional, div.child(...))`
    * If the value is not `nil` = `renderIf(isNotNil: \.optional, div.child(...))`
    * If the value conforms to `Equatable` = `renderIf(\.int == 2, div.child(...))`
    * If the value conforms to `Equatable` = `renderIf(\.int != 2, div.child(...))`
    * If the value conforms to `Comparable` = `renderIf(\.int < 2, div.child(...))`
    * If the value conforms to `Comparable` = `renderIf(\.int > 2, div.child(...))`
    * If the value conforms to `Comparable` = `renderIf(\.int >= 2, div.child(...))`
    * If the value conforms to `Comparable` = `renderIf(\.int <= 2, div.child(...))`
    * It is also possible to use `||` and `&&` for more complex statements. `renderIf(\.bool || \.otherBool, div.child(...))`
    * `elseIf` has the same statements and is a method on the returned if. `renderIf(...).elseIf(...)`
    * and lastly `else`. `renderIf(...).else(div.child(...))`

- Date:
If you are using a `LocalizedTemplate`, the date will also be formatted into the specified locale.
    * Format a date with `DateFormatter.Style`'s = `date(\.createdAt, dateStyle: .short, timeStyle: .short)`
    * Format a date with a custom string format = `date(\.createdAt, formate: "MM/dd/yyyy")`

- Dynamic Attributes:
    * In order to add attributes based on the `Context` you can use if's.  `div.if(\.bool, add: .checked)`

- Markdown ([SwiftMarkdown](https://github.com/vapor-community/markdown)):
NB! The rendering will not be as performant as with HTML, since most of the markdown will be evaluated at runtime
    * In order to render markdown in your template, use `markdown(...)`. You can add variables and logic inside here, as with every other HTML tag.
    * If you want a specific rendering option use `markdown(..., options: ...)`. View SwiftMarkdown for more info.
    
- Localization ([Lingo](https://github.com/miroslavkovac/Lingo)):
    * For a localized string use `localize("hello.world")` or `localize(.helloWorld)`.
    * Or `localize("unread.messages", with: \.unreadMessages)` or  `localize(.unreadMessages, with: ...)`.
    

Add custom node types by extending `TemplateBuilder`.

```swift
extension TemplateBuilder {
    var div: HTML.ContentNode { 
        return HTML.ContentNode(name: "div")
    }
}
```

Add non-dynamic attributes with an extension on `AttributableNode`. Or extend `HTML.AttributeNode`if a dynamic attribute is needed.

```swift
extension AttributableNode {
    func ariaLabelledby(_ values: CompiledTemplate...) -> Self {
        return add(.init(attribute: "aria-labelledby", value: values))
    }
}

extension HTML.AttributeNode {
    static func dataToggle(_ toggle: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "data-toggle", value: toggle)
    }
}
```


## Useful Resources to Get Started

* [Vapor TIL fork](https://github.com/MatsMoll/vapor-til) - Compare Leaf to HTMLKit in this fork of the TIL app.
* Convert pure HTML code to HTMLKit code using this [HTML-to-HTMLKit converter](https://github.com/MatsMoll/HTMLKit-code-converter).
