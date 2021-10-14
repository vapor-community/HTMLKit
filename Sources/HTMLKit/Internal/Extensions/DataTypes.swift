import Foundation

extension Array: HTML where Element == HTML {

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: HTML {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension String: HTML {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return self
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: self)
    }
}

extension String: RawRepresentable {
    public typealias RawValue = String

    public var rawValue: String { self }

    public init?(rawValue: String) {
        self = rawValue
    }
}

extension Int: HTML {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Double: HTML {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Float: HTML {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Bool: HTML {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Optional: HTML where Wrapped: HTML {

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        switch self {
        case .some(let wrapped): try wrapped.prerender(formula)
        default: break
        }
    }

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch self {
        case .none: return ""
        case .some(let wrapped): return try wrapped.render(with: manager)
        }
    }

    public var scripts: HTML {
        switch self {
        case .none: return ""
        case .some(let wrapped): return wrapped.scripts
        }
    }
}

extension Optional: IsDefinable {
    var isDefinded: Bool {
        switch self {
        case .none: return false
        default: return true
        }
    }
}

extension UUID: HTML {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return self.uuidString
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: self.uuidString)
    }
}
