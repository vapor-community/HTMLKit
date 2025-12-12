import HTMLKit

/// A view that represents a video embed.
///
/// Use `Video` to play a video.
///
/// ```swift
/// Video(source: "...mov")
/// ```
public struct Video: View, Modifiable, Identifiable {
    
    /// The unique identifier of the video.
    internal var id: String?
    
    /// The source path of the video.
    internal let source: DynamicType
    
    /// The class names for the video.
    internal var classes: [String]
    
    /// Create a video.
    ///
    /// - Parameter source: The souce path to load from.
    public init(source: String) {
        
        self.source = .string(source)
        self.classes = ["video"]
    }
    
    /// Create a video.
    ///
    /// - Parameter source: The souce path to load from.
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
    
    /// Set the identifier for the video.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The video
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
    
    public func hidden(_ condition: Bool = true) -> Video {
        
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
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> Video {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> Video {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Video {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Video {
        return self.mutate(margin: length.value, insets: insets)
    }
}
