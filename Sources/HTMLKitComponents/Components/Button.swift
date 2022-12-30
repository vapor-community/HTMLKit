/*
 Abstract:
 The file contains everything related to buttons.
 */

import HTMLKit
import Foundation

/// A component that initiates an action.
public struct ActionButton: View, Modifiable, Actionable {
    
    internal var id: String?
    
    /// The  content of the button.
    internal var content: [Content]
    
    /// The classes of the button.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a action button.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["button"]
    }
    
    /// Creates a action button.
    internal init(content: [Content], classes: [String], events: [String]?) {
        
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Button {
            self.content
        }
        .type(.button)
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
    
    public func id(_ value: String) -> ActionButton {
        return self.mutate(id: value)
    }
}

extension ActionButton: ButtonModifier {
    
    public func buttonSize(_ size: Tokens.ButtonSize) -> ActionButton {
        return self.mutate(buttonsize: size.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> ActionButton {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> ActionButton {
        return self.mutate(buttonstyle: style.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> ActionButton {
        return self.mutate(backgroundcolor: color.rawValue)
    }
}

extension ActionButton: PressModifier {
    
    public func onClick(perfom action: Actions) -> ActionButton {
        return self.mutate(clickevent: action.script)
    }
    
    public func onTap(perfom action: Actions) -> ActionButton {
        return self.mutate(tapevent: action.script)
    }
    
    public func onPress(perfom action: Actions) -> ActionButton {
        return self.mutate(pressevent: action.script)
    }
}

/// A component that initiates a form submit.
public struct SubmitButton: View, Modifiable {
    
    /// The  content of the button.
    internal var content: [Content]
    
    /// The classes of the button.
    internal var classes: [String]
    
    /// Creates a submit button.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["button"]
    }
    
    public var body: Content {
        Button {
            self.content
        }
        .type(.submit)
        .class(self.classes.joined(separator: " "))
    }
}

extension SubmitButton: ButtonModifier {
    
    public func buttonSize(_ size: Tokens.ButtonSize) -> SubmitButton {
        return self.mutate(buttonsize: size.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SubmitButton {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> SubmitButton {
        return self.mutate(buttonstyle: style.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SubmitButton {
        return self.mutate(backgroundcolor: color.rawValue)
    }
}

/// A component that initiates a form reset.
public struct ResetButton: View, Modifiable {
    
    /// The  content of the button.
    internal var content: [Content]
    
    /// The classes of the button.
    internal var classes: [String]
    
    /// Creates a reset button.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["button"]
    }
    
    /// Creates a sbumit button.
    internal init(content: [Content], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }

    public var body: Content {
        Button {
            self.content
        }
        .type(.reset)
        .class(self.classes.joined(separator: " "))
    }
}

extension ResetButton: ButtonModifier {
    
    public func buttonSize(_ size: Tokens.ButtonSize) -> ResetButton {
        return self.mutate(buttonsize: size.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> ResetButton {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> ResetButton {
        return self.mutate(buttonstyle: style.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> ResetButton {
        return self.mutate(backgroundcolor: color.rawValue)
    }
}

/// A component that initiates an action.
public struct LinkButton: View, Modifiable {
    
    /// The url path of the target.
    internal let destination: String
    
    /// The  content of the button.
    internal var content: [Content]
    
    /// The classes of the button.
    internal var classes: [String]
    
    /// The events of the button.
    internal var events: [String]?
    
    /// Creates a action button.
    public init(destination: String, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination
        self.content = content()
        self.classes = ["button"]
    }
    
    /// Creates a action button.
    internal init(destination: String, content: [Content], classes: [String], events: [String]?) {
        
        self.destination = destination
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Anchor {
            self.content
        }
        .reference(self.destination)
        .class(self.classes.joined(separator: " "))
        .role(.button)
    }
}

extension LinkButton: ButtonModifier {
    
    public func buttonSize(_ size: Tokens.ButtonSize) -> LinkButton {
        return self.mutate(buttonsize: size.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> LinkButton {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> LinkButton {
        return self.mutate(buttonstyle: style.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> LinkButton {
        return self.mutate(backgroundcolor: color.rawValue)
    }
}
