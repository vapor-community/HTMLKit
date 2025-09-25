import Foundation
import HTMLKit

/// A view that represents a link button.
///
/// Use `LinkButton`to navigate to a target.
///
/// ```swift
/// LinkButton(destination: "https://..") {
///     "Lorem ipsum"
/// }
/// ```
public struct LinkButton: View, Modifiable, Identifiable {
    
    /// The unique identifier of the button.
    internal var id: String?
    
    /// The target behaviour for the destination
    internal let target: HTMLKit.Values.Target
    
    /// The url path of the target.
    internal let destination: String
    
    /// The body content of the button.
    internal var content: [Content]
    
    /// The class names for the button.
    internal var classes: [String]
    
    /// The event handlers on the button.
    internal var events: [String]?
    
    /// Create a link button.
    ///
    /// - Parameters:
    ///   - destination: The url of the target to navigate to.
    ///   - target: The behaviour that determines how to open the target.
    ///   - content: The content displayed as the label.
    public init(destination: String, target: HTMLKit.Values.Target = .current, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination
        self.target = target
        self.content = content()
        self.classes = ["button"]
    }
    
    /// Create a link button.
    ///
    /// - Parameters:
    ///   - localizedStringKey: The key of the localized string used as the label.
    ///   - destination: The url of the target to navigate to.
    ///   - target: The behaviour that determines how to open the target.
    public init(_ localizedStringKey: LocalizedStringKey, destination: String, target: HTMLKit.Values.Target = .current) {
        
        self.destination = destination
        self.target = target
        self.content = [LocalizedString(key: localizedStringKey)]
        self.classes = ["button"]
    }
    
    /// Create a link button.
    ///
    /// - Parameters:
    ///   - destination: The url of the target to navigate to.
    ///   - target: The behaviour that determines how to open the target.
    ///   - content: The content displayed as the label.
    public init(destination: URL, target: HTMLKit.Values.Target = .current, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination.absoluteString
        self.target = target
        self.content = content()
        self.classes = ["button"]
    }
    
    /// Create a link button.
    ///
    /// - Parameters:
    ///   - localizedStringKey: The key of the localized string used as the label.
    ///   - destination: The url of the target to navigate to.
    ///   - target: The behaviour that determines how to open the target.
    public init(_ localizedStringKey: LocalizedStringKey, destination: URL, target: HTMLKit.Values.Target = .current) {
        
        self.destination = destination.absoluteString
        self.target = target
        self.content = [LocalizedString(key: localizedStringKey)]
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
    
    public func disabled(_ condition: Bool = true) -> LinkButton {
        
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
    
    public func hidden(_ condition: Bool = true) -> LinkButton {
        
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
