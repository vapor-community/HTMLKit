/*
 Abstract:
 The file contains the modifiers for input components.
 */

/// A type that describes the modifier of a input component.
public protocol InputModifier {
    
    /// Sets the state of the view.
    func disabled(_ condition: Bool) -> Self
    
    /// Sets the focus color of the input.
    func focusColor(_ color: Tokens.FocusColor) -> Self
}

extension InputModifier where Self: Modifiable {
    
    internal func mutate(inputstate value: String) -> Self {
        return self.mutate(class: "state:\(value)")
    }
    
    internal func mutate(focuscolor value: String) -> Self {
        return self.mutate(class: "focus:\(value)")
    }
}

