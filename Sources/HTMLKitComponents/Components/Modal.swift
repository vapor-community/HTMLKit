import HTMLKit

///
/// Use `Modal` to present a dialog on top of other views.
///
/// ```swift
/// Modal {
///     VStack {
///         Text {
///             "Lorem ipsum..."
///         }
///     }
/// }
/// .tag("lorem")
/// ```
public struct Modal: View, Modifiable, Actionable {
    
    /// The unique identifier of the modal.
    internal var id: String?
    
    /// The body content of the modal.
    internal var content: [Content]
    
    /// The class names for the modal.
    internal var classes: [String]
    
    /// The event handlers on the modal.
    internal var events: [String]?
    
    /// Create a modal.
    ///
    /// - Parameter content: The modal's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["modal"]
    }
    
    public var body: Content {
        Dialog {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
        if let events = self.events {
            Script {
                events
            }
        }
    }
    
    /// Set the identifier for the modal.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The modal
    public func tag(_ value: String) -> Modal {
        return self.mutate(id: value)
    }
    
    /// Set the style for the modal.
    ///
    /// - Parameter style: The configuration to apply to.
    ///
    /// - Returns: The modal
    public func modalStyle(_ style: ModalConfiguration) -> Modal {
        return self.mutate(classes: style.configuration)
    }
}

extension Modal: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Modal {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Modal {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> Modal {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Modal {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Modal {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Modal {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Modal {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Modal {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Modal {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Modal {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Modal {
        return self.mutate(margin: length.value, insets: insets)
    }
}
