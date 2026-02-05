import HTMLKit

/// A view that represents a alert message.
///
/// Use the `Alert` to display a brief or important message.
///
/// ```swift
/// Alert {
///    "Lorem ipsum..."
/// }
/// ```
public struct Alert: View, Identifiable, Modifiable {
    
    /// The unique identifier of the alert.
    internal var id: String?
    
    /// The body content of the alert
    internal let content: [Content]
    
    /// The class names for the alert.
    internal var classes: [String]
    
    /// Create a alert.
    ///
    /// - Parameter content: The alert's content
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["alert"]
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes)
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the alert.
    ///
    /// - Parameter value: The value of the identifier
    ///
    /// - Returns: The alert
    public func tag(_ value: String) -> Alert {
        return self.mutate(id: value)
    }
}

extension Alert: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Alert {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Alert {
        return self.mutate(zindex: index.value)
    }
    
    @available(*, deprecated, message: "Use the background(_:) modifier instead.")
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Alert {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func background(_ color: Tokens.BackgroundColor) -> Alert {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func hidden(_ condition: Bool = true) -> Alert {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Alert {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet, length: Tokens.PaddingLength) -> Alert {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> Alert {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> Alert {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight?, alignment: Tokens.FrameAlignment?) -> Alert {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet, length: Tokens.MarginLength) -> Alert {
        return self.mutate(margin: length.value, insets: insets)
    }
}
