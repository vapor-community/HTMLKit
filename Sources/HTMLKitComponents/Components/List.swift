/*
 Abstract:
 The file contains everything related to the list component.
 */

import HTMLKit

/// A component that collects and arranges list items vertically.
public struct List: View, Modifiable, Actionable {
    
    public var id: String?
    
    /// The content of the list.
    internal var content: [ListElement]
    
    /// The classes of the list.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a list.
    public init(direction: Tokens.FlowDirection, @ContentBuilder<ListElement> content: () -> [ListElement]) {
        
        self.content = content()
        self.classes = ["list", "direction:\(direction.value)"]
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
        newSelf.classes.append("style:\(style.value)")
        
        return newSelf
    }
    
    public func tag(_ value: String) -> List {
        return self.mutate(id: value)
    }
}

extension List: MouseEvent {

    public func onHover(@ActionBuilder action: (ViewAction) -> [Action]) -> List {
        return self.mutate(hoverevent: action(.init()))
    }
    
    public func onLeave(@ActionBuilder action: (ViewAction) -> [Action]) -> List {
        return self.mutate(leaveevent: action(.init()))
    }
}

extension List: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> List {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> List {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> List {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> List {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> List {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> List {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> List {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> List {
        return self.mutate(bordershape: shape.value)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> List {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> List {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> List {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that represents a list item.
public struct ListRow: View, Modifiable, Actionable {
    
    public var id: String?
    
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
    
    public  func padding(insets: EdgeSet, length: Tokens.PaddingLength) -> ListRow {
        
        var classes: [String] = []
        
        if !insets.contains(.all) {
            
            if insets.contains(.top) {
                classes.append("padding-top:\(length)")
            }
            
            if insets.contains(.bottom) {
                classes.append("padding-bottom:\(length)")
            }
            
            if insets.contains(.leading) {
                classes.append("padding-leading:\(length)")
            }
            
            if insets.contains(.trailing) {
                classes.append("padding-trailing:\(length)")
            }
            
            if insets.contains(.horizontal) {
                classes.append("padding-inline:\(length)")
            }
            
            if insets.contains(.vertical) {
                classes.append("padding-block:\(length)")
            }
            
        } else {
            classes.append("padding:\(length)")
        }
        
        return self.mutate(classes: classes)
    }
    
    public func tag(_ value: String) -> ListRow {
        return self.mutate(id: value)
    }
}

extension ListRow: MouseEvent {
    
    public func onHover(@ActionBuilder action: (ViewAction) -> [Action]) -> ListRow {
        return self.mutate(hoverevent: action(.init()))
    }
    
    public func onLeave(@ActionBuilder action: (ViewAction) -> [Action]) -> ListRow {
        return self.mutate(leaveevent: action(.init()))
    }
}
