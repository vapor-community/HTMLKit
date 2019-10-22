
/// A protocol that makes it possible to render HTML views
public protocol TemplateBuilder: View {

    /// Builds the view
    ///
    /// - Returns: a view that conforms to `Mappable`
    func build() -> View
}

extension TemplateBuilder {

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        try build().prerender(formula)
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try build().render(with: manager)
    }
}

public protocol LocalizableNode {
    init(_ localizedKey: String)
    init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B: Encodable
}

extension LocalizableNode {
    public init<T>(_ localizedKey: String, with context: T) where T: Encodable {
        self.init(localizedKey, with: RootValue<T>.constant(context))
    }
}

@_functionBuilder
public class HTMLBuilder {

    public static func buildBlock(_ children: View...) -> View {
        return children
    }
}

public struct Div: ContentNode {

    public var name: String { "div" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct P: ContentNode, LocalizableNode {

    public var name: String { "p" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H1: ContentNode, LocalizableNode {

    public var name: String { "h1" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H2: ContentNode, LocalizableNode {

    public var name: String { "h2" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H3: ContentNode, LocalizableNode {

    public var name: String { "h3" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H4: ContentNode, LocalizableNode {

    public var name: String { "h4" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H5: ContentNode, LocalizableNode {

    public var name: String { "h5" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H6: ContentNode, LocalizableNode {

    public var name: String { "h6" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Blockquote: ContentNode, LocalizableNode {

    public var name: String { "blockquote" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Bold: ContentNode, LocalizableNode {

    public var name: String { "b" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Italic: ContentNode, LocalizableNode {

    public var name: String { "i" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Small: ContentNode, LocalizableNode {

    public var name: String { "small" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Span: ContentNode {

    public var name: String { "span" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct HTMLNode: ContentNode {

    public var name: String { "html" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Body: ContentNode {

    public var name: String { "body" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Head: ContentNode {

    public var name: String { "head" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Header: ContentNode {

    public var name: String { "header" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Title: ContentNode, LocalizableNode {

    public var name: String { "title" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public enum ButtonType: String {
    case button
    case submit
}

public struct Button: ContentNode, TypableAttribute, NameableAttribute, ClickableAttribute, LocalizableNode {

    public var name: String { "button" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }

    public func type(_ type: ButtonType) -> Button {
        self.type(TemplateValue<Void, String>.constant(type.rawValue))
    }
}

public struct ListItem: ContentNode {

    public var name: String { "li" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct OrderdList: ContentNode {

    public var name: String { "ol" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct UnorderdList: ContentNode {

    public var name: String { "ul" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Code: ContentNode {

    public var name: String { "code" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Abbreviation: ContentNode {

    public var name: String { "abbr" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

typealias Acronym = Abbreviation

/// The <address> tag defines the contact information for the author/owner of a document or an article.
/// If the <address> element is inside the <body> element, it represents contact information for the document.
/// If the <address> element is inside an <article> element, it represents contact information for that article.
/// The text in the <address> element usually renders in italic. Most browsers will add a line break before and after the address element.
public struct Address: ContentNode {

    public var name: String { "address" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Area: ContentNode {

    public var name: String { "area" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
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

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <aside> tag defines some content aside from the content it is placed in.
/// The aside content should be related to the surrounding content.
public struct Aside: ContentNode {

    public var name: String { "aside" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <audio> tag defines sound, such as music or other audio streams.
/// Currently, there are 3 supported file formats for the <audio> element: MP3, WAV, and OGG:
public struct Audio: ContentNode {

    public var name: String { "aside" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Anchor: ContentNode, TypableAttribute, HyperlinkReferenceAttribute, ClickableAttribute, LocalizableNode {

    public var name: String { "a" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }

    public func mail(to email: String) -> Anchor {
        self.href("mailto:\(email)")
    }
}

public struct Nav: ContentNode {

    public var name: String { "nav" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Form: ContentNode, NameableAttribute, TargetableAttribute {

    public enum Method: String {
        case post
        case get
    }

    public var name: String { "form" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }

    public func action(_ value: View) -> Form {
        self.add(.init(attribute: "action", value: value))
    }

    public func method(_ method: Method) -> Form {
        self.add(.init(attribute: "method", value: method.rawValue))
    }
}

public struct Label: ContentNode, FormInputCompanianAttributes, LocalizableNode {

    public var name: String { "label" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Script: ContentNode, TypableAttribute, MediaSourceableAttribute {

    public var name: String { "script" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TextArea: ContentNode, NameableAttribute, PlaceholderAttribute, RequierdAttribute, LocalizableNode {

    public var name: String { "textarea" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<A, B>(_ localizedKey: String, with context: TemplateValue<A, B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Footer: ContentNode {

    public var name: String { "footer" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Section: ContentNode {

    public var name: String { "section" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Select<A, B>: AttributeNode, NameableAttribute {

    public var name: String { "select" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    let isMultiple: Conditionable

    public init(attributes: [HTML.Attribute], content: View, isMultiple: Conditionable) {
        self.content = content
        self.attributes = attributes
        self.isMultiple = isMultiple
    }

    public init(_ elements: TemplateValue<A, [B]>, @HTMLBuilder builder: (RootValue<B>) -> View) {
        content = ForEach(in: elements) { variable in
            Option { builder(variable) }
        }
        isMultiple = false
    }

    public init(custom elements: TemplateValue<A, [B]>, @HTMLBuilder builder: (RootValue<B>) -> View) {
        content = ForEach(in: elements) { variable in
            builder(variable)
        }
        isMultiple = false
    }
}

public struct Option: ContentNode, ValueableAttribute {

    public var name: String { "option" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }

    public func isSelected(_ condition: Conditionable) -> Option {
        self.add(HTML.Attribute(attribute: "selected", value: nil, isIncluded: condition))
    }
}

public struct OptionGroup: ContentNode, ValueableAttribute, LabelAttribute {

    public var name: String { "optgroup" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}


public struct Canvas: ContentNode, SizableAttribute {

    public var name: String { "canvas" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Table: ContentNode, SizableAttribute {

    public var name: String { "table" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableHead: ContentNode, SizableAttribute {

    public var name: String { "thead" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableBody: ContentNode, SizableAttribute {

    public var name: String { "tbody" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableRow: ContentNode, SizableAttribute {

    public var name: String { "tr" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableHeader: ContentNode, SizableAttribute {

    public var name: String { "th" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TableCell: ContentNode, SizableAttribute {

    public var name: String { "td" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct BiDirectionalIsolation: ContentNode {

    public var name: String { "bdi" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
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

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <cite> tag defines the title of a work (e.g. a book, a song, a movie, a TV show, a painting, a sculpture, etc.).
/// Note: A person's name is not the title of a work.
public struct Cite: ContentNode {

    public var name: String { "cite" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <col> tag specifies column properties for each column within a <colgroup> element.
/// The <col> tag is useful for applying styles to entire columns, instead of repeating the styles for each cell, for each row.
public struct Collumn: ContentNode {

    public var name: String { "col" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <colgroup> tag specifies a group of one or more columns in a table for formatting.
/// The <colgroup> tag is useful for applying styles to entire columns, instead of repeating the styles for each cell, for each row.
/// Note: The <colgroup> tag must be a child of a <table> element, after any <caption> elements and before any <thead>, <tbody>, <tfoot>, and <tr> elements.
/// Tip: To define different properties to a column within a <colgroup>, use the <col> tag within the <colgroup> tag.
public struct CollumnGroup: ContentNode {

    public var name: String { "colgroup" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <data> tag links the given content with a machine-readable translation.
/// This element provides both a machine-readable value for data processors, and a human-readable value for rendering in a browser.
/// Tip: If the content is time- or date-related, the <time> element must be used instead.
public struct DataNode: ContentNode {

    public var name: String { "data" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <datalist> tag specifies a list of pre-defined options for an <input> element.
/// The <datalist> tag is used to provide an "autocomplete" feature on <input> elements. Users will see a drop-down list of pre-defined options as they input data.
/// Use the <input> element's list attribute to bind it together with a <datalist> element.
public struct DataList: ContentNode {

    public var name: String { "datalist" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <dl> tag defines a description list.
/// The <dl> tag is used in conjunction with <dt> (defines terms/names) and <dd> (describes each term/name).
public struct DescriptionList: ContentNode {

    public var name: String { "dl" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <dt> tag defines a term/name in a description list.
/// The <dt> tag is used in conjunction with <dl> (defines a description list) and <dd> (describes each term/name).
public struct DescriptionTerm: ContentNode {

    public var name: String { "dt" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <dd> tag is used to describe a term/name in a description list.
/// The <dd> tag is used in conjunction with <dl> (defines a description list) and <dt> (defines terms/names).
/// Inside a <dd> tag you can put paragraphs, line breaks, images, links, lists, etc.
public struct DescriptionDetails: ContentNode {

    public var name: String { "dd" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <del> tag defines text that has been deleted from a document.
public struct DeletedText: ContentNode {

    public var name: String { "del" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <ins> tag defines a text that has been inserted into a document.
/// Tip: Also look at the <del> tag to markup deleted text.
/// Browsers will normally strike a line through deleted text and underline inserted text.
public struct InsertedText: ContentNode {

    public var name: String { "ins" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <details> tag specifies additional details that the user can view or hide on demand.
/// The <details> tag can be used to create an interactive widget that the user can open and close. Any sort of content can be put inside the <details> tag.
/// The content of a <details> element should not be visible unless the open attribute is set.
public struct Details: ContentNode {

    public var name: String { "details" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Summary: ContentNode {

    public var name: String { "summary" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The <dialog> tag defines a dialog box or window.
/// The <dialog> element makes it easy to create popup dialogs and modals on a web page.
public struct Dialog: ContentNode {

    public var name: String { "dialog" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// Defines emphasized text
public struct Emphasized: ContentNode {

    public var name: String { "em" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Select where A == Never, B == Never {
    public init(@HTMLBuilder builder: () -> View) {
        content = builder()
        isMultiple = false
    }
}

extension Select where B: View {
    public init(_ elements: TemplateValue<A, [B]>) {
        isMultiple = false
        content = ForEach(in: elements) { variable in
            Option { variable }
        }
    }
}

// Easier use of TemplateVariable.constant()
extension Select where B: View, A == Never {
    public init(in elements: [B]) {
        isMultiple = false
        content = ForEach<Never, B>(in: .constant(elements)) { variable in
            Option { variable }
        }
    }
}

extension Select {
    public func copy(with attributes: [HTML.Attribute]) -> Select<A, B> {
        .init(attributes: attributes, content: content, isMultiple: isMultiple)
    }

    public func isMultiple(_ isMultiple: Conditionable) -> Select<A, B> {
        .init(attributes: attributes, content: content, isMultiple: isMultiple)
    }

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
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

public struct Link: DatableNode, TypableAttribute, HyperlinkReferenceAttribute {

    public var name: String { "link" }

    public var attributes: [HTML.Attribute]

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }
}

/// Specifies the base URL/target for all relative URLs in a document
public struct Base: DatableNode, HyperlinkReferenceAttribute {

    public var name: String { "base" }

    public var attributes: [HTML.Attribute]

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }
}

/// Specifies the base URL/target for all relative URLs in a document
public struct Embed: DatableNode, MediaSourceableAttribute, TypableAttribute, SizableAttribute {

    public var name: String { "embed" }

    public var attributes: [HTML.Attribute]

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }
}

public struct BiDirectionalOverride: DatableNode {

    public var name: String { "bdo" }

    public var attributes: [HTML.Attribute]

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }
}

public struct Img: DatableNode, MediaSourceableAttribute, SizableAttribute {

    public var name: String { "img" }

    public var attributes: [HTML.Attribute]

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }

    public init(source: String) {
        self.init(attributes: [.init(attribute: "src", value: source)])
    }

    public func alt(_ text: View) -> Img {
        self.add(.init(attribute: "alt", value: text))
    }
}

public struct Meta: DatableNode, NameableAttribute, ContentableAttribute {

    public var name: String { "meta" }

    public var attributes: [HTML.Attribute]

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }
}

public struct Input: DatableNode, TypableAttribute, MediaSourceableAttribute, NameableAttribute, SizableAttribute, ValueableAttribute, PlaceholderAttribute, RequierdAttribute {

    public enum Types: String {
        case hidden
        case email
        case number
        case password
        case checkbox
        case radio
        case text
        case file
        case range
    }

    public var name: String { "input" }

    public var attributes: [HTML.Attribute]

    public init(type: Types, id: View) {
        self.attributes = [
            .init(attribute: "type", value: type.rawValue),
            .init(attribute: "id", value: id)
        ]
    }

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }

    public func type(_ type: Types) -> Input {
        self.type(RootValue<String>.constant(type.rawValue))
    }

    public func isChecked(_ condition: Conditionable) -> Input {
        self.add(HTML.Attribute(attribute: "checked", value: nil, isIncluded: condition))
    }
}

public struct Break: DatableNode {

    public var attributes: [HTML.Attribute]

    public var name: String { "br" }

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }
}

//extension ContextualTemplate {
//
//    public var div: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "div") }
//
//    public var body: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "body") }
//
//    public var form: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "form") }
//
//    public var small: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "small") }
//
//    public var footer: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "footer") }
//
//    public var head: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "head") }
//
//    public var p: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "p") }
//
//    public var html: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "html") }
//
//    public var button: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "button") }
//
//    public var h1: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h1") }
//
//    public var h2: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h2") }
//
//    public var h3: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h3") }
//
//    public var h4: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h4") }
//
//    public var h5: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h5") }
//
//    public var h6: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h6") }
//
//    public var span: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "span") }
//
//    public var i: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "i") }
//
//    public var b: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "b") }
//
//    public var strong: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "strong") }
//
//    public var u: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "u") }
//
//    public var em: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "em") }
//
//    public var a: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "a") }
//
//    public var ol: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "ol") }
//
//    public var ul: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "ul") }
//
//    public var li: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "li") }
//
//    public var dl: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "dl") }
//
//    public var dt: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "dt") }
//
//    public var dd: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "dd") }
//
//    public var label: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "label") }
//
//    public var title: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "title") }
//
//    public var script: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "script") }
//
//    public var blockquote: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "blockquote") }
//
//    public var code: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "code") }
//
//    public var samp: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "samp") }
//
//    public var abbr: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "abbr") }
//
//    public var table: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "table") }
//
//    public var th: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "th") }
//
//    public var tr: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "tr") }
//
//    public var td: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "td") }
//
//    public var thead: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "thead") }
//
//    public var tbody: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "tbody") }
//
//    public var tfoot: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "tfoot") }
//
//    public var textarea: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "textarea") }
//
//    public var legend: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "legend") }
//
//    public var fieldset: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "fieldset") }
//
//    public var output: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "output") }
//
//    public var datalist: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "datalist") }
//
//    public var option: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "option") }
//
//    public var optgroup: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "optgroup") }
//
//    public var select: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "select") }
//
//    public var iframe: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "iframe") }
//
//    public var map: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "map") }
//
//    public var canvas: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "canvas") }
//
//    public var figure: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "figure") }
//
//    public var figcaption: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "figcaption") }
//
//    public var picture: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "picture") }
//
//    public var svg: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "svg") }
//
//    public var caption: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "caption") }
//
//    public var colgroup: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "colgroup") }
//
//    public var main: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "main") }
//
//    public var section: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "sectino") }
//
//    public var article: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "article") }
//
//    public var aside: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "aside") }
//
//    public var details: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "details") }
//
//    public var summary: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "summary") }
//
//    public var dialog: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "dialog") }
//
//    public var data: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "data") }
//
//    public var nav: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "nav") }
//
//    public var audio: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "audio") }
//
//    public var video: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "video") }
//}
//
//extension ContextualTemplate {
//
//    public var link: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "link") }
//
////    public var stylesheet: HTML.DataNode<Self> { return link.rel("stylesheet") }
//
//    public var meta: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "meta") }
//
//    public var img: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "img") }
//
//    public var input: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "input") }
//
//    public var area: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "area") }
//
//    public var col: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "col") }
//
//    public var base: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "base") }
//
//    public var param: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "param") }
//
//    public var embed: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "embed") }
//
//    public var source: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "source") }
//
//    public var track: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "track") }
//}

extension TemplateBuilder {

    /// Creates a doctype tag
    ///
    /// - Parameter type: the type of document
    /// - Returns: A ductype node
    public func doctype(_ type: String = "html") -> View {
        return "<!doctype \(type)>"
    }

    /// Creates a comment
    ///
    /// - Parameter comment: The comment to create
    /// - Returns: A comment node
    public func comment(_ comment: String) -> View {
        return "<!-- \(comment) -->"
    }

    /// The </br> tag
    public var br: View { return "<br>" }
}
