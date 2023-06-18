/*
 Abstract:
 The file contains a dropdown component.
 */

import HTMLKit

/// A component that displays a list of actions.
public struct Dropdown: View, Modifiable {
    
    /// The label for the dropdown.
    internal var label: [Content]
    
    /// The content of the dropdown.
    internal var content: [Content]
    
    /// The classes of the dropdown.
    internal var classes: [String]
    
    /// Creates a dropdown.
    public init(@ContentBuilder<Content> content: () -> [Content], @ContentBuilder<Content> label: () -> [Content]) {
        
        self.label = label()
        self.content = content()
        self.classes = ["dropdown"]
    }
    
    /// Creates a dropdown.
    internal init(label: [Content], content: [Content], classes: [String]) {
        
        self.label = label
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        Division {
            HTMLKit.Button {
                label
            }
            .type(.button)
            .class("dropdown-label")
            Division {
                content
            }
            .class("dropdown-content")
        }
        .class(classes.joined(separator: " "))
    }
}

extension Dropdown: ButtonModifier {

    public func buttonSize(_ size: Tokens.ButtonSize) -> Dropdown {
        return self.mutate(buttonsize: size.rawValue)
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> Dropdown {
        return self.mutate(buttonstyle: style.rawValue)
    }
    
    public func disabled(_ condition: Bool) -> Dropdown {
        
        if condition {
            return self.mutate(buttonstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
}

extension Dropdown: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Dropdown {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Dropdown {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> Dropdown {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> Dropdown {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Dropdown {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Dropdown {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Dropdown {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Dropdown {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Dropdown {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}
