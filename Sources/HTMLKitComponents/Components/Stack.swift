/*
 Abstract:
 The file contains everything related to stack components.
 */

import HTMLKit

/// A component that arranges content horizontally.
public struct HStack: View {
    
    /// The content of the stack.
    internal var content: [Content]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    /// Creates a horizontal stack.
    public init(alignment: Tokens.VerticalAlignment = .center, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["hstack", alignment.rawValue]
    }
    
    /// Creates a horizontal stack.
    internal init(content: [Content], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
    
    /// Sets the space of the content.
    public func contentSpace(_ value: Tokens.ContentSpace) -> HStack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        
        return newSelf
    }
}

extension HStack: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> HStack {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }

    public func opacity(_ value: Tokens.OpacityValue) -> HStack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        
        return newSelf
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> HStack {
        
        var newSelf = self
        newSelf.classes.append(index.rawValue)
        
        return newSelf
    }
}

/// A component that arranges content vertically.
public struct VStack: View {
    
    /// The content of the stack.
    internal var content: [Content]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    /// Creates a vertical stack.
    public init(alignment: Tokens.HorizontalAlignment = .leading, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["vstack", alignment.rawValue]
    }
    
    /// Creates a vertical stack.
    internal init(content: [Content], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

extension VStack: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> VStack {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }

    public func opacity(_ value: Tokens.OpacityValue) -> VStack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        
        return newSelf
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> VStack {
        
        var newSelf = self
        newSelf.classes.append(index.rawValue)
        
        return newSelf
    }
}

/// A component that overlays content.
public struct ZStack: View {
    
    /// The content of the stack.
    internal var content: [Content]
    
    /// The classes of the stack.
    internal var classes: [String]
    
    /// Creates a stack.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["zstack"]
    }
    
    /// Creates a stack.
    internal init(content: [Content], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

extension ZStack: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> ZStack {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }

    public func opacity(_ value: Tokens.OpacityValue) -> ZStack {
        
        var newSelf = self
        newSelf.classes.append(value.rawValue)
        
        return newSelf
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> ZStack {
        
        var newSelf = self
        newSelf.classes.append(index.rawValue)
        
        return newSelf
    }
}

/// A component that represents a stack column.
public struct StackColumn: View {
    
    /// The content of the column.
    internal var content: [Content]
    
    /// The content of the column.
    internal var classes: [String]
    
    /// Creates a stack column.
    public init(size: Tokens.ColumnSize, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue]
    }
    
    /// Creates a stack column.
    public init(size: Tokens.ColumnSize, alignment: Tokens.TextAlignment, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, alignment.rawValue]
    }
    
    /// Creates a stack column.
    public init(size: Tokens.ColumnSize, offset: Tokens.ColumnOffset, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, offset.rawValue]
    }
    
    /// Creates a stack column.
    public init(size: Tokens.ColumnSize, alignment: Tokens.TextAlignment, offset: Tokens.ColumnOffset, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["stack-column", size.rawValue, alignment.rawValue, offset.rawValue]
    }
    
    /// Creates a stack column.
    internal init(content: [Content], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
