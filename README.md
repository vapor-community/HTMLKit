# HTMLKit

Render HTML templates in a *typesafe* and **lightning fast** way!
By using Swift's powerfull language features, HTMLKit is able to catch bugs that might otherwise occure, but also in an insanely fast way.

## How fast is HTMLKit?

As mentioned HTMLKit is extremely fast, but exactly who fast?
By using the Leaf templating language as a benchmark, HTMLKit was **150 or 880x faster** depending if the caching feature was used.

This is the result of the rendering time used on a somewhat complex page, using a base template, that renders a navigation-bar and has a placeholder for some view content to display. In the view content, there was a for loop that displays some cards and its content.
The same view was rendered *128* times with the different frameworks, and Leaf used an average of *0.841 sec*, while HTMLKit used and an average of *0.00548 sec*. This is where the *150x* relation is from.

So how do you use it?

It is actually quite simple. But first, there are three different protocols to understand.

- `StaticTemplate`: This is a view that static or will not need any context/information to render.
- `Template`: This is a view that needs some data structure to render.
-  `ViewTemplate`: This is a view that needs another view and a data structure to render.
As of now, there is not a protocol that only takes another view as arguments and not a data structure, but this might come.

By conforming to one of these protocols, you get access to the different helping functions you will need to render HTML.

So let's render a simple view.
```swift
struct SimpleView: Template {

    struct Context {
        let value: String
    }

    // <div><p>#(value)</p></div>

    static func build() -> Mappable {
        return
            div(children:
                p(children: variable(at: \.value))
            )
    }
}
```
Now how do we render the views?

In order to render the views effectively and cleanly, we need to add all the different views to a render struct. 
Bellow is an example of how to render a view with a context.
```swift
var renderer = HTML.Renderer()
try renderer.brewFormula(for: SomeView.self)
...
try renderer.render(SimpleView.self, with: .init(value: "Hello World"))
```
You register and optimize the rendering by calling the `brewFormula(for: View.Type)` function, and render the view with the correct Context with `render(View.Type, with: Context)`.

Now since that was so simple. Let's step it up a bit by creating a base template and a view that renders some content, based on the input.

```swift
struct BaseView: ViewTemplate {

    struct Context {
        let title: String
    }

    struct ViewContext {
        let body: Mappable
    }

    static func build(with context: BaseView.ViewContext) -> Mappable {
        return
            html(children:
                head(children: 
                    title(children: variable(at: \.title))
                ),
                body(children: context.body)
            )
    }
}

struct SomeView: Template {

    struct Context {
        let name: String
        let baseContext: BaseView.Context
        let values: [SimpleView.Context]

        /// A helper function to make it more readable when creating the context
        static func contentWith(name: String, title: String, values: [String]) -> Context {
            return .init(
                name: name, 
                baseContext: .init(title: title), 
                values: values.map { .init(value: $0) }
                )
        }
    }

    static func build() -> Mappable {
        return
            embed(
                BaseView.self,
                with: .init(
                    body: 
                        p(children: "Hello ", variable(at: \.name), "!"),
                        forEach(in: \.values, render: SimpleView.self)
                ),
                contextPath: \.baseContext
            )
    }
}
```
This could render something like:
```html
<html>
    <head>
        <title>Welcome</title>
    </head>
    <body>
        <p>Hello Mats!</p>
        <div>
            <p>First</p>
        </div>
        <div>
            <p>Second</p>
        </div>
        <div>
            <p>Third</p>
        </div>
    </body>
</html>
```
