# Template

Scaffold your written content and apply context.


## Overview

In HTMLKit a template consist of two parts. The first part is the view logic, wich gives the template the structure to display the content as you want. The second part is the data logic, wich gives the template the data to process the variables, that you may set in between the content.

```swift
struct SimpleView: View {

    @TemplateValue(String.self)
    var context

    var body: AnyContent {
        SimplePage {
            Heading1 {
                context
            }
        }
    }
}
```

## Topics

### View logic

- <doc:Layouts>

### Data logic

- <doc:Context>
