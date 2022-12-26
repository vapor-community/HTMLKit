/*
 Abstract:
 The file contains everything related to the collection.
 */

import HTMLKit

/// A component that collects and arranges collection items horizontally.
public struct Collection: View, Actionable {
    
    internal var id: String?
    
    /// The content of the collection.
    internal var content: [ListElement]
    
    /// The classes of the collection.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a collection.
    public init(ratio: Tokens.ItemRatio = .half, @ContentBuilder<ListElement> content: () -> [ListElement]) {
        
        self.content = content()
        self.classes = ["collection", ratio.rawValue]
    }
    
    /// Creates a collection.
    internal init(content: [ListElement], classes: [String], events: [String]?, id: String?) {
        
        self.content = content
        self.classes = classes
        self.events = events
        self.id = id
    }
    
    public var body: Content {
        UnorderedList {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
        if let events = self.events {
            Script {
                events
            }
        }
    }
    
    public func id(_ value: String) -> Collection {
        return self.mutate(id: value)
    }
    
    /// Sets the style for the collection.
    public func collectionStyle(_ style: Tokens.CollectionStyle) -> Collection {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
}

extension Collection: Hoverable {
    
    public func onHover(perfom action: Actions) -> Collection {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> Collection {
        return self.mutate(leaveevent: action.script)
    }
}

/// A component that represents a collection item.
public struct CollectionItem: View, Actionable {
    
    internal var id: String?
    
    /// The content of the item.
    internal var content: [Content]
    
    /// The classes for the item.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a collection item.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["collection-item"]
    }
    
    /// Creates a collection item.
    internal init(content: [Content], classes: [String], events: [String]?, id: String?) {
        
        self.content = content
        self.classes = classes
        self.events = events
        self.id = id
    }
    
    public var body: Content {
        ListItem {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
        if let events = self.events {
            Script {
                events
            }
        }
    }
    
    public func id(_ value: String) -> CollectionItem {
        return self.mutate(id: value)
    }
}

extension CollectionItem: Hoverable {
    
    public func onHover(perfom action: Actions) -> CollectionItem {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> CollectionItem {
        return self.mutate(leaveevent: action.script)
    }
}
