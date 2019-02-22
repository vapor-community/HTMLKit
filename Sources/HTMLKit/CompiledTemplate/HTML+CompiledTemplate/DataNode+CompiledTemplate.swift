/// Makes the node renderable
extension HTML.DataNode: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try "<\(nodeName)" + attributes.reduce("") { try $0 + " \($1.render(with: manager))" } + "/>"
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: "<\(nodeName)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.brew(formula)
        }
        formula.add(string: "/>")
    }
}

extension HTML.DataNode: AttributableNode {
    func add(_ attribute: HTML.AttributeNode) -> HTML.DataNode {
        return .init(nodeName: nodeName, attributes: attributes + [attribute])
    }
}

