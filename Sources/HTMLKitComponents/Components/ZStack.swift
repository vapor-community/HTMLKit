import HTMLKit

/// A view that represents an overlay stack.
///
/// Use `ZStack` to overlay content.
///
/// ```swift
/// ZStack {
///     Text {
///         "Lorem ipsum"
///     }
/// }
/// ```
public struct ZStack: View, Actionable, Modifiable {
    
    /// The unique identifier of the stack.
    internal var id: String?
    
    /// The body content of the stack.
    internal let content: [Content]
    
    /// The class names for the stack.
    internal var classes: [String]
    
    /// The event handlers on the stack.
    internal var events: [String]?
    
    /// Create a stack.
    ///
    /// - Parameter content: The stack's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["zstack"]
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
    public func tag(_ value: String) -> ZStack {
        return self.mutate(id: value)
    }
    
    /// Set the drop shadow for the stack.
    ///
    /// - Parameters:
    ///   - radius: The radius to extend the shadow.
    ///   - color: The color to fill the shadow.
    ///
    /// - Returns: The stack
    public func shadow(_ radius: Tokens.BlurRadius = .small, color: Tokens.ShadowColor = .black) -> ZStack {
        return self.mutate(classes: "shadow:\(radius.value)", "shadow:\(color.value)")
    }
    
    /// Clip the content for the stack.
    ///
    /// - Returns: The stack
    public func clipped() -> ZStack {
        return self.mutate(classes: "overflow:clip")
    }
}

extension ZStack: MouseEvent {
    
    public func onHover(@ActionBuilder action: (ViewAction) -> [Action]) -> ZStack {
        return self.mutate(hoverevent: action(.init()))
    }
    
    public func onLeave(@ActionBuilder action: (ViewAction) -> [Action]) -> ZStack {
        return self.mutate(leaveevent: action(.init()))
    }
}

extension ZStack: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> ZStack {
        return self.mutate(backgroundcolor: color.value)
    }

    public func opacity(_ value: Tokens.OpacityValue) -> ZStack {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> ZStack {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> ZStack {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> ZStack {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> ZStack {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> ZStack {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> ZStack {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> ZStack {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> ZStack {
        return self.mutate(margin: length.value, insets: insets)
    }
}

