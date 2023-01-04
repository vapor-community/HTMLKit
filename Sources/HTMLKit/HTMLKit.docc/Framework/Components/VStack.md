# VStack

A component to arrange content vertically.

## Declaration

```swift
struct VStack : View
```

## Overview

```swift
VStack(alignment: .leading) {
    StackColumn(size: .twelve) {
        Text {
            "Lorem ipsum..."
        }
    }
}
```

## Modifiers

- func backgroundColor(_ color: Tokens.BackgroundColor)

- func opacity(_ value: Tokens.OpacityValue)

- func zIndex(_ index: Tokens.PositionIndex)
