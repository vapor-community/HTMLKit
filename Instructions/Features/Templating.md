# Templating

The templating is

## Essential

### Definition

```swift
/// [SimplePage.swift]

struct SimplePage: Page {

    var body: AnyContent {
        Document(type: .html5)
        Head {
            Title {
                "SimplePage"
            }
        }
        Body {
            SimpleView(context: "Hello World!")
        }
    }
}
```

### Output

```html
<!-- SimplePage.html -->

<!DOCTYPE html> 
<html>
    <head>
        <title>SimplePage</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
```

