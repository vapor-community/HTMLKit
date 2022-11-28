# Collection

A component to collect and arrange collection items horizontally.

## Declaration

```swift
struct Collection : Component
```

## Overview

```swift
Collection(ratio: .half) {
    CollectionItem {
        Image(source: "../assets/thumbnail.png")
    }
}
```

### Modifiers

- collectionStyle(_ style: Token.CollectionStyle)
