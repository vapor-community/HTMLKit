/// A type that describes the modifier of a view.
public protocol GraphicsModifier {
    
    /// Specify the intensity of blur for the view.
    ///
    /// - Parameter size: The amout of blur to apply.
    ///
    /// - Returns: The graphic
    func blur(_ size: Tokens.BlurLevel) -> Self
    
    /// Adjust the grayscale depth for the view.
    ///
    /// - Parameter size: The amout of depth to apply.
    ///
    /// - Returns: The graphic
    func grayscale(_ size: Tokens.GrayscaleDepth) -> Self
    
    /// Set the level of brightness for the view.
    ///
    /// - Parameter size: The amout of brightness to apply.
    ///
    /// - Returns: The graphic
    func brightness(_ size: Tokens.BrightnessLevel) -> Self
    
    /// Set the level of saturation for the view.
    ///
    /// - Parameter size: The amount of saturation to apply.
    ///
    /// - Returns: The graphic
    func saturation(_ size: Tokens.SaturationLevel) -> Self
    
    /// Specify the level of contrast for the view.
    ///
    /// - Parameter size: The amount of contrast to apply.
    ///
    /// - Returns: The graphic
    func contrast(_ size: Tokens.ContrastLevel) -> Self
    
    /// Add drop shadow to the view.
    ///
    /// - Parameters:
    ///   - radius: The radius to extend the shadow.
    ///   - color: The color to fill the shadow.
    ///
    /// - Returns: The graphic
    func shadow(_ radius: Tokens.BlurRadius, color: Tokens.ShadowColor) -> Self
}

extension GraphicsModifier where Self: Modifiable {
    
    internal func mutate(blur value: String) -> Self {
        return self.mutate(classes: "blur:\(value)")
    }
    
    internal func mutate(grayscale value: String) -> Self {
        return self.mutate(classes: "grayscale:\(value)")
    }
    
    internal func mutate(brightness value: String) -> Self {
        return self.mutate(classes: "brightness:\(value)")
    }
    
    internal func mutate(saturation value: String) -> Self {
        return self.mutate(classes: "saturation:\(value)")
    }
    
    internal func mutate(contrast value: String) -> Self {
        return self.mutate(classes: "contrast:\(value)")
    }
    
    internal func mutate(shadow radius: String, color: String) -> Self {
        return self.mutate(classes: "shadow:\(radius)", "shadow:\(color)")
    }
}
