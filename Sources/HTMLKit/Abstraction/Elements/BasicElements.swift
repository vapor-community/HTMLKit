import Foundation
import OrderedCollections

/// An element that represents a comment output.
///
/// Use `Comment` to insert a comment with descriptive text.
///
/// ```swift
/// Comment("Lorem ipsum")
/// ```
public struct Comment: CommentNode, GlobalElement {    
    
    internal var content: String
    
    internal var context: EscapeContext
    
    /// Create a comment.
    ///
    /// - Parameter content: The text of the comment.
    public init(_ content: String) {
        
        self.context = .tainted(.html)
        self.content = content
    }
}

/// An element that represents a document type.
///
/// Use `Document` to declare the type for the document.
///
/// ```swift
/// Document(.html5)
/// Html {
///     Head {
///     }
///     Body {
///     }
/// }
/// ```
public struct Document: DocumentNode, BasicElement {
    
    internal var content: String
    
    internal var context: EscapeContext
    
    /// Create a document.
    ///
    /// - Parameter value: The type to declare.
    public init(_ value: Values.Doctype) {

        self.context = .trusted        
        self.content = value.rawValue
    }
}

/// An element that represents the page document.
///
/// Use `Html` to define the document’s main structure, including child elements for metadata,
/// body content, and other nested HTML components.
///
/// ```swift
/// Html {
///     Head {
///         Title {
///             "Lorem ipsum..."
///         }
///     }
///     Body {
///         Header {
///         }
///         Main {
///         }
///         Footer {
///         }
///     }
/// }
/// ```
public struct Html: ContentNode, BasicElement {

    internal var name: String { "html" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [HtmlElement]
    
    internal var context: EscapeContext

    /// Create a html.
    ///
    /// - Parameter content: The html's content.
    public init(@ContentBuilder<HtmlElement> content: () -> [HtmlElement]) {
        
        self.context = .trusted
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [HtmlElement]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Html) -> Html) -> Html {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Html, T) -> Html) -> Html {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Html: GlobalAttributes, GlobalEventAttributes {
    
    public func accessKey(_ value: Character) -> Html {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Html {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> Html {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> Html {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Html {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Html {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> Html {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> Html {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Html {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> Html {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Html {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> Html {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> Html {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Html {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> Html {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Html {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        if let elements = elements {
            copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        }
        
        return copy
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Html {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        
        return copy
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Html {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> Html {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Html {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Html {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Html {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> Html {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> Html {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> Html {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ value: Values.Role) -> Html {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Html {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> Html {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> Html {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> Html {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Html {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Html {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> Html {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Html {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> Html {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> Html {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Html {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Html {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Html {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Html {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Html {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Html {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Html {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
}

/// An element that represents a custom element.
///
/// Use `Custom` when an element is not supported by the framework.
///
/// ```swift
/// Custom(name: "lorem-ipsum") {
/// }
/// ```
public struct Custom: CustomNode, GlobalElement {

    public var name: String

    public var attributes: OrderedDictionary<String, AttributeData>?

    public var content: [Content]
    
    public var context: EscapeContext

    /// Create a custom.
    ///
    /// - Parameters:
    ///   - name: The tag to use for the element.
    ///   - content: The custom's content.
    public init(name: String, context: EscapeContext = .tainted(.html), @ContentBuilder<Content> content: () -> [Content]) {
        
        self.name = name
        self.context = context
        self.content = content()
    }
    
    public init(name: String, attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext = .tainted(.html), content: [Content]) {
        
        self.name = name
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Custom) -> Custom) -> Custom {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Custom, T) -> Custom) -> Custom {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Custom: Attribute {
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Custom {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Custom {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Custom {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Custom {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Custom {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Custom {
        return mutate(key: key, value: .init(value, context: context))
    }
}
