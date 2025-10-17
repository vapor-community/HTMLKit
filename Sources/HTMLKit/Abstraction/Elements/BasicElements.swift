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
    
    /// Create a comment.
    ///
    /// - Parameter content: The text of the comment.
    public init(_ content: String) {
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
    
    /// Create a document.
    ///
    /// - Parameter value: The type to declare.
    public init(_ value: Values.Doctype) {
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

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [HtmlElement]

    /// Create a html.
    ///
    /// - Parameter content: The html's content.
    public init(@ContentBuilder<HtmlElement> content: () -> [HtmlElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [HtmlElement]) {
        self.attributes = attributes
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
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Html {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Html {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Html {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Html {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Html {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Html {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Html {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Html {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Html {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Html {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Html {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Html {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Html {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Html {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Html {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Html {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Html {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Html {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Html {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Html {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Html {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Html {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Html {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Html {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Html {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Html {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Html {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Html {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Html {
        return mutate(translate: value.rawValue)
    }
    
    public func inert(_ condition: Bool = true) -> Html {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Html {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Html {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
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

    public var attributes: OrderedDictionary<String, Any>?

    public var content: [Content]

    /// Create a custom.
    ///
    /// - Parameters:
    ///   - name: The tag to use for the element.
    ///   - content: The custom's content.
    public init(name: String, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.name = name
        self.content = content()
    }
    
    public init(name: String, attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        
        self.name = name
        self.attributes = attributes
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
    
    public func custom(key: String, value: Any) -> Custom {
        return mutate(key: key, value: value)
    }
}
