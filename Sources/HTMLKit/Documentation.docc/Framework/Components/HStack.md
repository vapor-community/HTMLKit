# HStack

A component to arrange content horizontally.

## Declaration

```swift
struct HStack : View
```

## Overview

```swift
HStack(alignment: .center) {
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
