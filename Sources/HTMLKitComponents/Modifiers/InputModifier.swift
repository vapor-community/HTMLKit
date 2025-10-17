/// A type that describes the modifier of a input component.
public protocol InputModifier {
    
    /// Disable the input
    ///
    /// - Parameter condition: Whether to disable the input.
    ///
    /// - Returns: The input
    func disabled(_ condition: Bool) -> Self
    
    /// Set the focus color for the input.
    ///
    /// - Parameter color: The color to apply as the focus.
    ///
    /// - Returns: The input
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
