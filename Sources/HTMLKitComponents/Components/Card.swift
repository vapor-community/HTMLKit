/*
 Abstract:
 The file contains a card component.
 */

import HTMLKit

/// A component that distinguish content.
public struct Card: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The header of the card.
    public var header: [Content]?
    
    /// The content of the card.
    public var content: [Content]
    
    /// The classes of the content.
    internal var classes: [String]
    
    /// Creates a card.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["card"]
    }
    
    /// Creates a card.
    public init(@ContentBuilder<Content> content: () -> [Content],
                @ContentBuilder<Content> header: () -> [Content]) {
        
        self.content = content()
        self.header = header()
        self.classes = ["card"]
    }
    
    /// Creates a card.
    internal init(header: [Content]?, content: [Content], classes: [String], id: String?) {
        
        self.header = header
        self.content = content
        self.classes = classes
        self.id = id
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
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Card {
        return self.mutate(id: value)
    }
}

extension Card: ViewModifier {

    public func opacity(_ value: Tokens.OpacityValue) -> Card {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Card {
        return self.mutate(zindex: index.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Card {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func hidden() -> Card {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Card {
        
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
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Card {
        return self.mutate(bordershape: shape.value)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Card {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Card {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Card {
        return self.mutate(margin: length.value, insets: insets)
    }
}

