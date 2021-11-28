import OrderedCollections

/// The alias points
///
///
public typealias Nav = Navigation

/// The alias points
///
///
public typealias H1 = Heading1

/// The alias points
///
///
public typealias H2 = Heading2

/// The alias points
///
///
public typealias H3 = Heading3

/// The alias points
///
///
public typealias H4 = Heading4

/// The alias points
///
///
public typealias H5 = Heading5

/// The alias points
///
///
public typealias H6 = Heading6

/// The alias points
///
///
public typealias Hgroup = HeadingGroup

/// The alias points
///
///
public typealias P = Paragraph

/// The alias points
///
///
public typealias Hr = HorizontalRule

/// The alias points
///
///
public typealias Pre = PreformattedText

/// The alias points
///
///
public typealias Ol = OrderedList

/// The alias points
///
///
public typealias Ul = UnorderedList

/// The alias points
///
///
public typealias Dl = DescriptionList

/// The alias points
///
///
public typealias Div = Division

/// The alias points
///
///
public typealias A = Anchor

/// The alias points
///
///
public typealias Em = Emphasize

/// The alias points
///
///
public typealias S = StrikeThrough

/// The alias points
///
///
public typealias Q = ShortQuote

/// The alias points
///
///
public typealias Dfn = Definition

/// The alias points
///
///
public typealias Abbr = Abbreviation

/// The alias points
///
///
public typealias V = Variable

/// The alias points
///
///
public typealias Samp = SampleOutput

/// The alias points
///
///
public typealias Kbd = KeyboardInput

/// The alias points
///
///
public typealias Sub = Subscript

/// The alias points
///
///
public typealias Sup = Superscript

/// The alias points
///
///
public typealias I = Italic

/// The alias points
///
///
public typealias B = Bold

/// The alias points
///
///
public typealias U = Underline

/// The alias points
///
///
public typealias Br = LineBreak

/// The alias points
///
///
public typealias Wbr = WordBreak

/// The alias points
///
///
public typealias Ins = InsertedText

/// The alias points
///
///
public typealias Del = DeletedText

/// The alias points
///
///
public typealias Img = Image

/// The alias points
///
///
public typealias Iframe = InlineFrame

/// The alias points
///
///
public typealias Param = Parameter

/// The element
///
///
public struct Comment: CommentNode {
    
    public var content: String
    
    public init(_ content: String) {
        self.content = content
    }
}

extension Comment: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element
///
///
public struct Document: DocumentNode, BasicElement {
    
    public var content: String
    
    public init(type: DocumentType) {
        self.content = type.rawValue
    }
}

extension Document: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element
///
///
public struct Html: ContentNode, BasicElement {

    internal var name: String { "html" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: AnyContent

    public init(@ContentBuilder content: () -> AnyContent) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: AnyContent) {
        self.attributes = attributes
        self.content = content
    }
}

extension Html: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Html {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Html {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Html {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Html {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Html {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Html {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Html {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Html {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Html {
        return mutate(hidden: "hidden")
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

    public func id(_ value: String) -> Html {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Html {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Html {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Html {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Html {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Html {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Html {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Html {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Html {
        return mutate(translate: value)
    }
}

extension Html: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element
///
///
public struct Head: ContentNode, BasicElement {

    internal var name: String { "head" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: AnyContent

    public init(@ContentBuilder content: () -> AnyContent) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: AnyContent) {
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

/// The element
///
///
public struct Body: ContentNode, BasicElement {

    internal var name: String { "body" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: AnyContent

    public init(@ContentBuilder content: () -> AnyContent) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: AnyContent) {
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
