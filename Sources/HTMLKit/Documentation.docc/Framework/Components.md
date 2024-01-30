# Components

Construct UI interfaces using the components.

## Overview

The components library follows the idea of a design system. It offers you standardized, reusable components imitating the syntax and semantics of SwiftUI. The library also comes with CSS (Cascading Style Sheet) and JS (JavaScript) to help you construct your vision without the need to completely rebuild it or have any knowledge in one of these languages.

```swift
HStack {
    Text {
        "Lorem ipsum..."
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
- <doc:Scroll>

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
