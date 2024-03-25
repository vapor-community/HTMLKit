/*
 Abstract:
 The file contains a modal component.
 */

import HTMLKit

/// A component that presents a dialog on top of other views.
public struct Modal: View, Modifiable, Actionable {
    
    internal var id: String?
    
    /// The content of the modal.
    internal var content: [Content]
    
    /// The classes of the modal.
    internal var classes: [String]
    
    /// The events of the modal.
    internal var events: [String]?
    
    /// Creates a modal.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["modal"]
    }
    
    public var body: Content {
        Dialog {
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
    
    public func tag(_ value: String) -> Modal {
        return self.mutate(id: value)
    }
    
    public func modalStyle(_ style: ModalConfiguration) -> Modal {
        return self.mutate(classes: style.configuration)
    }
}

extension Modal: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Modal {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Modal {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> Modal {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Modal {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Modal {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Modal {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Modal {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Modal {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Modal {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Modal {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Modal {
        return self.mutate(margin: length.value, insets: insets)
    }
}
