
/// Used to create a html view in with inn an instance
/// Example when building a `Viewable`
public protocol ViewBuildable { }

extension ViewBuildable {

    public func body(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "body", attributes: attributes, content: children)
    }

    public func form(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "form", attributes: attributes, content: children)
    }

    public func small(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "small", attributes: attributes, content: children)
    }

    public func footer(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "footer", attributes: attributes, content: children)
    }

    public func head(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "head", attributes: attributes, content: children)
    }

    public func p(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "p", attributes: attributes, content: children)
    }

    public func html(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public func button(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public func div(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "div", attributes: attributes, content: children)
    }

    public func h1(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h1", attributes: attributes, content: children)
    }

    public func h2(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h2", attributes: attributes, content: children)
    }

    public func h3(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h3", attributes: attributes, content: children)
    }

    public func h4(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h4", attributes: attributes, content: children)
    }

    public func h5(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h5", attributes: attributes, content: children)
    }

    public func h6(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "h6", attributes: attributes, content: children)
    }

    public func span(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "span", attributes: attributes, content: children)
    }

    public func i(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "i", attributes: attributes, content: children)
    }

    public func b(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public func a(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public func a(href: String, attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "b", attributes: [.href(href)] + attributes, content: children)
    }

    public func ol(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "ol", attributes: attributes, content: children)
    }

    public func ul(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "ul", attributes: attributes, content: children)
    }

    public func li(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "li", attributes: attributes, content: children)
    }

    public func label(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "label", attributes: attributes, content: children)
    }

    public func title(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "title", attributes: attributes, content: children)
    }

    public func script(attr attributes: [HTML.AttributeNode] = [], _ children: Mappable...) -> Mappable {
        return HTML.ContentNode(nodeName: "script", attributes: attributes, content: children)
    }
}

extension ViewBuildable {
    public func comment(_ comment: String) -> Mappable {
        return "<!-- \(comment) -->"
    }
}


extension ViewBuildable {

    public func stylesheet(href: String, attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "link", attributes: [.href(href), .rel("stylesheet")] + attributes)
    }

    public func link(attr attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "link", attributes: attributes)
    }

    public func link(href: String, attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "link", attributes: [.href(href)] + attributes)
    }

    public func meta(attr attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "meta", attributes: attributes)
    }

    public func meta(name: String, content: String, attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "meta", attributes: [.name(name), .content(content)] + attributes)
    }

    public func img(attr attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "img", attributes: attributes)
    }

    public func img(src: String, attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "img", attributes: [.src(src)] + attributes)
    }

    public func input(attr attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.DataNode(nodeName: "input", attributes: attributes)
    }

    public func script(attr attributes: HTML.AttributeNode...) -> Mappable {
        return HTML.ContentNode(nodeName: "input", attributes: attributes, content: "")
    }
}
