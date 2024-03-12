/*
 Abstract:
 The file contains everything related to image component.
 */

import HTMLKit

public struct Image: View, Modifiable, Identifiable {
    
    internal var id: String?
    
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
    
    public var body: Content {
        HTMLKit.Image()
            .source(source)
            .role(.img)
            .class(classes.joined(separator: " "))
            .modify(unwrap: id) {
                $0.id($1)
            }
    }
    
    public func tag(_ value: String) -> Image {
        return self.mutate(id: value)
    }
    
    public func imageStyle(_ style: ImageConfiguration) -> Image {
        return self.mutate(classes: style.configuration)
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
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Image {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Image {
        return self.mutate(margin: length.value, insets: insets)
    }
}

extension Image: GraphicsModifier {
    
    public func blur(_ level: Tokens.BlurLevel) -> Image {
        return mutate(blur: level.value)
    }
    
    public func grayscale(_ depth: Tokens.GrayscaleDepth) -> Image {
        return mutate(grayscale: depth.value)
    }
    
    public func brightness(_ level: Tokens.BrightnessLevel) -> Image {
        return mutate(brightness: level.value)
    }
    
    public func saturation(_ level: Tokens.SaturationLevel) -> Image {
        return mutate(saturation: level.value)
    }
    
    public func contrast(_ level: Tokens.ContrastLevel) -> Image {
        return mutate(contrast: level.value)
    }
}
