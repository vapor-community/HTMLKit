import HTMLKit

public struct Alert: View, Identifiable, Modifiable {
    
    internal var id: String?
    
    /// The content of the alert
    internal var content: [Content]
    
    /// The classes of the carousel.
    internal var classes: [String]
    
    /// Creates a alert.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["alert"]
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
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
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Alert {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func hidden() -> Alert {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Alert {
        
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
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Alert {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Alert {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight?, alignment: Tokens.FrameAlignment?) -> Alert {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet, length: Tokens.MarginLength) -> Alert {
        return self.mutate(margin: length.value, insets: insets)
    }
}
