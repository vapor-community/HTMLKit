
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

    public var a: HTML.ContentNode { return HTML.ContentNode(nodeName: "a") }

    public var ol: HTML.ContentNode { return HTML.ContentNode(nodeName: "ol") }
    
    public var ul: HTML.ContentNode { return HTML.ContentNode(nodeName: "ul") }

    public var li: HTML.ContentNode { return HTML.ContentNode(nodeName: "li") }

    public var label: HTML.ContentNode { return HTML.ContentNode(nodeName: "label") }

    public var title: HTML.ContentNode { return HTML.ContentNode(nodeName: "title") }

    public var script: HTML.ContentNode { return HTML.ContentNode(nodeName: "script") }
}

extension TemplateBuilder {

    public var link: HTML.DataNode { return HTML.DataNode(nodeName: "link") }

    public var stylesheet: HTML.DataNode { return link.rel("stylesheet") }

    public var meta: HTML.DataNode { return HTML.DataNode(nodeName: "meta") }

    public var img: HTML.DataNode { return HTML.DataNode(nodeName: "img") }

    public var input: HTML.DataNode { return HTML.DataNode(nodeName: "input") }
}

extension TemplateBuilder {
    public func comment(_ comment: String) -> CompiledTemplate {
        return "<!-- \(comment) -->"
    }
}
