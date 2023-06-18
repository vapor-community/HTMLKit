/*
 Abstract:
 The file contains the modifiers for view components.
 */

/// A type that describes the modifier of a view.
public protocol ViewModifier {

    /// Sets the opacity of the view.
    func opacity(_ value: Tokens.OpacityValue) -> Self
    
    /// Sets the position of the view.
    func zIndex(_ index: Tokens.PositionIndex) -> Self
    
    /// Sets the background color of the view.
    func backgroundColor(_ color: Tokens.BackgroundColor) -> Self
    
    /// Hides the view
    func hidden() -> Self
    
    /// Sets the color appearence
    func colorScheme(_ scheme: Tokens.ColorScheme) -> Self
    
    /// Sets the box padding
    func padding(_ length: Tokens.BoxPadding) -> Self
    
    /// Sets the shape of the button.
    func borderShape(_ shape: Tokens.BorderShape) -> Self
    
    /// Sets the border color of the input
    func borderColor(_ color: Tokens.BorderColor) -> Self
    
    func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset?) -> Self
}

extension ViewModifier where Self: Modifiable {
    
    internal func mutate(opacity class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(zindex class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(backgroundcolor class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(viewstate class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(scheme class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(padding class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(bordershape class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(bordercolor class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(frame classes: [String]) -> Self {
        return self.mutate(classes: classes)
    }
}
