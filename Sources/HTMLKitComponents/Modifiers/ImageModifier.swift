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
    
    internal func mutate(objectfit class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(imagescale class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(clipshape class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(aspectratio classes: [String]) -> Self {
        return self.mutate(classes: classes)
    }
}
