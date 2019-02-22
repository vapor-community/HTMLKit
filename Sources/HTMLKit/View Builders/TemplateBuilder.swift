
public protocol TemplateBuilder { }

public protocol StaticBuild: TemplateBuilder {
    static func build() -> CompiledTemplate
}


extension TemplateBuilder {

    public static var div: HTML.ContentNode { return HTML.ContentNode(nodeName: "div") }

    public static var body: HTML.ContentNode { return HTML.ContentNode(nodeName: "body") }

    public static var form: HTML.ContentNode { return HTML.ContentNode(nodeName: "form") }

    public static var small: HTML.ContentNode { return HTML.ContentNode(nodeName: "small") }

    public static var footer: HTML.ContentNode { return HTML.ContentNode(nodeName: "footer") }

    public static var head: HTML.ContentNode { return HTML.ContentNode(nodeName: "head") }

    public static var p: HTML.ContentNode { return HTML.ContentNode(nodeName: "p") }

    public static var html: HTML.ContentNode { return HTML.ContentNode(nodeName: "html") }

    public static var button: HTML.ContentNode { return HTML.ContentNode(nodeName: "html") }

    public static var h1: HTML.ContentNode { return HTML.ContentNode(nodeName: "h1") }

    public static var h2: HTML.ContentNode { return HTML.ContentNode(nodeName: "h2") }

    public static var h3: HTML.ContentNode { return HTML.ContentNode(nodeName: "h3") }

    public static var h4: HTML.ContentNode { return HTML.ContentNode(nodeName: "h4") }

    public static var h5: HTML.ContentNode { return HTML.ContentNode(nodeName: "h5") }

    public static var h6: HTML.ContentNode { return HTML.ContentNode(nodeName: "h6") }

    public static var span: HTML.ContentNode { return HTML.ContentNode(nodeName: "span") }

    public static var i: HTML.ContentNode { return HTML.ContentNode(nodeName: "i") }

    public static var b: HTML.ContentNode { return HTML.ContentNode(nodeName: "b") }

    public static var a: HTML.ContentNode { return HTML.ContentNode(nodeName: "a") }

    public static var ol: HTML.ContentNode { return HTML.ContentNode(nodeName: "ol") }
    
    public static var ul: HTML.ContentNode { return HTML.ContentNode(nodeName: "ul") }

    public static var li: HTML.ContentNode { return HTML.ContentNode(nodeName: "li") }

    public static var label: HTML.ContentNode { return HTML.ContentNode(nodeName: "label") }

    public static var title: HTML.ContentNode { return HTML.ContentNode(nodeName: "title") }

    public static var script: HTML.ContentNode { return HTML.ContentNode(nodeName: "script") }
}

extension TemplateBuilder {

    public static var link: HTML.DataNode { return HTML.DataNode(nodeName: "link") }

    public static var stylesheet: HTML.DataNode { return link.rel("stylesheet") }

    public static var meta: HTML.DataNode { return HTML.DataNode(nodeName: "meta") }

    public static var img: HTML.DataNode { return HTML.DataNode(nodeName: "img") }

    public static var input: HTML.DataNode { return HTML.DataNode(nodeName: "input") }
}

extension TemplateBuilder {
    public static func comment(_ comment: String) -> CompiledTemplate {
        return "<!-- \(comment) -->"
    }
}


extension TemplateBuilder {
    public static func embed(static template: StaticBuild.Type) -> CompiledTemplate {
        return template.build()
    }
}
