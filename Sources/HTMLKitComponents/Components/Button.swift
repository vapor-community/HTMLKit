/*
 Abstract:
 The file contains everything related to buttons.
 */

import HTMLKit
import Foundation

/// A view that represents a button.
///
/// Use `Button` to trigger an action when tapped or clicked.
///
/// ```swift
/// Button(role: .button) {
///     "Lorem ipsum"
/// }
/// ```
public struct Button: View, Modifiable, Actionable {
    
    /// The identifier of the button.
    internal var id: String?
    
    /// The role of the button.
    internal var role: HTMLKit.Values.Button
    
    /// The  content of the button.
    internal var content: [Content]
    
    /// The classes of the button.
    internal var classes: [String]
    
    /// The events of the button.
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
    
    public func disabled() -> Button {
        return self.mutate(buttonstate: Tokens.ViewState.disabled.value)
    }
    
    public func disabled(_ condition: Bool) -> Button {
        
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
    
    public func hidden() -> Button {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Button {
        
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

/// A component that initiates an action.
public struct LinkButton: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    internal let target: HTMLKit.Values.Target
    
    /// The url path of the target.
    internal let destination: String
    
    /// The  content of the button.
    internal var content: [Content]
    
    /// The classes of the button.
    internal var classes: [String]
    
    /// The events of the button.
    internal var events: [String]?
    
    /// Creates a action button.
    public init(destination: String, target: HTMLKit.Values.Target = .current, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination
        self.target = target
        self.content = content()
        self.classes = ["button"]
    }
    
    /// Creates a action button.
    public init(destination: URL, target: HTMLKit.Values.Target = .current, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination.absoluteString
        self.target = target
        self.content = content()
        self.classes = ["button"]
    }
    
    public var body: Content {
        Anchor {
            self.content
        }
        .reference(self.destination)
        .target(target)
        .class(self.classes.joined(separator: " "))
        .role(.button)
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> LinkButton {
        return self.mutate(id: value)
    }
}

extension LinkButton: ButtonModifier {
    
    public func controlSize(_ size: Tokens.ControlSize) -> LinkButton {
        return self.mutate(controlsize: size.value)
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> LinkButton {
        return self.mutate(buttonstyle: style.value)
    }

    public func buttonStyle(_ style: ButtonConfiguration) -> LinkButton {
        return self.mutate(classes: style.configuration)
    }
    
    public func disabled() -> LinkButton {
        return self.mutate(buttonstate: Tokens.ViewState.disabled.value)
    }
    
    public func disabled(_ condition: Bool) -> LinkButton {
        
        if condition {
            return self.mutate(buttonstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
}

extension LinkButton: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> LinkButton {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> LinkButton {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> LinkButton {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> LinkButton {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> LinkButton {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> LinkButton {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> LinkButton {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> LinkButton {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> LinkButton {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> LinkButton {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> LinkButton {
        return self.mutate(margin: length.value, insets: insets)
    }
}
