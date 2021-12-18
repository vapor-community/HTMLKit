# Layouts

Layouts allow to define a website template. It is used to provide a consistend look.

## Page

The page is the entry point of the site. It should be used to package the views.

### Definition

```swift
/// [SimplePage.swift]

struct SimplePage: Page {

    var body: AnyContent {
        Document(type: .html5)
        Html {
            Head {
                Title {
                    "SimplePage"
                }
            }
            Body {
            }
        }
    }
}
```

## View

The view is a partial view of the page. It should be used to display data using the context.

### Definition

```swift
/// [SimpleView.swift]

struct SimpleView: View {

    @TemplateValue(SimpleContext.self)
    var context

    var body: AnyContent {
        Heading1 {
            context
        }
    }
}
```

### Context

The context as an object holds the information for the view. ... See [Context](https://github.com/vapor-community/HTMLKit/blob/master/Instructions/Essential/Context.md) to learn more about it.

## Component

The component is a reusable portion of a page. It should be used to break up large files into smaller components.

### Definition

```swift
/// [SimpleComponent.swift]

struct SimpleComponent: Component {

    var body: AnyContent {
    }
}
```
