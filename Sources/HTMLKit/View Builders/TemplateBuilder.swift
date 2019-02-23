
public protocol TemplateBuilder: CompiledTemplate {
    
    /// Builds the view
    ///
    /// - Returns: a view that conforms to `Mappable`
    func build() -> CompiledTemplate
}

extension TemplateBuilder {
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        try build().brew(formula)
    }

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try build().render(with: manager)
    }
}


extension TemplateBuilder {

    public var div: HTML.ContentNode { return HTML.ContentNode(nodeName: "div") }

    public var body: HTML.ContentNode { return HTML.ContentNode(nodeName: "body") }

    public var form: HTML.ContentNode { return HTML.ContentNode(nodeName: "form") }

    public var small: HTML.ContentNode { return HTML.ContentNode(nodeName: "small") }

    public var footer: HTML.ContentNode { return HTML.ContentNode(nodeName: "footer") }

    public var head: HTML.ContentNode { return HTML.ContentNode(nodeName: "head") }

    public var p: HTML.ContentNode { return HTML.ContentNode(nodeName: "p") }

    public var html: HTML.ContentNode { return HTML.ContentNode(nodeName: "html") }

    public var button: HTML.ContentNode { return HTML.ContentNode(nodeName: "button") }

    public var h1: HTML.ContentNode { return HTML.ContentNode(nodeName: "h1") }

    public var h2: HTML.ContentNode { return HTML.ContentNode(nodeName: "h2") }

    public var h3: HTML.ContentNode { return HTML.ContentNode(nodeName: "h3") }

    public var h4: HTML.ContentNode { return HTML.ContentNode(nodeName: "h4") }

    public var h5: HTML.ContentNode { return HTML.ContentNode(nodeName: "h5") }

    public var h6: HTML.ContentNode { return HTML.ContentNode(nodeName: "h6") }

    public var span: HTML.ContentNode { return HTML.ContentNode(nodeName: "span") }

    public var i: HTML.ContentNode { return HTML.ContentNode(nodeName: "i") }

    public var b: HTML.ContentNode { return HTML.ContentNode(nodeName: "b") }

    public var strong: HTML.ContentNode { return HTML.ContentNode(nodeName: "strong") }

    public var u: HTML.ContentNode { return HTML.ContentNode(nodeName: "u") }

    public var em: HTML.ContentNode { return HTML.ContentNode(nodeName: "em") }

    public var a: HTML.ContentNode { return HTML.ContentNode(nodeName: "a") }

    public var ol: HTML.ContentNode { return HTML.ContentNode(nodeName: "ol") }
    
    public var ul: HTML.ContentNode { return HTML.ContentNode(nodeName: "ul") }

    public var li: HTML.ContentNode { return HTML.ContentNode(nodeName: "li") }

    public var dl: HTML.ContentNode { return HTML.ContentNode(nodeName: "dl") }

    public var dt: HTML.ContentNode { return HTML.ContentNode(nodeName: "dt") }

    public var dd: HTML.ContentNode { return HTML.ContentNode(nodeName: "dd") }

    public var label: HTML.ContentNode { return HTML.ContentNode(nodeName: "label") }

    public var title: HTML.ContentNode { return HTML.ContentNode(nodeName: "title") }

    public var script: HTML.ContentNode { return HTML.ContentNode(nodeName: "script") }

    public var blockquote: HTML.ContentNode { return HTML.ContentNode(nodeName: "blockquote") }

    public var code: HTML.ContentNode { return HTML.ContentNode(nodeName: "code") }

    public var samp: HTML.ContentNode { return HTML.ContentNode(nodeName: "samp") }

    public var abbr: HTML.ContentNode { return HTML.ContentNode(nodeName: "abbr") }

    public var table: HTML.ContentNode { return HTML.ContentNode(nodeName: "table") }

    public var th: HTML.ContentNode { return HTML.ContentNode(nodeName: "th") }

    public var tr: HTML.ContentNode { return HTML.ContentNode(nodeName: "tr") }

    public var td: HTML.ContentNode { return HTML.ContentNode(nodeName: "td") }

    public var thead: HTML.ContentNode { return HTML.ContentNode(nodeName: "thead") }

    public var tbody: HTML.ContentNode { return HTML.ContentNode(nodeName: "tbody") }

    public var tfoot: HTML.ContentNode { return HTML.ContentNode(nodeName: "tfoot") }

    public var textarea: HTML.ContentNode { return HTML.ContentNode(nodeName: "textarea") }

    public var legend: HTML.ContentNode { return HTML.ContentNode(nodeName: "legend") }

    public var fieldset: HTML.ContentNode { return HTML.ContentNode(nodeName: "fieldset") }

    public var output: HTML.ContentNode { return HTML.ContentNode(nodeName: "output") }

    public var datalist: HTML.ContentNode { return HTML.ContentNode(nodeName: "datalist") }

    public var option: HTML.ContentNode { return HTML.ContentNode(nodeName: "option") }

    public var optgroup: HTML.ContentNode { return HTML.ContentNode(nodeName: "optgroup") }

    public var select: HTML.ContentNode { return HTML.ContentNode(nodeName: "select") }

    public var iframe: HTML.ContentNode { return HTML.ContentNode(nodeName: "iframe") }

    public var map: HTML.ContentNode { return HTML.ContentNode(nodeName: "map") }

    public var canvas: HTML.ContentNode { return HTML.ContentNode(nodeName: "canvas") }

    public var figure: HTML.ContentNode { return HTML.ContentNode(nodeName: "figure") }

    public var figcaption: HTML.ContentNode { return HTML.ContentNode(nodeName: "figcaption") }

    public var picture: HTML.ContentNode { return HTML.ContentNode(nodeName: "picture") }

    public var svg: HTML.ContentNode { return HTML.ContentNode(nodeName: "svg") }

    public var caption: HTML.ContentNode { return HTML.ContentNode(nodeName: "caption") }

    public var colgroup: HTML.ContentNode { return HTML.ContentNode(nodeName: "colgroup") }

    public var main: HTML.ContentNode { return HTML.ContentNode(nodeName: "main") }

    public var section: HTML.ContentNode { return HTML.ContentNode(nodeName: "sectino") }

    public var article: HTML.ContentNode { return HTML.ContentNode(nodeName: "article") }

    public var aside: HTML.ContentNode { return HTML.ContentNode(nodeName: "aside") }

    public var details: HTML.ContentNode { return HTML.ContentNode(nodeName: "details") }

    public var summary: HTML.ContentNode { return HTML.ContentNode(nodeName: "summary") }

    public var dialog: HTML.ContentNode { return HTML.ContentNode(nodeName: "dialog") }

    public var data: HTML.ContentNode { return HTML.ContentNode(nodeName: "data") }

    public var nav: HTML.ContentNode { return HTML.ContentNode(nodeName: "nav") }

    public var audio: HTML.ContentNode { return HTML.ContentNode(nodeName: "audio") }

    public var video: HTML.ContentNode { return HTML.ContentNode(nodeName: "video") }
}

extension TemplateBuilder {

    public var link: HTML.DataNode { return HTML.DataNode(nodeName: "link") }

    public var stylesheet: HTML.DataNode { return link.rel("stylesheet") }

    public var meta: HTML.DataNode { return HTML.DataNode(nodeName: "meta") }

    public var img: HTML.DataNode { return HTML.DataNode(nodeName: "img") }

    public var input: HTML.DataNode { return HTML.DataNode(nodeName: "input") }

    public var area: HTML.DataNode { return HTML.DataNode(nodeName: "area") }

    public var col: HTML.DataNode { return HTML.DataNode(nodeName: "col") }

    public var base: HTML.DataNode { return HTML.DataNode(nodeName: "base") }

    public var param: HTML.DataNode { return HTML.DataNode(nodeName: "param") }

    public var embed: HTML.DataNode { return HTML.DataNode(nodeName: "embed") }

    public var source: HTML.DataNode { return HTML.DataNode(nodeName: "source") }

    public var track: HTML.DataNode { return HTML.DataNode(nodeName: "track") }
}

extension TemplateBuilder {

    public func doctype(_ type: String = "html") -> CompiledTemplate {
        return "<!doctype \(type)>"
    }

    public func comment(_ comment: String) -> CompiledTemplate {
        return "<!-- \(comment) -->"
    }

    public var br: CompiledTemplate { return "<br>" }
}
