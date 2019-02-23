
extension HTML.ContentNode: CompiledTemplate {

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: "<\(nodeName)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.brew(formula)
        }
        formula.add(string: ">")
        try content.brew(formula)
        formula.add(string: "</\(nodeName)>")
    }

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try "<\(nodeName)"
            + attributes.reduce("") { try $0 + " \($1.render(with: manager))" }
            + ">\(content.render(with: manager))</\(nodeName)>"
    }
}

extension HTML.ContentNode {

    public func child(_ child: CompiledTemplate...) -> CompiledTemplate {
        return HTML.ContentNode(nodeName: nodeName, attributes: attributes, content: child)
    }
}

extension HTML.ContentNode: AttributableNode {
    public func add(_ attribute: HTML.AttributeNode) -> HTML.ContentNode {
        var attributes = self.attributes
        for (index, attr) in attributes.enumerated() {
            if attr.attribute == attribute.attribute {
                guard let value = attr.value, let newValue = attribute.value else {
                    break
                }
                attributes.append(.init(attribute: attr.attribute, value: [value, " ", newValue]))
                attributes.remove(at: index)
                return .init(nodeName: nodeName, attributes: attributes, content: content)
            }
        }
        return .init(nodeName: nodeName, attributes: attributes + [attribute], content: content)
    }
}
