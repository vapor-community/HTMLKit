/*
 Abstract:
 The file contains the modifiers for input components.
 */

/// A type that describes the modifier of a input component.
public protocol InputModifier {
    
    /// Sets the border color of the input
    func borderColor(_ color: Tokens.BorderdColor) -> Self
    
    /// Sets the border shape of the input.
    func borderShape(_ shape: Tokens.BorderShape) -> Self
    
    /// Sets the background color of the input.
    func backgroundColor(_ color: Tokens.BackgroundColor) -> Self
    
    /// Sets the state of the view.
    func disabled(_ condition: Bool) -> Self
    
    /// Sets the color appearence
    func colorScheme(_ scheme: Tokens.ColorScheme) -> Self
}

extension InputModifier where Self: Modifiable {
    
    internal func mutate(bordercolor class: String) -> Self {
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
    
    internal func mutate(scheme class: String) -> Self {
        return self.mutate(class: `class`)
    }
}

