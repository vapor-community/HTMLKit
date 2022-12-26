/*
 Abstract:
 The file contains everything related to the list component.
 */

import HTMLKit

/// A component that collects and arranges list items vertically.
public struct List: View, Actionable {
    
    var id: String?
    
    /// The content of the list.
    internal var content: [ListElement]
    
    /// The classes of the list.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a list.
    public init(direction: Tokens.FlowDirection, @ContentBuilder<ListElement> content: () -> [ListElement]) {
        
        self.content = content()
        self.classes = ["list", direction.rawValue]
    }
    
    /// Creates a list.
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
    
    /// Sets the style for the list.
    public func listStyle(_ style: Tokens.ListStyle) -> List {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
}

extension List: Hoverable {
    
    public func id(_ value: String) -> List {
        return self.mutate(id: value)
    }

    public func onHover(perfom action: Actions) -> List {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> List {
        return self.mutate(leaveevent: action.script)
    }
}

/// A component that represents a list item.
public struct ListRow: View, Actionable {
    
    var id: String?
    
    /// The content of the row.
    internal var content: [Content]
    
    /// The classes of the row.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a list row.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["list-row"]
    }
    
    /// Creates a list row.
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
    
    public func id(_ value: String) -> ListRow {
        return self.mutate(id: value)
    }
}

extension ListRow: Hoverable {
    
    public func onHover(perfom action: Actions) -> ListRow {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> ListRow {
        return self.mutate(leaveevent: action.script)
    }
}
