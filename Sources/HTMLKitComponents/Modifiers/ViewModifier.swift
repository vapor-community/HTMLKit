/*
 Abstract:
 The file contains the modifiers for view components.
 */

public protocol ViewModifier {

    /// Sets the opacity of the view.
    ///
    /// - Parameters:
    ///    - value:
    ///
    /// - Returns: A component
    func opacity(_ value: Tokens.OpacityValue) -> Self
    
    /// Sets the position of the view.
    ///
    /// - Parameters:
    ///    - index:
    ///
    /// - Returns: A component
    func zIndex(_ index: Tokens.PositionIndex) -> Self
    
    /// Sets the background color of the view.
    ///
    /// - Parameters:
    ///    - color:
    ///
    /// - Returns: A component
    func backgroundColor(_ color: Tokens.BackgroundColor) -> Self
}
