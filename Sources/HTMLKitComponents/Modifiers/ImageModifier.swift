/// A type that describes the modifier of a image component.
public protocol ImageModifier {
    
    /// Set how the content should be resized to fit its parent.
    ///
    /// - Parameters:
    ///   - ratio: The ratio to maintain during resizing.
    ///   - fit: The scaling behavior to apply when resizing.
    ///
    /// - Returns: The image
    func aspectRatio(_ ratio: Tokens.AspectRatio, fit: Tokens.ObjectFit) -> Self
    
    /// Scale the image proportionally.
    ///
    /// - Parameter scale: The factor by which to scale the image.
    ///
    /// - Returns: The image
    func imageScale(_ scale: Tokens.ImageScale) -> Self
    
    /// Set the fill style to use.
    ///
    /// - Parameter shape: The shape the image will be clipped to.
    ///
    /// - Returns: The image
    func clipShape(_ shape: Tokens.ClipShape) -> Self
    
    /// Scale the image to fit within the parent.
    ///
    /// - Returns: The image
    func scaleToFit() -> Self
    
    /// Scale the image to fill the parent.
    ///
    /// - Returns: The image
    func scaleToFill() -> Self
}

extension ImageModifier where Self: Modifiable {
    
    internal func mutate(objectfit value: String) -> Self {
        return self.mutate(classes: "fit:\(value)")
    }
    
    internal func mutate(imagescale value: String) -> Self {
        return self.mutate(classes: "scale:\(value)")
    }
    
    internal func mutate(clipshape value: String) -> Self {
        return self.mutate(classes: "shape:\(value)")
    }
    
    internal func mutate(aspectratio ratio: String, fit: String) -> Self {
        return self.mutate(classes: "aspect:\(ratio)", "fit:\(fit)")
    }
}
