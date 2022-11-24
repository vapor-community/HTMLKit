# Components

Construct UI interfaces using the components.

## Overview

The components library follows the idea of a complete design system. It offers you standardized, reusable components imitating the syntax and semantic of SwiftUI. The library also comes with CSS (Cascading Style Sheet) to help you constructing your vision, without the need to completely rebuild it or furthermore any knowledge in CSS.

```swift
HStack {
    StackColumn(size: .twelve) {
        Paragraph {
            "Lorem ipsum..."
        }
    }
}
```

```css
.hstack {
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
}
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
- <doc:SubmitButton>
- <doc:ResetButton>
- <doc:Toggle>
- <doc:Slider>

### List components

- <doc:List>
- <doc:Collection>

### Section components

- <doc:HStack>
- <doc:VStack>
- <doc:ZStack>
- <doc:Divider>

### Text components

- <doc:Text>

### Link components

- <doc:Link>
- <doc:ActionButton>

### Media components

- <doc:Snippet>
- <doc:ProgressView>
- <doc:Image>
