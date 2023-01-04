/*
 Abstract:
 */

import HTMLKit

/// A component that collects content.
public struct Group: View, Modifiable {
    
    /// The content of the group.
    internal var content: [Content]
    
    /// The classes of the group.
    internal var classes: [String]
    
    /// Creates a group.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["group"]
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
}

extension Group: TextModifier {
    
    public func font(_ style: Tokens.TextStyle) -> Group {
        return self.mutate(font: style.rawValue)
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Group {
        return self.mutate(foregroundcolor: color.rawValue)
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Group {
        return self.mutate(fontsize: size.rawValue)
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Group {
        return self.mutate(fontweight: weight.rawValue)
    }
    
    public func fontTransformation(_ transformation: Tokens.TextTransformation) -> Group {
        return self.mutate(fonttransformation: transformation.rawValue)
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Group {
        return self.mutate(fontstyle: style.rawValue)
    }
    
    public func bold() -> Group {
        return self.mutate(bold: Tokens.FontWeight.bold.rawValue)
    }
    
    public func italic() -> Group {
        return self.mutate(italic: Tokens.FontStyle.italic.rawValue)
    }
    
    public func underline() -> Group {
        return self.mutate(underline: Tokens.TextDecoration.underline.rawValue)
    }
}
