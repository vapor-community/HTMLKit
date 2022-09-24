/*
 Abstract:
 */

import HTMLKit

/// A component that collects content.
public struct Group: Component {
    
    /// The content of the group.
    internal var content: [AnyContent]
    
    /// The classes of the group.
    internal var classes: [String]
    
    /// Creates a group.
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["group"]
    }
    
    /// Creates a group.
    internal init(content: [AnyContent], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }

    public var body: AnyContent {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
    
    /// The behaviour of the group.
    public var scripts: AnyContent {
        return [content.scripts]
    }
}

extension Group: TextModifier {
    
    public func font(_ style: Tokens.TextStyle) -> Group {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Group {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Group {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        
        return newSelf
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Group {
        
        var newSelf = self
        newSelf.classes.append(weight.rawValue)
        
        return newSelf
    }
    
    public func fontTransformation(_ transformation: Tokens.TextTransformation) -> Group {
        
        var newSelf = self
        newSelf.classes.append(transformation.rawValue)
        
        return newSelf
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Group {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func bold() -> Group {
        
        var newSelf = self
        newSelf.classes.append(Tokens.FontWeight.bold.rawValue)
        
        return newSelf
    }
    
    public func italic() -> Group {
        
        var newSelf = self
        newSelf.classes.append(Tokens.FontStyle.italic.rawValue)
        
        return newSelf
    }
    
    public func underline() -> Group {
        
        var newSelf = self
        newSelf.classes.append(Tokens.TextDecoration.underline.rawValue)
        
        return newSelf
    }
}
