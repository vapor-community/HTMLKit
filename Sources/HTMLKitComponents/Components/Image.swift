/*
 Abstract:
 The file contains everything related to image component.
 */

import HTMLKit

public struct Image: View, Modifiable {
    
    /// The url path of the image.
    internal let source: DynamicType
    
    /// The classes of the image view.
    internal var classes: [String]
    
    /// Creates an image.
    public init(source: String) {
        
        self.source = .string(source)
        self.classes = ["image"]
    }
    
    /// Creates an image.
    public init(source: EnvironmentValue) {

         self.source = .value(source)
         self.classes = ["image"]
     }
    
    /// Creates a image view.
    internal init(source: String, classes: [String]) {
        
        self.source = .string(source)
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
        return self.mutate(aspectratio: ratio.value, fit: fit.value)
    }
    
    public func imageScale(_ scale: Tokens.ImageScale) -> Image {
        return self.mutate(imagescale: scale.value)
    }
    
    public func clipShape(_ shape: Tokens.ClipShape) -> Image {
        return self.mutate(clipshape: shape.value)
    }
    
    public func scaleToFit() -> Image {
        return self.mutate(objectfit: Tokens.ObjectFit.contain.value)
    }
    
    public func scaleToFill() -> Image {
        return self.mutate(objectfit: Tokens.ObjectFit.cover.value)
    }
}

extension Image: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Image {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Image {
        return self.mutate(zindex: index.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Image {
        return self.mutate(opacity: value.value)
    }
    
    public func hidden() -> Image {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Image {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Image {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Image {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Image {
        return self.mutate(bordershape: shape.value)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Image {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Image {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Image {
        return self.mutate(margin: length.value, insets: insets)
    }
}
