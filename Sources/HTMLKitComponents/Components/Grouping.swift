/*
 Abstract:
 The file contains everything related to the group component.
 */

import HTMLKit

/// A component that collects content.
public struct Grouping: View, Modifiable, Identifiable {
    
    public var id: String?
    
    /// The content of the group.
    internal var content: [Content]
    
    /// The classes of the group.
    internal var classes: [String]
    
    /// Creates a group.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["grouping"]
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
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Grouping {
        
        var newSelf = self
        
        if let height {
            newSelf.classes.append("height:\(height.value)")
        }
        
        if let alignment {
            newSelf.classes.append("frame-alignment:\(alignment.value)")
        }
        
        newSelf.classes.append("width:\(width.value)")
        
        return newSelf
    }
    
    public func tag(_ value: String) -> Grouping {
        return self.mutate(id: value)
    }
}

extension Grouping: TextModifier {    
    
    public func textStyle(_ style: Tokens.TextStyle) -> Grouping {
        return self.mutate(textstyle: style.value)
    }
    
    public func textStyle(_ style: TextConfiguration) -> Grouping {
        return self.mutate(classes: style.configuration)
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
    
    public func textCase(_ case: Tokens.TextCase) -> Grouping {
        return self.mutate(textcase: `case`.value)
    }
    
    public func textDecoration(_ decoration: Tokens.TextDecoration) -> Grouping {
        return self.mutate(textdecoration: decoration.value)
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
        return self.mutate(textdecoration: Tokens.TextDecoration.underline.value)
    }
    
    public func underline(_ condition: Bool) -> Grouping {
        
        if condition {
            return self.mutate(textdecoration: Tokens.TextDecoration.underline.value)
        }
        
        return self
    }
    
    public func strikethrough() -> Grouping {
        return self.mutate(textdecoration: Tokens.TextDecoration.strikeThrough.value)
    }
    
    public func strikethrough(_ condition: Bool) -> Grouping {
        
        if condition {
            return self.mutate(textdecoration: Tokens.TextDecoration.strikeThrough.value)
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
