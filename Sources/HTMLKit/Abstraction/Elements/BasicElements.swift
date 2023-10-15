/*
 Abstract:
 The file contains the basic html-elements. These elements should be used at first in an html-document.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element represents a comment output.
///
/// ```html
/// <!-- -->
/// ```
public struct Comment: CommentNode, GlobalElement {
    
    public var content: String
    
    public init(_ content: String) {
        self.content = content
    }
}

/// The element represents the document type.
///
/// ```html
/// <!DOCTYPE html>
/// ```
public struct Document: DocumentNode, BasicElement {
    
    public var content: String
    
    public init(_ value: Values.Doctype) {
        self.content = value.rawValue
    }
}

/// The element represents the document's root element.
///
/// ```html
/// <html></html>
/// ```
public struct Html: ContentNode, BasicElement {

    internal var name: String { "html" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [HtmlElement]

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

    public func hidden() -> Html {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Html {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: String) -> Html {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Html {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Html {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Html {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Html {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Html {
        return mutate(itemscope: value)
    }
    
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

    public func title(_ value: String) -> Html {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Html {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Html {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Html {

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

public struct Custom: CustomNode, GlobalElement {

    public var name: String

    public var attributes: OrderedDictionary<String, Any>?

    public var content: [Content]

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
