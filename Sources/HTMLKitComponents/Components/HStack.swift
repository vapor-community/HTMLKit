import HTMLKit

/// A view that represents an horizontal stack.
///
/// Use `HStack` to arrange content horizontally.
///
/// ```swift
/// HStack {
///     Symbol(.house)
///     Text {
///         "Lorem ipsum"
///     }
/// }
/// ```
public struct HStack: View, Actionable, Modifiable {
    
    /// The unique identifier of the stack.
    internal var id: String?
    
    /// The body content of the stack.
    internal var content: [Content]
    
    /// The class names for the stack.
    internal var classes: [String]
    
    /// The event handlers on the stack.
    internal var events: [String]?
     
    /// Create a horizontal stack
    ///
    /// - Parameters:
    ///   - alignment: The alignment to apply to the content
    ///   - spacing: The spacing to set between elements
    ///   - content: The content to arrange within the stack
    public init(alignment: Tokens.VerticalAlignment = .center, spacing: Tokens.ContentSpace? = nil, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        
        if let spacing {
            self.classes = ["hstack", "vertical-alignment:\(alignment.value)", "spacing:\(spacing.value)"]
            
        } else {
            self.classes = ["hstack", "vertical-alignment:\(alignment.value)"]
        }
    }
    
    public var body: Content {
        Division {
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
    
    /// Set the identifier for the stack.
    ///
    /// - Parameter value: The value of the identifier
    ///
    /// - Returns: The stack
    public func tag(_ value: String) -> HStack {
        return self.mutate(id: value)
    }
    
    /// Set the drop shadow for the stack.
    ///
    /// - Parameters:
    ///   - radius: The radius to extend the shadow.
    ///   - color: The color to fill the shadow.
    ///
    /// - Returns: The stack
    public func shadow(_ radius: Tokens.BlurRadius = .small, color: Tokens.ShadowColor = .black) -> HStack {
        return self.mutate(classes: ["shadow:\(radius.value)", "shadow:\(color.value)"])
    }
    
    /// Clip the content for the stack.
    ///
    /// - Returns: The stack
    public func clipped() -> HStack {
        return self.mutate(class: "overflow:clip")
    }
}

extension HStack: MouseEvent {
    
    public func onHover(@ActionBuilder action: (ViewAction) -> [Action]) -> HStack {
        return self.mutate(hoverevent: action(.init()))
    }
    
    public func onLeave(@ActionBuilder action: (ViewAction) -> [Action]) -> HStack {
        return self.mutate(leaveevent: action(.init()))
    }
}

extension HStack: ViewModifier {

    public func backgroundColor(_ color: Tokens.BackgroundColor) -> HStack {
        return self.mutate(backgroundcolor: color.value)
    }

    public func opacity(_ value: Tokens.OpacityValue) -> HStack {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> HStack {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> HStack {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> HStack {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> HStack {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> HStack {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> HStack {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> HStack {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> HStack {
        return self.mutate(margin: length.value, insets: insets)
    }
}
