/*
 Abstract:
 The file contains everything related to the list component.
 */

import HTMLKit

/// A component that collects and arranges list items vertically.
public struct List: Component {
    
    /// The content of the list.
    internal var content: [AnyContent]
    
    /// The classes of the list.
    internal var classes: [String]
    
    /// The events of the list.
    internal var events: [String]?
    
    /// Creates a list.
    public init(direction: Tokens.FlowDirection, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["list", direction.rawValue]
    }
    
    /// Creates a list.
    internal init(content: [AnyContent], classes: [String], events: [String]?) {
        
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        UnorderedList {
            content
        }
        .class(classes.joined(separator: " "))
    }
    
    /// Sets the style for the list.
    public func listStyle(_ style: Tokens.ListStyle) -> List {
        
        var newSelf = self
        newSelf.classes.append(style.rawValue)
        
        return newSelf
    }
}

/// A component that represents a list item.
public struct ListRow: Component {

    /// The content of the row.
    internal var content: [AnyContent]
    
    /// The classes of the row.
    internal var classes: [String]
    
    /// The events of the row.
    internal var events: [String]?
    
    /// Creates a list row.
    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.content = content()
        self.classes = ["list-row"]
    }
    
    /// Creates a list row.
    internal init(content: [AnyContent], classes: [String], events: [String]?) {
        
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        ListItem {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

