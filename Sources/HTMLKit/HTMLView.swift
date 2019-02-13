
/// A protocol that makes it easy to build a html document
public protocol HTMLView: HTMLRepresentable {

    /// Builds a leaf template
    ///
    /// - Returns: A
    /// - Throws: If the build fails for some reason
    func build() throws -> HTMLRepresentable
}

extension HTMLView {
    public func render<T>(for templateType: T.Type, with context: T.Context) throws -> HTML where T : HTMLViewTemplate {
        return try build().render(for: templateType, with: context)
    }

    public func prerender(in builder: HTMLBuilder) throws {
        try build().prerender(in: builder)
    }
}

extension HTMLView {

    public func body(attributes: [HTMLAttributeNode] = [] , children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "body", attributes: attributes, content: children)
    }

    public func form(attributes: [HTMLAttributeNode] = [] , children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "form", attributes: attributes, content: children)
    }

    public func small(attributes: [HTMLAttributeNode] = [] , children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "small", attributes: attributes, content: children)
    }

    public func footer(attributes: [HTMLAttributeNode] = [] , children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "footer", attributes: attributes, content: children)
    }

    public func head(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "head", attributes: attributes, content: children)
    }

    public func p(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "p", attributes: attributes, content: children)
    }

    public func html(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public func button(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public func div(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "div", attributes: attributes, content: children)
    }

    public func h1(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h1", attributes: attributes, content: children)
    }

    public func h2(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h2", attributes: attributes, content: children)
    }

    public func h3(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h3", attributes: attributes, content: children)
    }

    public func h4(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h4", attributes: attributes, content: children)
    }

    public func h5(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h5", attributes: attributes, content: children)
    }

    public func h6(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h6", attributes: attributes, content: children)
    }

    public func span(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "span", attributes: attributes, content: children)
    }

    public func i(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "i", attributes: attributes, content: children)
    }

    public func b(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public func a(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public func a(href: String, attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "b", attributes: [.href(href)] + attributes, content: children)
    }

    public func ol(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "ol", attributes: attributes, content: children)
    }

    public func ul(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "ul", attributes: attributes, content: children)
    }

    public func li(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "li", attributes: attributes, content: children)
    }

    public func label(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "label", attributes: attributes, content: children)
    }

    public func title(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "title", attributes: attributes, content: children)
    }

    public func script(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "script", attributes: attributes, content: children)
    }
}

extension HTMLView {
    public func comment(_ comment: String) -> HTMLRepresentable {
        return "<!-- \(comment) -->"
    }
}


extension HTMLView {

    public func stylesheet(href: String, attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "link", attributes: [.href(href), .rel("stylesheet")] + attributes)
    }

    public func link(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "link", attributes: attributes)
    }

    public func link(href: String, attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "link", attributes: [.href(href)] + attributes)
    }

    public func meta(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "meta", attributes: attributes)
    }

    public func meta(name: String, content: String, attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "meta", attributes: [.name(name), .content(content)] + attributes)
    }

    public func img(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "img", attributes: attributes)
    }

    public func img(src: String, attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "img", attributes: [.src(src)] + attributes)
    }

    public func input(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "input", attributes: attributes)
    }

    public func script(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "input", attributes: attributes, content: "")
    }
}


extension HTMLView {

    public func forEach<T>(in collection: [T], render: (Int, T) -> HTMLRepresentable) -> HTMLRepresentable {
        return collection.enumerated().map { render($0.offset, $0.element) }
    }

    public func forEach<T>(in collection: [T], render: (T) -> HTMLRepresentable) -> HTMLRepresentable {
        return collection.map { render($0) }
    }

    public func forEach<Root, Value>(in collectionPath: KeyPath<Root, [Value]>, render: (Value) -> HTMLRepresentable) -> HTMLRepresentable {
        return ""
    }
}
