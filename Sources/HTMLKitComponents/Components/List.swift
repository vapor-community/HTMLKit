/*
 Abstract:
 The file contains everything related to the list component.
 */

import HTMLKit

/// A component that collects and arranges list items vertically.
public struct List: View, Modifiable, Actionable {
    
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> List {
        
        var newSelf = self
        
        if let offset {
            newSelf.classes.append(offset.rawValue)
        }
        
        newSelf.classes.append(width.rawValue)
        
        return newSelf
    }
    
    public  func padding(insets: EdgeSet, length: Tokens.PaddingLength) -> List {
        
        var classes: [String] = []
        
        if !insets.contains(.all) {
            
            if insets.contains(.top) {
                classes.append("padding-top:\(length.rawValue)")
            }
            
            if insets.contains(.bottom) {
                classes.append("padding-bottom:\(length.rawValue)")
            }
            
            if insets.contains(.leading) {
                classes.append("padding-leading:\(length.rawValue)")
            }
            
            if insets.contains(.trailing) {
                classes.append("padding-trailing:\(length.rawValue)")
            }
            
            if insets.contains(.horizontal) {
                classes.append("padding-inline:\(length.rawValue)")
            }
            
            if insets.contains(.vertical) {
                classes.append("padding-block:\(length.rawValue)")
            }
            
        } else {
            classes.append("padding:\(length.rawValue)")
        }
        
        return self.mutate(classes: classes)
    }
}

extension List: HoverModifier {
    
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
public struct ListRow: View, Modifiable, Actionable {
    
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
    
    public  func padding(insets: EdgeSet, length: Tokens.PaddingLength) -> ListRow {
        
        var classes: [String] = []
        
        if !insets.contains(.all) {
            
            if insets.contains(.top) {
                classes.append("padding-top:\(length.rawValue)")
            }
            
            if insets.contains(.bottom) {
                classes.append("padding-bottom:\(length.rawValue)")
            }
            
            if insets.contains(.leading) {
                classes.append("padding-leading:\(length.rawValue)")
            }
            
            if insets.contains(.trailing) {
                classes.append("padding-trailing:\(length.rawValue)")
            }
            
            if insets.contains(.horizontal) {
                classes.append("padding-inline:\(length.rawValue)")
            }
            
            if insets.contains(.vertical) {
                classes.append("padding-block:\(length.rawValue)")
            }
            
        } else {
            classes.append("padding:\(length.rawValue)")
        }
        
        return self.mutate(classes: classes)
    }
}

extension ListRow: HoverModifier {
    
    public func onHover(perfom action: Actions) -> ListRow {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> ListRow {
        return self.mutate(leaveevent: action.script)
    }
}
