public protocol HTMLProperty: Codable {}

@dynamicMemberLookup
public struct HTMLContext<T: HTMLProperty> {
    internal let path: [String]
    
    public init() {
        path = []
    }
    
    public subscript<V: HTMLProperty>(dynamicMember keyPath: KeyPath<T, V>) -> HTMLContext<V> {
        return HTMLContext<V>()
    }
}

extension HTMLContext {
    public func forEach<Property: HTMLProperty, V: _HTML>(
        @TemplateBuilder<Scopes.Body> content: (HTMLContext<Property>) -> V
    ) -> AnyHTML<V.HTMLScope>
        where T: Sequence, T.Element == Property, V.HTMLScope: Scopes.Body
    {
        let html = content(.init())
        let node = TemplateNode(from: html)
        
        return AnyHTML(
            node: .computedList(path, node)
        )
    }
}

extension Array: HTMLProperty where Element: HTMLProperty {}
extension HTMLContext: _HTML {
    public typealias Content = AnyHTML
    public typealias HTMLScope = Scopes.Anywhere
    
    public var html: AnyHTML<Scopes.Anywhere> {
        return .init(node: .contextValue(path))
    }
}
