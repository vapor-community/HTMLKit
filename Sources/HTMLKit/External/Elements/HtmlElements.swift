import OrderedCollections

/// The element
///
///
public struct Head: ContentNode, HtmlElement {

    internal var name: String { "head" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [HeadElement]

    public init(@ContentBuilder<HeadElement> content: () -> [HeadElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [HeadElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Head: GlobalAttributes {

    public func accessKey(_ value: String) -> Head {
        return mutate(accesskey: value)
    }
    
    public func autocapitalize(_ type: Capitalization) -> Head {
        return mutate(autocapitalize: type.rawValue)
    }
    
    public func autofocus() -> Head {
        return mutate(autofocus: "autofocus")
    }
    
    public func `class`(_ value: String) -> Head {
        return mutate(class: value)
    }
    
    public func isEditable(_ condition: Bool) -> Head {
        return mutate(contenteditable: condition)
    }
    
    public func direction(_ type: Direction) -> Head {
        return mutate(dir: type.rawValue)
    }
    
    public func isDraggable(_ condition: Bool) -> Head {
        return mutate(draggable: condition)
    }
    
    public func enterKeyHint(_ type: Hint) -> Head {
        return mutate(enterkeyhint: type.rawValue)
    }
    
    public func hidden() -> Head {
        return mutate(hidden: "hidden")
    }
    
    public func inputMode(_ value: String) -> Head {
        return mutate(inputmode: value)
    }
    
    public func `is`(_ value: String) -> Head {
        return mutate(is: value)
    }
    
    public func itemId(_ value: String) -> Head {
        return mutate(itemid: value)
    }
    
    public func itemProperty(_ value: String) -> Head {
        return mutate(itemprop: value)
    }
    
    public func itemReference(_ value: String) -> Head {
        return mutate(itemref: value)
    }
    
    public func itemScope(_ value: String) -> Head {
        return mutate(itemscope: value)
    }
    
    public func id(_ value: String) -> Head {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Head {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Head {
        return mutate(lang: type.rawValue)
    }
    
    public func nonce(_ value: String) -> Head {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Head {
        return mutate(role: value)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Head {
        return mutate(spellcheck: condition)
    }
    
    public func style(_ value: String) -> Head {
        return mutate(style: value)
    }
    
    public func tabIndex(_ value: String) -> Head {
        return mutate(tabindex: value)
    }
    
    public func title(_ value: String) -> Head {
        return mutate(title: value)
    }
    
    public func translate(_ value: String) -> Head {
        return mutate(translate: value)
    }
}

extension Head: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Head: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}

/// The element
///
///
public struct Body: ContentNode, HtmlElement {

    internal var name: String { "body" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [BodyElement]

    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [BodyElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Body: GlobalAttributes, AfterPrintEventAttribute, BeforePrintEventAttribute, BeforeUnloadEventAttribute, HashChangeEventAttribute, LoadEventAttribute, OfflineEventAttribute, OnlineEventAttribute, PageShowEventAttribute, ResizeEventAttribute {
    
    public func onAfterPrint(_ value: String) -> Body {
        return mutate(onafterprint: value)
    }
    
    public func onBeforePrint(_ value: String) -> Body {
        return mutate(onbeforeprint: value)
    }
    
    public func onBeforeUnload(_ value: String) -> Body {
        return mutate(onbeforeunload: value)
    }
    
    public func onHashChange(_ value: String) -> Body {
        return mutate(onhashchange: value)
    }
    
    public func onLoad(_ value: String) -> Body {
        return mutate(onload: value)
    }
    
    public func onOffline(_ value: String) -> Body {
        return mutate(onoffline: value)
    }
    
    public func onOnline(_ value: String) -> Body {
        return mutate(ononline: value)
    }
    
    public func onPageShow(_ value: String) -> Body {
        return mutate(onpageshow: value)
    }
    
    public func onResize(_ value: String) -> Body {
        return mutate(onresize: value)
    }

    public func accessKey(_ value: String) -> Body {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Body {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Body {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Body {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Body {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Body {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Body {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Body {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Body {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Body {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Body {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Body {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Body {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Body {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Body {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Body {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Body {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Body {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Body {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Body {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Body {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Body {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Body {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Body {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Body {
        return mutate(translate: value)
    }
}

extension Body: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Body: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}
