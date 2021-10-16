import Foundation

extension Array: HTMLContent where Element == HTMLContent {

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: HTMLContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension String: HTMLContent {

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

extension Int: HTMLContent {

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

extension Double: HTMLContent {

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

extension Float: HTMLContent {

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

extension Bool: HTMLContent {

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

extension Optional: HTMLContent where Wrapped: HTMLContent {

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

    public var scripts: HTMLContent {
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

extension UUID: HTMLContent {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return self.uuidString
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: self.uuidString)
    }
}
