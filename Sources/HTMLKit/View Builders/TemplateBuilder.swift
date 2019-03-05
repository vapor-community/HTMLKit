
/// A protocol that makes it possible to render HTML views
public protocol TemplateBuilder: CompiledTemplate {
    
    /// Builds the view
    ///
    /// - Returns: a view that conforms to `Mappable`
    func build() -> CompiledTemplate
}

extension TemplateBuilder {

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        try build().brew(formula)
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try build().render(with: manager)
    }
}


extension ContextualTemplate {

    public var div: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "div") }

    public var body: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "body") }

    public var form: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "form") }

    public var small: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "small") }

    public var footer: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "footer") }

    public var head: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "head") }

    public var p: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "p") }

    public var html: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "html") }

    public var button: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "button") }

    public var h1: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h1") }

    public var h2: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h2") }

    public var h3: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h3") }

    public var h4: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h4") }

    public var h5: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h5") }

    public var h6: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "h6") }

    public var span: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "span") }

    public var i: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "i") }

    public var b: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "b") }

    public var strong: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "strong") }

    public var u: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "u") }

    public var em: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "em") }

    public var a: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "a") }

    public var ol: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "ol") }
    
    public var ul: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "ul") }

    public var li: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "li") }

    public var dl: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "dl") }

    public var dt: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "dt") }

    public var dd: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "dd") }

    public var label: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "label") }

    public var title: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "title") }

    public var script: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "script") }

    public var blockquote: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "blockquote") }

    public var code: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "code") }

    public var samp: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "samp") }

    public var abbr: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "abbr") }

    public var table: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "table") }

    public var th: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "th") }

    public var tr: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "tr") }

    public var td: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "td") }

    public var thead: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "thead") }

    public var tbody: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "tbody") }

    public var tfoot: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "tfoot") }

    public var textarea: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "textarea") }

    public var legend: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "legend") }

    public var fieldset: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "fieldset") }

    public var output: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "output") }

    public var datalist: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "datalist") }

    public var option: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "option") }

    public var optgroup: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "optgroup") }

    public var select: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "select") }

    public var iframe: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "iframe") }

    public var map: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "map") }

    public var canvas: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "canvas") }

    public var figure: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "figure") }

    public var figcaption: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "figcaption") }

    public var picture: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "picture") }

    public var svg: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "svg") }

    public var caption: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "caption") }

    public var colgroup: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "colgroup") }

    public var main: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "main") }

    public var section: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "sectino") }

    public var article: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "article") }

    public var aside: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "aside") }

    public var details: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "details") }

    public var summary: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "summary") }

    public var dialog: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "dialog") }

    public var data: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "data") }

    public var nav: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "nav") }

    public var audio: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "audio") }

    public var video: HTML.ContentNode<Self> { return HTML.ContentNode<Self>(name: "video") }
}

extension ContextualTemplate {

    public var link: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "link") }

    public var stylesheet: HTML.DataNode<Self> { return link.rel("stylesheet") }

    public var meta: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "meta") }

    public var img: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "img") }

    public var input: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "input") }

    public var area: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "area") }

    public var col: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "col") }

    public var base: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "base") }

    public var param: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "param") }

    public var embed: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "embed") }

    public var source: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "source") }

    public var track: HTML.DataNode<Self> { return HTML.DataNode<Self>(name: "track") }
}

extension TemplateBuilder {

    /// Creates a doctype tag
    ///
    /// - Parameter type: the type of document
    /// - Returns: A ductype node
    public func doctype(_ type: String = "html") -> CompiledTemplate {
        return "<!doctype \(type)>"
    }

    /// Creates a comment
    ///
    /// - Parameter comment: The comment to create
    /// - Returns: A comment node
    public func comment(_ comment: String) -> CompiledTemplate {
        return "<!-- \(comment) -->"
    }

    /// The </br> tag
    public var br: CompiledTemplate { return "<br>" }
}
