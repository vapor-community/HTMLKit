/*
 Abstract:
 The file contains everything related to the link component.
 */

import HTMLKit
import Foundation

/// A component that navigates to an target.
public struct Link: Component {

    /// The url path of the target.
    internal let destination: TemplateValue<String>
    
    /// The content of the link.
    internal var content: [AnyContent]
    
    /// The classes of the link.
    internal var classes: [String]
    
    /// The events of the link.
    internal var events: [String]?
    
    /// Creates a link.
    public init(destination: TemplateValue<String>, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.destination = destination
        self.content = content()
        self.classes = ["link"]
    }
    
    /// Creates a link.
    internal init(destination: TemplateValue<String>, content: [AnyContent], classes: [String], events: [String]?) {
        
        self.destination = destination
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Anchor {
            content
        }
        .reference(destination.rawValue)
        .class(classes.joined(separator: " "))
    }
}

extension Link: TextModifier {
    
    public func font(_ style: Tokens.TextStyle) -> Link {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Link {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Link {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        
        return newSelf
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Link {
        
        var newSelf = self
        newSelf.classes.append(weight.rawValue)
        
        return newSelf
    }
    
    public func fontTransformation(_ transformation: Tokens.TextTransformation) -> Link {
        
        var newSelf = self
        newSelf.classes.append(transformation.rawValue)
        
        return newSelf
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Link {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func bold() -> Link {
        
        var newSelf = self
        newSelf.classes.append(Tokens.FontWeight.bold.rawValue)
        
        return newSelf
    }
    
    public func italic() -> Link {
        
        var newSelf = self
        newSelf.classes.append(Tokens.FontStyle.italic.rawValue)
        
        return newSelf
    }
    
    public func underline() -> Link {
        
        var newSelf = self
        newSelf.classes.append(Tokens.TextDecoration.underline.rawValue)
        
        return newSelf
    }
}
