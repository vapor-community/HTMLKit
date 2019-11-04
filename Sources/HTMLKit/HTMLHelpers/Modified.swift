public struct Modified<BaseTag: AttributedHTML>: AttributedHTML where BaseTag.HTMLScope: Scopes.Body {
    public typealias Content = AnyBodyTag
    public typealias HTMLScope = BaseTag.HTMLScope

    let tag: StaticString
    let modifiers: [Modifier]
    let baseNode: TemplateNode
    
    var node: TemplateNode {
        .tag(name: tag, content: baseNode, modifiers: modifiers)
    }
    
    public var html: AnyBodyTag<HTMLScope> { AnyBodyTag<HTMLScope>(tag, content: node, modifiers: modifiers) }
    
    public func attribute(key: String, value: String) -> Modified<BaseTag> {
        var modifiers = self.modifiers
        modifiers.append(
            .attribute(name: key, value: value)
        )
        
        return Modified(
            tag: tag,
            modifiers: modifiers,
            baseNode: baseNode
        )
    }
}

extension Array where Element == Modifier {
    var string: String {
        var string = ""
        
        for element in self {
            if case .attribute(let name, let value) = element {
                string += " \(name)=\"\(value)\""
            }
        }
        
        return string
    }
}
