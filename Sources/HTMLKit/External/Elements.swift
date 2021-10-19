// MARK: aliases
public typealias Nav = Navigation
public typealias H1 = Heading1
public typealias H2 = Heading2
public typealias H3 = Heading3
public typealias H4 = Heading4
public typealias H5 = Heading5
public typealias H6 = Heading6
public typealias P = Paragraph
public typealias Ol = OrderedList
public typealias Ul = UnorderedList
public typealias Li = ListItem
public typealias Dl = DescriptionList
public typealias Dt = TermName
public typealias Dd = TermDefinition
public typealias Div = Division
public typealias A = Anchor
public typealias Em = Emphasize
public typealias S = StrikeThrough
public typealias Abbr = Abbreviation
public typealias I = Italic
public typealias B = Bold
public typealias Br = LineBreak
public typealias Ins = InsertedText
public typealias Del = DeletedText
public typealias Img = Image
public typealias Colgroup = ColumnGroup
public typealias Col = Column
public typealias Tbody = TableBody
public typealias Thead = TableHead
public typealias Tr = TableRow
public typealias Td = DataCell
public typealias Th = HeaderCell
public typealias Optgroup = OptionGroup

// MARK: structs

/// The `<head>`element
///
///
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

/// The `<base />`element
///
///
public struct Base: EmptyNode, HyperlinkReferenceAttribute {

    public var name: String { "base" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<link />`element
///
///
public struct Link: EmptyNode, TypableAttribute, HyperlinkReferenceAttribute, RelationshipAttribute {

    public enum RelationshipTypes: String {

        case alternate
        case author
        case dnsPrefetch = "dns-prefetch"
        case help
        case icon
        case license
        case next
        case pingback
        case preconnect
        case prefetch
        case preload
        case prerender
        case prev
        case search
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

/// The `<meta />`element
///
///
public struct Meta: EmptyNode, NameableAttribute, ContentableAttribute {

    public enum NameType: String {
        
        case applicationName = "application-name"
        case author
        case description
        case generator
        case keywords
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

/// The `<body>`element
///
///
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

/// The `<article>`element
///
///
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

/// The `<section>`element
///
///
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

/// The `<nav>`element
///
///
public struct Navigation: ContentNode {

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

/// The `<aside>`element
///
///
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

/// The `<h1>`element
///
///
public struct Heading1: ContentNode {

    public var name: String { "h1" }

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

extension Heading1: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h2>`element
///
///
public struct Heading2: ContentNode {

    public var name: String { "h2" }

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

extension Heading2: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h3>`element
///
///
public struct Heading3: ContentNode {

    public var name: String { "h3" }

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

extension Heading3: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h4>`element
///
///
public struct Heading4: ContentNode {

    public var name: String { "h4" }

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

extension Heading4: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h5>`element
///
///
public struct Heading5: ContentNode {

    public var name: String { "h5" }

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

extension Heading5: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h6>`element
///
///
public struct Heading6: ContentNode {

    public var name: String { "h6" }

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

extension Heading6: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<header>`element
///
///
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

/// The `<footer>`element
///
///
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

/// The `<adress>`element
///
///
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

/// The `<p>`element
///
///
public struct Paragraph: ContentNode {

    public var name: String { "p" }

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

extension Paragraph: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<blockquote>`element
///
///
public struct Blockquote: ContentNode {

    public var name: String { "blockquote" }

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

extension Blockquote: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<ol>`element
///
///
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

/// The `<ul>`element
///
///
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

/// The `<li>`element
///
///
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

/// The `<dl>`element
///
///
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

/// The `<dt>`element
///
///
public struct TermName: ContentNode {

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

/// The `<dd>`element
///
///
public struct TermDefinition: ContentNode {

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

/// The `<main>`element
///
///
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

/// The `<div>`element
///
///
public struct Division: ContentNode {

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

/// The `<a>`element
///
///
public struct Anchor: ContentNode, TypableAttribute, HyperlinkReferenceAttribute, RelationshipAttribute {

    public enum RelationshipTypes: String {

        case alternate
        case author
        case bookmark
        case external
        case help
        case license
        case next
        case noFollow = "nofollow"
        case noReferrer = "noreferrer"
        case noOpener = "noopener"
        case prev
        case search
        case tag
    }

    public var name: String { "a" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

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

extension Anchor: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<em>`element
///
///
public struct Emphasize: ContentNode {

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

/// The `<small>`element
///
///
public struct Small: ContentNode {

    public var name: String { "small" }

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

extension Small: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<s>`element
///
///
public struct StrikeThrough: ContentNode {

    public var name: String { "s" }

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

extension StrikeThrough: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<cite>`element
///
///
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

/// The `<abbr>`element
///
///
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

/// The `<data>`element
///
///
public struct Data: ContentNode {

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

/// The `<code>`element
///
///
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

/// The `<i>`element
///
///
public struct Italic: ContentNode {

    public var name: String { "i" }

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

extension Italic: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<b>`element
///
///
public struct Bold: ContentNode {

    public var name: String { "b" }

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

extension Bold: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<bdi>`element
///
///
public struct Bdi: ContentNode {

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

/// The `<bdo />`element
///
///
public struct Bdo: EmptyNode {

    public var name: String { "bdo" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<span>`element
///
///
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

/// The `<br />`element
///
///
public struct LineBreak: EmptyNode {

    public var attributes: [HTMLAttribute]

    public var name: String { "br" }

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<ins>`element
///
///
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

/// The `<del>`element
///
///
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

/// The `<source />`element
///
///
public struct Source: EmptyNode {

    public var name: String { "source" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<img />`element
///
///
public struct Image: EmptyNode, MediaSourceableAttribute, SizableAttribute {

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

    public func alt(_ text: HTMLContent) -> Image {
        self.add(.init(attribute: "alt", value: text))
    }
}

/// The `<embed />`element
///
///
public struct Embed: EmptyNode, MediaSourceableAttribute, TypableAttribute, SizableAttribute {

    public var name: String { "embed" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<ins>`element
///
///
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

/// The `<area>`element
///
///
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

/// The `<table>`element
///
///
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

/// The `<caption>`element
///
///
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

/// The `<colgroup>`element
///
///
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

/// The `<col>`element
///
///
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

/// The `<tbody>`element
///
///
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

/// The `<thead>`element
///
///
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

/// The `<tr>`element
///
///
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

/// The `<td>`element
///
///
public struct DataCell: ContentNode, SizableAttribute {

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

/// The `<th>`element
///
///
public struct HeaderCell: ContentNode, SizableAttribute {

    public var name: String { "th" }

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

extension HeaderCell: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<form>`element
///
///
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

/// The `<label>`element
///
///
public struct Label: ContentNode, FormInputCompanionAttributes {

    public var name: String { "label" }

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

extension Label: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<input />`element
///
///
public struct Input: EmptyNode, TypableAttribute, MediaSourceableAttribute, NameableAttribute, SizableAttribute, ValueableAttribute, PlaceholderAttribute, RequiredAttribute, LengthAttribute, PatternAttribute {

    public typealias NameType = String

    public enum Types: String {
        
        case button
        case checkbox
        case color
        case date
        case datetimeLocal = "datetime-local"
        case email
        case file
        case hidden
        case image
        case month
        case number
        case password
        case radio
        case range
        case reset
        case search
        case submit
        case telephone = "tel"
        case text
        case time
        case url
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
        self.add(.init(attribute: "checked", value: nil, isIncluded: condition))
    }
}

/// The `<button>`element
///
///
public struct Button: ContentNode, TypableAttribute, NameableAttribute {

    public typealias NameType = String

    public var name: String { "button" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

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

extension Button: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<select>`element
///
///
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

/// The `<datalist>`element
///
///
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

/// The `<optgroup>`element
///
///
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

/// The `<option>`element
///
///
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
        self.add(.init(attribute: "selected", value: nil, isIncluded: condition))
    }
}

/// The `<textarea>`element
///
///
public struct TextArea: ContentNode, NameableAttribute, PlaceholderAttribute, RequiredAttribute {

    public typealias NameType = String

    public var name: String { "textarea" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }

    public func row(_ rows: Int) -> TextArea {
        add(.init(attribute: "row", value: rows))
    }

    public func readOnly() -> TextArea {
        add(.init(attribute: "readonly", value: nil))
    }
}

extension TextArea: LocalizableNode {
    
    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
    }
}

/// The `<details>`element
///
///
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

/// The `<summary>`element
///
///
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

/// The `<dialog>`element
///
///
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

/// The `<script>`element
///
///
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

/// The `<canvas>`element
///
///
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

