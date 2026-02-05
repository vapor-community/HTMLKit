import HTMLKit

/// A view that represents a range slider.
///
/// Use `Slider` to display a range of values.
///
/// ```swift
/// Slider(name: "lorem")
/// ```
public struct Slider: View, Modifiable, Identifiable {
    
    /// The unique identifier of the slider.
    internal var id: String?
    
    /// The name of the slider.
    internal let name: String
    
    /// The class names for the slider.
    internal var classes: [String]
    
    /// The event handlers on the slider.
    internal var events: [String]?
    
    /// Create a slider.
    ///
    /// - Parameter name: The name to assign to the field.
    public init(name: String) {
        
        self.name = name
        self.classes = ["slider"]
    }
    
    public var body: Content {
        Input()
            .type(.range)
            .name(name)
            .class(classes)
            .modify(unwrap: id) {
                $0.id($1)
            }
    }
    
    /// Set the identifier for the slider.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The slider
    public func tag(_ value: String) -> Slider {
        return self.mutate(id: value)
    }
}

extension Slider: InputModifier {
    
    public func disabled(_ condition: Bool = true) -> Slider {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> Slider {
        return self.mutate(focuscolor: color.value)
    }
}

extension Slider: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Slider {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Slider {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> Slider {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Slider {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> Slider {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> Slider {
        return self.mutate(bordershape: shape.value)
    }
    
    @available(*, deprecated, message: "Use the background(_:) modifier instead.")
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Slider {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func background(_ color: Tokens.BackgroundColor) -> Slider {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Slider {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Slider {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Slider {
        return self.mutate(margin: length.value, insets: insets)
    }
}
