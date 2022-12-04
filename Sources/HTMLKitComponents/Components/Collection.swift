/*
 Abstract:
 The file contains everything related to the collection.
 */

import HTMLKit

/// A component that collects and arranges collection items horizontally.
public struct Collection: Component {
    
    /// The content of the collection.
    internal var content: [Content]
    
    /// The classes of the collection.
    internal var classes: [String]
    
    /// The events of the collection.
    internal var events: [String]?
    
    /// Creates a collection.
    public init(ratio: Tokens.ItemRatio = .half, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["collection", ratio.rawValue]
    }
    
    /// Creates a collection.
    internal init(content: [Content], classes: [String], events: [String]?) {
        
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        UnorderedList {
            content
        }
        .class(classes.joined(separator: " "))
    }
    
    /// Sets the style for the collection.
    public func collectionStyle(_ style: Tokens.CollectionStyle) -> Collection {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
}

/// A component that represents a collection item.
public struct CollectionItem: Component {
    
    /// The content of the item.
    internal var content: [Content]
    
    /// The classes for the item.
    internal var classes: [String]
    
    /// The events of the item.
    internal var events: [String]?
    
    /// Creates a collection item.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["collection-item"]
    }
    
    /// Creates a collection item.
    internal init(content: [Content], classes: [String], events: [String]?) {
        
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        ListItem {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
