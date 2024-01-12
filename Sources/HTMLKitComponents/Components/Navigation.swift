import HTMLKit

public struct Navigation: View, Modifiable, Identifiable {
    
    public var id: String?
    
    internal var content: [BodyElement]
    
    public var classes: [String]
    
    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        
        self.content = content()
        self.classes = ["navigation"]
    }
    
    public var body: Content {
        HTMLKit.Navigation {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Sets the style for the list.
    public func navigationStyle(_ style: Tokens.NavigationStyle) -> Navigation {
        
        var newSelf = self
        newSelf.classes.append("style:\(style.value)")
        
        return newSelf
    }
    
    public func tag(_ value: String) -> Navigation {
        return self.mutate(id: value)
    }
}

extension Navigation: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Navigation {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Navigation {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Navigation {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> Navigation {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Navigation {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Navigation {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Navigation {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Navigation {
        return self.mutate(bordershape: shape.value)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Navigation {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil) -> Navigation {
        return mutate(frame: width.value, height: height?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Navigation {
        return self.mutate(margin: length.value, insets: insets)
    }
}
