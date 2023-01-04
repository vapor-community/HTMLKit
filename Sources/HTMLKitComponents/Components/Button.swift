/*
 Abstract:
 The file contains everything related to buttons.
 */

import HTMLKit
import Foundation

/// A component that initiates an action.
public struct Button: View, Modifiable, Actionable {
    
    internal var id: String?
    
    /// The role of the button
    internal var role: HTMLKit.Values.Button
    
    /// The  content of the button.
    internal var content: [Content]
    
    /// The classes of the button.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a action button.
    public init(role: HTMLKit.Values.Button, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.role = role
        self.content = content()
        self.classes = ["button"]
    }
    
    /// Creates a action button.
    internal init(role: HTMLKit.Values.Button, content: [Content], classes: [String], events: [String]?) {
        
        self.role = role
        self.content = content
        self.classes = classes
        self.events = events
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
    
    public func id(_ value: String) -> Button {
        return self.mutate(id: value)
    }
}

extension Button: ButtonModifier {
    
    public func buttonSize(_ size: Tokens.ButtonSize) -> Button {
        return self.mutate(buttonsize: size.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Button {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> Button {
        return self.mutate(buttonstyle: style.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Button {
        return self.mutate(backgroundcolor: color.rawValue)
    }
}

extension Button: PressModifier {
    
    public func onClick(perfom action: Actions) -> Button {
        return self.mutate(clickevent: action.script)
    }
    
    public func onTap(perfom action: Actions) -> Button {
        return self.mutate(tapevent: action.script)
    }
    
    public func onPress(perfom action: Actions) -> Button {
        return self.mutate(pressevent: action.script)
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
