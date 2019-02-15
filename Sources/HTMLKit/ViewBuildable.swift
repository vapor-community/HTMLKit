
/// A Static view
public protocol ViewBuildable { }

extension ViewBuildable {

    public static func body(attributes: [HTML.AttributeNode] = [] , children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "body", attributes: attributes, content: children)
    }

    public static func form(attributes: [HTML.AttributeNode] = [] , children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "form", attributes: attributes, content: children)
    }

    public static func small(attributes: [HTML.AttributeNode] = [] , children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "small", attributes: attributes, content: children)
    }

    public static func footer(attributes: [HTML.AttributeNode] = [] , children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "footer", attributes: attributes, content: children)
    }

    public static func head(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "head", attributes: attributes, content: children)
    }

    public static func p(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "p", attributes: attributes, content: children)
    }

    public static func html(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public static func button(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public static func div(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "div", attributes: attributes, content: children)
    }

    public static func h1(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h1", attributes: attributes, content: children)
    }

    public static func h2(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h2", attributes: attributes, content: children)
    }

    public static func h3(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h3", attributes: attributes, content: children)
    }

    public static func h4(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h4", attributes: attributes, content: children)
    }

    public static func h5(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h5", attributes: attributes, content: children)
    }

    public static func h6(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h6", attributes: attributes, content: children)
    }

    public static func span(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "span", attributes: attributes, content: children)
    }

    public static func i(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "i", attributes: attributes, content: children)
    }

    public static func b(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public static func a(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public static func a(href: String, attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "b", attributes: [.href(href)] + attributes, content: children)
    }

    public static func ol(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "ol", attributes: attributes, content: children)
    }

    public static func ul(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "ul", attributes: attributes, content: children)
    }

    public static func li(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "li", attributes: attributes, content: children)
    }

    public static func label(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "label", attributes: attributes, content: children)
    }

    public static func title(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "title", attributes: attributes, content: children)
    }

    public static func script(attributes: [HTML.AttributeNode] = [], children:Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "script", attributes: attributes, content: children)
    }
}

extension ViewBuildable {
    public static func comment(_ comment: String) -> Mappable {
        return "<!-- \(comment) -->"
    }
}


extension ViewBuildable {

    public static func stylesheet(href: String, attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "link", attributes: [.href(href), .rel("stylesheet")] + attributes)
    }

    public static func link(attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "link", attributes: attributes)
    }

    public static func link(href: String, attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "link", attributes: [.href(href)] + attributes)
    }

    public static func meta(attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "meta", attributes: attributes)
    }

    public static func meta(name: String, content: String, attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "meta", attributes: [.name(name), .content(content)] + attributes)
    }

    public static func img(attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "img", attributes: attributes)
    }

    public static func img(src: String, attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "img", attributes: [.src(src)] + attributes)
    }

    public static func input(attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "input", attributes: attributes)
    }

    public static func script(attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.ContentNode(nodeName: "input", attributes: attributes, content: "")
    }
}


extension ViewBuildable {

    public static func forEach<T>(in collection: [T], render: (Int, T) -> Mappable) -> Mappable {
        return collection.enumerated().map { render($0.offset, $0.element) }
    }

    public static func forEach<T>(in collection: [T], render: (T) -> Mappable) -> Mappable {
        return collection.map { render($0) }
    }
}

extension ViewBuildable {
    public static func embed<T: StaticTemplate>(static view: T.Type) -> Mappable {
        return T.build()
    }
}


