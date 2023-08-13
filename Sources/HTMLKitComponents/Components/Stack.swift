/*
 Abstract:
 The file contains everything related to stack components.
 */

import HTMLKit

/// A component that arranges content horizontally.
public struct HStack: View, Actionable, Modifiable {
    
    /// The identifier of the text.
    internal var id: String?
    
    /// The content of the stack.
    internal var content: [Content]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    /// The events of the text.
    internal var events: [String]?
    
    /// Creates a horizontal stack.
    public init(alignment: Tokens.VerticalAlignment = .center, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["hstack", "alignment:\(alignment.value)"]
    }
    
    /// Creates a horizontal stack.
    internal init(content: [Content], classes: [String], events: [String]?, id: String?) {
        
        self.content = content
        self.classes = classes
        self.events = events
        self.id = id
    }
    
    public var body: Content {
        Division {
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
    
    /// Sets the space of the content.
    public func contentSpace(_ value: Tokens.ContentSpace) -> HStack {
        
        var newSelf = self
        newSelf.classes.append("space:\(value.value)")
        
        return newSelf
    }
}

extension HStack: MouseEvent {
    
    public func tag(_ value: String) -> HStack {
        return self.mutate(id: value)
    }
    
    public func onHover(@StringBuilder action: (ViewAction) -> [String]) -> HStack {
        return self.mutate(hoverevent: action(self))
    }
    
    public func onLeave(@StringBuilder action: (ViewAction) -> [String]) -> HStack {
        return self.mutate(leaveevent: action(self))
    }
}

extension HStack: ViewModifier {

    public func backgroundColor(_ color: Tokens.BackgroundColor) -> HStack {
        return self.mutate(backgroundcolor: color.value)
    }

    public func opacity(_ value: Tokens.OpacityValue) -> HStack {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> HStack {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> HStack {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> HStack {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> HStack {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> HStack {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> HStack {
        return self.mutate(bordershape: shape.value)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> HStack {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> HStack {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> HStack {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that arranges content vertically.
public struct VStack: View, Actionable, Modifiable {
    
    internal var id: String?
    
    /// The content of the stack.
    internal var content: [Content]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    var events: [String]?
    
    /// Creates a vertical stack.
    public init(alignment: Tokens.HorizontalAlignment = .leading, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["vstack", "alignment:\(alignment.value)"]
    }
    
    /// Creates a vertical stack.
    internal init(content: [Content], classes: [String], events: [String]?, id: String?) {
        
        self.content = content
        self.classes = classes
        self.events = events
        self.id = id
    }
    
    public var body: Content {
        Division {
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
    
    /// Sets the space of the content.
    public func contentSpace(_ value: Tokens.ContentSpace) -> VStack {
        
        var newSelf = self
        newSelf.classes.append("space:\(value.value)")
        
        return newSelf
    }
}

extension VStack: MouseEvent {
    
    public func tag(_ value: String) -> VStack {
        return self.mutate(id: value)
    }
    
    public func onHover(@StringBuilder action: (ViewAction) -> [String]) -> VStack {
        return self.mutate(hoverevent: action(self))
    }
    
    public func onLeave(@StringBuilder action: (ViewAction) -> [String]) -> VStack {
        return self.mutate(leaveevent: action(self))
    }
}

extension VStack: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> VStack {
        return self.mutate(backgroundcolor: color.value)
    }

    public func opacity(_ value: Tokens.OpacityValue) -> VStack {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> VStack {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> VStack {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> VStack {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> VStack {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> VStack {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> VStack {
        return self.mutate(bordershape: shape.value)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> VStack {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> VStack {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> VStack {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that overlays content.
public struct ZStack: View, Actionable, Modifiable {
    
    internal var id: String?
    
    /// The content of the stack.
    internal var content: [Content]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    var events: [String]?
    
    /// Creates a stack.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["zstack"]
    }
    
    /// Creates a stack.
    internal init(content: [Content], classes: [String], events: [String]?, id: String?) {
        
        self.content = content
        self.classes = classes
        self.events = events
        self.id = id
    }
    
    public var body: Content {
        Division {
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
}

extension ZStack: MouseEvent {
    
    public func tag(_ value: String) -> ZStack {
        return self.mutate(id: value)
    }
    
    public func onHover(@StringBuilder action: (ViewAction) -> [String]) -> ZStack {
        return self.mutate(hoverevent: action(self))
    }
    
    public func onLeave(@StringBuilder action: (ViewAction) -> [String]) -> ZStack {
        return self.mutate(leaveevent: action(self))
    }
}

extension ZStack: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> ZStack {
        return self.mutate(backgroundcolor: color.value)
    }

    public func opacity(_ value: Tokens.OpacityValue) -> ZStack {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> ZStack {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> ZStack {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> ZStack {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> ZStack {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> ZStack {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> ZStack {
        return self.mutate(bordershape: shape.value)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> ZStack {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> ZStack {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> ZStack {
        return self.mutate(margin: length.value, insets: insets)
    }
}

