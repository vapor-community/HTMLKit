import HTMLKit
import Foundation

/// A view that represents a text link.
///
/// Use `Link` to navigate to a target.
///
/// ```swift
/// Link(destination: "https://..") {
///     Text {
///         "Lorem ipsum"
///     }
/// }
/// ```
public struct Link: View, Modifiable, Identifiable {
    
    /// The unique identifier of the link.
    internal var id: String?
    
    /// The target behaviour for the destination
    internal let target: HTMLKit.Values.Target

    /// The url path of the target.
    internal let destination: String
    
    /// The body content of the link.
    internal let content: [Content]
    
    /// The class names for the link.
    internal var classes: [String]
    
    /// The event handlers on the link.
    internal var events: [String]?
    
    /// Create a link.
    ///
    /// - Parameters:
    ///   - destination: The url of the target to navigate to.
    ///   - target: The behaviour that determines how to open the target.
    ///   - content: The content displayed as the label.
    public init(destination: String, target: HTMLKit.Values.Target = .current, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination
        self.target = target
        self.content = content()
        self.classes = ["link"]
    }
    
    /// Create a link.
    ///
    /// - Parameters:
    ///   - destination: The url of the target to navigate to.
    ///   - target: The behaviour that determines how to open the target.
    ///   - content: The content displayed as the label.
    public init(destination: URL, target: HTMLKit.Values.Target = .current, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination.absoluteString
        self.target = target
        self.content = content()
        self.classes = ["link"]
    }
    
    public var body: Content {
        Anchor {
            content
        }
        .reference(destination)
        .target(target)
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the link.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The link
    public func tag(_ value: String) -> Link {
        return self.mutate(id: value)
    }
}

extension Link: TextModifier {
    
    public func font(_ family: Tokens.FontFamily) -> Link {
        return self.mutate(fontfamily: family.value)
    }
    
    public func textStyle(_ style: Tokens.TextStyle) -> Link {
        return self.mutate(textstyle: style.value)
    }
    
    public func textStyle(_ style: TextConfiguration) -> Link {
        return self.mutate(classes: style.configuration)
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Link {
        return self.mutate(foregroundcolor: color.value)
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Link {
        return self.mutate(fontsize: size.value)
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Link {
        return self.mutate(fontweight: weight.value)
    }
    
    public func textCase(_ case: Tokens.TextCase) -> Link {
        return self.mutate(textcase: `case`.value)
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Link {
        return self.mutate(fontstyle: style.value)
    }
    
    public func textDecoration(_ decoration: Tokens.TextDecoration) -> Link {
        return self.mutate(textdecoration: decoration.value)
    }
    
    public func bold(_ condition: Bool = true) -> Link {
        
        if condition {
            return self.mutate(fontweight: Tokens.FontWeight.bold.value)
        }
        
        return self
    }
    
    public func italic(_ condition: Bool = true) -> Link {
    
        if condition {
            return self.mutate(fontstyle: Tokens.FontStyle.italic.value)
        }
        
        return self
    }
    
    public func underline(_ condition: Bool = true) -> Link {
        
        if condition {
            return self.mutate(textdecoration: Tokens.TextDecoration.underline.value)
        }
        
        return self
    }
    
    public func strikethrough(_ condition: Bool = true) -> Link {
        
        if condition {
            return self.mutate(textdecoration: Tokens.TextDecoration.strikeThrough.value)
        }
        
        return self
    }
    
    public func lineSpacing(_ height: Tokens.LineHeight) -> Link {
        return self.mutate(lineheight: height.value)
    }
    
    public func lineLimit(_ limit: Tokens.LineLimit) -> Link {
        return self.mutate(linelimit: limit.value)
    }
    
    public func shadow(_ radius: Tokens.BlurRadius, color: Tokens.ShadowColor = .black) -> Link {
        return self.mutate(shadow: radius.value, color: color.value)
    }
}

extension Link: ViewModifier {
    
    @available(*, deprecated, message: "Use the background(_:) modifier instead.")
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Link {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func background(_ color: Tokens.BackgroundColor) -> Link {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Link {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Link {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> Link {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Link {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Link {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> Link {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> Link {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Link {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Link {
        return self.mutate(margin: length.value, insets: insets)
    }
}
