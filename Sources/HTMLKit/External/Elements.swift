// MARK: aliases
public typealias Nav = Navigation
public typealias H1 = Heading1
public typealias H2 = Heading2
public typealias H3 = Heading3
public typealias H4 = Heading4
public typealias H5 = Heading5
public typealias H6 = Heading6
public typealias Hgroup = HeadingGroup
public typealias P = Paragraph
public typealias Hr = HorizontalRule
public typealias Pre = PreformattedText
public typealias Ol = OrderedList
public typealias Ul = UnorderedList
public typealias Li = ListItem
public typealias Dl = DescriptionList
public typealias Dt = TermName
public typealias Dd = TermDefinition
public typealias Figcaption = FigureCaption
public typealias Div = Division
public typealias A = Anchor
public typealias Em = Emphasize
public typealias S = StrikeThrough
public typealias Q = ShortQuote
public typealias Dfn = Definition
public typealias Abbr = Abbreviation
public typealias Rt = RubyText
public typealias Rp = RubyPronunciation
public typealias V = Variable
public typealias Samp = SampleOutput
public typealias Kbd = KeyboardInput
public typealias Sub = Subscript
public typealias Sup = Superscript
public typealias I = Italic
public typealias B = Bold
public typealias U = Underline
public typealias Br = LineBreak
public typealias Wbr = WordBreak
public typealias Ins = InsertedText
public typealias Del = DeletedText
public typealias Img = Image
public typealias Iframe = InlineFrame
public typealias Param = Parameter
public typealias Colgroup = ColumnGroup
public typealias Col = Column
public typealias Tbody = TableBody
public typealias Thead = TableHead
public typealias Tfoot = TableFoot
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<title>`element
///
///
public struct Title: ContentNode {

    public var name: String { "title" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<base />`element
///
///
public struct Base: EmptyNode, ReferenceAttribute, TargetAttribute {

    public var name: String { "base" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<link />`element
///
///
public struct Link: EmptyNode, ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, ReferrerPolicyAttribute, RelationshipAttribute, SizesAttribute, TypeAttribute {

    public var name: String { "link" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<meta />`element
///
///
public struct Meta: EmptyNode, ContentAttribute, NameAttribute, PropertyAttribute {

    public var name: String { "meta" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<style>`element
///
///
public struct Style: ContentNode, TypeAttribute, MediaAttribute {

    public var name: String { "style" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<html>`element
///
///
public struct Html: ContentNode {

    public var name: String { "html" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<body>`element
///
///
public struct Body: ContentNode {

    public var name: String { "body" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Heading1: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h2>`element
///
///
public struct Heading2: ContentNode {

    public var name: String { "h2" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Heading2: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h3>`element
///
///
public struct Heading3: ContentNode {

    public var name: String { "h3" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Heading3: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h4>`element
///
///
public struct Heading4: ContentNode {

    public var name: String { "h4" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Heading4: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h5>`element
///
///
public struct Heading5: ContentNode {

    public var name: String { "h5" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Heading5: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<h6>`element
///
///
public struct Heading6: ContentNode {

    public var name: String { "h6" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Heading6: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<hgroup>`element
///
///
public struct HeadingGroup: ContentNode {

    public var name: String { "hgroup" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<header>`element
///
///
public struct Header: ContentNode {

    public var name: String { "header" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Paragraph: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<hr />`element
///
///
public struct HorizontalRule: EmptyNode {

    public var attributes: [HTMLAttribute]

    public var name: String { "hr" }

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<pre>`element
///
///
public struct PreformattedText: ContentNode {

    public var name: String { "pre" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<blockquote>`element
///
///
public struct Blockquote: ContentNode, CiteAttribute {

    public var name: String { "blockquote" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Blockquote: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<ol>`element
///
///
public struct OrderedList: ContentNode, ReversedAttribute, StartAttribute, TypeAttribute {

    public var name: String { "ol" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<li>`element
///
///
public struct ListItem: ContentNode, ValueAttribute {

    public var name: String { "li" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<figure>`element
///
///
public struct Figure: ContentNode {

    public var name: String { "figure" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<figcaption>`element
///
///
public struct FigureCaption: ContentNode {

    public var name: String { "figcaption" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<a>`element
///
///
public struct Anchor: ContentNode, DownloadAttribute, ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, PingAttribute, ReferrerPolicyAttribute, RelationshipAttribute, TargetAttribute, TypeAttribute {

    public var name: String { "a" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Anchor: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<em>`element
///
///
public struct Emphasize: ContentNode {

    public var name: String { "em" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<strong>`element
///
///
public struct Strong: ContentNode {

    public var name: String { "strong" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Small: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<s>`element
///
///
public struct StrikeThrough: ContentNode {

    public var name: String { "s" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension StrikeThrough: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<cite>`element
///
///
public struct Cite: ContentNode {

    public var name: String { "cite" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<q>`element
///
///
public struct ShortQuote: ContentNode, CiteAttribute {

    public var name: String { "q" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<dfn>`element
///
///
public struct Definition: ContentNode {

    public var name: String { "dfn" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<ruby>`element
///
///
public struct Ruby: ContentNode {

    public var name: String { "ruby" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<rt>`element
///
///
public struct RubyText: ContentNode {

    public var name: String { "rt" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<rp>`element
///
///
public struct RubyPronunciation: ContentNode {

    public var name: String { "rp" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<data>`element
///
///
public struct Data: ContentNode, ValueAttribute {

    public var name: String { "data" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<time>`element
///
///
public struct Time: ContentNode, DateTimeAttribute {

    public var name: String { "time" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<var>`element
///
///
public struct Variable: ContentNode {

    public var name: String { "v" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<samp>`element
///
///
public struct SampleOutput: ContentNode {

    public var name: String { "samp" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<kbd>`element
///
///
public struct KeyboardInput: ContentNode {

    public var name: String { "kbd" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<sub>`element
///
///
public struct Subscript: ContentNode {

    public var name: String { "sub" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<sup>`element
///
///
public struct Superscript: ContentNode {

    public var name: String { "sup" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Italic: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<b>`element
///
///
public struct Bold: ContentNode {

    public var name: String { "b" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Bold: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<u>`element
///
///
public struct Underline: ContentNode {

    public var name: String { "u" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Underline: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<mark>`element
///
///
public struct Mark: ContentNode {

    public var name: String { "mark" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<bdi>`element
///
///
public struct Bdi: ContentNode {

    public var name: String { "bdi" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

/// The `<wbr>`element
///
///
public struct WordBreak: EmptyNode {

    public var attributes: [HTMLAttribute]

    public var name: String { "wbr" }

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<ins>`element
///
///
public struct InsertedText: ContentNode, CiteAttribute, DateTimeAttribute {

    public var name: String { "ins" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<del>`element
///
///
public struct DeletedText: ContentNode, CiteAttribute, DateTimeAttribute {

    public var name: String { "del" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<picture>`element
///
///
public struct Picture: ContentNode {

    public var name: String { "picture" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<source />`element
///
///
public struct Source: EmptyNode, TypeAttribute, SourceAttribute, SizesAttribute, MediaAttribute, WidthAttribute, HeightAttribute {

    public var name: String { "source" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<img />`element
///
///
public struct Image: EmptyNode, AlternativeAttribute, SourceAttribute, SizesAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute {

    public var name: String { "img" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<iframe>`element
///
///
public struct InlineFrame: ContentNode, SourceAttribute, NameAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute {
    
    public var name: String { "iframe" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<embed />`element
///
///
public struct Embed: EmptyNode, SourceAttribute, TypeAttribute, WidthAttribute, HeightAttribute {

    public var name: String { "embed" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<object>`element
///
///
public struct Object: ContentNode, DataAttribute, TypeAttribute, NameAttribute, FormAttribute, WidthAttribute, HeightAttribute {
    
    public var name: String { "object" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<param />`element
///
///
public struct Parameter: EmptyNode, NameAttribute, ValueAttribute {
    
    public var name: String { "param" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<video>`element
///
///
public struct Video: ContentNode, SourceAttribute, AutoPlayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute, WidthAttribute, HeightAttribute {

    public var name: String { "video" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<audio>`element
///
///
public struct Audio: ContentNode, SourceAttribute, AutoPlayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute {

    public var name: String { "audio" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<track />`element
///
///
public struct Track: EmptyNode, KindAttribute, SourceAttribute, LabelAttribute, DefaultAttribute {

    public var name: String { "track" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<map>`element
///
///
public struct Map: ContentNode, NameAttribute {
    
    public var name: String { "map" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<area>`element
///
///
public struct Area: ContentNode, AlternativeAttribute, CoordinatesAttribute, ShapeAttribute, ReferenceAttribute, TargetAttribute, DownloadAttribute, PingAttribute, RelationshipAttribute, ReferrerPolicyAttribute {

    public var name: String { "area" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<table>`element
///
///
public struct Table: ContentNode, WidthAttribute, HeightAttribute {

    public var name: String { "table" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<colgroup>`element
///
///
public struct ColumnGroup: ContentNode, SpanAttribute {

    public var name: String { "colgroup" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<col>`element
///
///
public struct Column: ContentNode, SpanAttribute {

    public var name: String { "col" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<tbody>`element
///
///
public struct TableBody: ContentNode, WidthAttribute, HeightAttribute {

    public var name: String { "tbody" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<thead>`element
///
///
public struct TableHead: ContentNode, WidthAttribute, HeightAttribute {

    public var name: String { "thead" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<tfoot>`element
///
///
public struct TableFoot: ContentNode {

    public var name: String { "tfoot" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<tr>`element
///
///
public struct TableRow: ContentNode, WidthAttribute, HeightAttribute {

    public var name: String { "tr" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<td>`element
///
///
public struct DataCell: ContentNode, ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute {

    public var name: String { "td" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<th>`element
///
///
public struct HeaderCell: ContentNode, ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute, ScopeAttribute {

    public var name: String { "th" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension HeaderCell: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<form>`element
///
///
public struct Form: ContentNode, ActionAttribute, AutoCompleteAttribute, EncodingAttribute, MethodAttribute, NameAttribute, TargetAttribute, RelationshipAttribute {

    public var name: String { "form" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<label>`element
///
///
public struct Label: ContentNode, ForAttribute {

    public var name: String { "label" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Label: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<input />`element
///
///
public struct Input: EmptyNode, AcceptAttribute, AlternativeAttribute, AutoCompleteAttribute, CheckedAttribute, DisabledAttribute, FormAttribute, FormActionAttribute, HeightAttribute, ListAttribute, MaximumValueAttribute, MaximumLengthAttribute, MinimumValueAttribute, MinimumLengthAttribute, MultipleAttribute, NameAttribute, PatternAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, SizeAttribute, SourceAttribute, StepAttribute, TypeAttribute, ValueAttribute, WidthAttribute {

    public var name: String { "input" }

    public var attributes: [HTMLAttribute]

    public init(attributes: [HTMLAttribute] = []) {
        self.attributes = attributes
    }
}

/// The `<button>`element
///
///
public struct Button: ContentNode, DisabledAttribute, FormAttribute, FormActionAttribute, NameAttribute, TypeAttribute, ValueAttribute {

    public var name: String { "button" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension Button: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<select>`element
///
///
public struct Select: ContentNode, AutoCompleteAttribute, DisabledAttribute, FormAttribute, MultipleAttribute, NameAttribute, RequiredAttribute, SizeAttribute {

    public var name: String { "select" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }
    
    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}


/// The `<datalist>`element
///
///
public struct DataList: ContentNode {

    public var name: String { "datalist" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<optgroup>`element
///
///
public struct OptionGroup: ContentNode, DisabledAttribute, LabelAttribute {

    public var name: String { "optgroup" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<option>`element
///
///
public struct Option: ContentNode, DisabledAttribute, LabelAttribute, ValueAttribute {

    public var name: String { "option" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<textarea>`element
///
///
public struct TextArea: ContentNode, AutoCompleteAttribute, ColumnsAttribute, DisabledAttribute, FormAttribute, MaximumLengthAttribute, MinimumLengthAttribute, NameAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, RowsAttribute, WrapAttribute {

    public var name: String { "textarea" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

extension TextArea: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The `<output>`element
///
///
public struct Output: ContentNode, ForAttribute, FormAttribute, NameAttribute {
    
    public var name: String { "output" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<progress>`element
///
///
public struct Progress: ContentNode, ValueAttribute, MaximumValueAttribute {

    public var name: String { "progress" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<meter>`element
///
///
public struct Meter: ContentNode, ValueAttribute, MinimumValueAttribute, MaximumValueAttribute, HighAttribute, OptimumAttribute {

    public var name: String { "meter" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<fieldset>`element
///
///
public struct Fieldset: ContentNode, DisabledAttribute, FormAttribute, NameAttribute {
    
    public var name: String { "fieldset" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<legend>`element
///
///
public struct Legend: ContentNode {

    public var name: String { "legend" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<details>`element
///
///
public struct Details: ContentNode, OpenAttribute {

    public var name: String { "details" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
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

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<dialog>`element
///
///
public struct Dialog: ContentNode, OpenAttribute {

    public var name: String { "dialog" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<script>`element
///
///
public struct Script: ContentNode, AsyncAttribute, ReferrerPolicyAttribute, SourceAttribute, TypeAttribute {

    public var name: String { "script" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<noscript>`element
///
///
public struct NoScript: ContentNode {

    public var name: String { "noscript" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<template>`element
///
///
public struct Template: ContentNode {

    public var name: String { "template" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The `<canvas>`element
///
///
public struct Canvas: ContentNode, WidthAttribute, HeightAttribute {

    public var name: String { "canvas" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder content: () -> HTMLContent) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}

