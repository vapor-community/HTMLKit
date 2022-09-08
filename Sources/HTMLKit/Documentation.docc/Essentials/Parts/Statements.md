# Statements

## Overview

### Branch Statements

If

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

### Loop Statements

ForEach

```swift
ForEach(in: context.categories) { category in
    Division {
        Paragraph {
            category.title
        }
        ...
    }
}
```

### Optional Statements

Unwrap

```swift
Unwrap(category.content) { content in
    Paragraph {
        content
    }
}
```
