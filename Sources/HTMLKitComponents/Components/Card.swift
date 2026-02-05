import HTMLKit

/// A view that represents a card container.
///
/// Use `Card` to group and distinguish content from other content.
///
/// ```swift
/// Card {
///     Text {
///         "Lorem ipsum..."
///     }
/// } header: {
///     Image(source: "...png")
/// }
/// ```
public struct Card: View, Modifiable, Identifiable {
    
    /// The unique identifier of the card.
    internal var id: String?
    
    /// The header content of the card.
    internal let header: [Content]?
    
    /// The body content of the card.
    internal let content: [Content]
    
    /// The class names for the card.
    internal var classes: [String]
    
    /// Create a card.
    ///
    /// - Parameter content: The card's content
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.header = nil
        self.content = content()
        self.classes = ["card"]
    }
    
    /// Create a card.
    ///
    /// - Parameters:
    ///   - content: The card's content.
    ///   - header: The card's header.
    public init(@ContentBuilder<Content> content: () -> [Content], @ContentBuilder<Content> header: () -> [Content]) {
        
        self.content = content()
        self.header = header()
        self.classes = ["card"]
    }
    
    public var body: Content {
        Division {
            Division {
                header
            }
            .class("card-header")
            Division {
                content
            }
            .class("card-body")
        }
        .class(classes)
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the card.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The card
    public func tag(_ value: String) -> Card {
        return self.mutate(id: value)
    }
    
    /// Set the style for the card.
    ///
    /// - Parameter style: The configuration to apply to.
    ///
    /// - Returns: The card
    public func cardStyle(_ style: CardConfiguration) -> Card {
        return self.mutate(classes: style.configuration)
    }
}

extension Card: ViewModifier {

    public func opacity(_ value: Tokens.OpacityValue) -> Card {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Card {
        return self.mutate(zindex: index.value)
    }
    
    @available(*, deprecated, message: "Use the background(_:) modifier instead.")
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Card {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func background(_ color: Tokens.BackgroundColor) -> Card {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func hidden(_ condition: Bool = true) -> Card {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Card {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Card {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> Card {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> Card {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Card {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Card {
        return self.mutate(margin: length.value, insets: insets)
    }
}

