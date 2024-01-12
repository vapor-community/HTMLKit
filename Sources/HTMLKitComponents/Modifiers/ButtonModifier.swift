/*
 Abstract:
 The file contains the modifiers for button components.
 */

/// A type that describes the modifier of a button component.
public protocol ButtonModifier {
    
    /// Sets the size of the button.
    func controlSize(_ size: Tokens.ControlSize) -> Self
 
    /// Sets the style of the button.
    func buttonStyle(_ style: Tokens.ButtonStyle) -> Self
    
    /// Sets the style of the button.
    func buttonStyle(_ style: ButtonConfiguration) -> Self
    
    /// Sets the state of the view.
    func disabled() -> Self
    
    /// Sets the state of the view.
    func disabled(_ condition: Bool) -> Self
}

extension ButtonModifier where Self: Modifiable {
    
    internal func mutate(controlsize value: String) -> Self {
        return self.mutate(class: "size:\(value)")
    }
    
    internal func mutate(buttonstyle value: String) -> Self {
        return self.mutate(class: "style:\(value)")
    }
    
    internal func mutate(buttonstate value: String) -> Self {
        return self.mutate(class: "state:\(value)")
    }
}
