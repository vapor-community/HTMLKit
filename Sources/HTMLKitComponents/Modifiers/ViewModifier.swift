/*
 Abstract:
 The file contains the modifiers for view components.
 */

public protocol ViewModifier {

    /// Sets the opacity of the view.
    func opacity(_ value: Tokens.OpacityValue) -> Self
    
    /// Sets the position of the view.
    func zIndex(_ index: Tokens.PositionIndex) -> Self
    
    /// Sets the background color of the view.
    func backgroundColor(_ color: Tokens.BackgroundColor) -> Self
    
    /// Hides the view
    func hidden() -> Self
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
    
    internal func mutate(state class: String) -> Self {
        return self.mutate(class: `class`)
    }
}
