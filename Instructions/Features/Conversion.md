# Conversion

The converter translates HTML into HTMLKit.

## Essential

### Call

```swift
/// [configure.swift]
...
/// creates the output as file
try Converter.default.convert(directory: directory, extension: .html, option: .file)

/// prints the output
try Converter.default.convert(directory: directory, extension: .html, option: .print)
...
```

### Input

```html
<!-- Simple.html -->

<!DOCTYPE html>
<html lang="en">
</html>
```

### Output

```swift
/// [SimplePage.swift]

import HTMLKit

struct IndexPage: Page {

    public var body: AnyContent {
        Document(type: .html5)
        Html {
        }
        .language(.english)
        
    }
}
```
