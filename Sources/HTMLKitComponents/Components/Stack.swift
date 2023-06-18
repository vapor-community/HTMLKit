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
        self.classes = ["hstack", alignment.rawValue]
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
    
    public func id(_ value: String) -> HStack {
        return self.mutate(id: value)
    }
    
    /// Sets the space of the content.
    public func contentSpace(_ value: Tokens.ContentSpace) -> HStack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        
        return newSelf
    }
}

extension HStack: HoverModifier {
    
    public func onHover(perfom action: Actions) -> HStack {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> HStack {
        return self.mutate(leaveevent: action.script)
    }
}

extension HStack: ViewModifier {

    public func backgroundColor(_ color: Tokens.BackgroundColor) -> HStack {
        return self.mutate(backgroundcolor: color.rawValue)
    }

    public func opacity(_ value: Tokens.OpacityValue) -> HStack {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> HStack {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> HStack {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> HStack {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func padding(_ length: Tokens.PaddingLength) -> HStack {
        return self.mutate(padding: length.rawValue)
    }
    
    public func padding(insets: EdgeSet, _ length: Tokens.PaddingLength) -> HStack {
        return self.mutate(padding: length.rawValue, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> HStack {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> HStack {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> HStack {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that arranges content vertically.
public struct VStack: View, Actionable, Modifiable {
    
    var id: String?
    
    /// The content of the stack.
    internal var content: [Content]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    var events: [String]?
    
    /// Creates a vertical stack.
    public init(alignment: Tokens.HorizontalAlignment = .leading, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["vstack", alignment.rawValue]
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
    
    public func id(_ value: String) -> VStack {
        return self.mutate(id: value)
    }
    
    /// Sets the space of the content.
    public func contentSpace(_ value: Tokens.ContentSpace) -> VStack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        
        return newSelf
    }
}

extension VStack: HoverModifier {
    
    public func onHover(perfom action: Actions) -> VStack {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> VStack {
        return self.mutate(leaveevent: action.script)
    }
}

extension VStack: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> VStack {
        return self.mutate(backgroundcolor: color.rawValue)
    }

    public func opacity(_ value: Tokens.OpacityValue) -> VStack {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> VStack {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> VStack {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> VStack {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func padding(_ length: Tokens.PaddingLength) -> VStack {
        return self.mutate(padding: length.rawValue)
    }
    
    public func padding(insets: EdgeSet, _ length: Tokens.PaddingLength) -> VStack {
        return self.mutate(padding: length.rawValue, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> VStack {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> VStack {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> VStack {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that overlays content.
public struct ZStack: View, Actionable, Modifiable {
    
    var id: String?
    
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
    
    public func id(_ value: String) -> ZStack {
        return self.mutate(id: value)
    }
}

extension ZStack: HoverModifier {
    
    public func onHover(perfom action: Actions) -> ZStack {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> ZStack {
        return self.mutate(leaveevent: action.script)
    }
}

extension ZStack: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> ZStack {
        return self.mutate(backgroundcolor: color.rawValue)
    }

    public func opacity(_ value: Tokens.OpacityValue) -> ZStack {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> ZStack {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> ZStack {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> ZStack {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func padding(_ length: Tokens.PaddingLength) -> ZStack {
        return self.mutate(padding: length.rawValue)
    }
    
    public func padding(insets: EdgeSet, _ length: Tokens.PaddingLength) -> ZStack {        
        return self.mutate(padding: length.rawValue, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> ZStack {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> ZStack {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> ZStack {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}
