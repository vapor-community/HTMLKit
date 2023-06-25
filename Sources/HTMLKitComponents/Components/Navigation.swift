import HTMLKit

public struct Navigation: View, Modifiable {
    
    internal var content: [BodyElement]
    
    public var classes: [String]
    
    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        
        self.content = content()
        self.classes = ["navigation"]
    }
    
    internal init(content: [BodyElement], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        HTMLKit.Navigation {
            content
        }
        .class(classes.joined(separator: " "))
    }
    
    /// Sets the style for the list.
    public func navigationStyle(_ style: Tokens.NavigationStyle) -> Navigation {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Navigation {
        
        var newSelf = self
        
        if let offset {
            newSelf.classes.append(offset.rawValue)
        }
        
        newSelf.classes.append(width.rawValue)
        
        return newSelf
    }
}
