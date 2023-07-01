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
        HTMLKit.Image()
            .source(source)
            .role(.img)
            .class(classes.joined(separator: " "))
    }
}

extension Image: ImageModifier {
    
    public func aspectRatio(_ ratio: Tokens.AspectRatio ,fit: Tokens.ObjectFit) -> Image {
        return self.mutate(aspectratio: ratio.rawValue, fit: fit.rawValue)
    }
    
    public func imageScale(_ scale: Tokens.ImageScale) -> Image {
        return self.mutate(imagescale: scale.rawValue)
    }
    
    public func clipShape(_ shape: Tokens.ClipShape) -> Image {
        return self.mutate(clipshape: shape.rawValue)
    }
    
    public func scaleToFit() -> Image {
        return self.mutate(objectfit: Tokens.ObjectFit.contain.rawValue)
    }
    
    public func scaleToFill() -> Image {
        return self.mutate(objectfit: Tokens.ObjectFit.cover.rawValue)
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
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Image {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Image {
        return self.mutate(padding: length.rawValue, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Image {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Image {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Image {
        return mutate(frame: width.rawValue, offset: offset?.rawValue)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Image {
        return self.mutate(margin: length.rawValue, insets: insets)
    }
}
