/*
 Abstract:
 The file contains everything related to images.
 */

import HTMLKit

/// A component that displays an image.
public struct Image: Component {
    
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
    
    public var body: AnyContent {
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
        
        var newSelf = self
        newSelf.classes.append(fit.rawValue)
        
        return newSelf
    }
    
    public func imageScale(_ scale: Tokens.ImageScale) -> Image {
        
        var newSelf = self
        newSelf.classes.append(scale.rawValue)
        
        return newSelf
    }
    
    public func clipShape(_ shape: Tokens.ClipShape) -> Image {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
}

extension Image: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Image {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Image {
        
        var newSelf = self
        newSelf.classes.append(index.rawValue)
        
        return newSelf
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Image {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        
        return newSelf
    }
}
