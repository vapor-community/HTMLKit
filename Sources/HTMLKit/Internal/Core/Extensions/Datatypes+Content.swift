import Foundation

/// The extension is
///
///
extension Array: Content where Element == Content {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: Content {
        return self.reduce("") { $0 + $1.scripts }
    }
}

/// The extension is
///
///
extension Bool: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

/// The extension is
///
///
extension Bool: Conditionable {
    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        return self
    }
}

/// The extension is
///
///
extension Double: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

/// The extension is
///
///
extension Float: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

/// The extension is
///
///
extension Int: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

/// The extension is
///
///
extension Optional: Content where Wrapped: Content {

    public func prerender(_ formula: Renderer.Formula) throws {
        switch self {
        case .some(let wrapped): try wrapped.prerender(formula)
        default: break
        }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        switch self {
        case .none: return ""
        case .some(let wrapped): return try wrapped.render(with: manager)
        }
    }

    public var scripts: Content {
        switch self {
        case .none: return ""
        case .some(let wrapped): return wrapped.scripts
        }
    }
}

/// The extension is
///
///
extension Optional: Defineable {
    
    var isDefinded: Bool {
        switch self {
        case .none: return false
        default: return true
        }
    }
}

/// The extension is
///
///
extension String: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return self
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: self)
    }
}

/// The extension is
///
///
extension UUID: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return self.uuidString
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: self.uuidString)
    }
}
