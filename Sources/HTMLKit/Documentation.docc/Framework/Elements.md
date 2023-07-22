# Elements

Write HTML markup using the abstraction.

## Overview

The elements in HTMLKit are an abstraction of the elements in HTML (Hyper Text Markup Language). If you have written HTML before, then you know, there are elements with or without an endtag. 

An element with an endtag, will be represented in HTMLKit as an element with curly brackets, while an element without, will be represented with the round brackets.

```swift
/// element with content
Body {
    Paragraph {
        "Lorem ipsum..."
    }
}

/// element without content
Input()
```

If you would like to add attributes, use the methods on the element. In most cases the method name matches the attribute name in HTML.

```swift
Input()
    .class("input")
```

To prevent writing invalid code, each element in HTMLKit owns an element limitation. For example the element *Heading1* is a type of *BodyElement*, so it is only valid as descendant of a body element.

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

- ``HTMLKit/Document``

- ``HTMLKit/Html``

- ``HTMLKit/Head``

- ``HTMLKit/Body``

- ``HTMLKit/Comment``

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

- ``HTMLKit/Article``

- ``HTMLKit/Span``

- ``HTMLKit/Dialog``

- ``HTMLKit/Details``

- ``HTMLKit/Summary``

- ``HTMLKit/DescriptionList``

- ``HTMLKit/TermName``

- ``HTMLKit/TermDefinition``

- ``HTMLKit/Address``

- ``HTMLKit/Template``

### Paragraph elements

- ``HTMLKit/HeadingGroup``

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

- ``HTMLKit/StrikeThrough``

- ``HTMLKit/ShortQuote``

- ``HTMLKit/DeletedText``

- ``HTMLKit/InsertedText``

- ``HTMLKit/Code``

- ``HTMLKit/SampleOutput``

- ``HTMLKit/KeyboardInput``

- ``HTMLKit/Cite``

- ``HTMLKit/Blockquote``

- ``HTMLKit/PreformattedText``

- ``HTMLKit/Subscript``

- ``HTMLKit/Superscript``

- ``HTMLKit/Ruby``

- ``HTMLKit/RubyPronunciation``

- ``HTMLKit/RubyText``

- ``HTMLKit/Mark``

- ``HTMLKit/Abbreviation``

- ``HTMLKit/Time``

- ``HTMLKit/Definition``

- ``HTMLKit/Bdi``

- ``HTMLKit/Bdo``

- ``HTMLKit/Variable``

### List elements

- ``HTMLKit/UnorderedList``

- ``HTMLKit/OrderedList``

- ``HTMLKit/ListItem``

- ``HTMLKit/Data``

### Table elements

- ``HTMLKit/Table``

- ``HTMLKit/TableHead``

- ``HTMLKit/TableBody``

- ``HTMLKit/TableFoot``

- ``HTMLKit/TableRow``

- ``HTMLKit/HeaderCell``

- ``HTMLKit/DataCell``

- ``HTMLKit/ColumnGroup``

- ``HTMLKit/Column``

- ``HTMLKit/Caption``

### Form elements

- ``HTMLKit/Form``

- ``HTMLKit/Label``

- ``HTMLKit/Input``

- ``HTMLKit/DataList``

- ``HTMLKit/TextArea``

- ``HTMLKit/Select``

- ``HTMLKit/OptionGroup``

- ``HTMLKit/Option``

- ``HTMLKit/Button``

- ``HTMLKit/Fieldset``

- ``HTMLKit/Legend``

- ``HTMLKit/Progress``

- ``HTMLKit/Meter``

- ``HTMLKit/Output``

### Link elements

- ``HTMLKit/Anchor``

### Media elements

- ``HTMLKit/Audio``

- ``HTMLKit/Video``

- ``HTMLKit/Source``

- ``HTMLKit/Track``

- ``HTMLKit/Image``

- ``HTMLKit/Map``

- ``HTMLKit/Area``

- ``HTMLKit/Picture``

- ``HTMLKit/Figure``

- ``HTMLKit/FigureCaption``

- ``HTMLKit/Object``

- ``HTMLKit/Parameter``

### Vector elements

- ``HTMLKit/Vector``

- ``HTMLKit/Circle``

- ``HTMLKit/Rectangle``

- ``HTMLKit/Ellipse``

- ``HTMLKit/Line``

- ``HTMLKit/Polygon``

- ``HTMLKit/Polyline``

- ``HTMLKit/Path``

- ``HTMLKit/Group``

- ``HTMLKit/Use``

### Break elements

- ``HTMLKit/LineBreak``

- ``HTMLKit/WordBreak``

- ``HTMLKit/HorizontalRule``

### Embed elements

- ``HTMLKit/Embed``

- ``HTMLKit/InlineFrame``

- ``HTMLKit/Canvas``

- ``HTMLKit/Slot``

### Script elements

- ``HTMLKit/Script``

- ``HTMLKit/NoScript``

- ``HTMLKit/Template``

### Custom elements

- ``HTMLKit/Custom``
