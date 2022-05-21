/*
 Abstract:
 The file contains the body elements. The html-element 'body' only allows these elements to be its descendants.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element Navigation.
///
/// Nav is the official tag and can be used instead of Navigation.
///
/// ```html
/// <nav></nav>
/// ```
public typealias Nav = Navigation

/// The alias for the element Heading1.
///
/// H1 is the official tag and can be used instead of Heading1.
///
/// ```html
/// <h1></h1>
/// ```
public typealias H1 = Heading1

/// The alias for the element Heading2.
///
/// H2 is the official tag and can be used instead of Heading2.
///
/// ```html
/// <h2></h2>
/// ```
public typealias H2 = Heading2

/// The alias for the element Heading3.
///
/// H3 is the official tag and can be used instead of Heading3.
///
/// ```html
/// <h3></h3>
/// ```
public typealias H3 = Heading3

/// The alias for the element Heading4.
///
/// H4 is the official tag and can be used instead of Heading4.
///
/// ```html
/// <h4></h4>
/// ```
public typealias H4 = Heading4

/// The alias for the element Heading5.
///
/// H5 is the official tag and can be used instead of Heading5.
///
/// ```html
/// <h5></h5>
/// ```
public typealias H5 = Heading5

/// The alias for the element Heading6.
///
/// H6 is the official tag and can be used instead of Heading6.
///
/// ```html
/// <h6></h6>
/// ```
public typealias H6 = Heading6

/// The alias for the element HeadingGroup.
///
/// Hgroup is the official tag and can be used instead of HeadingGroup.
///
/// ```html
/// <hgroup></hgroup>
/// ```
public typealias Hgroup = HeadingGroup

/// The alias for the element Paragraph.
///
/// P is the official tag and can be used instead of Paragraph.
///
/// ```html
/// <p></p>
/// ```
public typealias P = Paragraph

/// The alias for the element HorizontalRule.
///
/// Hr is the official tag and can be used instead of HorizontalRule.
///
/// ```html
/// <hr>
/// ```
public typealias Hr = HorizontalRule

/// The alias for the element PreformattedText.
///
/// Pre is the official tag and can be used instead of PreformattedText.
///
/// ```html
/// <pre></pre>
/// ```
public typealias Pre = PreformattedText

/// The alias for the element OrderedList.
///
/// Ol is the official tag and can be used instead of OrderedList.
///
/// ```html
/// <ol></ol>
/// ```
public typealias Ol = OrderedList

/// The alias for the element UnorderedList.
///
/// Ul is the official tag and can be used instead of UnorderedList.
///
/// ```html
/// <ul></ul>
/// ```
public typealias Ul = UnorderedList

/// The alias for the element DescriptionList.
///
/// Dl is the official tag and can be used instead of DescriptionList.
///
/// ```html
/// <dl></dl>
/// ```
public typealias Dl = DescriptionList

/// The alias for the element Division.
///
/// Div is the official tag and can be used instead of Division.
///
/// ```html
/// <div></div>
/// ```
public typealias Div = Division

/// The alias for the element Anchor.
///
/// A is the official tag and can be used instead of Anchor.
///
/// ```html
/// <a></a>
/// ```
public typealias A = Anchor

/// The alias for the element Emphasize.
///
/// Em is the official tag and can be used instead of Emphasize.
///
/// ```html
/// <em></em>
/// ```
public typealias Em = Emphasize

/// The alias for the element StrikeThrough.
///
/// S is the official tag and can be used instead of StrikeThrough.
///
/// ```html
/// <s></s>
/// ```
public typealias S = StrikeThrough

/// The alias for the element ShortQuote.
///
/// Q is the official tag and can be used instead of ShortQuote.
///
/// ```html
/// <q></q>
/// ```
public typealias Q = ShortQuote

/// The alias for the element Definition.
///
/// Dfn is the official tag and can be used instead of Definition.
///
/// ```html
/// <dfn></dfn>
/// ```
public typealias Dfn = Definition

/// The alias for the element Abbreviation.
///
/// Abbr is the official tag and can be used instead of Abbreviation.
///
/// ```html
/// <abbr></abbr>
/// ```
public typealias Abbr = Abbreviation

/// The alias for the element Variable.
///
/// V is the official tag and can be used instead of Variable.
///
/// ```html
/// <v></v>
/// ```
public typealias V = Variable

/// The alias for the element SampleOutput.
///
/// Samp is the official tag and can be used instead of SampleOutput.
///
/// ```html
/// <samp></samp>
/// ```
public typealias Samp = SampleOutput

/// The alias for the element KeyboardInput.
///
/// Kbd is the official tag and can be used instead of KeyboardInput.
///
/// ```html
/// <kdb></kdb>
/// ```
public typealias Kbd = KeyboardInput

/// The alias for the element Subscript.
///
/// Sub is the official tag and can be used instead of Subscript.
///
/// ```html
/// <sub></sub>
/// ```
public typealias Sub = Subscript

/// The alias for the element Superscript.
///
/// Sup is the official tag and can be used instead of Superscript.
///
/// ```html
/// <sup></sup>
/// ```
public typealias Sup = Superscript

/// The alias for the element Italic.
///
/// I is the official tag and can be used instead of Italic.
///
/// ```html
/// <i></i>
/// ```
public typealias I = Italic

/// The alias for the element Bold.
///
/// Bold is the official tag and can be used instead of Bold.
///
/// ```html
/// <b></b>
/// ```
public typealias B = Bold

/// The alias for the element Underline.
///
/// U is the official tag and can be used instead of Underline.
///
/// ```html
/// <u></u>
/// ```
public typealias U = Underline

/// The alias for the element LineBreak.
///
/// Br is the official tag and can be used instead of LineBreak.
///
/// ```html
/// <br>
/// ```
public typealias Br = LineBreak

/// The alias for the element WordBreak.
///
/// Wbr is the official tag and can be used instead of WordBreak.
///
/// ```html
/// <wbr>
/// ```
public typealias Wbr = WordBreak

/// The alias for the element InsertedText.
///
/// Ins is the official tag and can be used instead of InsertedText.
///
/// ```html
/// <ins></ins>
/// ```
public typealias Ins = InsertedText

/// The alias for the element DeletedText.
///
/// Del is the official tag and can be used instead of DeletedText.
///
/// ```html
/// <del></del>
/// ```
public typealias Del = DeletedText

/// The alias for the element Image.
///
/// Img is the official tag and can be used instead of Image.
///
/// ```html
/// <img>
/// ```
public typealias Img = Image

/// The alias for the element InlineFrame.
///
/// Iframe is the official tag and can be used instead of InlineFrame.
///
/// ```html
/// <iframe></iframe>
/// ```
public typealias Iframe = InlineFrame

/// The alias for the element Parameter.
///
/// Param is the official tag and can be used instead of Parameter.
///
/// ```html
/// <param>
/// ```
public typealias Param = Parameter

/// The alias for the element Vector.
///
/// Svg is the official tag and can be used instead of Vector.
///
/// ```html
/// <svg></svg>
/// ```
public typealias Svg = Vector

/// The element represents a self-contained content.
///
/// ```html
/// <article></article>
/// ```
public struct Article: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "article" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Article: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Article {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Article {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Article {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Article {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Article {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Article {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Article {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Article {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Article {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Article {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Article {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Article {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Article {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Article {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Article {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Article {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Article {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Article {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Article {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Article {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Article {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Article {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Article {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Article {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Article {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Article {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Article {
        return mutate(translate: value)
    }

    public func translate(_ type: Decision) -> Article {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Article {
        return mutate(key: key, value: value)
    }
}

extension Article: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Article: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a generic section of the document.
///
/// ```html
/// <section></section>
/// ```
public struct Section: ContentNode, HtmlElement, BodyElement, FigureElement, FormElement, ObjectElement {

    internal var name: String { "section" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Section: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Section {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Section {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Section {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Section {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Section {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Section {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Section {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Section {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Section {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Section {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Section {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Section {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Section {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Section {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Section {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Section {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Section {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Section {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Section {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Section {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Section {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Section {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Section {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Section {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Section {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Section {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Section {
        return mutate(translate: value)
    }

    public func translate(_ type: Decision) -> Section {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Section {
        return mutate(key: key, value: value)
    }
}

extension Section: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Section: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a section of a page that links to other pages or parts within the page.
///
/// ```html
/// <nav></nav>
/// ```
public struct Navigation: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "nav" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Navigation: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Navigation {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Navigation {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Navigation {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Navigation {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Navigation {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Navigation {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Navigation {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Navigation {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Navigation {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Navigation {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Navigation {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Navigation {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Navigation {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Navigation {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Navigation {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Navigation {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Navigation {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Navigation {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Navigation {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Navigation {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Navigation {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Navigation {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Navigation {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Navigation {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Navigation {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Navigation {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Navigation {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Navigation {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Navigation {
        return mutate(key: key, value: value)
    }
}

extension Navigation: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Navigation: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element defines some content aside from the content it is placed in.
///
/// ```html
/// <aside></aside>
/// ```
public struct Aside: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "aside" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Aside: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Aside {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Aside {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Aside {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Aside {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Aside {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Aside {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Aside {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Aside {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Aside {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Aside {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Aside {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Aside {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Aside {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Aside {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Aside {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Aside {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Aside {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Aside {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Aside {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Aside {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Aside {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Aside {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Aside {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Aside {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Aside {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Aside {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Aside {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Aside {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Aside {
        return mutate(key: key, value: value)
    }
}

extension Aside: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Aside: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a heading.
///
/// ```html
/// <h1></h1>
/// ```
public struct Heading1: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "h1" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Heading1: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Heading1 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading1 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading1 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading1 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading1 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading1 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading1 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading1 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading1 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading1 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading1 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading1 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading1 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading1 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading1 {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Heading1 {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Heading1 {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Heading1 {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Heading1 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading1 {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Heading1 {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Heading1 {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading1 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading1 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading1 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading1 {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Heading1 {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Heading1 {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Heading1 {
        return mutate(key: key, value: value)
    }
}

extension Heading1: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Heading1: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Heading1: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a heading.
///
/// ```html
/// <h2></h2>
/// ```
public struct Heading2: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "h2" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Heading2: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Heading2 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading2 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading2 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading2 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading2 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading2 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading2 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading2 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading2 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading2 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading2 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading2 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading2 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading2 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading2 {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Heading2 {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Heading2 {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> Heading2 {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Heading2 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading2 {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Heading2 {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Heading2 {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading2 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading2 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading2 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading2 {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Heading2 {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Heading2 {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Heading2 {
        return mutate(key: key, value: value)
    }
}

extension Heading2: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Heading2: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Heading2: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a heading.
///
/// ```html
/// <h3></h3>
/// ```
public struct Heading3: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "h3" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Heading3: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Heading3 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading3 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading3 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading3 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading3 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading3 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading3 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading3 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading3 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading3 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading3 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading3 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading3 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading3 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading3 {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Heading3 {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Heading3 {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> Heading3 {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Heading3 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading3 {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Heading3 {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Heading3 {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading3 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading3 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading3 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading3 {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Heading3 {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Heading3 {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Heading3 {
        return mutate(key: key, value: value)
    }
}

extension Heading3: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Heading3: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Heading3: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a heading.
///
/// ```html
/// <h4></h4>
/// ```
public struct Heading4: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "h4" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Heading4: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Heading4 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading4 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading4 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading4 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading4 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading4 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading4 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading4 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading4 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading4 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading4 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading4 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading4 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading4 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading4 {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Heading4 {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Heading4 {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Heading4 {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Heading4 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading4 {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Heading4 {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Heading4 {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading4 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading4 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading4 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading4 {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Heading4 {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Heading4 {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Heading4 {
        return mutate(key: key, value: value)
    }
}

extension Heading4: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Heading4: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Heading4: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a heading.
///
/// ```html
/// <h5></h5>
/// ```
public struct Heading5: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "h5" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Heading5: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Heading5 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading5 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading5 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading5 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading5 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading5 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading5 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading5 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading5 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading5 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading5 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading5 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading5 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading5 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading5 {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Heading5 {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Heading5 {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Heading5 {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Heading5 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading5 {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Heading5 {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Heading5 {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading5 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading5 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading5 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading5 {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Heading5 {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Heading5 {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Heading5 {
        return mutate(key: key, value: value)
    }
}

extension Heading5: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Heading5: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Heading5: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a heading.
///
/// ```html
/// <h6></h6>
/// ```
public struct Heading6: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "h6" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Heading6: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Heading6 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading6 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading6 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading6 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading6 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading6 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading6 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading6 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading6 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading6 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading6 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading6 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading6 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading6 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading6 {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Heading6 {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Heading6 {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Heading6 {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Heading6 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading6 {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Heading6 {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Heading6 {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading6 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading6 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading6 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading6 {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Heading6 {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Heading6 {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Heading6 {
        return mutate(key: key, value: value)
    }
}

extension Heading6: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Heading6: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Heading6: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element is used to group a set of heading elements.
///
/// ```html
/// <hgroup></hgroup>
/// ```
public struct HeadingGroup: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "hgroup" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension HeadingGroup: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> HeadingGroup {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> HeadingGroup {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> HeadingGroup {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> HeadingGroup {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> HeadingGroup {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> HeadingGroup {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> HeadingGroup {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> HeadingGroup {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> HeadingGroup {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> HeadingGroup {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> HeadingGroup {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> HeadingGroup {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> HeadingGroup {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> HeadingGroup {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> HeadingGroup {
        return mutate(itemscope: value)
    }

    public func itemType(_ value: String) -> HeadingGroup {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> HeadingGroup {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> HeadingGroup {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> HeadingGroup {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> HeadingGroup {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> HeadingGroup {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> HeadingGroup {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> HeadingGroup {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> HeadingGroup {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> HeadingGroup {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> HeadingGroup {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> HeadingGroup {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> HeadingGroup {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> HeadingGroup {
        return mutate(key: key, value: value)
    }
}

extension HeadingGroup: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension HeadingGroup: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a header.
///
/// ```html
/// <header></header>
/// ```
public struct Header: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "header" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Header: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Header {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Header {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Header {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Header {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Header {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Header {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Header {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Header {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Header {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Header {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Header {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Header {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Header {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Header {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Header {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Header {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Header {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Header {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Header {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Header {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Header {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Header {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Header {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Header {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Header {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Header {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Header {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Header {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Header {
        return mutate(key: key, value: value)
    }
}

extension Header: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Header: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a footer.
///
/// ```html
/// <footer></footer>
/// ```
public struct Footer: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "footer" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Footer: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Footer {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Footer {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Footer {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Footer {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Footer {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Footer {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Footer {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Footer {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Footer {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Footer {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Footer {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Footer {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Footer {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Footer {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Footer {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Footer {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Footer {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Footer {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Footer {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Footer {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Footer {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Footer {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Footer {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Footer {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Footer {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Footer {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Footer {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Footer {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Footer {
        return mutate(key: key, value: value)
    }
}

extension Footer: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Footer: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents the contact information.
///
/// ```html
/// <adress></adress>
/// ```
public struct Address: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "address" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Address: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Address {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Address {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Address {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Address {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Address {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Address {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Address {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Address {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Address {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Address {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Address {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Address {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Address {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Address {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Address {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Address {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Address {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> Address {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Address {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Address {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Address {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Address {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Address {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Address {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Address {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Address {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Address {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Address {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Address {
        return mutate(key: key, value: value)
    }
}

extension Address: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Address: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element is used to define a paragraph.
///
/// ```html
/// <p></p>
/// ```
public struct Paragraph: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "p" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Paragraph: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Paragraph {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Paragraph {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Paragraph {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Paragraph {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Paragraph {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Paragraph {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Paragraph {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Paragraph {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Paragraph {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Paragraph {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Paragraph {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Paragraph {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Paragraph {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Paragraph {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Paragraph {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Paragraph {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Paragraph {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Paragraph {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Paragraph {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Paragraph {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Paragraph {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Paragraph {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Paragraph {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Paragraph {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Paragraph {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Paragraph {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Paragraph {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Paragraph {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Paragraph {
        return mutate(key: key, value: value)
    }
}

extension Paragraph: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Paragraph: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Paragraph: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element is used for horizontal rules that act as dividers between sections.
///
/// ```html
/// <hr>
/// ```
public struct HorizontalRule: EmptyNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "hr" }
    
    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension HorizontalRule: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> HorizontalRule {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> HorizontalRule {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> HorizontalRule {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> HorizontalRule {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> HorizontalRule {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> HorizontalRule {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> HorizontalRule {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> HorizontalRule {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> HorizontalRule {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> HorizontalRule {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> HorizontalRule {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> HorizontalRule {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> HorizontalRule {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> HorizontalRule {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> HorizontalRule {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> HorizontalRule {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> HorizontalRule {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> HorizontalRule {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> HorizontalRule {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> HorizontalRule {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> HorizontalRule {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> HorizontalRule {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> HorizontalRule {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> HorizontalRule {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> HorizontalRule {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> HorizontalRule {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> HorizontalRule {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> HorizontalRule {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> HorizontalRule {
        return mutate(key: key, value: value)
    }
}

extension HorizontalRule: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension HorizontalRule: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a block of preformatted text.
///
/// ```html
/// <pre></pre>
/// ```
public struct PreformattedText: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "pre" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension PreformattedText: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> PreformattedText {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> PreformattedText {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> PreformattedText {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> PreformattedText {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> PreformattedText {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> PreformattedText {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> PreformattedText {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> PreformattedText {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> PreformattedText {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> PreformattedText {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> PreformattedText {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> PreformattedText {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> PreformattedText {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> PreformattedText {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> PreformattedText {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> PreformattedText {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> PreformattedText {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> PreformattedText {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> PreformattedText {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> PreformattedText {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> PreformattedText {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> PreformattedText {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> PreformattedText {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> PreformattedText {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> PreformattedText {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> PreformattedText {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> PreformattedText {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> PreformattedText {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> PreformattedText {
        return mutate(key: key, value: value)
    }
}

extension PreformattedText: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension PreformattedText: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a section that is quoted from another source.
///
/// ```html
/// <blockquote></blockquote>
/// ```
public struct Blockquote: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "blockquote" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Blockquote: GlobalAttributes, CiteAttribute {
    
    public func accessKey(_ value: Character) -> Blockquote {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Blockquote {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Blockquote {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Blockquote {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Blockquote {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Blockquote {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Blockquote {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Blockquote {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Blockquote {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Blockquote {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Blockquote {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Blockquote {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Blockquote {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Blockquote {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Blockquote {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Blockquote {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Blockquote {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Blockquote {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Blockquote {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Blockquote {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Blockquote {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Blockquote {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Blockquote {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Blockquote {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Blockquote {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Blockquote {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Blockquote {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Blockquote {
        return mutate(translate: type.rawValue)
    }
    
    public func cite(_ value: String) -> Blockquote {
        return mutate(cite: value)
    }
    
    public func custom(key: String, value: Any) -> Blockquote {
        return mutate(key: key, value: value)
    }
}

extension Blockquote: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Blockquote: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Blockquote: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a list of items, where the items have been intentionally ordered.
///
/// ```html
/// <ol></ol>
/// ```
public struct OrderedList: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "ol" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [ListElement]

    public init(@ContentBuilder<ListElement> content: () -> [ListElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [ListElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension OrderedList: GlobalAttributes, ReversedAttribute, StartAttribute, TypeAttribute {
    
    public func accessKey(_ value: Character) -> OrderedList {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> OrderedList {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> OrderedList {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> OrderedList {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> OrderedList {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> OrderedList {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> OrderedList {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> OrderedList {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> OrderedList {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> OrderedList {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> OrderedList {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> OrderedList {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> OrderedList {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> OrderedList {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> OrderedList {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> OrderedList {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> OrderedList {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> OrderedList {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> OrderedList {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> OrderedList {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> OrderedList {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> OrderedList {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> OrderedList {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> OrderedList {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> OrderedList {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> OrderedList {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> OrderedList {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> OrderedList {
        return mutate(translate: type.rawValue)
    }

    public func reversed() -> OrderedList {
        return mutate(reversed: "reversed")
    }
    
    public func start(_ size: Int) -> OrderedList {
        return mutate(start: size)
    }
    
    public func type(_ value: String) -> OrderedList {
        return mutate(type: value)
    }
    
    public func custom(key: String, value: Any) -> OrderedList {
        return mutate(key: key, value: value)
    }
}

extension OrderedList: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension OrderedList: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a list of items, where the order of the items is not important.
///
/// ```html
/// <ul></ul>
/// ```
public struct UnorderedList: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "ul" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [ListElement]

    public init(@ContentBuilder<ListElement> content: () -> [ListElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [ListElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension UnorderedList: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> UnorderedList {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> UnorderedList {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> UnorderedList {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> UnorderedList {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> UnorderedList {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> UnorderedList {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> UnorderedList {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> UnorderedList {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> UnorderedList {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> UnorderedList {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> UnorderedList {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> UnorderedList {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> UnorderedList {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> UnorderedList {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> UnorderedList {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> UnorderedList {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> UnorderedList {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> UnorderedList {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> UnorderedList {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> UnorderedList {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> UnorderedList {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> UnorderedList {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> UnorderedList {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> UnorderedList {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> UnorderedList {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> UnorderedList {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> UnorderedList {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> UnorderedList {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> UnorderedList {
        return mutate(key: key, value: value)
    }
}

extension UnorderedList: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension UnorderedList: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element defines a list of terms and corresponding definitions.
///
/// ```html
/// <dl></dl>
/// ```
public struct DescriptionList: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "dl" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [DescriptionElement]

    public init(@ContentBuilder<DescriptionElement> content: () -> [DescriptionElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [DescriptionElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension DescriptionList: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> DescriptionList {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> DescriptionList {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> DescriptionList {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> DescriptionList {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> DescriptionList {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> DescriptionList {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> DescriptionList {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> DescriptionList {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> DescriptionList {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> DescriptionList {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> DescriptionList {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> DescriptionList {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> DescriptionList {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> DescriptionList {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> DescriptionList {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> DescriptionList {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> DescriptionList {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> DescriptionList {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> DescriptionList {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> DescriptionList {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> DescriptionList {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> DescriptionList {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> DescriptionList {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> DescriptionList {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> DescriptionList {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> DescriptionList {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> DescriptionList {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> DescriptionList {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> DescriptionList {
        return mutate(key: key, value: value)
    }
}

extension DescriptionList: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension DescriptionList: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element can thus be used to annotate illustrations, diagrams, photos, code listings.
///
/// ```html
/// <figure></figure>
/// ```
public struct Figure: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "figure" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [FigureElement]

    public init(@ContentBuilder<FigureElement> content: () -> [FigureElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [FigureElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Figure: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Figure {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Figure {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Figure {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Figure {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Figure {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Figure {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Figure {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Figure {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Figure {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Figure {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Figure {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Figure {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Figure {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Figure {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Figure {
        return mutate(itemscope: value)
    }

    public func itemType(_ value: String) -> Figure {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Figure {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Figure {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Figure {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Figure {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Figure {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Figure {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Figure {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Figure {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Figure {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Figure {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Figure {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Figure {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Figure {
        return mutate(key: key, value: value)
    }
}

extension Figure: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Figure: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a comment output.
///
/// ```html
/// <a></a>
/// ```
public struct Anchor: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "a" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Anchor: GlobalAttributes, DownloadAttribute, ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, PingAttribute, ReferrerPolicyAttribute, RelationshipAttribute, TargetAttribute, TypeAttribute {
    
    public func accessKey(_ value: Character) -> Anchor {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Anchor {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Anchor {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Anchor {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Anchor {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Anchor {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Anchor {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Anchor {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Anchor {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Anchor {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Anchor {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Anchor {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Anchor {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Anchor {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Anchor {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Anchor {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Anchor {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Anchor {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Anchor {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Anchor {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Anchor {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Anchor {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Anchor {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Anchor {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Anchor {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Anchor {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Anchor {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Anchor {
        return mutate(translate: type.rawValue)
    }
    
    public func download() -> Anchor {
        return mutate(download: "download")
    }
    
    public func reference(_ value: String) -> Anchor {
        return mutate(href: value)
    }
    
    public func reference(_ value: TemplateValue<String>) -> Anchor {
        return mutate(href: value.rawValue)
    }
    
    public func referenceLanguage(_ type: Language) -> Anchor {
        return mutate(hreflang: type.rawValue)
    }
    
    public func media(_ value: String) -> Anchor {
        return mutate(media: value)
    }
    
    public func ping(_ value: String) -> Anchor {
        return mutate(ping: value)
    }
    
    public func referrerPolicy(_ type: Policy) -> Anchor {
        return mutate(referrerpolicy: type.rawValue)
    }
    
    public func relationship(_ type: Relation) -> Anchor {
        return mutate(rel: type.rawValue)
    }
    
    public func target(_ type: Target) -> Anchor {
        return mutate(target: type.rawValue)
    }
    
    public func type(_ value: String) -> Anchor {
        return mutate(type: value)
    }
    
    public func custom(key: String, value: Any) -> Anchor {
        return mutate(key: key, value: value)
    }
}

extension Anchor: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Anchor: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Anchor: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element provides typographic emphasis.
///
/// ```html
/// <em></em>
/// ```
public struct Emphasize: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "em" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Emphasize: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Emphasize {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Emphasize {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Emphasize {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Emphasize {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Emphasize {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Emphasize {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Emphasize {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Emphasize {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Emphasize {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Emphasize {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Emphasize {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Emphasize {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Emphasize {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Emphasize {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Emphasize {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Emphasize {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Emphasize {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Emphasize {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Emphasize {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Emphasize {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Emphasize {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Emphasize {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Emphasize {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Emphasize {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Emphasize {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Emphasize {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Emphasize {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Emphasize {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Emphasize {
        return mutate(key: key, value: value)
    }
}

extension Emphasize: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Emphasize: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element provides strong typographic emphasis.
///
/// ```html
/// <strong></strong>
/// ```
public struct Strong: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "strong" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Strong: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Strong {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Strong {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Strong {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Strong {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Strong {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Strong {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Strong {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Strong {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Strong {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Strong {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Strong {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Strong {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Strong {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Strong {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Strong {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Strong {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Strong {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> Strong {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Strong {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Strong {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Strong {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Strong {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Strong {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Strong {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Strong {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Strong {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Strong {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Strong {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Strong {
        return mutate(key: key, value: value)
    }
}

extension Strong: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Strong: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents side comments such as small print.
///
/// ```html
/// <small></small>
/// ```
public struct Small: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "small" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Small: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Small {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Small {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Small {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Small {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Small {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Small {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Small {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Small {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Small {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Small {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Small {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Small {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Small {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Small {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Small {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Small {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Small {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Small {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Small {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Small {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Small {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Small {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Small {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Small {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Small {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Small {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Small {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Small {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Small {
        return mutate(key: key, value: value)
    }
}

extension Small: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Small: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Small: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents contents that are no longer accurate or no longer relevant.
///
/// ```html
/// <s></s>
/// ```
public struct StrikeThrough: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "s" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension StrikeThrough: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> StrikeThrough {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> StrikeThrough {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> StrikeThrough {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> StrikeThrough {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> StrikeThrough {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> StrikeThrough {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> StrikeThrough {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> StrikeThrough {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> StrikeThrough {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> StrikeThrough {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> StrikeThrough {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> StrikeThrough {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> StrikeThrough {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> StrikeThrough {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> StrikeThrough {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> StrikeThrough {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> StrikeThrough {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> StrikeThrough {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> StrikeThrough {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> StrikeThrough {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> StrikeThrough {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> StrikeThrough {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> StrikeThrough {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> StrikeThrough {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> StrikeThrough {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> StrikeThrough {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> StrikeThrough {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> StrikeThrough {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> StrikeThrough {
        return mutate(key: key, value: value)
    }
}

extension StrikeThrough: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension StrikeThrough: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension StrikeThrough: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents the dominant contents of the document.
///
/// ```html
/// <main></main>
/// ```
public struct Main: ContentNode, HtmlElement, BodyElement, FormElement {

    internal var name: String { "main" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Main: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Main {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Main {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Main {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Main {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Main {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Main {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Main {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Main {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Main {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Main {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Main {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Main {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Main {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Main {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Main {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Main {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Main {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Main {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Main {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Main {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Main {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Main {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Main {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Main {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Main {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Main {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Main {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Main {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Main {
        return mutate(key: key, value: value)
    }
}

extension Main: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Main: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element is used to represent different kinds of containers.
///
/// ```html
/// <div></div>
/// ```
public struct Division: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "div" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Division: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Division {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Division {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Division {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Division {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Division {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Division {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Division {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Division {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Division {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Division {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Division {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Division {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Division {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Division {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Division {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Division {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Division {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Division {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Division {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Division {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Division {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Division {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Division {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Division {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Division {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Division {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Division {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Division {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Division {
        return mutate(key: key, value: value)
    }
}

extension Division: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Division: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a comment output.
///
/// ```html
/// <dfn></dfn>
/// ```
public struct Definition: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "dfn" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Definition: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Definition {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Definition {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Definition {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Definition {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Definition {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Definition {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Definition {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Definition {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Definition {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Definition {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Definition {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Definition {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Definition {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Definition {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Definition {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Definition {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Definition {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Definition {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Definition {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Definition {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Definition {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Definition {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Definition {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Definition {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Definition {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Definition {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Definition {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Definition {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Definition {
        return mutate(key: key, value: value)
    }
}

extension Definition: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Definition: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element specifies a citation.
///
/// ```html
/// <cite></cite>
/// ```
public struct Cite: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "cite" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Cite: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Cite {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Cite {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Cite {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Cite {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Cite {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Cite {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Cite {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Cite {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Cite {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Cite {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Cite {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Cite {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Cite {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Cite {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Cite {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Cite {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Cite {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Cite {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Cite {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Cite {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Cite {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> Cite {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Cite {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Cite {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Cite {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Cite {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Cite {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Cite {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Cite {
        return mutate(key: key, value: value)
    }
}

extension Cite: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Cite: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element is used for a short quotation.
///
/// ```html
/// <q></q>
/// ```
public struct ShortQuote: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "q" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension ShortQuote: GlobalAttributes, CiteAttribute {
    
    public func accessKey(_ value: Character) -> ShortQuote {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> ShortQuote {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> ShortQuote {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> ShortQuote {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> ShortQuote {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> ShortQuote {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> ShortQuote {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> ShortQuote {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> ShortQuote {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> ShortQuote {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> ShortQuote {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> ShortQuote {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> ShortQuote {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> ShortQuote {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> ShortQuote {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> ShortQuote {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> ShortQuote {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> ShortQuote {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> ShortQuote {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> ShortQuote {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> ShortQuote {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> ShortQuote {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> ShortQuote {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> ShortQuote {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> ShortQuote {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> ShortQuote {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> ShortQuote {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> ShortQuote {
        return mutate(translate: type.rawValue)
    }
    
    public func cite(_ value: String) -> ShortQuote {
        return mutate(cite: value)
    }
    
    public func custom(key: String, value: Any) -> ShortQuote {
        return mutate(key: key, value: value)
    }
}

extension ShortQuote: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension ShortQuote: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents an abbreviation or acronym.
///
/// ```html
/// <abbr></abbr>
/// ```
public struct Abbreviation: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "abbr" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Abbreviation: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Abbreviation {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Abbreviation {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Abbreviation {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Abbreviation {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Abbreviation {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Abbreviation {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Abbreviation {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Abbreviation {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Abbreviation {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Abbreviation {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Abbreviation {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Abbreviation {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Abbreviation {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Abbreviation {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Abbreviation {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Abbreviation {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Abbreviation {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Abbreviation {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Abbreviation {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Abbreviation {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Abbreviation {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> Abbreviation {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Abbreviation {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Abbreviation {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Abbreviation {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Abbreviation {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Abbreviation {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Abbreviation {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Abbreviation {
        return mutate(key: key, value: value)
    }
}

extension Abbreviation: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Abbreviation: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element allows one or more spans of phrasing content to be marked with ruby annotations.
///
/// ```html
/// <ruby></ruby>
/// ```
public struct Ruby: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "ruby" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [RubyElement]

    public init(@ContentBuilder<RubyElement> content: () -> [RubyElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [RubyElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Ruby: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Ruby {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Ruby {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Ruby {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Ruby {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Ruby {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Ruby {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Ruby {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Ruby {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Ruby {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Ruby {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Ruby {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Ruby {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Ruby {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Ruby {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Ruby {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Ruby {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Ruby {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Ruby {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Ruby {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Ruby {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Ruby {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Ruby {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Ruby {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Ruby {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Ruby {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Ruby {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Ruby {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Ruby {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Ruby {
        return mutate(key: key, value: value)
    }
}

extension Ruby: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Ruby: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a comment output.
///
/// ```html
/// <data></data>
/// ```
public struct Data: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "data" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Data: GlobalAttributes, ValueAttribute {
    
    public func accessKey(_ value: Character) -> Data {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Data {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Data {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Data {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Data {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Data {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Data {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Data {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Data {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Data {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Data {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Data {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Data {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Data {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Data {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Data {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Data {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Data {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Data {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Data {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Data {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Data {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Data {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Data {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Data {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Data {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Data {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Data {
        return mutate(translate: type.rawValue)
    }
    
    public func value(_ value: String) -> Data {
        return mutate(value: value)
    }
    
    public func value(_ value: TemplateValue<String>) -> Data {
        return mutate(value: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Data {
        return mutate(key: key, value: value)
    }
}

extension Data: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Data: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents its contents, along with a machine-readable form of those contents in the datetime attribute.
///
/// ```html
/// <time></time>
/// ```
public struct Time: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "time" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Time: GlobalAttributes, DateTimeAttribute {

    public func accessKey(_ value: Character) -> Time {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Time {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Time {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Time {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Time {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Time {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Time {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Time {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Time {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Time {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Time {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Time {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Time {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Time {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Time {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Time {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Time {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Time {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Time {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Time {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Time {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Time {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Time {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Time {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Time {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Time {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Time {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Time {
        return mutate(translate: type.rawValue)
    }

    public func dateTime(_ value: String) -> Time {
        return mutate(datetime: value)
    }
    
    public func custom(key: String, value: Any) -> Time {
        return mutate(key: key, value: value)
    }
}

extension Time: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Time: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents an example of code.
///
/// ```html
/// <code></code>
/// ```
public struct Code: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "code" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Code: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Code {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Code {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Code {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Code {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Code {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Code {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Code {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Code {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Code {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Code {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Code {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Code {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Code {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Code {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Code {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Code {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Code {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> Code {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Code {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Code {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Code {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Code {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Code {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Code {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Code {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Code {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Code {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Code {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Code {
        return mutate(key: key, value: value)
    }
}

extension Code: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Code: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element indicates a variable name.
///
/// ```html
/// <v></v>
/// ```
public struct Variable: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "v" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Variable: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Variable {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Variable {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Variable {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Variable {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Variable {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Variable {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Variable {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Variable {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Variable {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Variable {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Variable {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Variable {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Variable {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Variable {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Variable {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Variable {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Variable {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Variable {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Variable {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Variable {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Variable {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Variable {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Variable {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Variable {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Variable {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Variable {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Variable {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Variable {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Variable {
        return mutate(key: key, value: value)
    }
}

extension Variable: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Variable: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents sample or quoted output from another program or computing system.
///
/// ```html
/// <samp></samp>
/// ```
public struct SampleOutput: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "samp" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension SampleOutput: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> SampleOutput {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> SampleOutput {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> SampleOutput {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> SampleOutput {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> SampleOutput {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> SampleOutput {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> SampleOutput {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> SampleOutput {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> SampleOutput {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> SampleOutput {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> SampleOutput {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> SampleOutput {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> SampleOutput {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> SampleOutput {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> SampleOutput {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> SampleOutput {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> SampleOutput {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> SampleOutput {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> SampleOutput {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> SampleOutput {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> SampleOutput {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> SampleOutput {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> SampleOutput {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> SampleOutput {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> SampleOutput {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> SampleOutput {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> SampleOutput {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> SampleOutput {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> SampleOutput {
        return mutate(key: key, value: value)
    }
}

extension SampleOutput: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension SampleOutput: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents user input.
///
/// ```html
/// <kdb></kbd>
/// ```
public struct KeyboardInput: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "kbd" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension KeyboardInput: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> KeyboardInput {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> KeyboardInput {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> KeyboardInput {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> KeyboardInput {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> KeyboardInput {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> KeyboardInput {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> KeyboardInput {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> KeyboardInput {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> KeyboardInput {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> KeyboardInput {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> KeyboardInput {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> KeyboardInput {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> KeyboardInput {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> KeyboardInput {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> KeyboardInput {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> KeyboardInput {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> KeyboardInput {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> KeyboardInput {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> KeyboardInput {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> KeyboardInput {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> KeyboardInput {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> KeyboardInput {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> KeyboardInput {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> KeyboardInput {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> KeyboardInput {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> KeyboardInput {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> KeyboardInput {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> KeyboardInput {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> KeyboardInput {
        return mutate(key: key, value: value)
    }
}

extension KeyboardInput: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension KeyboardInput: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a subscript.
///
/// ```html
/// <sub></sub>
/// ```
public struct Subscript: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "sub" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Subscript: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Subscript {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Subscript {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Subscript {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Subscript {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Subscript {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Subscript {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Subscript {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Subscript {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Subscript {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Subscript {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Subscript {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Subscript {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Subscript {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Subscript {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Subscript {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Subscript {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Subscript {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Subscript {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Subscript {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Subscript {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Subscript {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> Subscript {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Subscript {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Subscript {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Subscript {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Subscript {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Subscript {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Subscript {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Subscript {
        return mutate(key: key, value: value)
    }
}

extension Subscript: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Subscript: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a superscript.
///
/// ```html
/// <sup></sup>
/// ```
public struct Superscript: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "sup" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Superscript: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Superscript {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Superscript {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Superscript {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Superscript {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Superscript {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Superscript {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Superscript {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Superscript {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Superscript {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Superscript {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Superscript {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Superscript {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Superscript {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Superscript {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Superscript {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Superscript {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Superscript {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Superscript {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Superscript {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Superscript {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Superscript {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Superscript {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Superscript {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Superscript {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Superscript {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Superscript {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Superscript {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Superscript {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Superscript {
        return mutate(key: key, value: value)
    }
}

extension Superscript: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Superscript: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents an italic font text.
///
/// ```html
/// <i></i>
/// ```
public struct Italic: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "i" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Italic: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Italic {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Italic {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Italic {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Italic {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Italic {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Italic {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Italic {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Italic {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Italic {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Italic {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Italic {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Italic {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Italic {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Italic {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Italic {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Italic {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Italic {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Italic {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Italic {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Italic {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Italic {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Italic {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Italic {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Italic {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Italic {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Italic {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Italic {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Italic {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Italic {
        return mutate(key: key, value: value)
    }
}

extension Italic: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Italic: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
    
extension Italic: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents an bold font text.
///
/// ```html
/// <b></b>
/// ```
public struct Bold: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "b" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Bold: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Bold {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Bold {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Bold {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Bold {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Bold {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Bold {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Bold {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Bold {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Bold {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Bold {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Bold {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Bold {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Bold {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Bold {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Bold {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Bold {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Bold {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Bold {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Bold {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Bold {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Bold {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Bold {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Bold {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Bold {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Bold {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Bold {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Bold {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Bold {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Bold {
        return mutate(key: key, value: value)
    }
}

extension Bold: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Bold: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Bold: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element specifies that the enclosed text should be displayed as underlined.
///
/// ```html
/// <u></u>
/// ```
public struct Underline: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "u" }
    
    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Underline: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Underline {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Underline {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Underline {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Underline {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Underline {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Underline {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Underline {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Underline {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Underline {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Underline {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Underline {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Underline {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Underline {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Underline {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Underline {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Underline {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Underline {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Underline {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Underline {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Underline {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Underline {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Underline {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Underline {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Underline {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Underline {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Underline {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Underline {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Underline {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Underline {
        return mutate(key: key, value: value)
    }
}

extension Underline: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Underline: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Underline: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a run of text in the document marked or highlighted for reference purposes.
///
/// ```html
/// <mark></mark>
/// ```
public struct Mark: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "mark" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Mark: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Mark {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Mark {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Mark {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Mark {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Mark {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Mark {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Mark {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Mark {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Mark {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Mark {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Mark {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Mark {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Mark {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Mark {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Mark {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Mark {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Mark {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Mark {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Mark {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Mark {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Mark {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Mark {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Mark {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Mark {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Mark {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Mark {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Mark {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Mark {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Mark {
        return mutate(key: key, value: value)
    }
}

extension Mark: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Mark: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a span of text that is to be isolated from its surroundings for the purposes of bidirectional text formatting.
///
/// ```html
/// <bdi></bdi>
/// ```
public struct Bdi: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "bdi" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Bdi: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Bdi {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Bdi {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Bdi {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Bdi {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Bdi {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Bdi {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Bdi {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Bdi {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Bdi {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Bdi {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Bdi {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Bdi {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Bdi {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Bdi {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Bdi {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Bdi {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Bdi {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Bdi {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Bdi {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Bdi {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Bdi {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Bdi {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Bdi {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Bdi {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Bdi {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Bdi {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Bdi {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Bdi {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Bdi {
        return mutate(key: key, value: value)
    }
}

extension Bdi: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Bdi: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents explicit text directionality formatting control.
///
/// ```html
/// <bdo></bdo>
/// ```
public struct Bdo: EmptyNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "bdo" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Bdo: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Bdo {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Bdo {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Bdo {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Bdo {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Bdo {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Bdo {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Bdo {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Bdo {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Bdo {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Bdo {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Bdo {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Bdo {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Bdo {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Bdo {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Bdo {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Bdo {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Bdo {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Bdo {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Bdo {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Bdo {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Bdo {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Bdo {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Bdo {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Bdo {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Bdo {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Bdo {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Bdo {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Bdo {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Bdo {
        return mutate(key: key, value: value)
    }
}

extension Bdo: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Bdo: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element doesn't mean anything on its own.
///
/// ```html
/// <span></span>
/// ```
public struct Span: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "span" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Span: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Span {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Span {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Span {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Span {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Span {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Span {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Span {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Span {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Span {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Span {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Span {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Span {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Span {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Span {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Span {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Span {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Span {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Span {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Span {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Span {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Span {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Span {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Span {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Span {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Span {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Span {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Span {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Span {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Span {
        return mutate(key: key, value: value)
    }
}

extension Span: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Span: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a line break.
///
/// ```html
/// <br>
/// ```
public struct LineBreak: EmptyNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "br" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension LineBreak: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> LineBreak {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> LineBreak {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> LineBreak {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> LineBreak {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> LineBreak {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> LineBreak {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> LineBreak {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> LineBreak {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> LineBreak {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> LineBreak {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> LineBreak {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> LineBreak {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> LineBreak {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> LineBreak {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> LineBreak {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> LineBreak {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> LineBreak {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> LineBreak {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> LineBreak {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> LineBreak {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> LineBreak {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> LineBreak {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> LineBreak {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> LineBreak {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> LineBreak {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> LineBreak {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> LineBreak {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> LineBreak {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> LineBreak {
        return mutate(key: key, value: value)
    }
}

extension LineBreak: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension LineBreak: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a line break opportunity.
///
/// ```html
/// <wbr>
/// ```
public struct WordBreak: EmptyNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "wbr" }
    
    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension WordBreak: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> WordBreak {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> WordBreak {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> WordBreak {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> WordBreak {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> WordBreak {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> WordBreak {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> WordBreak {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> WordBreak {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> WordBreak {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> WordBreak {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> WordBreak {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> WordBreak {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> WordBreak {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> WordBreak {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> WordBreak {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> WordBreak {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> WordBreak {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> WordBreak {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> WordBreak {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> WordBreak {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> WordBreak {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> WordBreak {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> WordBreak {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> WordBreak {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> WordBreak {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> WordBreak {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> WordBreak {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> WordBreak {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> WordBreak {
        return mutate(key: key, value: value)
    }
}

extension WordBreak: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension WordBreak: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents an addition to the document.
///
/// ```html
/// <ins></ins>
/// ```
public struct InsertedText: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "ins" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension InsertedText: GlobalAttributes, CiteAttribute, DateTimeAttribute {
    
    public func accessKey(_ value: Character) -> InsertedText {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> InsertedText {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> InsertedText {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> InsertedText {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> InsertedText {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> InsertedText {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> InsertedText {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> InsertedText {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> InsertedText {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> InsertedText {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> InsertedText {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> InsertedText {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> InsertedText {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> InsertedText {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> InsertedText {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> InsertedText {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> InsertedText {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> InsertedText {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> InsertedText {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> InsertedText {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> InsertedText {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> InsertedText {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> InsertedText {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> InsertedText {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> InsertedText {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> InsertedText {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> InsertedText {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> InsertedText {
        return mutate(translate: type.rawValue)
    }
    
    public func cite(_ value: String) -> InsertedText {
        return mutate(cite: value)
    }
    
    public func dateTime(_ value: String) -> InsertedText {
        return mutate(datetime: value)
    }
    
    public func custom(key: String, value: Any) -> InsertedText {
        return mutate(key: key, value: value)
    }
}

extension InsertedText: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension InsertedText: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a removal from the document.
///
/// ```html
/// <del></del>
/// ```
public struct DeletedText: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "del" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension DeletedText: GlobalAttributes, CiteAttribute, DateTimeAttribute {
    
    public func accessKey(_ value: Character) -> DeletedText {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> DeletedText {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> DeletedText {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> DeletedText {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> DeletedText {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> DeletedText {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> DeletedText {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> DeletedText {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> DeletedText {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> DeletedText {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> DeletedText {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> DeletedText {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> DeletedText {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> DeletedText {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> DeletedText {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> DeletedText {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> DeletedText {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> DeletedText {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> DeletedText {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> DeletedText {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> DeletedText {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> DeletedText {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> DeletedText {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> DeletedText {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> DeletedText {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> DeletedText {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> DeletedText {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> DeletedText {
        return mutate(translate: type.rawValue)
    }

    public func cite(_ value: String) -> DeletedText {
        return mutate(cite: value)
    }
    
    public func dateTime(_ value: String) -> DeletedText {
        return mutate(datetime: value)
    }
    
    public func custom(key: String, value: Any) -> DeletedText {
        return mutate(key: key, value: value)
    }
}

extension DeletedText: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension DeletedText: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element is a container which provides multiple sources to its contained image element.
///
/// ```html
/// <picture></picture>
/// ```
public struct Picture: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "picture" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Picture: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Picture {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Picture {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Picture {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Picture {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Picture {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Picture {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Picture {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Picture {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Picture {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Picture {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Picture {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Picture {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Picture {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Picture {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Picture {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Picture {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Picture {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Picture {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Picture {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Picture {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Picture {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Picture {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Picture {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Picture {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Picture {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Picture {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Picture {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Picture {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Picture {
        return mutate(key: key, value: value)
    }
}

extension Picture: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Picture: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents an image.
///
/// ```html
/// <img>
/// ```
public struct Image: EmptyNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "img" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Image: GlobalAttributes, AlternateAttribute, SourceAttribute, SizesAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute, ErrorEventAttribute, LoadEventAttribute {
    
    public func onError(_ value: String) -> Image {
        return mutate(onerror: value)
    }
    
    public func onLoad(_ value: String) -> Image {
        return mutate(onload: value)
    }
    
    public func accessKey(_ value: Character) -> Image {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Image {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Image {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Image {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Image {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Image {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Image {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Image {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Image {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Image {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Image {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Image {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Image {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Image {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Image {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Image {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Image {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Image {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Image {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Image {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Image {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Image {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Image {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Image {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Image {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Image {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Image {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Image {
        return mutate(translate: type.rawValue)
    }

    public func alternate(_ value: String) -> Image {
        return mutate(alternate: value)
    }
    
    public func source(_ value: String) -> Image {
        return mutate(source: value)
    }
    
    public func sizes(_ size: Int) -> Image {
        return mutate(sizes: size)
    }
    
    public func width(_ size: Int) -> Image {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Image {
        return mutate(height: size)
    }
    
    public func referrerPolicy(_ type: Policy) -> Image {
        return mutate(referrerpolicy: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Image {
        return mutate(key: key, value: value)
    }
}

extension Image: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Image: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents its nested browsing context.
///
/// ```html
/// <iframe></iframe>
/// ```
public struct InlineFrame: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {
    
    internal var name: String { "iframe" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension InlineFrame: GlobalAttributes, SourceAttribute, NameAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute {
    
    public func accessKey(_ value: Character) -> InlineFrame {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> InlineFrame {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> InlineFrame {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> InlineFrame {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> InlineFrame {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> InlineFrame {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> InlineFrame {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> InlineFrame {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> InlineFrame {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> InlineFrame {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> InlineFrame {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> InlineFrame {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> InlineFrame {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> InlineFrame {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> InlineFrame {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> InlineFrame {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> InlineFrame {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> InlineFrame {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> InlineFrame {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> InlineFrame {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> InlineFrame {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> InlineFrame {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> InlineFrame {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> InlineFrame {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> InlineFrame {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> InlineFrame {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> InlineFrame {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> InlineFrame {
        return mutate(translate: type.rawValue)
    }

    public func source(_ value: String) -> InlineFrame {
        return mutate(source: value)
    }
    
    public func name(_ value: String) -> InlineFrame {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> InlineFrame {
        return mutate(name: value.rawValue)
    }
    
    public func width(_ size: Int) -> InlineFrame {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> InlineFrame {
        return mutate(height: size)
    }
    
    public func referrerPolicy(_ type: Policy) -> InlineFrame {
        return mutate(referrerpolicy: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> InlineFrame {
        return mutate(key: key, value: value)
    }
}

extension InlineFrame: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension InlineFrame: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element provides an integration point for an external application or interactive content.
///
/// ```html
/// <embed></embed>
/// ```
public struct Embed: EmptyNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "embed" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Embed: GlobalAttributes, SourceAttribute, TypeAttribute, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: Character) -> Embed {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Embed {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Embed {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Embed {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Embed {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Embed {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Embed {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Embed {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Embed {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Embed {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Embed {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Embed {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Embed {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Embed {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Embed {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Embed {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Embed {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Embed {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Embed {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Embed {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Embed {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> Embed {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Embed {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Embed {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Embed {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Embed {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Embed {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Embed {
        return mutate(translate: type.rawValue)
    }

    public func source(_ value: String) -> Embed {
        return mutate(source: value)
    }
    
    public func type(_ value: Medias) -> Embed {
        return mutate(type: value.rawValue)
    }
    
    public func width(_ size: Int) -> Embed {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Embed {
        return mutate(height: size)
    }
    
    public func custom(key: String, value: Any) -> Embed {
        return mutate(key: key, value: value)
    }
}

extension Embed: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Embed: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents an external resource.
///
/// ```html
/// <object></object>
/// ```
public struct Object: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {
    
    internal var name: String { "object" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [ObjectElement]

    public init(@ContentBuilder<ObjectElement> content: () -> [ObjectElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [ObjectElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Object: GlobalAttributes, DataAttribute, TypeAttribute, NameAttribute, FormAttribute, WidthAttribute, HeightAttribute, ErrorEventAttribute {

    public func onError(_ value: String) -> Object {
        return mutate(onerror: value)
    }
    
    public func accessKey(_ value: Character) -> Object {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Object {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Object {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Object {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Object {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Object {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Object {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Object {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Object {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Object {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Object {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Object {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Object {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Object {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Object {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Object {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Object {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Object {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Object {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Object {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Object {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Object {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Object {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Object {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Object {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Object {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Object {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Object {
        return mutate(translate: type.rawValue)
    }
    
    public func data(_ value: String) -> Object {
        return mutate(data: value)
    }
    
    public func type(_ value: Medias) -> Object {
        return mutate(type: value.rawValue)
    }
    
    public func name(_ value: String) -> Object {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> Object {
        return mutate(name: value.rawValue)
    }
    
    public func form(_ value: String) -> Object {
        return mutate(form: value)
    }
    
    public func width(_ size: Int) -> Object {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Object {
        return mutate(height: size)
    }
    
    public func custom(key: String, value: Any) -> Object {
        return mutate(key: key, value: value)
    }
}

extension Object: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Object: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element is used to embed video content in a document.
///
/// ```html
/// <video></video>
/// ```
public struct Video: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "video" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [MediaElement]

    public init(@ContentBuilder<MediaElement> content: () -> [MediaElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [MediaElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Video: GlobalAttributes, SourceAttribute, AutoplayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: Character) -> Video {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Video {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Video {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Video {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Video {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Video {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Video {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Video {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Video {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Video {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Video {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Video {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Video {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Video {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Video {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Video {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Video {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Video {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Video {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Video {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Video {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> Video {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Video {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Video {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Video {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Video {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Video {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Video {
        return mutate(translate: type.rawValue)
    }

    public func source(_ value: String) -> Video {
        return mutate(source: value)
    }
    
    public func autoplay() -> Video {
        return mutate(autoplay: "autoplay")
    }
    
    public func loop() -> Video {
        return mutate(loop: "loop")
    }
    
    public func muted() -> Video {
        return mutate(muted: "muted")
    }
    
    public func controls() -> Video {
        return mutate(controls: "controls")
    }
    
    public func width(_ size: Int) -> Video {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Video {
        return mutate(height: size)
    }
    
    public func custom(key: String, value: Any) -> Video {
        return mutate(key: key, value: value)
    }
}

extension Video: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Video: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element is used to embed audio content in a document.
///
/// ```html
/// <audio></audio>
/// ```
public struct Audio: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "audio" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [MediaElement]

    public init(@ContentBuilder<MediaElement> content: () -> [MediaElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [MediaElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Audio: GlobalAttributes, SourceAttribute, AutoplayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute {
    
    public func accessKey(_ value: Character) -> Audio {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Audio {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Audio {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Audio {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Audio {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Audio {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Audio {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Audio {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Audio {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Audio {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Audio {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Audio {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Audio {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Audio {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Audio {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Audio {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Audio {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Audio {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Audio {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Audio {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Audio {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Audio {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Audio {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Audio {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Audio {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Audio {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Audio {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Audio {
        return mutate(translate: type.rawValue)
    }

    public func source(_ value: String) -> Audio {
        return mutate(source: value)
    }
    
    public func autoplay() -> Audio {
        return mutate(autoplay: "autoplay")
    }
    
    public func loop() -> Audio {
        return mutate(loop: "loop")
    }
    
    public func muted() -> Audio {
        return mutate(muted: "muted")
    }
    
    public func controls() -> Audio {
        return mutate(controls: "controls")
    }
    
    public func custom(key: String, value: Any) -> Audio {
        return mutate(key: key, value: value)
    }
}

extension Audio: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Audio: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

// TODO: Revise the comment.
/// The element represents a comment output.
///
/// ```html
/// <map></map>
/// ```
public struct Map: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {
    
    internal var name: String { "map" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [MapElement]

    public init(@ContentBuilder<MapElement> content: () -> [MapElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [MapElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Map: GlobalAttributes, NameAttribute {
    
    public func accessKey(_ value: Character) -> Map {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Map {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Map {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Map {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Map {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Map {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Map {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Map {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Map {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Map {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Map {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Map {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Map {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Map {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Map {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Map {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Map {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Map {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Map {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Map {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Map {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Map {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Map {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Map {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Map {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Map {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Map {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Map {
        return mutate(translate: type.rawValue)
    }

    public func name(_ value: String) -> Map {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> Map {
        return mutate(name: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Map {
        return mutate(key: key, value: value)
    }
}

extension Map: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Map: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

// TODO: Revise the comment.
/// The element represents a comment output.
///
/// ```html
/// <form></form>
/// ```
public struct Form: ContentNode, HtmlElement, BodyElement, FigureElement, ObjectElement {

    internal var name: String { "form" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [FormElement]

    public init(@ContentBuilder<FormElement> content: () -> [FormElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [FormElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Form: GlobalAttributes, ActionAttribute, AutocompleteAttribute, EncodingAttribute, MethodAttribute, NameAttribute, TargetAttribute, RelationshipAttribute, ResetEventAttribute, SubmitEventAttribute {
    
    public func onReset(_ value: String) -> Form {
        return mutate(onreset: value)
    }
    
    public func onSubmit(_ value: String) -> Form {
        return mutate(onsubmit: value)
    }
    
    public func accessKey(_ value: Character) -> Form {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Form {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Form {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Form {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Form {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Form {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Form {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Form {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Form {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Form {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Form {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Form {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Form {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Form {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Form {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Form {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Form {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Form {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Form {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Form {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Form {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Form {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Form {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Form {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Form {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Form {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Form {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Form {
        return mutate(translate: type.rawValue)
    }

    public func action(_ value: String) -> Form {
        return mutate(action: value)
    }
    
    public func hasCompletion(_ condition: Bool) -> Form {
        return mutate(autocomplete: condition)
    }
    
    public func encoding(_ type: Encoding) -> Form {
        return mutate(enctype: type.rawValue)
    }
    
    public func method(_ type: Method) -> Form {
        return mutate(method: type.rawValue)
    }
    
    public func name(_ value: String) -> Form {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> Form {
        return mutate(name: value.rawValue)
    }
    
    public func target(_ type: Target) -> Form {
        return mutate(target: type.rawValue)
    }
    
    public func relationship(_ type: Relation) -> Form {
        return mutate(rel: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Form {
        return mutate(key: key, value: value)
    }
}

extension Form: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Form: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a set of options.
///
/// ```html
/// <datalist></datalist>
/// ```
public struct DataList: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "datalist" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension DataList: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> DataList {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> DataList {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> DataList {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> DataList {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> DataList {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> DataList {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> DataList {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> DataList {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> DataList {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> DataList {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> DataList {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> DataList {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> DataList {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> DataList {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> DataList {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> DataList {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> DataList {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> DataList {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> DataList {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> DataList {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> DataList {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> DataList {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> DataList {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> DataList {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> DataList {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> DataList {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> DataList {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> DataList {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> DataList {
        return mutate(key: key, value: value)
    }
}

extension DataList: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension DataList: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents the result of a calculation.
///
/// ```html
/// <output></output>
/// ```
public struct Output: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {
    
    internal var name: String { "output" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Output: GlobalAttributes, ForAttribute, FormAttribute, NameAttribute {
    
    public func accessKey(_ value: Character) -> Output {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Output {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Output {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Output {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Output {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Output {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Output {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Output {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Output {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Output {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Output {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Output {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Output {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Output {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Output {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Output {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Output {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Output {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Output {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Output {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Output {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Output {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Output {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Output {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Output {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Output {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Output {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Output {
        return mutate(translate: type.rawValue)
    }
    
    public func `for`(_ value: String) -> Output {
        return mutate(for: value)
    }
    
    public func form(_ value: String) -> Output {
        return mutate(form: value)
    }
    
    public func name(_ value: String) -> Output {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> Output {
        return mutate(name: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Output {
        return mutate(key: key, value: value)
    }
}

extension Output: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Output: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents the completion progress of a task.
///
/// ```html
/// <progress></progress>
/// ```
public struct Progress: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "progress" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Progress: GlobalAttributes, ValueAttribute, MaximumValueAttribute {
    
    public func accessKey(_ value: Character) -> Progress {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Progress {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Progress {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Progress {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Progress {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Progress {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Progress {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Progress {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Progress {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Progress {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Progress {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Progress {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Progress {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Progress {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Progress {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Progress {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Progress {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Progress {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Progress {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Progress {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Progress {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Progress {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Progress {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Progress {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Progress {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Progress {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Progress {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Progress {
        return mutate(translate: type.rawValue)
    }

    public func maximum(_ value: String) -> Progress {
        return mutate(max: value)
    }

    public func value(_ value: String) -> Progress {
        return mutate(value: value)
    }
    
    public func value(_ value: TemplateValue<String>) -> Progress {
        return mutate(value: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Progress {
        return mutate(key: key, value: value)
    }
}

extension Progress: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Progress: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a scalar measurement within a known range, or a fractional value.
///
/// ```html
/// <meter></meter>
/// ```
public struct Meter: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "meter" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Meter: GlobalAttributes, ValueAttribute, MinimumValueAttribute, MaximumValueAttribute, HighAttribute, OptimumAttribute {
    
    public func accessKey(_ value: Character) -> Meter {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Meter {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Meter {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Meter {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Meter {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Meter {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Meter {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Meter {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Meter {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Meter {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Meter {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Meter {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Meter {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Meter {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Meter {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Meter {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Meter {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Meter {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Meter {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Meter {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Meter {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Meter {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Meter {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Meter {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Meter {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Meter {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Meter {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Meter {
        return mutate(translate: type.rawValue)
    }
    
    public func minimum(_ value: String) -> Meter {
        return mutate(min: value)
    }
    
    public func maximum(_ value: String) -> Meter {
        return mutate(max: value)
    }
    
    public func high(_ size: Int) -> Meter {
        return mutate(high: size)
    }
    
    public func optimum(_ value: Float) -> Meter {
        return mutate(optimum: value)
    }
    
    public func value(_ value: String) -> Meter {
        return mutate(value: value)
    }
    
    public func value(_ value: TemplateValue<String>) -> Meter {
        return mutate(value: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Meter {
        return mutate(key: key, value: value)
    }
}

extension Meter: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Meter: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a disclosure widget from which the user can obtain additional information or controls.
///
/// ```html
/// <details></details>
/// ```
public struct Details: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "details" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Details: GlobalAttributes, OpenAttribute, ToggleEventAttribute {
    
    public func onToggle(_ value: String) -> Details {
        return mutate(ontoggle: value)
    }
    
    public func accessKey(_ value: Character) -> Details {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Details {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Details {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Details {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Details {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Details {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Details {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Details {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Details {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Details {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Details {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Details {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Details {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Details {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Details {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Details {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Details {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Details {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Details {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Details {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Details {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> Details {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Details {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Details {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Details {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Details {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Details {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Details {
        return mutate(translate: type.rawValue)
    }

    public func isOpen(_ condition: Bool) -> Details {
        return mutate(open: condition)
    }
    
    public func custom(key: String, value: Any) -> Details {
        return mutate(key: key, value: value)
    }
}

extension Details: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Details: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element defines a dialog box or window.
public struct Dialog: ContentNode, BodyElement {

    internal var name: String { "dialog" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Dialog: GlobalAttributes, OpenAttribute {
    
    public func accessKey(_ value: Character) -> Dialog {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Dialog {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Dialog {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Dialog {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Dialog {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Dialog {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Dialog {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Dialog {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Dialog {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Dialog {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Dialog {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Dialog {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Dialog {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Dialog {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Dialog {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Dialog {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Dialog {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Dialog {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Dialog {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Dialog {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Dialog {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> Dialog {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Dialog {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Dialog {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Dialog {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Dialog {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Dialog {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Dialog {
        return mutate(translate: type.rawValue)
    }

    public func isOpen(_ condition: Bool) -> Dialog {
        return mutate(open: condition)
    }
    
    public func custom(key: String, value: Any) -> Dialog {
        return mutate(key: key, value: value)
    }
}

extension Dialog: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Dialog: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element allows to include dynamic script and data blocks in a document.
///
/// ```html
/// <script></script>
/// ```
public struct Script: ContentNode, HeadElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "script" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [String]

    public init(@ContentBuilder<String> content: () -> [String]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [String]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Script: GlobalAttributes, AsynchronouslyAttribute, ReferrerPolicyAttribute, SourceAttribute, TypeAttribute, ErrorEventAttribute, LoadEventAttribute {
    
    public func onError(_ value: String) -> Script {
        return mutate(onerror: value)
    }
    
    public func onLoad(_ value: String) -> Script {
        return mutate(onload: value)
    }

    public func accessKey(_ value: Character) -> Script {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Script {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Script {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Script {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Script {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Script {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Script {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Script {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Script {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Script {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Script {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Script {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Script {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Script {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Script {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Script {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Script {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Script {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Script {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Script {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Script {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Script {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Script {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Script {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Script {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Script {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Script {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Script {
        return mutate(translate: type.rawValue)
    }

    public func asynchronously() -> Script {
        return mutate(async: "async")
    }
    
    public func referrerPolicy(_ type: Policy) -> Script {
        return mutate(referrerpolicy: type.rawValue)
    }
    
    public func source(_ value: String) -> Script {
        return mutate(source: value)
    }
    
    public func type(_ value: Medias) -> Script {
        return mutate(type: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Script {
        return mutate(key: key, value: value)
    }
}

extension Script: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Script: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a caption for the rest of the contents of a fieldset.
///
/// ```html
/// <noscript></noscript>
/// ```
public struct NoScript: ContentNode, HtmlElement, HeadElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "noscript" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension NoScript: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> NoScript {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> NoScript {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> NoScript {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> NoScript {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> NoScript {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> NoScript {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> NoScript {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> NoScript {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> NoScript {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> NoScript {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> NoScript {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> NoScript {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> NoScript {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> NoScript {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> NoScript {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> NoScript {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> NoScript {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> NoScript {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> NoScript {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> NoScript {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> NoScript {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> NoScript {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> NoScript {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> NoScript {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> NoScript {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> NoScript {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> NoScript {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> NoScript {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> NoScript {
        return mutate(key: key, value: value)
    }
}

extension NoScript: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension NoScript: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element is used to declare fragments of HTML that can be cloned and inserted in the document by script.
///
/// ```html
/// <template></template>
/// ```
public struct Template: ContentNode, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "template" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Template: GlobalAttributes {
    
    public func accessKey(_ value: Character) -> Template {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Template {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Template {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Template {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Template {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Template {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Template {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Template {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Template {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Template {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Template {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Template {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Template {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Template {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Template {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Template {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Template {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Template {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Template {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Template {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Template {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Template {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Template {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Template {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Template {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Template {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Template {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Template {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Template {
        return mutate(key: key, value: value)
    }
}

extension Template: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Template: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a comment output.
///
/// ```html
/// <canvas></canvas>
/// ```
public struct Canvas: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "canvas" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Canvas: GlobalAttributes, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: Character) -> Canvas {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Canvas {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Canvas {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Canvas {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Canvas {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Canvas {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Canvas {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Canvas {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Canvas {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Canvas {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Canvas {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Canvas {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Canvas {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Canvas {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Canvas {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Canvas {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Canvas {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Canvas {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Canvas {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Canvas {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Canvas {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Canvas {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Canvas {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Canvas {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Canvas {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Canvas {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Canvas {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Canvas {
        return mutate(translate: type.rawValue)
    }
    
    public func width(_ size: Int) -> Canvas {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Canvas {
        return mutate(height: size)
    }
    
    public func custom(key: String, value: Any) -> Canvas {
        return mutate(key: key, value: value)
    }
}

extension Canvas: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Canvas: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a comment output.
///
/// ```html
/// <table></table>
/// ```
public struct Table: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "table" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [TableElement]

    public init(@ContentBuilder<TableElement> content: () -> [TableElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [TableElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Table: GlobalAttributes, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: Character) -> Table {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Table {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Table {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Table {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Table {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Table {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Table {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Table {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Table {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Table {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Table {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Table {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Table {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Table {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Table {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Table {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Table {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Table {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Table {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Table {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Table {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Table {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Table {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Table {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Table {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Table {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Table {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Table {
        return mutate(translate: type.rawValue)
    }

    public func width(_ size: Int) -> Table {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Table {
        return mutate(height: size)
    }
    
    public func custom(key: String, value: Any) -> Table {
        return mutate(key: key, value: value)
    }
}

extension Table: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Table: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element represents a vector.
///
/// ```html
/// <svg></svg>
/// ```
public struct Vector: ContentNode, HtmlElement, BodyElement, FormElement, FigureElement, ObjectElement {

    internal var name: String { "svg" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [VectorElement]

    public init(@ContentBuilder<VectorElement> content: () -> [VectorElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [VectorElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Vector: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.build(with: manager)
    }
}

extension Vector: GlobalVectorAttributes, WidthAttribute, HeightAttribute, ViewBoxAttribute {
    
    public func id(_ value: String) -> Vector {
        return self.mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Vector {
        return self.mutate(id: value.rawValue)
    }
    
    public func tabIndex(_ value: String) -> Vector {
        return self.mutate(tabindex: value)
    }
    
    public func width(_ size: Int) -> Vector {
        return self.mutate(width: size)
    }
    
    public func height(_ size: Int) -> Vector {
        return self.mutate(height: size)
    }
    
    public func `class`(_ value: String) -> Vector {
        return self.mutate(class: value)
    }
    
    public func style(_ value: String) -> Vector {
        return self.mutate(style: value)
    }
    
    public func viewBox(_ value: String) -> Vector {
        return self.mutate(viewbox: value)
    }
    
    public func fill(_ value: String) -> Vector {
        return self.mutate(fill: value)
    }
    
    public func stroke(_ value: String) -> Vector {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Vector {
        return self.mutate(strokewidth: size)
    }
    
    public func fillOpacity(_ value: Double) -> Vector {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Vector {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ type: Linecap) -> Vector {
        return self.mutate(strokelinecap: type.rawValue)
    }
    
    public func strokeLineJoin(_ type: Linejoin) -> Vector {
        return self.mutate(strokelinejoin: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Vector {
        return self.mutate(key: key, value: value)
    }
}
