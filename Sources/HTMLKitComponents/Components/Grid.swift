/*
 Abstract:
 The file contains everything related to the collection.
 */

import HTMLKit

/// A component that collects and arranges collection items horizontally.
public struct Grid: View, Actionable {
    
    internal var id: String?
    
    /// The content of the collection.
    internal var content: [ListElement]
    
    /// The classes of the collection.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a collection.
    public init(ratio: Tokens.ItemRatio = .half, @ContentBuilder<ListElement> content: () -> [ListElement]) {
        
        self.content = content()
        self.classes = ["grid", ratio.rawValue]
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
    
    public func id(_ value: String) -> Grid {
        return self.mutate(id: value)
    }
}

/// A component that represents a collection item.
public struct GridItem: View, Actionable {
    
    internal var id: String?
    
    /// The content of the item.
    internal var content: [Content]
    
    /// The classes for the item.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a collection item.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["grid-item"]
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
    
    public func id(_ value: String) -> GridItem {
        return self.mutate(id: value)
    }
}

extension GridItem: HoverModifier {
    
    public func onHover(perfom action: Actions) -> GridItem {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> GridItem {
        return self.mutate(leaveevent: action.script)
    }
}
