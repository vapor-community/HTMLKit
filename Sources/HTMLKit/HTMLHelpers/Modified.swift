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
    func makeString() -> String? {
        var string = ""
        
        for element in self {
            if case .attribute(let name, let value) = element {
                guard case .literal(let literal) = value else {
                    return nil
                }
                
                string += " \(name)=\"\(literal)\""
            }
        }
        
        return string
    }
}
