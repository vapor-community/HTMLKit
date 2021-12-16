# Elements

The elements represents the HTML tags. Every element has function handlers, wich are representing the attribute of a tag.

## Essential

### Definition

```swift
/// Element with content
Body {
    ...
}

/// Element without content
Input()
```

### Attributes

```swift
/// Attribute with value
.class("value")

/// Attribute as toggle
.required()
```

### Modifier
```swift
/// Modifies if the condition is true
Body {
    ...
}
.modify(if: condition) {
    $0.hidden()
}

/// Modifies if the value is set
Body {
    ...
}
.modify(unwrap: value) {
    $0.placeholder($1)
}
```

## Variation
