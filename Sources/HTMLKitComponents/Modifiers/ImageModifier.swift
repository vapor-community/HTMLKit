/*
 Abstract:
 The file contains the modifiers for image components.
 */

public protocol ImageModifier {
    
    /// Sets how the content should be resized to fit its parent.
    ///
    /// - Parameters:
    ///    - fit: The fit
    ///
    /// - Returns: A component
    func objectFit(_ fit: Tokens.ObjectFit) -> Self
    
    /// Sets the scale of the image.
    ///
    /// - Parameters:
    ///    - scale: The scale
    ///
    /// - Returns: A component
    func imageScale(_ scale: Tokens.ImageScale) -> Self
    
    /// Sets the fill style to use.
    ///
    /// - Parameters:
    ///    - shape: The fill style to use.
    ///
    /// - Returns: A component
    func clipShape(_ shape: Tokens.ClipShape) -> Self
}
