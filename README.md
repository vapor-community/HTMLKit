# HTMLKit

Render **lightning fast** HTML templates in a *typesafe* way!
By using Swift's powerful language features and a pre-rendering algorithm, will HTMLKit render insanely fast templates but also be able to catch bugs that otherwise might occur with other templating options.

## How fast is HTMLKit? ⚡

As mentioned HTMLKit is extremely fast, but exactly how fast?
By using the *Leaf* templating language as a benchmark, HTMLKit was **150x** faster, and compared to *Pointfree* **16-25x** faster.

The *Leaf* template used was a fairly complex template and HTMLKit rendered 128 documents in *0.00548 sec*.

## How do you use it? 🔧

### The basics

Let's get started with the two main protocols to know.

- `TemplateBuilder`: This is a protocol making it easy to render HTML views by giving you access to a lot of helper functions.
- `ContextualTemplate`: This is a protocol conforms to `TemplateBuilder` but also needs a `Context` to render. This could be a struct, protocol etc.

When conforming to one of these two, you can start building your views. 
This is done in the `build()` function. Here you will need to return a `CompiledTemplate` which is fancy talk for something that can be represented as HTML.
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
var renderer = HTML.Renderer()
try renderer.add(template: SimpleView())
...
try renderer.render(SimpleView.self, with: .init(value: "hello world"))
```
This would render: 
```html
<div class="simple-view">
    <p>Hello World</p>
</div>
```

You register and optimize the rendering by calling the `add(view: TemplateBuilder)` or `add(template: ContextualTemplate)`, and render the view with the with `render(TemplateBuilder.Type)` or `render(ContextualTemplate.Type, with: ContextualTemplate.Context)`.

Now since that was so simple. Let's step it up a bit by creating a base template and a view that renders some content, based on the input.


```swift
struct BaseView: TemplateBuilder {

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
                values: values.enumerated().map { .init(value:      $0.element,
                                                        intValue:   $0.offset) }
                )
        }
    }

    func build() -> CompiledTemplate {
        return
            BaseView(
                title: "Welcome"
                body:
                    p.child("Hello ", variable(\.name), "!"),
                
                    renderIf(
                        \.values.count > 0,
                        
                        forEach(in:     \.values, 
                                render: SimpleView())
                    ).else(
                        p.chiled(
                            "There is no values!"
                        )
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
        <title>Welcome</title>
    </head>
    <body>
        <p>Hello Mats!</p>
        <div class="simple-view">
            <p>First</p>
        </div>
        <div class="simple-view">
            <p>Second</p>
            <b>Extra text</b>
        </div>
        <div class="simple-view">
            <p>Third</p>
            <b>Extra text</b>
        </div>
    </body>
</html>
```
