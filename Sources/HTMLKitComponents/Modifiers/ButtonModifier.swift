/*
 Abstract:
 The file contains the modifiers for button components.
 */

/// A type that describes the modifier of a button component.
public protocol ButtonModifier {
    
    /// Sets the size of the button.
    func buttonSize(_ size: Tokens.ButtonSize) -> Self
 
    /// Sets the style of the button.
    func buttonStyle(_ style: Tokens.ButtonStyle) -> Self
    
    /// Sets the state of the view.
    func disabled(_ condition: Bool) -> Self
}

extension ButtonModifier where Self: Modifiable {
    
    internal func mutate(buttonsize class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(buttonstyle class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(buttonstate class: String) -> Self {
        return self.mutate(class: `class`)
    }
}
