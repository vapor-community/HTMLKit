# Html abstraction

Learn more about the abstraction.

## Overview

The elements in HTMLKit are an abstraction of the official HTML elements. Elements with content use the curly brackets, while elements without content use the round brackets. To add attributes to the element use the functions on the element.

### Elements

```swift
/// element with content
Body {
    ...
}

/// element without content
Input()
```

### Attributes

```swift
/// attribute with value
.class("value")

/// attribute as toggle
.required()
```

## Limitation

To prevent invalid code, each element owns a element definition. For example the element `Heading1` is a type of `BodyElement`, so it is only allowed to be placed in the `Body` element.

```swift
public struct Heading1: ContentNode, BodyElement {
    ...
}
```

```html
<html>
    <head>
        <h1>headline</h1> <!-- not valid -->
    </head>
    <body>
        <h1>headline</h1> <!-- valid -->
    </body>
</html>
```

If you need to break the limitation, extend the element with the element definition of your choice or define it as `GlobalElement`.

```swift
extension FormContainer: GlobalElement {
    ...
}
```
