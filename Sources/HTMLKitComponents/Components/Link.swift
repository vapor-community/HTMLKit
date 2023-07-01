/*
 Abstract:
 The file contains everything related to the link component.
 */

import HTMLKit
import Foundation

/// A component that navigates to an target.
public struct Link: View, Modifiable {
    
    /// The target for the destination
    internal let target: HTMLKit.Values.Target

    /// The url path of the target.
    internal let destination: String
    
    /// The content of the link.
    internal var content: [Content]
    
    /// The classes of the link.
    internal var classes: [String]
    
    /// The events of the link.
    internal var events: [String]?
    
    /// Creates a link.
    public init(destination: String, target: HTMLKit.Values.Target = .current, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination
        self.target = target
        self.content = content()
        self.classes = ["link"]
    }
    
    /// Creates a link.
    public init(destination: URL, target: HTMLKit.Values.Target = .current, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination.absoluteString
        self.target = target
        self.content = content()
        self.classes = ["link"]
    }
    
    /// Creates a link.
    internal init(destination: String, target: HTMLKit.Values.Target, content: [Content], classes: [String], events: [String]?) {
        
        self.destination = destination
        self.target = target
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Anchor {
            content
        }
        .reference(destination)
        .target(target)
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
        return self.mutate(fontweight: Tokens.FontWeight.bold.rawValue)
    }
    
    public func italic() -> Link {
        return self.mutate(fontstyle: Tokens.FontStyle.italic.rawValue)
    }
    
    public func underline() -> Link {
        return self.mutate(fontdecoration: Tokens.TextDecoration.underline.rawValue)
    }
}

extension Link: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Link {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Link {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Link {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> Link {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Link {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Link {
        return self.mutate(padding: length.rawValue, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Link {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Link {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Link {
        return mutate(frame: width.rawValue, offset: offset?.rawValue)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Link {
        return self.mutate(margin: length.rawValue, insets: insets)
    }
}
