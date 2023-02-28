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
    
    /// Sets the shape of the button.
    func borderShape(_ shape: Tokens.BorderShape) -> Self
    
    /// Sets the background color.
    func backgroundColor(_ color: Tokens.BackgroundColor) -> Self
    
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
    
    internal func mutate(bordershape class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(backgroundcolor class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(state class: String) -> Self {
        return self.mutate(class: `class`)
    }
}
