import HTMLKit

/// A view that represents a carousel container.
///
/// Use `Carousel` to cycle through an amount of slides.
///
/// ```swift
/// Carousel {
///     Slide {
///         Image(source: ...png)
///     }
///     .tag("slide")
/// }
/// ```
public struct Carousel: View, Identifiable, Modifiable {
    
    /// The unique identifier of the carousel.
    internal var id: String?
    
    /// The body content of the carousel.
    internal var content: [Slide]
    
    /// The class names for the carousel.
    internal var classes: [String]
    
    /// Create a carousel.
    ///
    /// - Parameter content: The carousel's content
    public init(@ContentBuilder<Slide> content: () -> [Slide]) {
        
        self.content = content()
        self.classes = ["carousel"]
    }
    
    public var body: Content {
        Division {
            Division {
                content
            }
            .class("carousel-content")
            Division {
                for item in content {
                    Anchor {
                    }
                    .class("indicator")
                    .modify(unwrap: item.id) {
                        $0.reference("#" + $1)
                    }
                }
            }
            .class("carousel-indication")
        }
        .class(classes)
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the carousel.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The carousel
    public func tag(_ value: String) -> Carousel {
        return self.mutate(id: value)
    }
    
    /// Set the style for the carousel.
    ///
    /// - Parameter style: The configuration to apply to.
    ///
    /// - Returns: The carousel
    public func carouselStyle(_ style: CarouselConfiguration) -> Carousel {
        return self.mutate(classes: style.configuration)
    }
}

extension Carousel: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Carousel {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Carousel {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> Carousel {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Carousel {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> Carousel {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> Carousel {
        return self.mutate(bordershape: shape.value)
    }
    
    @available(*, deprecated, message: "Use the background(_:) modifier instead.")
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Carousel {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func background(_ color: Tokens.BackgroundColor) -> Carousel {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Carousel {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Carousel {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Carousel {
        return self.mutate(margin: length.value, insets: insets)
    }
}
