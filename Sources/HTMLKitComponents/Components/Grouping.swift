/*
 Abstract:
 The file contains everything related to the group component.
 */

import HTMLKit

/// A component that collects content.
public struct Grouping: View, Modifiable {
    
    /// The content of the group.
    internal var content: [Content]
    
    /// The classes of the group.
    internal var classes: [String]
    
    /// Creates a group.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["grouping"]
    }
    
    /// Creates a group.
    internal init(content: [Content], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }

    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Grouping {
        
        var newSelf = self
        
        if let offset {
            newSelf.classes.append(offset.rawValue)
        }
        
        newSelf.classes.append(width.rawValue)
        
        return newSelf
    }
}

extension Grouping: TextModifier {
    
    public func font(_ style: Tokens.TextStyle) -> Grouping {
        return self.mutate(font: style.rawValue)
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Grouping {
        return self.mutate(foregroundcolor: color.rawValue)
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Grouping {
        return self.mutate(fontsize: size.rawValue)
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Grouping {
        return self.mutate(fontweight: weight.rawValue)
    }
    
    public func fontTransformation(_ transformation: Tokens.TextTransformation) -> Grouping {
        return self.mutate(fonttransformation: transformation.rawValue)
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Grouping {
        return self.mutate(fontstyle: style.rawValue)
    }
    
    public func bold() -> Grouping {
        return self.mutate(bold: Tokens.FontWeight.bold.rawValue)
    }
    
    public func italic() -> Grouping {
        return self.mutate(italic: Tokens.FontStyle.italic.rawValue)
    }
    
    public func underline() -> Grouping {
        return self.mutate(underline: Tokens.TextDecoration.underline.rawValue)
    }
}
