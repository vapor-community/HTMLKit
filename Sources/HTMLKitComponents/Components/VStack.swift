import HTMLKit

/// A component that arranges content vertically.
public struct VStack: View, Actionable, Modifiable {
    
    internal var id: String?
    
    /// The content of the stack.
    internal var content: [Content]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    var events: [String]?
    
    /// Creates a vertical stack.
    public init(alignment: Tokens.HorizontalAlignment = .leading, spacing: Tokens.ContentSpace? = nil, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        
        if let spacing {
            self.classes = ["vstack", "horizontal-alignment:\(alignment.value)", "spacing:\(spacing.value)"]
            
        } else {
            self.classes = ["vstack", "horizontal-alignment:\(alignment.value)"]
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
    
    public func tag(_ value: String) -> VStack {
        return self.mutate(id: value)
    }
    
    public func shadow(_ radius: Tokens.BlurRadius = .small, color: Tokens.ShadowColor = .black) -> VStack {
        return self.mutate(classes: ["shadow:\(radius.value)", "shadow:\(color.value)"])
    }
    
    public func clipped() -> VStack {
        return self.mutate(class: "overflow:clip")
    }
}

extension VStack: MouseEvent {
    
    public func onHover(@ActionBuilder action: (ViewAction) -> [Action]) -> VStack {
        return self.mutate(hoverevent: action(.init()))
    }
    
    public func onLeave(@ActionBuilder action: (ViewAction) -> [Action]) -> VStack {
        return self.mutate(leaveevent: action(.init()))
    }
}

extension VStack: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> VStack {
        return self.mutate(backgroundcolor: color.value)
    }

    public func opacity(_ value: Tokens.OpacityValue) -> VStack {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> VStack {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> VStack {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> VStack {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> VStack {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> VStack {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> VStack {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> VStack {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> VStack {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> VStack {
        return self.mutate(margin: length.value, insets: insets)
    }
}
