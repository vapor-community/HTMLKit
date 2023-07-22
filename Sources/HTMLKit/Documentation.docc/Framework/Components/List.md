# List

A component to collect and arrange list items vertically.

## Declaration

```swift
struct List : View
```

## Overview

```swift
List(direction: .vertical) {
    ListRow {
        Text {
            "Lorem ipsum..."
        }
    }
}
```

## Modifiers

- func listStyle(_ style: Tokens.ListStyle)
