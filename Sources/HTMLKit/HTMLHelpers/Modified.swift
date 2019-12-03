public struct Modified<BaseTag: AttributedHTML>: AttributedHTML {
    public typealias HTMLScope = Scopes.Body
    
    public typealias Content = AnyBodyTag
    
    let tag: StaticString
    let modifiers: [_Modifier]
    let baseNode: TemplateNode?
    
    public var html: AnyBodyTag { AnyBodyTag(tag, content: baseNode, modifiers: modifiers) }
    
    public func modify(with modifier: Modifier) -> Modified<BaseTag> {
        var modifiers = self.modifiers
        modifiers.append(modifier.modifier)
        
        return Modified(
            tag: tag,
            modifiers: modifiers,
            baseNode: baseNode
        )
    }
    
    public func attribute<Value: TemplateValueRepresentable>(key: String, value: Value) -> Modified<BaseTag> {
        self.modify(with: Modifier(modifier: .attribute(name: key, value: value.makeTemplateValue())))
    }
}

extension Array where Element == _Modifier {
    func makeTemplateNode() -> TemplateNode {
        var node: TemplateNode = .noContent
        for element in self {
            if case .attribute(let name, let value) = element {
                switch node {
                case .noContent:
                    switch value.storage {
                    case .compileTime(let literal):
                        switch literal.storage {
                        case .boolean(let boolean):
                            node = .literal(" \(name)=\"\(boolean)\"")
                        case .string(let string):
                            node = .literal(" \(name)=\"\(string)\"")
                        }
                    case .runtime(let runtimeValue):
                        node = .list([
                            .literal(" \(name)=\""),
                            .contextValue(runtimeValue),
                            .literal("\"")
                        ])
                    }
                case .literal(let currentNode):
                    switch value.storage {
                    case .compileTime(let literal):
                        switch literal.storage {
                        case .boolean(let boolean):
                            node = .literal(currentNode + " \(name)=\"\(boolean)\"")
                        case .string(let string):
                            node = .literal(currentNode + " \(name)=\"\(string)\"")
                        }
                    case .runtime(let runtimeValue):
                        node = .list([
                            .literal("\(currentNode) \(name)=\""),
                            .contextValue(runtimeValue),
                            .literal("\"")
                        ])
                    }
                case .list(let nodes):
                    switch value.storage {
                    case .compileTime(let literal):
                        switch literal.storage {
                        case .boolean(let boolean):
                            node = .list(
                                nodes + [
                                    .literal(" \(name)=\"\(boolean)\"")
                                ]
                            )
                        case .string(let string):
                            node = .list(
                                nodes + [
                                    .literal(" \(name)=\"\(string)\"")
                                ]
                            )
                        }
                    case .runtime(let runtimeValue):
                        node = .list(
                            nodes + [
                                .literal(" \(name)=\""),
                                .contextValue(runtimeValue),
                                .literal("\"")
                            ])
                    }
                default: fatalError()
                }
            }
        }
        return node
    }
}
