/*
 Abstract:
 The file contains the modifiers for text components.
 */

public protocol TextModifier {
    
    /// Sets the style of the text.
    ///
    /// - Parameters:
    ///    - style:
    ///
    /// - Returns: A component
    func font(_ style: Tokens.TextStyle) -> Self
    
    /// Sets the foreground color of the text.
    ///
    /// - Parameters:
    ///    - color:
    ///
    /// - Returns: A component
    func foregroundColor(_ color: Tokens.ForegroundColor) -> Self
    
    /// Sets the size of the text.
    ///
    /// - Parameters:
    ///    - size:
    ///
    /// - Returns: A component
    func fontSize(_ size: Tokens.FontSize) -> Self
    
    /// Sets the weight of the text.
    ///
    /// - Parameters:
    ///    - weight:
    ///
    /// - Returns:
    func fontWeight(_ weight: Tokens.FontWeight) -> Self
    
    /// Sets the transformation for the text.
    ///
    /// - Parameters:
    ///    - transformation:
    ///
    /// - Returns: A component
    func fontTransformation(_ transformation: Tokens.TextTransformation) -> Self
    
    /// Sets the style of the font.
    ///
    /// - Parameters:
    ///    - style:
    ///
    /// - Returns: A component
    func fontStyle(_ style: Tokens.FontStyle) -> Self
    
    /// Applies a bold font weight to the text.
    ///
    /// - Returns: A component
    func bold() -> Self
    
    /// Applies italics to the text.
    ///
    /// - Returns: A component
    func italic() -> Self
    
    /// Applies an underline to the text.
    ///
    /// - Returns: A component
    func underline() -> Self
}
