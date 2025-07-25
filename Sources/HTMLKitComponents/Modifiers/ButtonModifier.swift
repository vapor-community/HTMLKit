/// A type that describes the modifier of a button component.
public protocol ButtonModifier {
    
    /// Set the size for the button.
    ///
    /// - Parameter size: The unit to size the button.
    ///
    /// - Returns: The button
    func controlSize(_ size: Tokens.ControlSize) -> Self
 
    /// Set the appearance for the button.
    ///
    /// - Parameter style: The option to apply.
    ///
    /// - Returns: The button
    func buttonStyle(_ style: Tokens.ButtonStyle) -> Self
    
    /// Set the appereance for the button with a configuration.
    ///
    /// - Parameter style: The configuration to apply.
    ///
    /// - Returns: The button
    func buttonStyle(_ style: ButtonConfiguration) -> Self
    
    /// Disable the button.
    func disabled() -> Self
    
    /// Disable the button.
    ///
    /// - Parameter condition: Whether to disable the button.
    ///
    /// - Returns: The button
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
