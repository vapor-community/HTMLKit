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

extension Base: ReferenceAttribute, TargetAttribute {
    
    public func reference(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(ref: value))
        }
        
        return .init(attributes: update(ref: value, on: &attributes))
    }
    
    public func target(_ type: Target) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(target: type.rawValue))
        }
        
        return .init(attributes: update(target: type.rawValue, on: &attributes))
    }
}

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

extension Link: ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, ReferrerPolicyAttribute, RelationshipAttribute, SizesAttribute, TypeAttribute {
    
    public func reference(_ value: String) -> Link {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(ref: value))
        }
        
        return .init(attributes: update(ref: value, on: &attributes))
    }
    
    public func referenceLanguage(_ type: Language) -> Link {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(reflang: type.rawValue))
        }
        
        return .init(attributes: update(reflang: type.rawValue, on: &attributes))
    }
    
    public func media(_ value: Content) -> Link {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(media: value))
        }
        
        return .init(attributes: update(media: value, on: &attributes))
    }
    
    public func referrerPolicy(_ type: Policy) -> Link {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(policy: type.rawValue))
        }
        
        return .init(attributes: update(policy: type.rawValue, on: &attributes))
    }
    
    public func relationship(_ type: Relation) -> Link {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(rel: type.rawValue))
        }
        
        return .init(attributes: update(rel: type.rawValue, on: &attributes))
    }
    
    public func sizes(_ size: Int) -> Link {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(sizes: size))
        }
        
        return .init(attributes: update(sizes: size, on: &attributes))
    }
    
    public func type(_ value: String) -> Link {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value))
        }
        
        return .init(attributes: update(type: value, on: &attributes))
    }
}

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

extension Meta: ContentAttribute, NameAttribute, PropertyAttribute {
    
    public func content(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(content: value))
        }
        
        return .init(attributes: update(content: value, on: &attributes))
    }
    
    public func name(_ type: NameType) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue))
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes))
    }
    
    public func property(_ type: Graphs) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(property: type.rawValue))
        }
        
        return .init(attributes: update(property: type.rawValue, on: &attributes))
    }
}

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

extension Style: TypeAttribute, MediaAttribute {
    
    public func type(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value), content: content)
        }
        
        return .init(attributes: update(type: value, on: &attributes), content: content)
    }
    
    public func media(_ value: Content) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(media: value), content: content)
        }
        
        return .init(attributes: update(media: value, on: &attributes), content: content)
    }
    
    
}

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

extension Blockquote:  CiteAttribute {
    
    public func cite(_ value: String) -> Blockquote {

        guard var attributes = self.attributes else {
            return .init(attributes: set(cite: value), content: content)
        }
        
        return .init(attributes: update(cite: value, on: &attributes), content: content)
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

extension OrderedList: ReversedAttribute, StartAttribute, TypeAttribute {
    
    public func reversed() -> OrderedList {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(reversed: "reversed"), content: content)
        }
        
        return .init(attributes: update(reversed: "reversed", on: &attributes), content: content)
    }
    
    public func start(_ size: Int) -> OrderedList {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(start: size), content: content)
        }
        
        return .init(attributes: update(start: size, on: &attributes), content: content)
    }
    
    public func type(_ value: String) -> OrderedList {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value), content: content)
        }
        
        return .init(attributes: update(type: value, on: &attributes), content: content)
    }
}

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

extension ListItem: ValueAttribute {
    
    public func value(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value), content: content)
        }
        
        return .init(attributes: update(value: value, on: &attributes), content: content)
    }
}

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

extension Anchor: DownloadAttribute, ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, PingAttribute, ReferrerPolicyAttribute, RelationshipAttribute, TargetAttribute, TypeAttribute {
    
    public func download() -> Anchor {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(download: "download"), content: content)
        }
        
        return .init(attributes: update(download: "download", on: &attributes), content: content)
    }
    
    public func reference(_ value: String) -> Anchor {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(ref: value), content: content)
        }
        
        return .init(attributes: update(ref: value, on: &attributes), content: content)
    }
    
    public func referenceLanguage(_ type: Language) -> Anchor {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(reflang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(reflang: type.rawValue, on: &attributes), content: content)
    }
    
    public func media(_ value: Content) -> Anchor {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(media: value), content: content)
        }

        return .init(attributes: update(media: value, on: &attributes), content: content)
    }
    
    public func ping(_ value: String) -> Anchor {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(ping: value), content: content)
        }
        
        return .init(attributes: update(ping: value, on: &attributes), content: content)
    }
    
    public func referrerPolicy(_ type: Policy) -> Anchor {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(policy: type.rawValue), content: content)
        }
        
        return .init(attributes: update(policy: type.rawValue, on: &attributes), content: content)
    }
    
    public func relationship(_ type: Relation) -> Anchor {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(rel: type.rawValue), content: content)
        }
        
        return .init(attributes: update(rel: type.rawValue, on: &attributes), content: content)
    }
    
    public func target(_ type: Target) -> Anchor {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(target: type.rawValue), content: content)
        }
        
        return .init(attributes: update(target: type.rawValue, on: &attributes), content: content)
    }
    
    public func type(_ value: String) -> Anchor {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value), content: content)
        }
        
        return .init(attributes: update(type: value, on: &attributes), content: content)
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

extension ShortQuote: CiteAttribute {
    
    public func cite(_ value: String) -> ShortQuote {

        guard var attributes = self.attributes else {
            return .init(attributes: set(cite: value), content: content)
        }
        
        return .init(attributes: update(cite: value, on: &attributes), content: content)
    }
}

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

extension Data: ValueAttribute {
    
    public func value(_ value: String) -> Data {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value), content: content)
        }
        
        return .init(attributes: update(value: value, on: &attributes), content: content)
    }
}

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

extension Time: DateTimeAttribute {

    public func dateTime(_ value: Content) -> Time {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(time: value), content: content)
        }
        
        return .init(attributes: update(time: value, on: &attributes), content: content)
    }
}

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

extension InsertedText: CiteAttribute, DateTimeAttribute {
    
    public func cite(_ value: String) -> InsertedText {

        guard var attributes = self.attributes else {
            return .init(attributes: set(cite: value), content: content)
        }
        
        return .init(attributes: update(cite: value, on: &attributes), content: content)
    }
    
    public func dateTime(_ value: Content) -> InsertedText {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(time: value), content: content)
        }
        
        return .init(attributes: update(time: value, on: &attributes), content: content)
    }
}

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

extension DeletedText: CiteAttribute, DateTimeAttribute {
    
    public func cite(_ value: String) -> DeletedText {

        guard var attributes = self.attributes else {
            return .init(attributes: set(cite: value), content: content)
        }
        
        return .init(attributes: update(cite: value, on: &attributes), content: content)
    }
    
    public func dateTime(_ value: Content) -> DeletedText {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(time: value), content: content)
        }
        
        return .init(attributes: update(time: value, on: &attributes), content: content)
    }
}

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

extension Source: TypeAttribute, SourceAttribute, SizesAttribute, MediaAttribute, WidthAttribute, HeightAttribute {
    
    public func type(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value))
        }
        
        return .init(attributes: update(type: value, on: &attributes))
    }
    
    public func source(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value))
        }
        
        return .init(attributes: update(source: value, on: &attributes))
    }
    
    public func sizes(_ size: Int) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(sizes: size))
        }
        
        return .init(attributes: update(sizes: size, on: &attributes))
    }
    
    public func media(_ value: Content) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(media: value))
        }
        
        return .init(attributes: update(media: value, on: &attributes))
    }
    
    public func width(_ size: Int) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size))
        }
        
        return .init(attributes: update(width: size, on: &attributes))
    }
    
    public func height(_ size: Int) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size))
        }
        
        return .init(attributes: update(height: size, on: &attributes))
    }
}

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

extension Image: AlternateAttribute, SourceAttribute, SizesAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute {
    
    public func alternate(_ value: String) -> Image {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(alt: value))
        }
        
        return .init(attributes: update(alt: value, on: &attributes))
    }
    
    public func source(_ value: String) -> Image {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value))
        }
        
        return .init(attributes: update(source: value, on: &attributes))
    }
    
    public func sizes(_ size: Int) -> Image {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(sizes: size) )
        }
        
        return .init(attributes: update(sizes: size, on: &attributes))
    }
    
    public func width(_ size: Int) -> Image {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size))
        }
        
        return .init(attributes: update(width: size, on: &attributes))
    }
    
    public func height(_ size: Int) -> Image {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size))
        }
        
        return .init(attributes: update(height: size, on: &attributes))
    }
    
    public func referrerPolicy(_ type: Policy) -> Image {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(policy: type.rawValue))
        }
        
        return .init(attributes: update(policy: type.rawValue, on: &attributes))
    }
}

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

extension InlineFrame: SourceAttribute, NameAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute {
    
    public func source(_ value: String) -> InlineFrame {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value), content: content)
        }
        
        return .init(attributes: update(source: value, on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> InlineFrame {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
    
    public func width(_ size: Int) -> InlineFrame {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size), content: content)
        }
        
        return .init(attributes: update(width: size, on: &attributes), content: content)
    }
    
    public func height(_ size: Int) -> InlineFrame {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size), content: content)
        }
        
        return .init(attributes: update(height: size, on: &attributes), content: content)
    }
    
    public func referrerPolicy(_ type: Policy) -> InlineFrame {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(policy: type.rawValue), content: content)
        }
        
        return .init(attributes: update(policy: type.rawValue, on: &attributes), content: content)
    }
}

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

extension Embed: SourceAttribute, TypeAttribute, WidthAttribute, HeightAttribute {
    
    public func source(_ value: String) -> Embed {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value) )
        }
        
        return .init(attributes: update(source: value, on: &attributes))
    }
    
    public func type(_ value: String) -> Embed {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value))
        }
        
        return .init(attributes: update(type: value, on: &attributes))
    }
    
    public func width(_ size: Int) -> Embed {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size))
        }
        
        return .init(attributes: update(width: size, on: &attributes))
    }
    
    public func height(_ size: Int) -> Embed {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size))
        }
        
        return .init(attributes: update(height: size, on: &attributes))
    }
}

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

extension Object: DataAttribute, TypeAttribute, NameAttribute, FormAttribute, WidthAttribute, HeightAttribute {
    
    public func data(_ value: String) -> Object {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(data: value), content: content)
        }
        
        return .init(attributes: update(data: value, on: &attributes), content: content)
    }
    
    public func type(_ value: String) -> Object {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value), content: content)
        }
        
        return .init(attributes: update(type: value, on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> Object {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> Object {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func width(_ size: Int) -> Object {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size), content: content)
        }
        
        return .init(attributes: update(width: size, on: &attributes), content: content)
    }
    
    public func height(_ size: Int) -> Object {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size), content: content)
        }
        
        return .init(attributes: update(height: size, on: &attributes), content: content)
    }
}

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

extension Parameter: NameAttribute, ValueAttribute {
    
    public func name(_ type: NameType) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue))
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes))
    }
    
    public func value(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value))
        }
        
        return .init(attributes: update(value: value, on: &attributes))
    }
}

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

extension Video: SourceAttribute, AutoplayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute, WidthAttribute, HeightAttribute {
    
    public func source(_ value: String) -> Video {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value), content: content)
        }
        
        return .init(attributes: update(source: value, on: &attributes), content: content)
    }
    
    public func autoplay() -> Video {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autoplay: "autoplay"), content: content)
        }
        
        return .init(attributes: update(autoplay: "autoplay", on: &attributes), content: content)
    }
    
    public func loop() -> Video {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(loop: "loop"), content: content)
        }
        
        return .init(attributes: update(loop: "loop", on: &attributes), content: content)
    }
    
    public func muted() -> Video {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(muted: "muted"), content: content)
        }
        
        return .init(attributes: update(muted: "muted", on: &attributes), content: content)
    }
    
    public func controls() -> Video {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(controls: "controls"), content: content)
        }
        
        return .init(attributes: update(controls: "controls", on: &attributes), content: content)
    }
    
    public func width(_ size: Int) -> Video {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size), content: content)
        }
        
        return .init(attributes: update(width: size, on: &attributes), content: content)
    }
    
    public func height(_ size: Int) -> Video {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size), content: content)
        }
        
        return .init(attributes: update(height: size, on: &attributes), content: content)
    }
}

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

extension Audio: SourceAttribute, AutoplayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute {
    
    public func source(_ value: String) -> Audio {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value), content: content)
        }
        
        return .init(attributes: update(source: value, on: &attributes), content: content)
    }
    
    public func autoplay() -> Audio {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autoplay: "autoplay"), content: content)
        }
        
        return .init(attributes: update(autoplay: "autoplay", on: &attributes), content: content)
    }
    
    public func loop() -> Audio {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(loop: "loop"), content: content)
        }
        
        return .init(attributes: update(loop: "loop", on: &attributes), content: content)
    }
    
    public func muted() -> Audio {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(muted: "muted"), content: content)
        }
        
        return .init(attributes: update(muted: "muted", on: &attributes), content: content)
    }
    
    public func controls() -> Audio {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(controls: "controls"), content: content)
        }
        
        return .init(attributes: update(controls: "controls", on: &attributes), content: content)
    }
}

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

extension Track: KindAttribute, SourceAttribute, LabelAttribute, DefaultAttribute {
    
    public func kind(_ value: Content) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(kind: value))
        }
        
        return .init(attributes: update(kind: value, on: &attributes))
    }
    
    public func source(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value))
        }
        
        return .init(attributes: update(source: value, on: &attributes))
    }
    
    public func label(_ value: Content) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(label: value))
        }
        
        return .init(attributes: update(label: value, on: &attributes))
    }
    
    public func `default`() -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(default: "default"))
        }
        
        return .init(attributes: update(default: "default", on: &attributes))
    }
}

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

extension Map: NameAttribute {
    
    public func name(_ value: NameType) -> Map {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: value.rawValue), content: content)
        }
        
        return .init(attributes: update(name: value.rawValue, on: &attributes), content: content)
    }
}

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

extension Area: AlternateAttribute, CoordinatesAttribute, ShapeAttribute, ReferenceAttribute, TargetAttribute, DownloadAttribute, PingAttribute, RelationshipAttribute, ReferrerPolicyAttribute {
    
    public func alternate(_ value: String) -> Area {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(alt: value), content: content)
        }
        
        return .init(attributes: update(alt: value, on: &attributes), content: content)
    }
    
    public func coordinates(_ value: String) -> Area {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(coords: value), content: content)
        }
        
        return .init(attributes: update(coords: value, on: &attributes), content: content)
    }
    
    public func shape(_ type: Shape) -> Area {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(shape: type.rawValue), content: content)
        }
        
        return .init(attributes: update(shape: type.rawValue, on: &attributes), content: content)
    }
    
    public func reference(_ value: String) -> Area {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(ref: value), content: content)
        }
        
        return .init(attributes: update(ref: value, on: &attributes), content: content)
    }
    
    public func target(_ type: Target) -> Area {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(target: type.rawValue), content: content)
        }
        
        return .init(attributes: update(target: type.rawValue, on: &attributes), content: content)
    }
    
    public func download() -> Area {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(download: "download"), content: content)
        }
        
        return .init(attributes: update(download: "download", on: &attributes), content: content)
    }
    
    public func ping(_ value: String) -> Area {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(ping: value), content: content)
        }
        
        return .init(attributes: update(ping: value, on: &attributes), content: content)
    }
    
    public func relationship(_ type: Relation) -> Area {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(rel: type.rawValue), content: content)
        }
        
        return .init(attributes: update(rel: type.rawValue, on: &attributes), content: content)
    }
    
    public func referrerPolicy(_ type: Policy) -> Area {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(policy: type.rawValue), content: content)
        }
        
        return .init(attributes: update(policy: type.rawValue, on: &attributes), content: content)
    }
}

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

extension Table: WidthAttribute, HeightAttribute {
    
    public func width(_ size: Int) -> Table {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size), content: content)
        }
        
        return .init(attributes: update(width: size, on: &attributes), content: content)
    }
    
    public func height(_ size: Int) -> Table {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size), content: content)
        }
        
        return .init(attributes: update(height: size, on: &attributes), content: content)
    }
}

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

extension ColumnGroup: SpanAttribute {
    
    public func span(_ size: Int) -> ColumnGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(span: size), content: content)
        }
        
        return .init(attributes: update(span: size, on: &attributes), content: content)
    }
}

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

extension Column: SpanAttribute {
    
    public func span(_ size: Int) -> Column {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(span: size), content: content)
        }
        
        return .init(attributes: update(span: size, on: &attributes), content: content)
    }
}

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

extension TableBody: WidthAttribute, HeightAttribute {
    
    public func width(_ size: Int) -> TableBody {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size), content: content)
        }
        
        return .init(attributes: update(width: size, on: &attributes), content: content)
    }
    
    public func height(_ size: Int) -> TableBody {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size), content: content)
        }
        
        return .init(attributes: update(height: size, on: &attributes), content: content)
    }
}

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

extension TableHead: WidthAttribute, HeightAttribute {
    
    public func width(_ size: Int) -> TableHead {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size), content: content)
        }
        
        return .init(attributes: update(width: size, on: &attributes), content: content)
    }
    
    public func height(_ size: Int) -> TableHead {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size), content: content)
        }
        
        return .init(attributes: update(height: size, on: &attributes), content: content)
    }
}

/// The element
///
///
public struct TableFoot: ContentNode {

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

extension TableRow: WidthAttribute, HeightAttribute {
    
    public func width(_ size: Int) -> TableRow {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size), content: content)
        }
        
        return .init(attributes: update(width: size, on: &attributes), content: content)
    }
    
    public func height(_ size: Int) -> TableRow {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size), content: content)
        }
        
        return .init(attributes: update(height: size, on: &attributes), content: content)
    }
}

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

extension DataCell: ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute {

    public func columnSpan(_ size: Int) -> DataCell {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(columnspan: size), content: content)
        }
        
        return .init(attributes: update(columnspan: size, on: &attributes), content: content)
    }
    
    public func rowSpan(_ size: Int) -> DataCell {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(rowspan: size), content: content)
        }
        
        return .init(attributes: update(rowspan: size, on: &attributes), content: content)
    }
    
    public func headers(_ value: String) -> DataCell {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(headers: value), content: content)
        }
        
        return .init(attributes: update(headers: value, on: &attributes), content: content)
    }
}

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

extension HeaderCell: ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute, ScopeAttribute {
    
    public func columnSpan(_ size: Int) -> HeaderCell {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(columnspan: size), content: content)
        }
        
        return .init(attributes: update(columnspan: size, on: &attributes), content: content)
    }
    
    public func rowSpan(_ size: Int) -> HeaderCell {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(rowspan: size), content: content)
        }
        
        return .init(attributes: update(rowspan: size, on: &attributes), content: content)
    }
    
    public func headers(_ value: String) -> HeaderCell {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(headers: value), content: content)
        }
        
        return .init(attributes: update(headers: value, on: &attributes), content: content)
    }
    
    public func scope(_ value: String) -> HeaderCell {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(scope: value), content: content)
        }
        
        return .init(attributes: update(scope: value, on: &attributes), content: content)
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

extension Form: ActionAttribute, AutocompleteAttribute, EncodingAttribute, MethodAttribute, NameAttribute, TargetAttribute, RelationshipAttribute {
    
    public func action(_ value: String) -> Form {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(action: value), content: content)
        }
        
        return .init(attributes: update(action: value, on: &attributes), content: content)
    }
    
    public func hasCompletion(_ condition: Bool) -> Form {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocomplete: condition), content: content)
        }
        
        return .init(attributes: update(autocomplete: condition, on: &attributes), content: content)
    }
    
    public func encoding(_ type: Encoding) -> Form {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(enctype: type.rawValue), content: content)
        }
        
        return .init(attributes: update(enctype: type.rawValue, on: &attributes), content: content)
    }
    
    public func method(_ type: Method) -> Form {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(method: type.rawValue), content: content)
        }
        
        return .init(attributes: update(method: type.rawValue, on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> Form {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
    
    public func target(_ type: Target) -> Form {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(target: type.rawValue), content: content)
        }
        
        return .init(attributes: update(target: type.rawValue, on: &attributes), content: content)
    }
    
    public func relationship(_ type: Relation) -> Form {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(rel: type.rawValue), content: content)
        }
        
        return .init(attributes: update(rel: type.rawValue, on: &attributes), content: content)
    }
}

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

extension Label: ForAttribute {
    
    public func `for`(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(for: value), content: content)
        }
        
        return .init(attributes: update(for: value, on: &attributes), content: content)
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

extension Input: AcceptAttribute, AlternateAttribute, AutocompleteAttribute, CheckedAttribute, DisabledAttribute, FormAttribute, FormActionAttribute, HeightAttribute, ListAttribute, MaximumValueAttribute, MaximumLengthAttribute, MinimumValueAttribute, MinimumLengthAttribute, MultipleAttribute, NameAttribute, PatternAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, SizeAttribute, SourceAttribute, StepAttribute, TypeAttribute, ValueAttribute, WidthAttribute {
    
    public func accept(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accept: value))
        }
        
        return .init(attributes: update(accept: value, on: &attributes))
    }
    
    public func alternate(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(alt: value))
        }
        
        return .init(attributes: update(alt: value, on: &attributes))
    }
    
    public func hasCompletion(_ condition: Bool) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocomplete: condition))
        }
        
        return .init(attributes: update(autocomplete: condition, on: &attributes))
    }
    
    public func checked() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(checked: "checked"))
        }
        
        return .init(attributes: update(checked: "checked", on: &attributes))
    }
    
    public func disabled() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"))
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes))
    }
    
    public func form(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value))
        }
        
        return .init(attributes: update(form: value, on: &attributes))
    }
    
    public func formAction(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(formaction: value))
        }
        
        return .init(attributes: update(formaction: value, on: &attributes))
    }
    
    public func height(_ size: Int) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size))
        }
        
        return .init(attributes: update(height: size, on: &attributes))
    }
    
    public func list(_ value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(list: value))
        }
        
        return .init(attributes: update(list: value, on: &attributes))
    }
    
    public func maximum(_ value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(max: value))
        }
        
        return .init(attributes: update(max: value, on: &attributes))
    }
    
    public func maximum(length value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(maxlength: value))
        }
        
        return .init(attributes: update(maxlength: value, on: &attributes))
    }
    
    public func minimum(_ value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(min: value))
        }
        
        return .init(attributes: update(min: value, on: &attributes))
    }
    
    public func minimum(length value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(minlength: value))
        }
        
        return .init(attributes: update(minlength: value, on: &attributes))
    }
    
    public func multiple() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(multiple: "multiple"))
        }
        
        return .init(attributes: update(multiple: "multiple", on: &attributes))
    }
    
    public func name(_ type: NameType) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue))
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes))
    }
    
    public func pattern(_ regex: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(pattern: regex))
        }
        
        return .init(attributes: update(pattern: regex, on: &attributes))
    }
    
    public func placeholder(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(placeholder: value))
        }
        
        return .init(attributes: update(placeholer: value, on: &attributes))
    }
    
    public func readonly() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(readonly: "readonly"))
        }
        
        return .init(attributes: update(readonly: "readonly", on: &attributes))
    }
    
    public func required() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(required: "required"))
        }
        
        return .init(attributes: update(required: "required", on: &attributes))
    }
    
    public func size(_ size: Int) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(size: size))
        }
        
        return .init(attributes: update(size: size, on: &attributes))
    }
    
    public func source(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value))
        }
        
        return .init(attributes: update(source: value, on: &attributes))
    }
    
    public func step(_ size: Int) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(step: size))
        }
        
        return .init(attributes: update(step: size, on: &attributes))
    }
    
    public func type(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value))
        }
        
        return .init(attributes: update(type: value, on: &attributes))
    }
    
    public func value(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value))
        }
        
        return .init(attributes: update(value: value, on: &attributes))
    }
    
    public func width(_ size: Int) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size))
        }
        
        return .init(attributes: update(width: size, on: &attributes))
    }
}

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

extension Button: DisabledAttribute, FormAttribute, FormActionAttribute, NameAttribute, TypeAttribute, ValueAttribute {
    
    public func disabled() -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func formAction(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(formaction: value), content: content)
        }
        
        return .init(attributes: update(formaction: value, on: &attributes), content: content)
    }
    
    public func name(_ value: NameType) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: value.rawValue), content: content)
        }
        
        return .init(attributes: update(name: value.rawValue, on: &attributes), content: content)
    }
    
    public func type(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value), content: content)
        }
        
        return .init(attributes: update(type: value, on: &attributes), content: content)
    }
    
    public func value(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value), content: content)
        }
        
        return .init(attributes: update(value: value, on: &attributes), content: content)
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

extension Select: AutocompleteAttribute, DisabledAttribute, FormAttribute, MultipleAttribute, NameAttribute, RequiredAttribute, SizeAttribute {
    
    public func hasCompletion(_ condition: Bool) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocomplete: true), content: content)
        }
        
        return .init(attributes: update(autocomplete: true, on: &attributes), content: content)
    }
    
    public func disabled() -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func multiple() -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(multiple: "multiple"), content: content)
        }
        
        return .init(attributes: update(multiple: "multiple", on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
    
    public func required() -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(required: "required"), content: content)
        }
        
        return .init(attributes: update(required: "required", on: &attributes), content: content)
    }
    
    public func size(_ size: Int) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(size: size), content: content)
        }
        
        return .init(attributes: update(size: size, on: &attributes), content: content)
    }
}


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

extension OptionGroup: DisabledAttribute, LabelAttribute {

    public func disabled() -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func label(_ value: Content) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(label: value), content: content)
        }
        
        return .init(attributes: update(label: value, on: &attributes), content: content)
    }
}

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

extension Option: DisabledAttribute, LabelAttribute, ValueAttribute {
    
    public func disabled() -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func label(_ value: Content) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(label: value), content: content)
        }
        
        return .init(attributes: update(label: value, on: &attributes), content: content)
    }
    
    public func value(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value), content: content)
        }
        
        return .init(attributes: update(value: value, on: &attributes), content: content)
    }
}

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

extension TextArea: AutocompleteAttribute, ColumnsAttribute, DisabledAttribute, FormAttribute, MaximumLengthAttribute, MinimumLengthAttribute, NameAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, RowsAttribute, WrapAttribute {
    
    public func hasCompletion(_ condition: Bool) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocomplete: true), content: content)
        }
        
        return .init(attributes: update(autocomplete: true, on: &attributes), content: content)
    }
    
    public func columns(_ size: Int) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(columns: size), content: content)
        }
        
        return .init(attributes: update(columns: size, on: &attributes), content: content)
    }
    
    public func disabled() -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func maximum(length value: Content) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(maxlength: value), content: content)
        }
        
        return .init(attributes: update(maxlength: value, on: &attributes), content: content)
    }
    
    public func minimum(length value: Content) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(minlength: value), content: content)
        }
        
        return .init(attributes: update(minlength: value, on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
    
    public func placeholder(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(placeholder: value), content: content)
        }
        
        return .init(attributes: update(placeholer: value, on: &attributes), content: content)
    }
    
    public func readonly() -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(readonly: "readonly"), content: content)
        }
        
        return .init(attributes: update(readonly: "readonly", on: &attributes), content: content)
    }
    
    public func required() -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(required: "required"), content: content)
        }
        
        return .init(attributes: update(required: "required", on: &attributes), content: content)
    }
    
    public func rows(_ size: Int) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(rows: size), content: content)
        }
        
        return .init(attributes: update(rows: size, on: &attributes), content: content)
    }
    
    public func wrap(_ type: Wrapping) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(wrap: type.rawValue), content: content)
        }
        
        return .init(attributes: update(wrap: type.rawValue, on: &attributes), content: content)
    }
}

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

extension Output: ForAttribute, FormAttribute, NameAttribute {
    
    public func `for`(_ value: String) -> Output {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(for: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> Output {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> Output {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
}

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

extension Progress: ValueAttribute, MaximumValueAttribute {
    
    public func maximum(_ value: Content) -> Progress {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(max: value), content: content)
        }
        
        return .init(attributes: update(max: value, on: &attributes), content: content)
    }

    public func value(_ value: String) -> Progress {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value), content: content)
        }
        
        return .init(attributes: update(value: value, on: &attributes), content: content)
    }
}

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

extension Meter: ValueAttribute, MinimumValueAttribute, MaximumValueAttribute, HighAttribute, OptimumAttribute {
    
    public func minimum(_ value: Content) -> Meter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(min: value), content: content)
        }
        
        return .init(attributes: update(min: value, on: &attributes), content: content)
    }
    
    public func maximum(_ value: Content) -> Meter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(max: value), content: content)
        }
        
        return .init(attributes: update(max: value, on: &attributes), content: content)
    }
    
    public func high(_ size: Int) -> Meter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(high: size), content: content)
        }
        
        return .init(attributes: update(high: size, on: &attributes), content: content)
    }
    
    public func optimum(_ value: Float) -> Meter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(optimum: value), content: content)
        }
        
        return .init(attributes: update(optimum: value, on: &attributes), content: content)
    }
    
    public func value(_ value: String) -> Meter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value), content: content)
        }
        
        return .init(attributes: update(value: value, on: &attributes), content: content)
    }
}

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

extension Fieldset: DisabledAttribute, FormAttribute, NameAttribute {
    
    public func disabled() -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
}

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

extension Details: OpenAttribute {
    
    public func isOpen(_ condition: Bool) -> Details {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(open: condition),content: content)
        }
        
        return .init(attributes: update(open: condition, on: &attributes), content: content)
    }
}

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

extension Dialog: OpenAttribute {
    
    public func isOpen(_ condition: Bool) -> Dialog {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(open: condition),content: content)
        }
        
        return .init(attributes: update(open: condition, on: &attributes), content: content)
    }
}

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

extension Script: AsynchronouslyAttribute, ReferrerPolicyAttribute, SourceAttribute, TypeAttribute {
    
    public func asynchronously() -> Script {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(async: "async"), content: content)
        }
        
        return .init(attributes: update(async: "async", on: &attributes), content: content)
    }
    
    public func referrerPolicy(_ type: Policy) -> Script {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(policy: type.rawValue), content: content)
        }
        
        return .init(attributes: update(policy: type.rawValue, on: &attributes), content: content)
    }
    
    public func source(_ value: String) -> Script {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value), content: content)
        }
        
        return .init(attributes: update(source: value, on: &attributes), content: content)
    }
    
    public func type(_ value: String) -> Script {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value), content: content)
        }
        
        return .init(attributes: update(type: value, on: &attributes), content: content)
    }
}

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

extension Canvas: WidthAttribute, HeightAttribute {
    
    public func width(_ size: Int) -> Canvas {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size), content: content)
        }
        
        return .init(attributes: update(width: size, on: &attributes), content: content)
    }
    
    public func height(_ size: Int) -> Canvas {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size), content: content)
        }
        
        return .init(attributes: update(height: size, on: &attributes), content: content)
    }
}
