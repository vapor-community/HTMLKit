
public protocol CompiledTemplate: BrewableFormula {

    /// Renders a compiled template to a html document
    ///
    /// - Parameter manager: A manager that contains the context
    /// - Returns: A html document
    /// - Throws: If the html can not be rendered for some reason
    func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String
}


extension Array: BrewableFormula where Element == CompiledTemplate {

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        try forEach { try $0.brew(formula) }
    }
}

extension Array: CompiledTemplate where Element == CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }
}

extension String: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return self
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: self)
    }
}

extension Int: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: String(self))
    }
}

extension Bool: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: String(self))
    }
}


extension Optional: BrewableFormula where Wrapped: BrewableFormula {
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        switch self {
        case .some(let wrapped): try wrapped.brew(formula)
        default: break
        }
    }
}

extension Optional: CompiledTemplate where Wrapped: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        switch self {
        case .none: return ""
        case .some(let wrapped): return try wrapped.render(with: manager)
        }
    }
}
