# Elements

Write HTML markup using the abstraction.

## Overview

The elements in HTMLKit are an abstraction of the elements in HTML (Hyper Text Markup Language). If you have written HTML before, then you know, there are elements with or without an endtag. An Element with an end tag, will be represented in HTMLKit as an element with curly brackets, while an element without will be represented with the round brackets.

If you would like to add attributes, use the offered methods on the element. In most cases the method name matches the attribute name in HTML.

```swift
/// element with content
Body {
    Paragraph {
        "Lorem ipsum..."
    }
    .class("value")
}

/// element without content
Input()
    .required()
```

To prevent writing invalid code, each element in HTMLKit owns an element limitation. For example the element *Heading1* is a type of *BodyElement*, so it is only valid as content of a body element.

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

If you need to break up the limitation, extend the element with the element protocol of your choice or define it as `GlobalElement`.

```swift
extension FormContainer: GlobalElement {
    ...
}
```

## Topics

### Basic elements

- ``HTMLKit/Html``

- ``HTMLKit/Head``

- ``HTMLKit/Body``

### Head elements

- ``HTMLKit/Title``

- ``HTMLKit/Meta``

- ``HTMLKit/Style``

- ``HTMLKit/Base``

- ``HTMLKit/Link``

### Flow elements

- ``HTMLKit/Header``

- ``HTMLKit/Main``

- ``HTMLKit/Division``

- ``HTMLKit/Section``

- ``HTMLKit/Navigation``

- ``HTMLKit/Aside``

- ``HTMLKit/Footer``

### Paragraph elements

- ``HTMLKit/Heading1``

- ``HTMLKit/Heading2``

- ``HTMLKit/Heading3``

- ``HTMLKit/Heading4``

- ``HTMLKit/Heading5``

- ``HTMLKit/Heading6``

- ``HTMLKit/Paragraph``

- ``HTMLKit/Bold``

- ``HTMLKit/Italic``

- ``HTMLKit/Underline``

- ``HTMLKit/Emphasize``

- ``HTMLKit/Small``

- ``HTMLKit/Strong``

### List elements

- ``HTMLKit/UnorderedList``

- ``HTMLKit/OrderedList``

- ``HTMLKit/ListItem``

### Table elements

- ``HTMLKit/Table``

- ``HTMLKit/TableHead``

- ``HTMLKit/TableBody``

- ``HTMLKit/TableFoot``

- ``HTMLKit/TableRow``

- ``HTMLKit/HeaderCell``

- ``HTMLKit/DataCell``

### Form elements

- ``HTMLKit/Form``

- ``HTMLKit/Label``

- ``HTMLKit/Input``

- ``HTMLKit/TextArea``

- ``HTMLKit/Select``

- ``HTMLKit/Button``

- ``HTMLKit/Fieldset``

### Media elements

- ``HTMLKit/Audio``

- ``HTMLKit/Video``

### Vector elements

- ``HTMLKit/Circle``

- ``HTMLKit/Rectangle``

- ``HTMLKit/Ellipse``

- ``HTMLKit/Line``

- ``HTMLKit/Polygon``

- ``HTMLKit/Polyline``

- ``HTMLKit/Path``

- ``HTMLKit/Group``

- ``HTMLKit/Use``
