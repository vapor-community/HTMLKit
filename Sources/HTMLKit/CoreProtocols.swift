protocol ContentRepresentable {
    var node: TemplateNode { get }
}

public protocol HTMLScope {}

public enum Scopes {
    public class Anywhere: HTMLScope {}
    public class Root: Anywhere {}
    public class Body: Anywhere {}
    public class Head: Anywhere {}
}

public protocol _HTML {
    associatedtype Content: _HTML
    associatedtype HTMLScope
    
    var html: Content { get }
}

public protocol HTML: _HTML where HTMLScope: Scopes.Body, Content.HTMLScope: Scopes.Body {}
public protocol Template: _HTML where HTMLScope == Never {
    init()
}

internal protocol HeadElement: _HTML where HTMLScope == Scopes.Head {}
internal protocol BodyTag: _NativeHTMLElement, NodeRepresentedElement where HTMLScope == Scopes.Body {
    init(node: TemplateNode)
}

public protocol AttributedHTML: HTML {
    associatedtype BaseTag: AttributedHTML
    
    func attribute(key: String, value: String) -> Modified<BaseTag>
}

internal protocol NodeRepresentedElement: AttributedHTML where Content == AnyBodyTag<HTMLScope>, BaseTag == Self {
    var node: TemplateNode { get }
    static var tag: StaticString { get }
}

public protocol _NativeHTMLElement: AttributedHTML {
    init()
    init(@TemplateBuilder<Scopes.Body> build: () -> ListContent<Scopes.Body>)
    init<Element: HTML>(@TemplateBuilder<Scopes.Body> build: () -> Element)
}

extension NodeRepresentedElement {
    public func attribute(key: String, value: String) -> Modified<Self> {
        return Modified<BaseTag>(
            tag: Self.tag,
            modifiers: [
                .attribute(name: key, value: value)
            ],
            baseNode: node
        )
    }
    
    public var html: AnyBodyTag<HTMLScope> { AnyBodyTag<HTMLScope>(Self.tag, content: node, modifiers: []) }
}

extension BodyTag {
    @inlinable
    public init() {
        self.init(node: .none)
    }
    
    @inlinable
    public init(
        @TemplateBuilder<Scopes.Body> build: () -> ListContent<Scopes.Body>
    ) {
        self.init(node: TemplateNode(from: build()))
    }
    
    @inlinable
    public init<Element: HTML>(
        @TemplateBuilder<Scopes.Body> build: () -> Element
    ) {
        self.init(node: TemplateNode(from: build()))
    }
}

extension Never: _HTML {
    public typealias HTMLScope = Scopes.Anywhere
    
    public var html: Never { fatalError() }
}
