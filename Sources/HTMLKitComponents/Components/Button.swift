/*
 Abstract:
 The file contains everything related to buttons.
 */

import HTMLKit
import Foundation

/// A component that initiates an action.
public struct ActionButton: Component {
    
    /// The url path of the target.
    internal let destination: Property<String>
    
    /// The  content of the button.
    internal var content: [Content]
    
    /// The classes of the button.
    internal var classes: [String]
    
    /// The events of the button.
    internal var events: [String]?
    
    /// Creates a action button.
    public init(destination: Property<String>, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.destination = destination
        self.content = content()
        self.classes = ["button"]
    }
    
    /// Creates a action button.
    internal init(destination: Property<String>, content: [Content], classes: [String], events: [String]?) {
        
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

extension ActionButton: ButtonModifier {
    
    public func buttonSize(_ size: Tokens.ButtonSize) -> ActionButton {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        
        return newSelf
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> ActionButton {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> ActionButton {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> ActionButton {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that initiates a form submit.
public struct SubmitButton: Component {
    
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
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        
        return newSelf
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SubmitButton {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> SubmitButton {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SubmitButton {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that initiates a form reset.
public struct ResetButton: Component {
    
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
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        
        return newSelf
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> ResetButton {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func buttonStyle(_ style: Tokens.ButtonStyle) -> ResetButton {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> ResetButton {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}
