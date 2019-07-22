
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

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct P: ContentNode {

    public var name: String { "p" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H1: ContentNode {

    public var name: String { "h1" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H2: ContentNode {

    public var name: String { "h2" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H3: ContentNode {

    public var name: String { "h3" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H4: ContentNode {

    public var name: String { "h4" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H5: ContentNode {

    public var name: String { "h5" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct H6: ContentNode {

    public var name: String { "h6" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Blockquote: ContentNode {

    public var name: String { "blockquote" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct B: ContentNode {

    public var name: String { "b" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct I: ContentNode {

    public var name: String { "i" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Small: ContentNode {

    public var name: String { "small" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
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

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
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

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
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

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
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

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Title: ContentNode {

    public var name: String { "title" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public enum ButtonType : String {
    case button
    case submit
}

public struct Button: ContentNode {

    public var name: String { "button" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }

    public func type(_ type: ButtonType) -> Button {
        self.type(type.rawValue)
    }
}

public struct ListItem: ContentNode {

    public var name: String { "li" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
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

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
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

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Anchor: ContentNode {

    public var name: String { "a" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Nav: ContentNode {

    public var name: String { "nav" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Form: ContentNode {

    public var name: String { "form" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Label: ContentNode {

    public var name: String { "label" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Script: ContentNode {

    public var name: String { "script" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct TextArea: ContentNode {

    public var name: String { "textarea" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
    }

    public init(attributes: [HTML.Attribute] = [], content: View = "") {
        self.content = content
        self.attributes = attributes
    }
}

public struct Select<A, B>: AttributeNode {

    public var name: String { "select" }

    public var attributes: [HTML.Attribute] = []

    public var content: View

    let isMultiple: Conditionable

    public init(attributes: [HTML.Attribute], content: View, isMultiple: Conditionable) {
        self.content = content
        self.attributes = attributes
        self.isMultiple = isMultiple
    }

    public init(for elements: TemplateValue<A, [B]>, @HTMLBuilder buildere: (RootValue<B>) -> View) {
        content = ForEach(in: elements) { variable in
            Option { buildere(variable) }
        }
        isMultiple = false
    }

    public struct Option: ContentNode {

        public var name: String { "option" }

        public var attributes: [HTML.Attribute] = []

        public var content: View

        public init(@HTMLBuilder buildere: () -> View) {
            content = buildere()
        }

        public init(attributes: [HTML.Attribute] = [], content: View = "") {
            self.content = content
            self.attributes = attributes
        }
    }
}

extension Select where A == Never, B == Never {
    public init(@HTMLBuilder buildere: () -> View) {
        content = buildere()
        isMultiple = false
    }
}

extension Select where B : View {
    public init(for elements: TemplateValue<A, [B]>) {
        isMultiple = false
        content = ForEach(in: elements) { variable in
            Option { variable }
        }
    }
}

// Easier use of TemplateVariable.constant()
extension Select where B : View, A == Never {
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
        formula.add(mappable: content)
        formula.add(string: "</\(name)>")
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        fatalError()
    }
}



public struct Link: DataNode {

    public var name: String { "link" }

    public var attributes: [HTML.Attribute]

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }
}

public struct Img: DataNode {

    public var name: String { "img" }

    public var attributes: [HTML.Attribute]

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }

    public init(source: String) {
        self.init(attributes: [.init(attribute: "src", value: source)])
    }
}

public struct Meta: DataNode {

    public var name: String { "meta" }

    public var attributes: [HTML.Attribute]

    public init(attributes: [HTML.Attribute] = []) {
        self.attributes = attributes
    }
}

public struct Input: DataNode {

    public enum Types : String {
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
