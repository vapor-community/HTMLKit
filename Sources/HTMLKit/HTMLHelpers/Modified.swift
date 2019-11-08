public struct Modified<BaseTag: AttributedHTML>: AttributedHTML {
    public typealias HTMLScope = Scopes.Body
    
    public typealias Content = AnyBodyTag

    let tag: StaticString
    let modifiers: [Modifier]
    let baseNode: TemplateNode
    
    public var html: AnyBodyTag { AnyBodyTag(tag, content: baseNode, modifiers: modifiers) }
    
    public func attribute(key: String, value: TemplateValue) -> Modified<BaseTag> {
        var modifiers = self.modifiers
        modifiers.append(
            .attribute(name: key, value: value.value)
        )
        
        return Modified(
            tag: tag,
            modifiers: modifiers,
            baseNode: baseNode
        )
    }
}

extension Array where Element == Modifier {

    func makeTemplateNode() -> TemplateNode {
        var node: TemplateNode = .none
        for element in self {
            if case .attribute(let name, let value) = element {
                switch node {
                case .none:
                    switch value {
                    case .literal(let literal): node = .literal(" \(name)=\"\(literal)\"")
                    case .runtime(let path):    node = .contextValue(path, broken: false)
                    }
                case .literal(let currentNode):
                    switch value {
                    case .literal(let literal): node = .literal(currentNode + " \(name)=\"\(literal)\"")
                    case .runtime(let path):    node = .list([
                        .literal(currentNode),
                        .contextValue(path, broken: false)
                    ])
                    }
                case .contextValue(_):
                    switch value {
                    case .literal(let literal): node = .list([
                        node,
                        .literal(literal)
                    ])
                    case .runtime(let path):    node = .list([
                        node,
                        .contextValue(path, broken: false)
                    ])
                    }
                case .list(let nodes):
                    switch value {
                    case .literal(let literal):
                        node = .list(
                            nodes + [
                            .literal(" \(name)=\"\(literal)\"")
                        ])
                    case .runtime(let path):
                        node = .list(
                            nodes + [
                            .contextValue(path, broken: false)
                        ])
                    }
                default: fatalError()
                }
            }
        }
        return node
    }
}
