/*
 Abstract:
 The file contains everything related to vidoe component.
 */

import HTMLKit

public struct Video: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The url path of the image.
    internal let source: DynamicType
    
    /// The classes of the image view.
    internal var classes: [String]
    
    /// Creates an image.
    public init(source: String) {
        
        self.source = .string(source)
        self.classes = ["video"]
    }
    
    /// Creates an image.
    public init(source: EnvironmentValue) {
        
        self.source = .value(source)
        
        self.classes = ["video"]
     }
    
    public var body: Content {
        HTMLKit.Video {
        }
        .source(source)
        .controls()
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Video {
        return self.mutate(id: value)
    }
}

extension Video: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Video {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Video {
        return self.mutate(zindex: index.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Video {
        return self.mutate(opacity: value.value)
    }
    
    public func hidden() -> Video {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Video {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Video {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Video {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Video {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Video {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Video {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Video {
        return self.mutate(margin: length.value, insets: insets)
    }
}
