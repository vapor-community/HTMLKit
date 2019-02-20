
public typealias RenderedHTML = String

/// A protocol making it possible to render a html document
public protocol Mappable: BrewableFormula {

    /// Renders a presentable view
    ///
    /// - Returns: A renderd view
    /// - Throws: If the render fails for any reason
    func map<T: Templating>(for type: T.Type, with context: T.Context) throws -> String
}

extension Array: BrewableFormula where Element == Mappable {

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Templating {
        try forEach { try $0.brew(formula) }
    }
}

extension Array: Mappable where Element == Mappable {

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        return try self.reduce("") { try $0 + $1.map(for: type, with: context) }
    }
}

extension String: Mappable {

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        return self
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Templating {
        formula.add(string: self)
    }
}

extension Int: Mappable {

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        return "\(self)"
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T : Templating {
        formula.add(string: "\(self)")
    }
}

extension Bool: Mappable {
    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        return String(self)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T : Templating {
        formula.add(string: String(self))
    }
}


extension Optional: BrewableFormula where Wrapped: BrewableFormula {
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T : Templating {
        switch self {
        case .some(let wrapped): try wrapped.brew(formula)
        default: break
        }
    }
}

extension Optional: Mappable where Wrapped: Mappable {

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        switch self {
        case .none: return ""
        case .some(let wrapped): return try wrapped.map(for: type, with: context)
        }
    }
}
