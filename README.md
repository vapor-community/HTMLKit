# HTMLKit

Render **lightning fast** HTML templates in a *typesafe* way!
By using Swift's powerful language features and a pre-rendering algorithm, will HTMLKit render insanely fast templates but also be able to catch bugs that otherwise might occur with other templating options.

## Getting Started

Add the following in your `Package.swift` file
```swift
.package(url: "https://github.com/vapor-community/HTMLKit.git", from: "1.1.0"),
```
And register the provider and the different templates with in `configure.swift`
```swift
var renderer = HTMLRenderer()
try renderer.add(template: MyTemplate())

try services.register(HTMLKitProvider())
services.register(renderer)
```

## Some benchmarks? ⚡

As mentioned HTMLKit is extremely fast since it pre-renders most of the template, and uses `KeyPath`'s instead of decoding the context with `Codable`. But how much will faster will this make the rendering?
By using the *Leaf* templating language as a benchmark, HTMLKit was **150x** faster, and compared to *Pointfree* **16-25x** faster.

The *Leaf* template used was a fairly complex template and HTMLKit rendered 128 documents in *0.00548 sec*.

## How do you use it? 🔧

### The basics

Let's get started with the two main protocols to know.

- `ContextualTemplate`: This is a protocol making it easy to render HTML views by giving you access to a lot of helper functions. But this needs a `Context` to render. This could be a struct, protocol etc.
- `StaticView`: This is a protocol conforms to `ContextualTemplate` but needs no `Context` to render. 

When creating a view, it is recommend to use either `StaticView` of `ContextualTemplate`, since the `HTMLRenderer` has functions that is tailored for these two protocols.

The building of a view is done in the `build()` function. Here you will need to return a `CompiledTemplate` which is fancy talk for something that can be represented as HTML.
By default some base types like `String`, `Int`, `Bool`, `Optional`, `UUID` and `Array<Compiledtemplate>`.  This means you in theory can return a pure `String` as the view, even to this is not recommended.

You also get access to some more interesting structs that represents the different HTML tags and attributes. The tags are computed variables and you can therefore access them by typing something like `div`.
This will return an empty div tag like `<div></div>`. In order to add attributes, you can call `div.class("simple-view")`, this will result in `<div class='simple-view'></div>`. And lastly, in those tags that can contain a children, you can call `div.class("simple-view").child("Hello World")` and this will result in `<div class='simple-view'>Hello World</div>`.

### Create a Template

When rendering a template you usually want some more advanced stuff and not only pure static HTML tags, so what do HTMLKit offer.

- If statements: You can render an if where ever you like. Want to render a cookie message? HTMLKit got you covered. Want to add a class based on a context? HTMLKit got you covered here also.
- For each loops: In some instances you might want to render a list of objects, and HTMLKit provides the tools for exactly this.
- Representing variables:  Again, HTMLKit got the tools for the job. Even raw or safely formatted HTML variables.

But what if you would like do some manipulation on the variable, how would this work?
Since HTMLKit uses `KeyPath`s to represent variables, it is possible to reference a computed variable of any type. This means that you can capitalize a pure swift string by calling `variable(\.string.capitalized)`. Isn't that amazing!
This means you can add any extension to a swift type and use it in the template when you like.

So let's render a simple template that needs one `String` value and will display the string value in a `<div>` that has a class attribute and a `<p>` tag.
```swift
struct SimpleView: ContextualTemplate {

    struct Context {
        let value: String
    }

    func build() -> CompiledTemplate {
        return
            div.class("simple-view").child(
                p.child( 
                    variable(\.value.capitalized)
                )
            )
    }
}
```


### Now how do we render the views?

In order to render the views effectively and cleanly, we need to add all the different views to a render struct. 
Bellow is an example of how to render a view with a context:
```swift
var renderer = HTMLRenderer()
try renderer.add(template: SimpleView())
...
try req.renderer().render(SimpleView.self, with: .init(value: "hello world"))
```
This would render: 
```html
<div class="simple-view">
    <p>Hello World</p>
</div>
```

You register and optimize the rendering by calling the `add(view: StaticView)` or `add(template: ContextualTemplate)`, and render the view with the with `render(TemplateBuilder.Type)` or `render(ContextualTemplate.Type, with: ContextualTemplate.Context)`.

Now since that was so simple. Let's step it up a bit by creating a base template and a view that renders some content, based on the input.


```swift
struct BaseView: StaticView {

    let title: String
    let body: CompiledTemplate

    func build() -> CompiledTemplate {
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

struct SomeView: ContextualTemplate {

    struct Context {
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
                        "Hello ", variable(\.name), "!"
                    ),
                    runtimeIf(
                        \.values.count > 0,
                        
                        forEach(in:     \.values, 
                                render: SimpleView())
                    ).else(
                        p.child(
                            "There is no values!"
                        )
                    ),
                    footer.class("allways")
                        .if(\.name.isEmpty, add: .class("empty-nav")).child(
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
        <div class='simple-view'>
            <p>
                First
            </p>
        </div>
        <div class='simple-view'>
            <p>
                Second
            </p>
        </div>
        <div class='simple-view'>
            <p>
                Third
            </p>
        </div>
        <footer class='allways'>
            This is a footer
        </footer>
    </body>
</html>
```

## More Feature Syntax

- Variables:
    * A variable that is HTML safe = `variable(\.title)`
    * A variable that do not escape anything = `variable(\.title, escaping: .unsafeNone)` 
    * A variable that is not in the current `Context` (example get a variable in superview) `unsafeVariable(in: BaseTemplate.self, for: \.title)` or  `unsafeVariable(... escaping: .unsafeNone)`
- Embed:
    * Where the sub view's `Context` is equal to the super view's `Context` = `embed(SubView())`
    * Where the sub view's `Context`is variable of the super view's `Context`= `embed(Subview(), withPath: \.subContext)`
- ForEach:
    * Where the super view's `Context` is an array of the sub view's `Context` = `forEach(render: SubView())`
    * Where the super view's `Context` variable is an array of the sub view's `Context`  = `forEach(in \.subContext, render: Subview()`
- If:
    * If the value is a `Bool` = `runtimeIf(\.bool, div.child(...))`
    * If the value is `nil` = `runtimeIf(isNil: \.optional, div.child(...))`
    * If the value is not `nil` = `runtimeIf(isNotNil: \.optional, div.child(...))`
    * If the value conforms to `Equatable` = `runtimeIf(\.int == 2, div.child(...))`
    * If the value conforms to `Equatable` = `runtimeIf(\.int != 2, div.child(...))`
    * If the value conforms to `Comparable` = `runtimeIf(\.int < 2, div.child(...))`
    * If the value conforms to `Comparable` = `runtimeIf(\.int > 2, div.child(...))`
    * It is also possible to use `||` and `&&` for more complex statments. `runtimeIf(\.bool || \.otherBool, div.child(...))`
    * `elseIf`has the same statments and is a method on the returned if. `runtimeIf(...).elseIf(...)`
    * and lastly `else`. `runtimeIf(...).else(div.child(...))`
- Dynamic Attributes
    * In order to add attributes based on the `Context` you can use if's.  `div.if(\.bool, add: .checked)`

Add custom node types by extending `TemplateBuilder`.

```swift
extension TemplateBuilder {
    var div: HTML.ContentNode { 
        return HTML.ContentNode(name: "div") 
    }
}
```

Add non-dynamic attributes with an extension on `AttributableNode`. Or extend `HTML.AttributeNode`if a dynamic is needed.

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
