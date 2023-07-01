/*
 Abstract:
 The file contains the modifiers for image components.
 */

/// A type that describes the modifier of a image component.
public protocol ImageModifier {
    
    /// Sets how the content should be resized to fit its parent.
    func aspectRatio(_ ratio: Tokens.AspectRatio, fit: Tokens.ObjectFit) -> Self
    
    /// Sets the scale of the image.
    func imageScale(_ scale: Tokens.ImageScale) -> Self
    
    /// Sets the fill style to use.
    func clipShape(_ shape: Tokens.ClipShape) -> Self
    
    func scaleToFit() -> Self
    
    func scaleToFill() -> Self
}

extension ImageModifier where Self: Modifiable {
    
    internal func mutate(objectfit value: String) -> Self {
        return self.mutate(class: "fit:\(value)")
    }
    
    internal func mutate(imagescale value: String) -> Self {
        return self.mutate(class: "scale:\(value)")
    }
    
    internal func mutate(clipshape value: String) -> Self {
        return self.mutate(class: "shape:\(value)")
    }
    
    internal func mutate(aspectratio ratio: String, fit: String) -> Self {
        
        var classes: [String] = []
        
        classes.append("aspect:\(ratio)")
        classes.append("fit:\(fit)")
        
        return self.mutate(classes: classes)
    }
}
