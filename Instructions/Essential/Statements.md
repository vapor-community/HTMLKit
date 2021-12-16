# Statements

## Essential

### If

```swift
IF(context.categories.isEmpty) {
    Paragraph {
        "There aren't any categories yet!"
    }
}
.else {
    ...
}
```

### ForEach

```swift
ForEach(in: context.categories) { category in
    Division {
        Paragraph {
            category.title
        }
        ...
    }
}
```

### Unwrap

```swift
Unwrap(category.content) { content in
    Paragraph {
        content
    }
}
```
