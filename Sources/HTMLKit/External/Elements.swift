public struct Div: ContentNode {

    public var name: String { "div" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct P: ContentNode, LocalizableNode {

    public var name: String { "p" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H1: ContentNode, LocalizableNode {

    public var name: String { "h1" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H2: ContentNode, LocalizableNode {

    public var name: String { "h2" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H3: ContentNode, LocalizableNode {

    public var name: String { "h3" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H4: ContentNode, LocalizableNode {

    public var name: String { "h4" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H5: ContentNode, LocalizableNode {

    public var name: String { "h5" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H6: ContentNode, LocalizableNode {

    public var name: String { "h6" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Blockquote: ContentNode, LocalizableNode {

    public var name: String { "blockquote" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Bold: ContentNode, LocalizableNode {

    public var name: String { "b" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Italic: ContentNode, LocalizableNode {

    public var name: String { "i" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Small: ContentNode, LocalizableNode {

    public var name: String { "small" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <s> tag specifies text that is no longer correct, accurate or relevant.
/// The <s> tag should not be used to define replaced or deleted text, use the <del> tag to define replaced or deleted text.
public struct StrikeThrough: ContentNode, LocalizableNode {

    public var name: String { "s" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Span: ContentNode {

    public var name: String { "span" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Body: ContentNode {

    public var name: String { "body" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Head: ContentNode {

    public var name: String { "head" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Header: ContentNode {

    public var name: String { "header" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public enum ButtonType: String {
    case button
    case submit
    case reset
}

public struct Button: ContentNode, TypableAttribute, NameableAttribute, LocalizableNode {

    public typealias NameType = String

    public var name: String { "button" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }

    public func type(_ type: ButtonType) -> Button {
        self.type(TemplateValue<String>.constant(type.rawValue))
    }
}

public struct ListItem: ContentNode {

    public var name: String { "li" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct OrderedList: ContentNode {

    public var name: String { "ol" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct UnorderedList: ContentNode {

    public var name: String { "ul" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Code: ContentNode {

    public var name: String { "code" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Abbreviation: ContentNode {

    public var name: String { "abbr" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <address> tag defines the contact information for the author/owner of a document or an article.
/// If the <address> element is inside the <body> element, it represents contact information for the document.
/// If the <address> element is inside an <article> element, it represents contact information for that article.
/// The text in the <address> element usually renders in italic. Most browsers will add a line break before and after the address element.
public struct Address: ContentNode {

    public var name: String { "address" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Area: ContentNode {

    public var name: String { "area" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <article> tag specifies independent, self-contained content.
///
/// An article should make sense on its own and it should be possible to distribute it independently from the rest of the site.
///
/// Potential sources for the <article> element:
///
/// - Forum post
/// - Blog post
/// - News story
/// - Comment
public struct Article: ContentNode {

    public var name: String { "article" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <aside> tag defines some content aside from the content it is placed in.
/// The aside content should be related to the surrounding content.
public struct Aside: ContentNode {

    public var name: String { "aside" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <audio> tag defines sound, such as music or other audio streams.
/// Currently, there are 3 supported file formats for the <audio> element: MP3, WAV, and OGG:
public struct Audio: ContentNode {

    public var name: String { "audio" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <a> tag defines a hyperlink, which is used to link from one page to another.
public struct Anchor: ContentNode, TypableAttribute, HyperlinkReferenceAttribute, LocalizableNode, RelationshipAttribute {

    public enum RelationshipTypes: String {
        /// Provides a link to an alternate representation of the document (i.e. print page, translated or mirror)
        case alternate

        /// Provides a link to the author of the document
        case author

        /// Permanent URL used for bookmarking
        case bookmark

        /// Indicates that the referenced document is not part of the same site as the current document
        case external

        /// Provides a link to a help document
        case help

        /// Provides a link to licensing information for the document
        case license

        /// Provides a link to the next document in the series
        case next

        /// Links to an unendorsed document, like a paid link. ("nofollow" is used by Google, to specify that the Google search spider should not follow that link)
        case noFollow = "nofollow"

        /// Requires that the browser should not send an HTTP referrer header if the user follows the hyperlink
        case noReferrer = "noreferrer"

        /// Requires that any browsing context created by following the hyperlink must not have an opener browsing context
        case noOpener = "noopener"

        /// The previous document in a selection
        case prev

        /// Links to a search tool for the document
        case search

        /// A tag (keyword) for the current document
        case tag
    }

    public var name: String { "a" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }

    public func mail(to email: String) -> Anchor {
        self.href("mailto:\(email)")
    }
}

public struct Nav: ContentNode {

    public var name: String { "nav" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Form: ContentNode, NameableAttribute, TargetableAttribute, FormableAttributes {

    public typealias NameType = String


    public var name: String { "form" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Label: ContentNode, FormInputCompanionAttributes, LocalizableNode {

    public var name: String { "label" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Script: ContentNode, TypableAttribute, MediaSourceableAttribute {

    public var name: String { "script" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TextArea: ContentNode, NameableAttribute, PlaceholderAttribute, RequiredAttribute, LocalizableNode {

    public typealias NameType = String

    public var name: String { "textarea" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }

    public func row(_ rows: Int) -> TextArea {
        add(HTMLAttribute(attribute: "row", value: rows))
    }

    public func readOnly() -> TextArea {
        add(HTMLAttribute(attribute: "readonly", value: nil))
    }
}

public struct Footer: ContentNode {

    public var name: String { "footer" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Section: ContentNode {

    public var name: String { "section" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Select: AttributeNode, NameableAttribute {

    public typealias NameType = String

    public var name: String { "select" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    let isMultiple: Conditionable

    public init(attributes: [HTMLAttribute], content: HTMLContent, isMultiple: Conditionable) {
        self.content = content
        self.attributes = attributes
        self.isMultiple = isMultiple
    }

    public init<B>(_ elements: TemplateValue<[B]>, @HTMLBuilder builder: (TemplateValue<B>) -> HTMLContent) {
        content = ForEach(in: elements) { variable in
            Option { builder(variable) }
        }
        isMultiple = false
    }

    public init<B>(custom elements: TemplateValue<[B]>, @HTMLBuilder builder: (TemplateValue<B>) -> HTMLContent) {
        content = ForEach(in: elements) { variable in
            builder(variable)
        }
        isMultiple = false
    }
}

extension Select {
    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
        isMultiple = false
    }
}

extension Select {
    public init<B>(_ elements: TemplateValue<[B]>) where B: HTMLContent {
        isMultiple = false
        content = ForEach(in: elements) { variable in
            Option { variable }
        }
    }
}

// Easier use of TemplateVariable.constant()
extension Select {
    public init<A>(in elements: A) where A : Sequence, A.Element : HTMLContent {
        isMultiple = false
        content = ForEach<A>(in: .constant(elements)) { variable in
            Option { variable }
        }
    }
}

extension Select {
    public func copy(with attributes: [HTMLAttribute]) -> Select {
        .init(attributes: attributes, content: content, isMultiple: isMultiple)
    }

    public func isMultiple(_ isMultiple: Conditionable) -> Select {
        .init(attributes: attributes, content: content, isMultiple: isMultiple)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.prerender(formula)
        }
        let ifView = IF(isMultiple) { " multiple" }
        try ifView.prerender(formula) // Need to prerender the different paths

        formula.add(mappable: ifView)
        formula.add(string: ">")
        try content.prerender(formula)
        formula.add(string: "</\(name)>")
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        fatalError()
    }
}

public struct Option: ContentNode, ValueableAttribute {

    public var name: String { "option" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }

    public func isSelected(_ condition: Conditionable) -> Option {
        self.add(HTMLAttribute(attribute: "selected", value: nil, isIncluded: condition))
    }
}

public struct OptionGroup: ContentNode, ValueableAttribute, LabelAttribute {

    public var name: String { "optgroup" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Canvas: ContentNode, SizableAttribute {

    public var name: String { "canvas" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Table: ContentNode, SizableAttribute {

    public var name: String { "table" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableHead: ContentNode, SizableAttribute {

    public var name: String { "thead" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableBody: ContentNode, SizableAttribute {

    public var name: String { "tbody" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableRow: ContentNode, SizableAttribute {

    public var name: String { "tr" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableHeader: ContentNode, SizableAttribute, LocalizableNode {

    public var name: String { "th" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableCell: ContentNode, SizableAttribute {

    public var name: String { "td" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct BiDirectionalIsolation: ContentNode {

    public var name: String { "bdi" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <caption> tag defines a table caption.
/// The <caption> tag must be inserted immediately after the <table> tag.
/// Note: You can specify only one caption per table.
/// Tip: By default, a table caption will be center-aligned above a table. However, the CSS properties text-align and caption-side can be used to align and place the caption.
public struct Caption: ContentNode {

    public var name: String { "caption" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <cite> tag defines the title of a work (e.g. a book, a song, a movie, a TV show, a painting, a sculpture, etc.).
/// Note: A person's name is not the title of a work.
public struct Cite: ContentNode {

    public var name: String { "cite" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <col> tag specifies column properties for each column within a <colgroup> element.
/// The <col> tag is useful for applying styles to entire columns, instead of repeating the styles for each cell, for each row.
public struct Column: ContentNode {

    public var name: String { "col" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <colgroup> tag specifies a group of one or more columns in a table for formatting.
/// The <colgroup> tag is useful for applying styles to entire columns, instead of repeating the styles for each cell, for each row.
/// Note: The <colgroup> tag must be a child of a <table> element, after any <caption> elements and before any <thead>, <tbody>, <tfoot>, and <tr> elements.
/// Tip: To define different properties to a column within a <colgroup>, use the <col> tag within the <colgroup> tag.
public struct ColumnGroup: ContentNode {

    public var name: String { "colgroup" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <data> tag links the given content with a machine-readable translation.
/// This element provides both a machine-readable value for data processors, and a human-readable value for rendering in a browser.
/// Tip: If the content is time- or date-related, the <time> element must be used instead.
public struct DataNode: ContentNode {

    public var name: String { "data" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <datalist> tag specifies a list of pre-defined options for an <input> element.
/// The <datalist> tag is used to provide an "autocomplete" feature on <input> elements. Users will see a drop-down list of pre-defined options as they input data.
/// Use the <input> element's list attribute to bind it together with a <datalist> element.
public struct DataList: ContentNode {

    public var name: String { "datalist" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <dl> tag defines a description list.
/// The <dl> tag is used in conjunction with <dt> (defines terms/names) and <dd> (describes each term/name).
public struct DescriptionList: ContentNode {

    public var name: String { "dl" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <dt> tag defines a term/name in a description list.
/// The <dt> tag is used in conjunction with <dl> (defines a description list) and <dd> (describes each term/name).
public struct DescriptionTerm: ContentNode {

    public var name: String { "dt" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <dd> tag is used to describe a term/name in a description list.
/// The <dd> tag is used in conjunction with <dl> (defines a description list) and <dt> (defines terms/names).
/// Inside a <dd> tag you can put paragraphs, line breaks, images, links, lists, etc.
public struct DescriptionDetails: ContentNode {

    public var name: String { "dd" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <del> tag defines text that has been deleted from a document.
public struct DeletedText: ContentNode {

    public var name: String { "del" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <ins> tag defines a text that has been inserted into a document.
/// Tip: Also look at the <del> tag to markup deleted text.
/// Browsers will normally strike a line through deleted text and underline inserted text.
public struct InsertedText: ContentNode {

    public var name: String { "ins" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <details> tag specifies additional details that the user can view or hide on demand.
/// The <details> tag can be used to create an interactive widget that the user can open and close. Any sort of content can be put inside the <details> tag.
/// The content of a <details> element should not be visible unless the open attribute is set.
public struct Details: ContentNode {

    public var name: String { "details" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Summary: ContentNode {

    public var name: String { "summary" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}


/// The <dialog> tag defines a dialog box or window.
/// The <dialog> element makes it easy to create popup dialogs and modals on a web page.
public struct Dialog: ContentNode {

    public var name: String { "dialog" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// Defines emphasized text
public struct Emphasized: ContentNode {

    public var name: String { "em" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// Specifies the base URL/target for all relative URLs in a document
public struct Embed: DatableNode, MediaSourceableAttribute, TypableAttribute, SizableAttribute {

    public var name: String { "embed" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

public struct BiDirectionalOverride: DatableNode {

    public var name: String { "bdo" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

public struct Img: DatableNode, MediaSourceableAttribute, SizableAttribute {

    public var name: String { "img" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }

    public init(source: String) {
        self.init(attributes: [.init(attribute: "src", value: source)])
    }

    public init(source: TemplateValue<String>) {
        self.init(attributes: [.init(attribute: "src", value: source)])
    }

    public func alt(_ text: HTMLContent) -> Img {
        self.add(.init(attribute: "alt", value: text))
    }
}

public struct Source: DatableNode {

    public var name: String { "source" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// Specifies the base URL/target for all relative URLs in a document
public struct Base: DatableNode, HyperlinkReferenceAttribute {

    public var name: String { "base" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

public struct Meta: DatableNode, NameableAttribute, ContentableAttribute {

    public enum NameType: String {
        /// Specifies the name of the Web application that the page represents
        case applicationName = "application-name"

        /// Specifies the name of the author of the document. Example:
        /// <meta name="author" content="John Doe">
        case author

        /// Specifies a description of the page. Search engines can pick up this description to show with the results of searches. Example:
        /// <meta name="description" content="Free web tutorials">
        case description

        /// Specifies one of the software packages used to generate the document (not used on hand-authored pages). Example:
        /// <meta name="generator" content="FrontPage 4.0">
        case generator

        /// Specifies a comma-separated list of keywords - relevant to the page (Informs search engines what the page is about).
        /// Tip: Always specify keywords (needed by search engines to catalogize the page). Example:
        /// <meta name="keywords" content="HTML, meta tag, tag reference">
        case keywords

        /// Controls the viewport (the user's visible area of a web page).
        /// The viewport varies with the device, and will be smaller on a mobile phone than on a computer screen.
        /// You should include the following <meta> viewport element in all your web pages:
        /// <meta name="viewport" content="width=device-width, initial-scale=1.0">
        /// A <meta> viewport element gives the browser instructions on how to control the page's dimensions and scaling.
        /// The width=device-width part sets the width of the page to follow the screen-width of the device (which will vary depending on the device).
        /// The initial-scale=1.0 part sets the initial zoom level when the page is first loaded by the browser.
        /// Here is an example of a web page without the viewport meta tag, and the same web page with the viewport meta tag:
        case viewport
    }

    public var name: String { "meta" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }

    public func property(_ property: String) -> Meta {
        add(.init(attribute: "property", value: property))
    }
}

public struct Input: DatableNode, TypableAttribute, MediaSourceableAttribute, NameableAttribute, SizableAttribute, ValueableAttribute, PlaceholderAttribute, RequiredAttribute, LengthAttribute, PatternAttribute {

    public typealias NameType = String

    public enum Types: String {
        /// Defines a clickable button (mostly used with a JavaScript to activate a script)
        case button

        /// Defines a checkbox
        case checkbox

        /// Defines a color picker
        /// **NB**: (HTML 5)
        case color

        /// Defines a date control (year, month, day (no time))
        /// **NB**: (HTML 5)
        case date

        /// Defines a date and time control (year, month, day, time (no timezone)
        /// **NB**: (HTML 5)
        case datetimeLocal = "datetime-local"

        /// Defines a field for an e-mail address
        /// **NB**: (HTML 5)
        case email

        /// Defines a file-select field and a "Browse" button (for file uploads)
        case file

        /// Defines a hidden input field
        case hidden

        /// Defines an image as the submit button
        case image

        /// Defines a month and year control (no timezone)
        /// **NB**: (HTML 5)
        case month

        /// Defines a field for entering a number
        /// **NB**: (HTML 5)
        case number

        /// Defines a password field
        case password

        /// Defines a radio button
        case radio

        /// Defines a range control (like a slider control)
        /// **NB**: (HTML 5)
        case range

        /// Defines a reset button
        case reset

        /// Defines a text field for entering a search string
        /// **NB**: (HTML 5)
        case search

        /// Defines a submit button
        case submit

        /// Defines a field for entering a telephone number
        /// **NB**: (HTML 5)
        case telephone = "tel"

        /// Default. Defines a single-line text field
        case text

        /// Defines a control for entering a time (no timezone)
        /// **NB**: (HTML 5)
        case time

        /// Defines a field for entering a URL
        /// **NB**: (HTML 5)
        case url

        /// Defines a week and year control (no timezone)
        /// **NB**: (HTML 5)
        case week
    }

    public var name: String { "input" }

    public var attributes: [HTMLAttribute]

    public init(type: Types, id: HTMLContent) {
        self.attributes = [
            .init(attribute: "type", value: type.rawValue),
            .init(attribute: "id", value: id)
        ]
    }

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }

    public func type(_ type: Types) -> Input {
        self.type(TemplateValue<String>.constant(type.rawValue))
    }

    public func isChecked(_ condition: Conditionable) -> Input {
        self.add(HTMLAttribute(attribute: "checked", value: nil, isIncluded: condition))
    }
}

public struct Break: DatableNode {

    public var attributes: [HTMLAttribute]

    public var name: String { "br" }

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The <main> tag defines the dominant content of a document.
public struct Main: ContentNode {

    public var name: String { "main" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Link: DatableNode, TypableAttribute, HyperlinkReferenceAttribute, RelationshipAttribute {

    public enum RelationshipTypes: String {
        /// Provides a link to an alternate version of the document (i.e. print page, translated or mirror).
        /// Example: <link rel="alternate" type="application/atom+xml" title="W3Schools News" href="/blog/news/atom">
        case alternate

        /// Provides a link to the author of the document
        case author

        /// Specifies that the browser should preemptively perform DNS resolution for the target resource's origin
        case dnsPrefetch = "dns-prefetch"

        /// Provides a link to a help document. Example: <link rel="help" href="/help/">
        case help

        /// Imports an icon to represent the document.
        /// Example: <link rel="icon" href="/favicon.ico" type="image/x-icon">
        case icon

        /// Provides a link to copyright information for the document
        case license

        /// Provides a link to the next document in the series
        case next

        /// Provides the address of the pingback server that handles pingbacks to the current document
        case pingback

        /// Specifies that the browser should preemptively connect to the target resource's origin.
        case preconnect

        /// Specifies that the browser should preemptively fetch and cache the target resource as it is likely to be required for a follow-up navigation
        case prefetch

        /// Specifies that the browser agent must preemptively fetch and cache the target resource for current navigation according to the destination given by the "as" attribute (and the priority associated with that destination).
        case preload

        /// Specifies that the browser should pre-render (load) the specified webpage in the background. So, if the user navigates to this page, it speeds up the page load (because the page is already loaded). Warning! This waste the user's bandwidth! Only use prerender if it is absolutely sure that the webpage is required at some point in the user journey
        case prerender

        /// The previous document in a selection
        case prev

        /// Links to a search tool for the document
        case search

        /// Imports a style sheet
        case stylesheet

        case shortcutIcon = "shortcut icon"

        case appleTouchIcon = "apple-touch-icon"
    }

    public var name: String { "link" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}
