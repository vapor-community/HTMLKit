import HTMLKit
import Foundation

/// A view that represents an action button.
///
/// Use `Button` to trigger an action when tapped or clicked.
///
/// ```swift
/// Button(role: .button) {
///     "Lorem ipsum"
/// }
/// ```
public struct Button: View, Modifiable, Actionable {
    
    /// The unique identifier of the button.
    internal var id: String?
    
    /// The role of the button.
    internal var role: HTMLKit.Values.Button
    
    /// The body content of the button.
    internal var content: [Content]
    
    /// The class names for the button.
    internal var classes: [String]
    
    /// The event handlers on the button.
    internal var events: [String]?
    
    /// Create a button.
    ///
    /// - Parameters:
    ///   - role: The role of the button.
    ///   - content: The button's content.
    public init(role: HTMLKit.Values.Button, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.role = role
        self.content = content()
        self.classes = ["button"]
    }
    
    /// Create a button.
    ///
    /// - Parameters:
    ///   - localizedStringKey: The key of the localized string used as a label.
    ///   - role: The role of the button.
    public init(_ localizedStringKey: LocalizedStringKey, role: HTMLKit.Values.Button) {
        
        self.role = role
        self.content = [LocalizedString(key: localizedStringKey)]
        self.classes = ["button"]
    }
    
    public var body: Content {
        HTMLKit.Button {
            self.content
        }
        .type(role)
        .class(self.classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
        if let events = self.events {
            Script {
                events
            }
        }
    }
    
    /// Set the identifier for the button.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The button
    public func tag(_ value: String) -> Button {
        return self.mutate(id: value)
    }
}

extension Button: ButtonModifier {
    
    public func controlSize(_ size: Tokens.ControlSize) -> Button {
        return self.mutate(controlsize: size.value)
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> Button {
        return self.mutate(buttonstyle: style.value)
    }
    
    public func buttonStyle(_ style: ButtonConfiguration) -> Button {
        return self.mutate(classes: style.configuration)
    }
    
    public func disabled(_ condition: Bool = true) -> Button {
        
        if condition {
            return self.mutate(buttonstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
}

extension Button: PressEvent {
    
    public func onClick(@ActionBuilder action: (ViewAction) -> [Action]) -> Button {
        return self.mutate(clickevent: action(.init()))
    }
    
    public func onTap(@ActionBuilder action: (ViewAction) -> [Action]) -> Button {
        return self.mutate(tapevent: action(.init()))
    }
    
    public func onPress(@ActionBuilder action: (ViewAction) -> [Action]) -> Button {
        return self.mutate(pressevent: action(.init()))
    }
}

extension Button: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Button {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Button {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Button {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> Button {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Button {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Button {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Button {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Button {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Button {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet, length: Tokens.MarginLength = .small) -> Button {
        return self.mutate(margin: length.value, insets: insets)
    }
}
