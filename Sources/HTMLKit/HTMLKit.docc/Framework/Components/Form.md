# Form

A component that collects form controls.

## Declaration

```swift
struct Form : View
```

## Overview

```swift
Form(method: .post) {
    FieldLabel(name: "firstname") {
        "Firstname"
    }
    TextField(name: "firstname")
}
```
