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

// MARK: elements

/// The element
///
///
public struct Comment: CommentNode {
    
    public var content: String
    
    public init(_ content: String) {
        self.content = content
    }
}

/// The element
///
///
public struct Document: DocumentNode {
    
    public var content: String
    
    public init(type: DocumentType) {
        self.content = type.rawValue
    }
}

/// The element
///
///
public struct Head: ContentNode {

    internal var name: String { "head" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Title: ContentNode {

    internal var name: String { "title" }

    internal var attributes: [String: Any]?

    internal var content: String
    
    public init(@StringBuilder content: () -> String) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: String) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Base: EmptyNode {

    internal var name: String { "base" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

extension Base: ReferenceAttribute, TargetAttribute {}

/// The element
///
///
public struct Link: EmptyNode {

    internal var name: String { "link" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

extension Link: ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, ReferrerPolicyAttribute, RelationshipAttribute, SizesAttribute, TypeAttribute {}

/// The element
///
///
public struct Meta: EmptyNode {

    internal var name: String { "meta" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

extension Meta: ContentAttribute, NameAttribute, PropertyAttribute {}

/// The element
///
///
public struct Style: ContentNode {

    internal var name: String { "style" }
    
    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Style: TypeAttribute, MediaAttribute {}

/// The element
///
///
public struct Html: ContentNode {

    internal var name: String { "html" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Body: ContentNode {

    internal var name: String { "body" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Article: ContentNode {

    internal var name: String { "article" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Section: ContentNode {

    internal var name: String { "section" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Navigation: ContentNode {

    internal var name: String { "nav" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Aside: ContentNode {

    internal var name: String { "aside" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Heading1: ContentNode {

    internal var name: String { "h1" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct Heading2: ContentNode {

    internal var name: String { "h2" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct Heading3: ContentNode {

    internal var name: String { "h3" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct Heading4: ContentNode {

    internal var name: String { "h4" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct Heading5: ContentNode {

    internal var name: String { "h5" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct Heading6: ContentNode {

    internal var name: String { "h6" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct HeadingGroup: ContentNode {

    internal var name: String { "hgroup" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Header: ContentNode {

    internal var name: String { "header" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Footer: ContentNode {

    internal var name: String { "footer" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Address: ContentNode {

    internal var name: String { "address" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Paragraph: ContentNode {

    internal var name: String { "p" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct HorizontalRule: EmptyNode {

    internal var name: String { "hr" }
    
    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

/// The element
///
///
public struct PreformattedText: ContentNode {

    internal var name: String { "pre" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Blockquote: ContentNode {

    internal var name: String { "blockquote" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Blockquote:  CiteAttribute {}

extension Blockquote: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The element
///
///
public struct OrderedList: ContentNode {

    internal var name: String { "ol" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension OrderedList: ReversedAttribute, StartAttribute, TypeAttribute {}

/// The element
///
///
public struct UnorderedList: ContentNode {

    internal var name: String { "ul" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct ListItem: ContentNode {

    internal var name: String { "li" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension ListItem: ValueAttribute {}

/// The element
///
///
public struct DescriptionList: ContentNode {

    internal var name: String { "dl" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct TermName: ContentNode {

    internal var name: String { "dt" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct TermDefinition: ContentNode {

    internal var name: String { "dd" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Figure: ContentNode {

    internal var name: String { "figure" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct FigureCaption: ContentNode {

    internal var name: String { "figcaption" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Main: ContentNode {

    internal var name: String { "main" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Division: ContentNode {

    internal var name: String { "div" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Anchor: ContentNode {

    internal var name: String { "a" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String : Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Anchor: DownloadAttribute, ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, PingAttribute, ReferrerPolicyAttribute, RelationshipAttribute, TargetAttribute, TypeAttribute {}

extension Anchor: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The element
///
///
public struct Emphasize: ContentNode {

    internal var name: String { "em" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Strong: ContentNode {

    internal var name: String { "strong" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String : Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Small: ContentNode {

    internal var name: String { "small" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct StrikeThrough: ContentNode {

    internal var name: String { "s" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct Cite: ContentNode {

    internal var name: String { "cite" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct ShortQuote: ContentNode {

    internal var name: String { "q" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension ShortQuote: CiteAttribute {}

/// The element
///
///
public struct Definition: ContentNode {

    internal var name: String { "dfn" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Abbreviation: ContentNode {

    internal var name: String { "abbr" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Ruby: ContentNode {

    internal var name: String { "ruby" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct RubyText: ContentNode {

    internal var name: String { "rt" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct RubyPronunciation: ContentNode {

    internal var name: String { "rp" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Data: ContentNode {

    internal var name: String { "data" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Data: ValueAttribute {}

/// The element
///
///
public struct Time: ContentNode {

    internal var name: String { "time" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Time: DateTimeAttribute {}

/// The element
///
///
public struct Code: ContentNode {

    internal var name: String { "code" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Variable: ContentNode {

    internal var name: String { "v" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct SampleOutput: ContentNode {

    internal var name: String { "samp" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct KeyboardInput: ContentNode {

    internal var name: String { "kbd" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Subscript: ContentNode {

    internal var name: String { "sub" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Superscript: ContentNode {

    internal var name: String { "sup" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Italic: ContentNode {

    internal var name: String { "i" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct Bold: ContentNode {

    internal var name: String { "b" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct Underline: ContentNode {

    internal var name: String { "u" }
    
    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
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

/// The element
///
///
public struct Mark: ContentNode {

    internal var name: String { "mark" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Bdi: ContentNode {

    internal var name: String { "bdi" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Bdo: EmptyNode {

    internal var name: String { "bdo" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

/// The element
///
///
public struct Span: ContentNode {

    internal var name: String { "span" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String : Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct LineBreak: EmptyNode {

    internal var name: String { "br" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

/// The element
///
///
public struct WordBreak: EmptyNode {

    internal var name: String { "wbr" }
    
    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

/// The element
///
///
public struct InsertedText: ContentNode {

    internal var name: String { "ins" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension InsertedText: CiteAttribute, DateTimeAttribute {}

/// The element
///
///
public struct DeletedText: ContentNode {

    internal var name: String { "del" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension DeletedText: CiteAttribute, DateTimeAttribute {}

/// The element
///
///
public struct Picture: ContentNode {

    internal var name: String { "picture" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Source: EmptyNode {

    internal var name: String { "source" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

extension Source: TypeAttribute, SourceAttribute, SizesAttribute, MediaAttribute, WidthAttribute, HeightAttribute {}

/// The element
///
///
public struct Image: EmptyNode {

    internal var name: String { "img" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

extension Image: AlternativeAttribute, SourceAttribute, SizesAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute {}

/// The element
///
///
public struct InlineFrame: ContentNode {
    
    internal var name: String { "iframe" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension InlineFrame: SourceAttribute, NameAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute {}

/// The element
///
///
public struct Embed: EmptyNode {

    internal var name: String { "embed" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

extension Embed: SourceAttribute, TypeAttribute, WidthAttribute, HeightAttribute {}

/// The element
///
///
public struct Object: ContentNode {
    
    internal var name: String { "object" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Object: DataAttribute, TypeAttribute, NameAttribute, FormAttribute, WidthAttribute, HeightAttribute {}

/// The element
///
///
public struct Parameter: EmptyNode {
    
    internal var name: String { "param" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

extension Parameter: NameAttribute, ValueAttribute {}

/// The element
///
///
public struct Video: ContentNode {

    internal var name: String { "video" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Video: SourceAttribute, AutoPlayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute, WidthAttribute, HeightAttribute {}

/// The element
///
///
public struct Audio: ContentNode {

    internal var name: String { "audio" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Audio: SourceAttribute, AutoPlayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute {}

/// The element
///
///
public struct Track: EmptyNode {

    internal var name: String { "track" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

extension Track: KindAttribute, SourceAttribute, LabelAttribute, DefaultAttribute {}

/// The element
///
///
public struct Map: ContentNode {
    
    internal var name: String { "map" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Map: NameAttribute {}

/// The element
///
///
public struct Area: ContentNode {

    internal var name: String { "area" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Area: AlternativeAttribute, CoordinatesAttribute, ShapeAttribute, ReferenceAttribute, TargetAttribute, DownloadAttribute, PingAttribute, RelationshipAttribute, ReferrerPolicyAttribute {}

/// The element
///
///
public struct Table: ContentNode {

    internal var name: String { "table" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Table: WidthAttribute, HeightAttribute {}

/// The element
///
///
public struct Caption: ContentNode {

    internal var name: String { "caption" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct ColumnGroup: ContentNode {

    internal var name: String { "colgroup" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension ColumnGroup: SpanAttribute {}

/// The element
///
///
public struct Column: ContentNode {

    internal var name: String { "col" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Column: SpanAttribute {}

/// The element
///
///
public struct TableBody: ContentNode {

    internal var name: String { "tbody" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension TableBody: WidthAttribute, HeightAttribute {}

/// The element
///
///
public struct TableHead: ContentNode {

    internal var name: String { "thead" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension TableHead: WidthAttribute, HeightAttribute {}

/// The element
///
///
public struct TableFoot: ContentNode {

    public var name: String { "tfoot" }

    public var attributes: [HTMLAttribute] = []

    public var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }

    public init(attributes: [HTMLAttribute] = [], content: Content = "") {
        self.content = content
        self.attributes = attributes
    }
}

/// The element
///
///
public struct TableRow: ContentNode {

    internal var name: String { "tfoot" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension TableRow: WidthAttribute, HeightAttribute {}

/// The element
///
///
public struct DataCell: ContentNode {

    internal var name: String { "td" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension DataCell: ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute {}

/// The element
///
///
public struct HeaderCell: ContentNode {

    internal var name: String { "th" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension HeaderCell: ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute, ScopeAttribute {}

extension HeaderCell: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The element
///
///
public struct Form: ContentNode {

    internal var name: String { "form" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Form: ActionAttribute, AutoCompleteAttribute, EncodingAttribute, MethodAttribute, NameAttribute, TargetAttribute, RelationshipAttribute {}

/// The element
///
///
public struct Label: ContentNode {

    internal var name: String { "label" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Label: ForAttribute {}

extension Label: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The element
///
///
public struct Input: EmptyNode {

    internal var name: String { "input" }

    internal var attributes: [String: Any]?

    public init() {}
    
    internal init(attributes: [String: Any]?) {
        self.attributes = attributes
    }
}

extension Input: AcceptAttribute, AlternativeAttribute, AutoCompleteAttribute, CheckedAttribute, DisabledAttribute, FormAttribute, FormActionAttribute, HeightAttribute, ListAttribute, MaximumValueAttribute, MaximumLengthAttribute, MinimumValueAttribute, MinimumLengthAttribute, MultipleAttribute, NameAttribute, PatternAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, SizeAttribute, SourceAttribute, StepAttribute, TypeAttribute, ValueAttribute, WidthAttribute {}

/// The element
///
///
public struct Button: ContentNode {

    internal var name: String { "button" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Button: DisabledAttribute, FormAttribute, FormActionAttribute, NameAttribute, TypeAttribute, ValueAttribute {}

extension Button: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

/// The element
///
///
public struct Select: ContentNode {

    internal var name: String { "select" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Select: AutoCompleteAttribute, DisabledAttribute, FormAttribute, MultipleAttribute, NameAttribute, RequiredAttribute, SizeAttribute {}


/// The element
///
///
public struct DataList: ContentNode {

    internal var name: String { "datalist" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct OptionGroup: ContentNode {

    internal var name: String { "optgroup" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension OptionGroup: DisabledAttribute, LabelAttribute {}

/// The element
///
///
public struct Option: ContentNode {

    internal var name: String { "option" }

    internal var attributes: [String: Any]?

    internal var content: String

    public init(content: () -> String) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: String) {
        self.attributes = attributes
        self.content = content
    }
}

extension Option: DisabledAttribute, LabelAttribute, ValueAttribute {}

/// The element
///
///
public struct TextArea: ContentNode {
        
    internal var name: String { "textarea" }

    internal var attributes: [String: Any]?

    internal var content: String

    public init(@StringBuilder content: () -> String) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: String) {
        self.attributes = attributes
        self.content = content
    }
}

extension Textarea: AutoCompleteAttribute, ColumnsAttribute, DisabledAttribute, FormAttribute, MaximumLengthAttribute, MinimumLengthAttribute, NameAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, RowsAttribute, WrapAttribute {}

/// The element
///
///
public struct Output: ContentNode {
    
    internal var name: String { "output" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Output: ForAttribute, FormAttribute, NameAttribute {}

/// The element
///
///
public struct Progress: ContentNode {

    internal var name: String { "progress" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Progress: ValueAttribute, MaximumValueAttribute {}

/// The element
///
///
public struct Meter: ContentNode {

    internal var name: String { "meter" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Meter: ValueAttribute, MinimumValueAttribute, MaximumValueAttribute, HighAttribute, OptimumAttribute {}

/// The element
///
///
public struct Fieldset: ContentNode {
    
    internal var name: String { "fieldset" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Fieldset: DisabledAttribute, FormAttribute, NameAttribute {}

/// The element
///
///
public struct Legend: ContentNode {

    internal var name: String { "legend" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Details: ContentNode {

    internal var name: String { "details" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Details: OpenAttribute {}

/// The element
///
///
public struct Summary: ContentNode {

    internal var name: String { "summary" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Dialog: ContentNode {

    internal var name: String { "dialog" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Dialog: OpenAttribute {}

/// The element
///
///
public struct Script: ContentNode {

    internal var name: String { "script" }

    internal var attributes: [String: Any]?

    internal var content: String

    public init(content: () -> String) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: String) {
        self.attributes = attributes
        self.content = content
    }
}

extension Script: AsyncAttribute, ReferrerPolicyAttribute, SourceAttribute, TypeAttribute {}

/// The element
///
///
public struct NoScript: ContentNode {

    internal var name: String { "noscript" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Template: ContentNode {

    internal var name: String { "template" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

/// The element
///
///
public struct Canvas: ContentNode {

    internal var name: String { "canvas" }

    internal var attributes: [String: Any]?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: [String: Any]?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension Canvas: WidthAttribute, HeightAttribute {}
