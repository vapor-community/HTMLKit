# Conversion

Use conversion

## Overview

With HTMLKit you can convert your existing HTML code into Swift. It makes the change easier, faster and it can give you an idea how the library works.

### Call

Call the converter and use the convert function. Pass the directory, where your html files are located and choose the output. We recommend to use the print option first, to get a quick preview on the output. The print shows up in the debug window of your IDE. If you choose the file option, the converter creates the swift files at the same directory you have given to the converter.

```swift
/// creates the output as file
try Converter.default.convert(directory: directory, extension: .html, option: .file)

/// prints the output
try Converter.default.convert(directory: directory, extension: .html, option: .print)
```

### Input

```html
<!DOCTYPE html>
<html lang="en">
</html>
```

### Output

```swift
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

## Note

Keep in mind, that maybe the converter has not covered every case. If you miss something, file an [issue](https://github.com/vapor-community/HTMLKit/issues) and let us know to make the converter better.
