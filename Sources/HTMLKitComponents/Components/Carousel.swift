/*
 Abstract:
 The file contains a carousel component.
 */

import HTMLKit

/// A compnonent that cycles through an amount of views.
public struct Carousel: View, Identifiable, Modifiable {
    
    internal var id: String?
    
    /// The content of the carousel.
    internal var content: [Slide]
    
    /// The classes of the carousel.
    internal var classes: [String]
    
    /// Creates a carousel.
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
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Carousel {
        return self.mutate(id: value)
    }
    
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
    
    public func hidden() -> Carousel {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Carousel {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Carousel {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Carousel {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Carousel {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Carousel {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Carousel {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Carousel {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Carousel {
        return self.mutate(margin: length.value, insets: insets)
    }
}

public struct Slide: View, Identifiable, Modifiable {
    
    internal var id: String?
    
    internal var classes: [String]
    
    internal var content: [Content]
    
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["slide"]
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Slide {
        return self.mutate(id: value)
    }
}

extension Slide: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Slide {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Slide {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> Slide {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Slide {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Slide {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Slide {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Slide {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Slide {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Slide {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Slide {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Slide {
        return self.mutate(margin: length.value, insets: insets)
    }
}
