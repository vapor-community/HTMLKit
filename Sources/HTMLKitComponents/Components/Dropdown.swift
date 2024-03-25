/*
 Abstract:
 The file contains a dropdown component.
 */

import HTMLKit

/// A component that displays a list of actions.
public struct Dropdown: View, Modifiable, Identifiable {
    
    internal var id: String?
    
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
    
    public var body: Content {
        Division {
            Division {
                label
            }
            .class("dropdown-label")
            Division {
                content
            }
            .class("dropdown-content")
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Dropdown {
        return self.mutate(id: value)
    }
}

extension Dropdown: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Dropdown {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Dropdown {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> Dropdown {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Dropdown {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Dropdown {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Dropdown {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Dropdown {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Dropdown {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Dropdown {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Dropdown {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Dropdown {
        return self.mutate(margin: length.value, insets: insets)
    }
}
