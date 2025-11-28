import HTMLKit

/// A view that represents navigation container.
///
/// Use `Navigation` to add semantic meaning to a list.
///
/// ```swift
/// Navigation {
///     List(direction: .vertical) {
///         Link(destination: "https://...") {
///             Text {
///                 "Lorem ipsum"
///             }
///         }
///     }
/// }
/// ```
public struct Navigation: View, Modifiable, Identifiable {
    
    /// The unique identifier of the navigation.
    internal var id: String?
    
    /// The body content of the navigation.
    internal var content: [BodyElement]
    
    /// The class names of the navigation
    internal var classes: [String]
    
    /// Create a navigation.
    ///
    /// - Parameter content: The navigation's content.
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
    
    /// Set the style for the navigation.
    ///
    /// - Parameter style: The option to apply to.
    ///
    /// - Returns: The navigation
    public func navigationStyle(_ style: Tokens.NavigationStyle) -> Navigation {
        
        var copy = self
        copy.classes.append("style:\(style.value)")
        
        return copy
    }
    
    /// Set the style for the navigation.
    ///
    /// - Parameter style: The configuration to apply to.
    ///
    /// - Returns: The navigation
    public func navigationStyle(_ style: NavigationConfiguration) -> Navigation {
        return self.mutate(classes: style.configuration)
    }
    
    /// Set the identifier for the navigation.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The navigation
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
    
    public func hidden(_ condition: Bool = true) -> Navigation {
        
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
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Navigation {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Navigation {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Navigation {
        return self.mutate(margin: length.value, insets: insets)
    }
}
