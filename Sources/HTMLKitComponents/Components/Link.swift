/*
 Abstract:
 The file contains everything related to the link component.
 */

import HTMLKit
import Foundation

/// A component that navigates to an target.
public struct Link: View, Modifiable {

    /// The url path of the target.
    internal let destination: String
    
    /// The content of the link.
    internal var content: [Content]
    
    /// The classes of the link.
    internal var classes: [String]
    
    /// The events of the link.
    internal var events: [String]?
    
    /// Creates a link.
    public init(destination: String, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination
        self.content = content()
        self.classes = ["link"]
    }
    
    /// Creates a link.
    internal init(destination: String, content: [Content], classes: [String], events: [String]?) {
        
        self.destination = destination
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Anchor {
            content
        }
        .reference(destination)
        .class(classes.joined(separator: " "))
    }
}

extension Link: TextModifier {
    
    public func font(_ style: Tokens.TextStyle) -> Link {
        return self.mutate(font: style.rawValue)
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Link {
        return self.mutate(foregroundcolor: color.rawValue)
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Link {
        return self.mutate(fontsize: size.rawValue)
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Link {
        return self.mutate(fontweight: weight.rawValue)
    }
    
    public func fontTransformation(_ transformation: Tokens.TextTransformation) -> Link {
        return self.mutate(fonttransformation: transformation.rawValue)
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Link {
        return self.mutate(fontstyle: style.rawValue)
    }
    
    public func bold() -> Link {
        return self.mutate(bold: Tokens.FontWeight.bold.rawValue)
    }
    
    public func italic() -> Link {
        return self.mutate(italic: Tokens.FontStyle.italic.rawValue)
    }
    
    public func underline() -> Link {
        return self.mutate(underline: Tokens.TextDecoration.underline.rawValue)
    }
}
