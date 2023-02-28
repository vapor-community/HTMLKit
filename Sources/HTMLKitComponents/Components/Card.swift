/*
 Abstract:
 The file contains a card component.
 */

import HTMLKit

/// A component that distinguish content.
public class Card: View {
    
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
    internal init(header: [Content]?, content: [Content], classes: [String]) {
        
        self.header = header
        self.content = content
        self.classes = classes
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
    }
}
