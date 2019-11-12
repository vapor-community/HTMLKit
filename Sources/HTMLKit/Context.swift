@dynamicMemberLookup
@propertyWrapper
public struct HTMLContext<Base, Value> {
    internal let path: KeyPath<Base, Value>
    public var wrappedValue: HTMLContext<Base, Value> { self }
    
    init(path: KeyPath<Base, Value>) {
        self.path = path
    }
    
    public subscript<SubValue>(dynamicMember keyPath: KeyPath<Value, SubValue>) -> HTMLContext<Base, SubValue> {
        HTMLContext<Base, SubValue>(path: path.appending(path: keyPath))
    }
}

extension HTMLContext where Base == Value {
    public init(_ base: Base.Type) {
        self.init(path: \Base.self)
    }
}

extension HTMLContext {
    public func forEach<Property, V: _HTML>(
        @TemplateBuilder<Scopes.Body> content: (HTMLContext<Property, Property>) -> V
    ) -> AnyHTML<V.HTMLScope>
        where Value: Sequence, Value.Element == Property, V.HTMLScope: Scopes.Body
    {
        let html = content(.init(Property.self))
        let node = TemplateNode(from: html)
        
        return AnyHTML(
            node: .computedList(path, node)
        )
    }
}

extension HTMLContext: HTML {
    public typealias Content = AnyHTML
    
    public var html: AnyHTML<Scopes.Body> {
        return .init(node: .contextValue(path))
    }
}

extension HTMLContext: TemplateValueRepresentable {
    public func makeTemplateValue() -> TemplateValue {
        TemplateValue(keyPath: path)
    }
}
