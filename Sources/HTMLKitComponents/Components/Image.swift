/*
 Abstract:
 The file contains everything related to image component.
 */

import HTMLKit

/// A component that displays an image.
public struct Image: View, Modifiable {
    
    /// The url path of the image.
    internal let source: String
    
    /// The classes of the image view.
    internal var classes: [String]
    
    /// Creates a image view.
    public init(source: String) {
        
        self.source = source
        self.classes = ["image"]
    }
    
    /// Creates a image view.
    internal init(source: String, classes: [String]) {
        
        self.source = source
        self.classes = classes
    }
    
    public var body: Content {
        Division {
            HTMLKit.Image()
                .source(source)
                .role(.img)
        }
        .class(classes.joined(separator: " "))
    }
}

extension Image: ImageModifier {
    
    public func objectFit(_ fit: Tokens.ObjectFit) -> Image {
        return self.mutate(objectfit: fit.rawValue)
    }
    
    public func imageScale(_ scale: Tokens.ImageScale) -> Image {
        return self.mutate(imagescale: scale.rawValue)
    }
    
    public func clipShape(_ shape: Tokens.ClipShape) -> Image {
        return self.mutate(clipshape: shape.rawValue)
    }
}

extension Image: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Image {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Image {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Image {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func hidden() -> Image {
        return self.mutate(state: Tokens.ViewState.hidden.rawValue)
    }
}
