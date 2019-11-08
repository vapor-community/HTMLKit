public protocol HTMLProperty: Codable {}

@dynamicMemberLookup
@propertyWrapper
public struct HTMLContext<T: HTMLProperty> {
    internal let path: [String]
    internal let broken: Bool
    public var wrappedValue: HTMLContext<T> { self }
    
    public init() {
        path = []
        broken = false
    }
    
    public init(_ type: T.Type) {
        self.init()
    }
    
    init(path: [String], broken: Bool) {
        self.path = path
        self.broken = broken
    }
    
    public subscript<V: HTMLProperty>(dynamicMember keyPath: KeyPath<T, V>) -> HTMLContext<V> {
        let extractor = CodingKeyExtractor(type: T.self)
        guard let key = extractor.keyName(forKeyPath: keyPath) else {
            return HTMLContext<V>(path: path, broken: true)
        }
        
        return HTMLContext<V>(path: path + [key], broken: self.broken)
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
extension HTMLContext: HTML {
    public typealias Content = AnyHTML
    
    public var html: AnyHTML<Scopes.Body> {
        return .init(node: .contextValue(path, broken: broken))
    }
}

extension HTMLContext: TemplateValueRepresentable {
    public func makeTemplateValue() -> TemplateValue {
        TemplateValue(value: .runtime(path))
    }
}

extension String: HTMLProperty {}
