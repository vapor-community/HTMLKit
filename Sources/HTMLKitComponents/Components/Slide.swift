import HTMLKit

public struct Slide: View, Identifiable, Modifiable {
    
    internal var id: String?
    
    internal var classes: [String]
    
    internal var content: [Content]
    
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["slide"]
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
    
    public func tag(_ value: String) -> Slide {
        return self.mutate(id: value)
    }
}

extension Slide: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Slide {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Slide {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> Slide {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Slide {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Slide {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Slide {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Slide {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Slide {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Slide {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Slide {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Slide {
        return self.mutate(margin: length.value, insets: insets)
    }
}
