/*
 Abstract:
 The file contains the modifiers for input components.
 */

public protocol InputModifier {
    
    /// Sets the border shape of the input.
    ///
    /// - Parameters:
    ///    - shape:
    ///
    /// - Returns: A component
    func borderShape(_ shape: Tokens.BorderShape) -> Self
    
    /// Sets the background color of the input.
    ///
    /// - Parameters:
    ///    - color:
    ///
    /// - Returns: A component
    func backgroundColor(_ color: Tokens.BackgroundColor) -> Self
}

extension InputModifier where Self: Modifiable {
    
    internal func mutate(bordershape class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(backgroundcolor class: String) -> Self {
        return self.mutate(class: `class`)
    }
}

