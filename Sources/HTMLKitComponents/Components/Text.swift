/*
 Abstract:
 The file contains everything related to the text component.
 */

import HTMLKit

/// A component that displays text.
public struct Text: View {

    /// The identifier of the text.
    internal var id: String?
    
    /// The content of the text.
    internal var content: [AnyContent]
    
    /// The classes of the text.
    internal var classes: [String]
    
    /// The events of the text.
    internal var events: [String]?
    
    /// Creates a text.
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["text"]
        self.id = nil
    }
    
    /// Creates a text.
    internal init(content: [AnyContent], classes: [String], events: [String]?, id: String?) {
        
        self.content = content
        self.classes = classes
        self.events = events
        self.id = id
    }
    
    public var body: AnyContent {
        Paragraph {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func id(_ value: String) -> Text {
        
        var newSelf = self
        newSelf.id = value
        
        return newSelf
    }
}

extension Text: TextModifier {
    
    public func font(_ style: Tokens.TextStyle) -> Text {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Text {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Text {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        
        return newSelf
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Text {
        
        var newSelf = self
        newSelf.classes.append(weight.rawValue)
        
        return newSelf
    }
    
    public func fontTransformation(_ transformation: Tokens.TextTransformation) -> Text {
        
        var newSelf = self
        newSelf.classes.append(transformation.rawValue)
        
        return newSelf
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Text {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func bold() -> Text {
        
        var newSelf = self
        newSelf.classes.append(Tokens.FontWeight.bold.rawValue)
        
        return newSelf
    }
    
    public func italic() -> Text {
        
        var newSelf = self
        newSelf.classes.append(Tokens.FontStyle.italic.rawValue)
        
        return newSelf
    }
    
    public func underline() -> Text {
        
        var newSelf = self
        newSelf.classes.append(Tokens.TextDecoration.underline.rawValue)
        
        return newSelf
    }
}
