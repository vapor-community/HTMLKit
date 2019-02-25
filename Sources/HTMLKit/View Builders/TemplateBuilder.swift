
/// A protocol that makes it possible to render HTML views
public protocol TemplateBuilder: CompiledTemplate {
    
    /// Builds the view
    ///
    /// - Returns: a view that conforms to `Mappable`
    func build() -> CompiledTemplate
}

extension TemplateBuilder {

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        try build().brew(formula)
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try build().render(with: manager)
    }
}


extension TemplateBuilder {

    public var div: HTML.ContentNode { return HTML.ContentNode(name: "div") }

    public var body: HTML.ContentNode { return HTML.ContentNode(name: "body") }

    public var form: HTML.ContentNode { return HTML.ContentNode(name: "form") }

    public var small: HTML.ContentNode { return HTML.ContentNode(name: "small") }

    public var footer: HTML.ContentNode { return HTML.ContentNode(name: "footer") }

    public var head: HTML.ContentNode { return HTML.ContentNode(name: "head") }

    public var p: HTML.ContentNode { return HTML.ContentNode(name: "p") }

    public var html: HTML.ContentNode { return HTML.ContentNode(name: "html") }

    public var button: HTML.ContentNode { return HTML.ContentNode(name: "button") }

    public var h1: HTML.ContentNode { return HTML.ContentNode(name: "h1") }

    public var h2: HTML.ContentNode { return HTML.ContentNode(name: "h2") }

    public var h3: HTML.ContentNode { return HTML.ContentNode(name: "h3") }

    public var h4: HTML.ContentNode { return HTML.ContentNode(name: "h4") }

    public var h5: HTML.ContentNode { return HTML.ContentNode(name: "h5") }

    public var h6: HTML.ContentNode { return HTML.ContentNode(name: "h6") }

    public var span: HTML.ContentNode { return HTML.ContentNode(name: "span") }

    public var i: HTML.ContentNode { return HTML.ContentNode(name: "i") }

    public var b: HTML.ContentNode { return HTML.ContentNode(name: "b") }

    public var strong: HTML.ContentNode { return HTML.ContentNode(name: "strong") }

    public var u: HTML.ContentNode { return HTML.ContentNode(name: "u") }

    public var em: HTML.ContentNode { return HTML.ContentNode(name: "em") }

    public var a: HTML.ContentNode { return HTML.ContentNode(name: "a") }

    public var ol: HTML.ContentNode { return HTML.ContentNode(name: "ol") }
    
    public var ul: HTML.ContentNode { return HTML.ContentNode(name: "ul") }

    public var li: HTML.ContentNode { return HTML.ContentNode(name: "li") }

    public var dl: HTML.ContentNode { return HTML.ContentNode(name: "dl") }

    public var dt: HTML.ContentNode { return HTML.ContentNode(name: "dt") }

    public var dd: HTML.ContentNode { return HTML.ContentNode(name: "dd") }

    public var label: HTML.ContentNode { return HTML.ContentNode(name: "label") }

    public var title: HTML.ContentNode { return HTML.ContentNode(name: "title") }

    public var script: HTML.ContentNode { return HTML.ContentNode(name: "script") }

    public var blockquote: HTML.ContentNode { return HTML.ContentNode(name: "blockquote") }

    public var code: HTML.ContentNode { return HTML.ContentNode(name: "code") }

    public var samp: HTML.ContentNode { return HTML.ContentNode(name: "samp") }

    public var abbr: HTML.ContentNode { return HTML.ContentNode(name: "abbr") }

    public var table: HTML.ContentNode { return HTML.ContentNode(name: "table") }

    public var th: HTML.ContentNode { return HTML.ContentNode(name: "th") }

    public var tr: HTML.ContentNode { return HTML.ContentNode(name: "tr") }

    public var td: HTML.ContentNode { return HTML.ContentNode(name: "td") }

    public var thead: HTML.ContentNode { return HTML.ContentNode(name: "thead") }

    public var tbody: HTML.ContentNode { return HTML.ContentNode(name: "tbody") }

    public var tfoot: HTML.ContentNode { return HTML.ContentNode(name: "tfoot") }

    public var textarea: HTML.ContentNode { return HTML.ContentNode(name: "textarea") }

    public var legend: HTML.ContentNode { return HTML.ContentNode(name: "legend") }

    public var fieldset: HTML.ContentNode { return HTML.ContentNode(name: "fieldset") }

    public var output: HTML.ContentNode { return HTML.ContentNode(name: "output") }

    public var datalist: HTML.ContentNode { return HTML.ContentNode(name: "datalist") }

    public var option: HTML.ContentNode { return HTML.ContentNode(name: "option") }

    public var optgroup: HTML.ContentNode { return HTML.ContentNode(name: "optgroup") }

    public var select: HTML.ContentNode { return HTML.ContentNode(name: "select") }

    public var iframe: HTML.ContentNode { return HTML.ContentNode(name: "iframe") }

    public var map: HTML.ContentNode { return HTML.ContentNode(name: "map") }

    public var canvas: HTML.ContentNode { return HTML.ContentNode(name: "canvas") }

    public var figure: HTML.ContentNode { return HTML.ContentNode(name: "figure") }

    public var figcaption: HTML.ContentNode { return HTML.ContentNode(name: "figcaption") }

    public var picture: HTML.ContentNode { return HTML.ContentNode(name: "picture") }

    public var svg: HTML.ContentNode { return HTML.ContentNode(name: "svg") }

    public var caption: HTML.ContentNode { return HTML.ContentNode(name: "caption") }

    public var colgroup: HTML.ContentNode { return HTML.ContentNode(name: "colgroup") }

    public var main: HTML.ContentNode { return HTML.ContentNode(name: "main") }

    public var section: HTML.ContentNode { return HTML.ContentNode(name: "sectino") }

    public var article: HTML.ContentNode { return HTML.ContentNode(name: "article") }

    public var aside: HTML.ContentNode { return HTML.ContentNode(name: "aside") }

    public var details: HTML.ContentNode { return HTML.ContentNode(name: "details") }

    public var summary: HTML.ContentNode { return HTML.ContentNode(name: "summary") }

    public var dialog: HTML.ContentNode { return HTML.ContentNode(name: "dialog") }

    public var data: HTML.ContentNode { return HTML.ContentNode(name: "data") }

    public var nav: HTML.ContentNode { return HTML.ContentNode(name: "nav") }

    public var audio: HTML.ContentNode { return HTML.ContentNode(name: "audio") }

    public var video: HTML.ContentNode { return HTML.ContentNode(name: "video") }
}

extension TemplateBuilder {

    public var link: HTML.DataNode { return HTML.DataNode(name: "link") }

    public var stylesheet: HTML.DataNode { return link.rel("stylesheet") }

    public var meta: HTML.DataNode { return HTML.DataNode(name: "meta") }

    public var img: HTML.DataNode { return HTML.DataNode(name: "img") }

    public var input: HTML.DataNode { return HTML.DataNode(name: "input") }

    public var area: HTML.DataNode { return HTML.DataNode(name: "area") }

    public var col: HTML.DataNode { return HTML.DataNode(name: "col") }

    public var base: HTML.DataNode { return HTML.DataNode(name: "base") }

    public var param: HTML.DataNode { return HTML.DataNode(name: "param") }

    public var embed: HTML.DataNode { return HTML.DataNode(name: "embed") }

    public var source: HTML.DataNode { return HTML.DataNode(name: "source") }

    public var track: HTML.DataNode { return HTML.DataNode(name: "track") }
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
