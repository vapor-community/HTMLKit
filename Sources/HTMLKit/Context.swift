@dynamicMemberLookup
@propertyWrapper
public struct HTMLContext<Base, Value> {

    internal let contextId: String
    internal let rootId: String
    internal let path: KeyPath<Base, Value>
    public var wrappedValue: HTMLContext<Base, Value> { self }
    
    init(path: KeyPath<Base, Value>, rootId: String? = nil, contextId: String? = nil) {
        self.path = path
        let root = rootId ?? String(reflecting: Base.self)
        self.rootId = root
        self.contextId = contextId ?? ("\(root)-\(String(reflecting: Value.self))")
    }
    
    public subscript<SubValue>(dynamicMember keyPath: KeyPath<Value, SubValue>) -> HTMLContext<Base, SubValue> {
        return HTMLContext<Base, SubValue>(path: path.appending(path: keyPath), rootId: rootId, contextId: contextId)
    }
}

extension HTMLContext where Base == Value {
    public init(_ base: Base.Type) {
        self.init(path: \Base.self)
    }

    internal init(_ base: Base.Type, rootId: String? = nil) {
        self.init(path: \Base.self, rootId: rootId)
    }
}

extension HTMLContext {
    public func forEach<Property, V: _HTML>(
        @TemplateBuilder<Scopes.Body> content: (HTMLContext<Property, Property>) -> V
    ) -> AnyHTML<V.HTMLScope>
        where Value: Sequence, Value.Element == Property, V.HTMLScope: Scopes.Body
    {
        let html = content(.init(Property.self, rootId: "\(contextId)-loop-"))
        let node = TemplateNode(from: html)
        
        return AnyHTML(
            node: .computedList(path, rootId, contextId, node)
        )
    }
}

extension HTMLContext: HTML {
    public typealias Content = AnyHTML
    
    public var html: AnyHTML<Scopes.Body> {
        return .init(node: .contextValue(path, rootId))
    }
}

extension HTMLContext: TemplateValueRepresentable {
    public func makeTemplateValue() -> TemplateValue {
        TemplateValue(keyPath: path)
    }
}
