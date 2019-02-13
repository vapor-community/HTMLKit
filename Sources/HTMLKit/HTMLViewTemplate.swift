
public protocol HTMLViewTemplate {
    associatedtype Context
    associatedtype ViewContext

    static func build(with context: ViewContext) -> HTMLRepresentable
    static func prebuild(for builder: HTMLBuilder) throws
}

extension HTMLViewTemplate {
    static public func prebuild(for builder: HTMLBuilder) throws {
        fatalError()
    }
}

public struct EmptyContext { }

public protocol HTMLTemplate: HTMLViewTemplate where ViewContext == EmptyContext { }

extension HTMLTemplate {
    static func prebuild(for builder: HTMLBuilder) throws {
        try build(with: .init()).prerender(in: builder)
    }
}


extension HTMLViewTemplate {
    public static func embed<T: HTMLViewTemplate>(_ template: T.Type, with viewContext: T.ViewContext, contextPath: KeyPath<Self.Context, T.Context>) -> HTMLRepresentable {
        return HTMLEmbed<Self, T>(template: template, viewContext: viewContext, contextKeyPath: contextPath)
    }
}

extension HTMLViewTemplate {

    public static func body(attributes: [HTMLAttributeNode] = [] , children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "body", attributes: attributes, content: children)
    }

    public static func form(attributes: [HTMLAttributeNode] = [] , children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "form", attributes: attributes, content: children)
    }

    public static func small(attributes: [HTMLAttributeNode] = [] , children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "small", attributes: attributes, content: children)
    }

    public static func footer(attributes: [HTMLAttributeNode] = [] , children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "footer", attributes: attributes, content: children)
    }

    public static func head(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "head", attributes: attributes, content: children)
    }

    public static func p(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "p", attributes: attributes, content: children)
    }

    public static func html(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public static func button(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "html", attributes: attributes, content: children)
    }

    public static func div(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "div", attributes: attributes, content: children)
    }

    public static func h1(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h1", attributes: attributes, content: children)
    }

    public static func h2(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h2", attributes: attributes, content: children)
    }

    public static func h3(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h3", attributes: attributes, content: children)
    }

    public static func h4(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h4", attributes: attributes, content: children)
    }

    public static func h5(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h5", attributes: attributes, content: children)
    }

    public static func h6(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "h6", attributes: attributes, content: children)
    }

    public static func span(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "span", attributes: attributes, content: children)
    }

    public static func i(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "i", attributes: attributes, content: children)
    }

    public static func b(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public static func a(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "b", attributes: attributes, content: children)
    }

    public static func a(href: String, attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "b", attributes: [.href(href)] + attributes, content: children)
    }

    public static func ol(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "ol", attributes: attributes, content: children)
    }

    public static func ul(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "ul", attributes: attributes, content: children)
    }

    public static func li(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "li", attributes: attributes, content: children)
    }

    public static func label(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "label", attributes: attributes, content: children)
    }

    public static func title(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "title", attributes: attributes, content: children)
    }

    public static func script(attributes: [HTMLAttributeNode] = [], children: HTMLRepresentable...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "script", attributes: attributes, content: children)
    }
}

extension HTMLViewTemplate {
    public static func comment(_ comment: String) -> HTMLRepresentable {
        return "<!-- \(comment) -->"
    }
}


extension HTMLViewTemplate {

    public static func stylesheet(href: String, attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "link", attributes: [.href(href), .rel("stylesheet")] + attributes)
    }

    public static func link(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "link", attributes: attributes)
    }

    public static func link(href: String, attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "link", attributes: [.href(href)] + attributes)
    }

    public static func meta(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "meta", attributes: attributes)
    }

    public static func meta(name: String, content: String, attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "meta", attributes: [.name(name), .content(content)] + attributes)
    }

    public static func img(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "img", attributes: attributes)
    }

    public static func img(src: String, attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "img", attributes: [.src(src)] + attributes)
    }

    public static func input(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLDataNode(nodeName: "input", attributes: attributes)
    }

    public static func script(attributes: HTMLAttributeNode...) -> HTMLRepresentable {
        return HTMLContentNode(nodeName: "input", attributes: attributes, content: "")
    }
}


extension HTMLViewTemplate {

    public static func forEach<T>(in collection: [T], render: (Int, T) -> HTMLRepresentable) -> HTMLRepresentable {
        return collection.enumerated().map { render($0.offset, $0.element) }
    }

    public static func forEach<T>(in collection: [T], render: (T) -> HTMLRepresentable) -> HTMLRepresentable {
        return collection.map { render($0) }
    }

    public static func forEach<Value>(in collectionPath: KeyPath<Self.Context, [Value]>, render: (Value) -> HTMLRepresentable) -> HTMLRepresentable {
        return HTMLForEach<Self, Value>(collectionKeyPath: collectionPath)
    }
}
