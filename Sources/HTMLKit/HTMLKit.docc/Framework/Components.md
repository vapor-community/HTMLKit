# Components

Construct UI interfaces using the components.

## Overview

The components library follows the idea of a design system. It offers you standardized, reusable components imitating the syntax and semantic of SwiftUI. The library also comes with CSS (Cascading Style Sheet) and JS (JavaScript) to help you constructing your vision, without the need to completely rebuild it or furthermore any knowledge in one of these languages.

```swift
HStack {
    StackColumn(size: .twelve) {
        Text {
            "Lorem ipsum..."
        }
    }
}
```

### Interactions

```swift
Text {
    "Lorem ipsum..."
}
.onHover(perfom: .show("navigation"))
```

See the article <doc:ComponentsPlugin> before you get started.


## Topics

### Form components

- <doc:Form>
- <doc:FieldLabel>
- <doc:TextField>
- <doc:TextEditor>
- <doc:CheckField>
- <doc:RadioSelect>
- <doc:DatePicker>
- <doc:SearchField>
- <doc:SecureField>
- <doc:SelectField>
- <doc:Button>
- <doc:Toggle>
- <doc:Slider>

### Section components

- <doc:HStack>
- <doc:VStack>
- <doc:ZStack>
- <doc:Divider>

### Group components

- <doc:Card>
- <doc:List>
- <doc:Grid>

### Text components

- <doc:Text>
- <doc:Symbol>

### Link components

- <doc:Link>
- <doc:LinkButton>

### Media components

- <doc:Snippet>
- <doc:Progress>
- <doc:Image>

### Active components

- <doc:Modal>
