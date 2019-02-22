# HTMLKit

Render **lightning fast** HTML templates in a *typesafe* way!
By using Swift's powerfull language features, HTMLKit is able to catch bugs that might otherwise occure, but also render in an insanely fast way.

## How fast is HTMLKit? ⚡

As mentioned HTMLKit is extremely fast, but exactly how fast?
By using the Leaf templating language as a benchmark, HTMLKit was **150 or 880x faster** depending if the caching feature was used.

This is the result of the rendering time used on a somewhat complex page, using a base template, that renders a navigation-bar and has a placeholder for some view content to display. In the view content, there was a for loop that displays some cards and its content.
The same view was rendered 128 times with the different frameworks, and Leaf used an average of *0.841 sec*, while HTMLKit used and an average of *0.00548 sec*. This is where the *150x* relation comes from.

When it was compared with Pointfree, was it **16-25x** faster. This was a small small static html page that was rendered 1000 times.

## How do you use it? 🔧

It is actually quite simple. But first, there are three different protocols to understand.

- `TemplateBuilder`: This is a view that is static or will not need any context to render.
- `ContextualTemplate`: This is a view that needs some context information to render.

By conforming to one of these protocols, you get access to the different helping functions you will need to render HTML.

So let's render a simple view.
```swift
struct SimpleView: ContextualTemplate {

    struct Context {
        let value: String
        let intValue: Int
    }

    // <div class="simple-view"><p>#(value)</p> #if(intValue > 0) {<b>Extra text</b>}</div>

    func build() -> CompiledTemplate {
        return
            div.class("simple-view").child(
                p.child( variable(\.value)),
                
                renderIf(\.intValue > 0, 
                    b.child("Extra text")
                )
            )
    }
}
```
Now how do we render the views?

In order to render the views effectively and cleanly, we need to add all the different views to a render struct. 
Bellow is an example of how to render a view with a context.
```swift
var renderer = HTML.Renderer()
try renderer.add(view: SimpleView())
...
let context = SimpleView.Context(value: "Hello World", intValue: 0)
try renderer.render(SimpleView.self, with: context)  // <div class="simple-view"><p>Hello World</p></div>
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

        /// A helper function to make it more readable when creating the context
        static func contentWith(name: String, values: [String]) -> Context {
            return .init(
                name: name, 
                values: values.enumerated().map { .init(value: $0.element,
                                                        intValue: $0.offset) }
                )
        }
    }

    func build() -> CompiledTemplate {
        return
            BaseView(
                title: "Welcome"
                body:
                    p("Hello ", variable(\.name), "!"),
                
                    forEach(in: \.values, 
                            render: SimpleView())
            )
    }
}

...

renderer.add(template: SomeView())
renderer.render(SomeView.self, with: .contentWith(name: "Mats", values: ["First", "Second", "Third"])
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
