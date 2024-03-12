/*
 Abstract:
 The file contains the modifiers for view components.
 */

/// A type that describes the modifier of a view.
public protocol GraphicsModifier {
    
    /// Specifies the intensity of blur for the view.
    func blur(_ size: Tokens.BlurLevel) -> Self
    
    /// Adjusts the grayscale depth of the view.
    func grayscale(_ size: Tokens.GrayscaleDepth) -> Self
    
    /// Sets the level of brightness of the view.
    func brightness(_ size: Tokens.BrightnessLevel) -> Self
    
    /// Sets the level of saturation of the view.
    func saturation(_ size: Tokens.SaturationLevel) -> Self
    
    /// Specifies the level of contrast for the view.
    func contrast(_ size: Tokens.ContrastLevel) -> Self
}

extension GraphicsModifier where Self: Modifiable {
    
    internal func mutate(blur value: String) -> Self {
        return self.mutate(class: "blur:\(value)")
    }
    
    internal func mutate(grayscale value: String) -> Self {
        return self.mutate(class: "grayscale:\(value)")
    }
    
    internal func mutate(brightness value: String) -> Self {
        return self.mutate(class: "brightness:\(value)")
    }
    
    internal func mutate(saturation value: String) -> Self {
        return self.mutate(class: "saturation:\(value)")
    }
    
    internal func mutate(contrast value: String) -> Self {
        return self.mutate(class: "contrast:\(value)")
    }
}
