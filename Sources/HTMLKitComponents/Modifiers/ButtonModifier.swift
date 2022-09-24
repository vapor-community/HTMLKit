/*
 Abstract:
 The file contains the modifiers for button components.
 */

public protocol ButtonModifier {
    
    /// Sets the size of the button.
    ///
    /// - Parameters:
    ///    - size:
    ///
    /// - Returns: A component
    func buttonSize(_ size: Tokens.ButtonSize) -> Self
 
    /// Sets the style of the button.
    ///
    /// - Parameters:
    ///    - style:
    ///
    /// - Returns: A component
    func buttonStyle(_ style: Tokens.ButtonStyle) -> Self
    
    /// Sets the shape of the button.
    ///
    /// - Parameters:
    ///    - shape:
    ///
    /// - Returns: A component
    func borderShape(_ shape: Tokens.BorderShape) -> Self
    
    /// Sets the background color.
    ///
    /// - Parameters:
    ///    - color:
    ///
    /// - Returns: A component
    func backgroundColor(_ color: Tokens.BackgroundColor) -> Self
}

