/*
 Abstract:
 The file contains everything related to the group component.
 */

import HTMLKit

/// A component that collects content.
public struct Grouping: View, Modifiable, Identifiable {
    
    internal var id: String?
    
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
    internal init(content: [Content], classes: [String], id: String?) {
        
        self.content = content
        self.classes = classes
        self.id = id
    }

    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Grouping {
        
        var newSelf = self
        
        if let offset {
            newSelf.classes.append("offset:\(offset.value)")
        }
        
        newSelf.classes.append("size:\(width.value)")
        
        return newSelf
    }
    
    public func tag(_ value: String) -> Grouping {
        return self.mutate(id: value)
    }
}

extension Grouping: TextModifier {    
    
    public func font(_ style: Tokens.TextStyle) -> Grouping {
        return self.mutate(font: style.value)
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Grouping {
        return self.mutate(foregroundcolor: color.value)
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Grouping {
        return self.mutate(fontsize: size.value)
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Grouping {
        return self.mutate(fontweight: weight.value)
    }
    
    public func fontTransformation(_ transformation: Tokens.TextTransformation) -> Grouping {
        return self.mutate(fonttransformation: transformation.value)
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Grouping {
        return self.mutate(fontstyle: style.value)
    }
    
    public func bold() -> Grouping {
        return self.mutate(fontweight: Tokens.FontWeight.bold.value)
    }
    
    public func bold(_ condition: Bool) -> Grouping {
        
        if condition {
            return self.mutate(fontweight: Tokens.FontWeight.bold.value)
        }
        
        return self
    }
    
    public func italic() -> Grouping {
        return self.mutate(fontstyle: Tokens.FontStyle.italic.value)
    }
    
    public func italic(_ condition: Bool) -> Grouping {
    
        if condition {
            return self.mutate(fontstyle: Tokens.FontStyle.italic.value)
        }
        
        return self
    }
    
    public func underline() -> Grouping {
        return self.mutate(fontdecoration: Tokens.TextDecoration.underline.value)
    }
    
    public func underline(_ condition: Bool) -> Grouping {
        
        if condition {
            return self.mutate(fontdecoration: Tokens.TextDecoration.underline.value)
        }
        
        return self
    }
    
    public func strikethrough() -> Grouping {
        return self.mutate(fontdecoration: Tokens.TextDecoration.strikeThrough.value)
    }
    
    public func strikethrough(_ condition: Bool) -> Grouping {
        
        if condition {
            return self.mutate(fontdecoration: Tokens.TextDecoration.strikeThrough.value)
        }
        
        return self
    }
    
    public func lineSpacing(_ height: Tokens.LineHeight) -> Grouping {
        return self.mutate(lineheight: height.value)
    }
    
    public func lineLimit(_ limit: Tokens.LineLimit) -> Grouping {
        return self.mutate(linelimit: limit.value)
    }
}
