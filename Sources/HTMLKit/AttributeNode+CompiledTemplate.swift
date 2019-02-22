
extension HTML.AttributeNode: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        if let value = value {
            return try "\(attribute)='\(value.render(with: manager))'"
        } else {
            return "\(attribute)"
        }
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: attribute)
        if let value = value {
            formula.add(string: "='")
            try value.brew(formula)
            formula.add(string: "'")
        }
    }
}
