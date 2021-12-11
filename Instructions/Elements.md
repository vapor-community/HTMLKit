# Elements

The elements are

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
.class("bg-white")

/// Attribute as toggle
.required()
```

### Modifier
```swift
Body {
    ...
}
.modifiy(if: isOpen) {
    $0.hidden()
}
```

## Variation
