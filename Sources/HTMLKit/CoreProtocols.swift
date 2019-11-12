protocol ContentRepresentable {
    var node: TemplateNode { get }
}

public protocol HTMLScope: AnyObject {}

public enum Scopes {
    public final class Never: HTMLScope {}
    public class Root: HTMLScope {}
    public class Body: HTMLScope {}
    public class Head: HTMLScope {}
}

public protocol _HTML {
    associatedtype Content: _HTML
    associatedtype HTMLScope: HTMLKit.HTMLScope
    
    var html: Content { get }
    func applyStyle(to css: inout CSS)
}

extension _HTML {
    @inlinable
    public func applyStyle(to css: inout CSS) {}
}

public protocol HTML: _HTML where Content.HTMLScope == Scopes.Body, HTMLScope == Scopes.Body {}
public protocol Template: _HTML where HTMLScope == Scopes.Never {
    init()
}

internal protocol HeadElement: _HTML where HTMLScope == Scopes.Head {}
internal protocol BodyTag: _NativeHTMLElement, NodeRepresentedElement {
    init(node: TemplateNode)
}

public protocol AttributedHTML: HTML {
    associatedtype BaseTag: AttributedHTML
    
    func attribute<Value: TemplateValueRepresentable>(key: String, value: Value) -> Modified<BaseTag>
    func modify(with modifier: Modifier) -> Modified<BaseTag>
}

internal protocol NodeRepresentedElement: AttributedHTML where Content == AnyBodyTag, BaseTag == Self {
    var node: TemplateNode { get }
    static var tag: StaticString { get }
}

public protocol _NativeHTMLElement: AttributedHTML {
    init()
    init(@TemplateBuilder<Scopes.Body> build: () -> ListContent<Scopes.Body>)
    init<Element: HTML>(@TemplateBuilder<Scopes.Body> build: () -> Element)
}

extension NodeRepresentedElement {
    public func modify(with modifier: Modifier) -> Modified<BaseTag> {
        return Modified<BaseTag>(
            tag: Self.tag,
            modifiers: [modifier.modifier],
            baseNode: node
        )
    }
    
    public func attribute<Value: TemplateValueRepresentable>(key: String, value: Value) -> Modified<Self> {
        return modify(with: Modifier(modifier: .attribute(name: key, value: value.makeTemplateValue())))
    }
    
    public var html: AnyBodyTag { AnyBodyTag(Self.tag, content: node, modifiers: []) }
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
    public init<Element: _HTML>(
        @TemplateBuilder<Scopes.Body> build: () -> Element
    ) {
        self.init(node: TemplateNode(from: build()))
    }
}

extension Never: HTML {
    public typealias HTMLScope = Scopes.Body
    
    public var html: Never { fatalError() }
}
