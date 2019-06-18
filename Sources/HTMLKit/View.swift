
import Foundation

@dynamicMemberLookup
public enum TemplateValue<Value> {
    case value(Value)
    case variable(ContextVariable<Value>)

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> TemplateValue<Subject> {

        switch self {
        case .value(let value): return .value(value[keyPath: keyPath])
        case .variable(let variable): return .variable(variable[dynamicMember: keyPath])
        }
    }

    public func escaping(_ option: EscapingOption) -> TemplateValue<Value> {
        switch self {
        case .variable(let variable): return .variable(variable.escaping(option))
        default: return self
        }
    }
}

extension TemplateValue : View where Value : View {

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        switch self {
        case .value(let value): try value.prerender(formula)
        case .variable(let variable): try variable.prerender(formula)
        }
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch self {
        case .value(let value): return try value.render(with: manager)
        case .variable(let variable): return try variable.render(with: manager)
        }
    }
}

extension TemplateValue: ExpressibleByUnicodeScalarLiteral where Value == String {
    public typealias UnicodeScalarLiteralType = String
}

extension TemplateValue: ExpressibleByExtendedGraphemeClusterLiteral where Value == String {
    public typealias ExtendedGraphemeClusterLiteralType = String
}

extension TemplateValue : ExpressibleByStringLiteral where Value == String {
    public typealias StringLiteralType = String

    public init(stringLiteral value: Self.StringLiteralType) {
        self = .value(value)
    }
}

extension TemplateValue {
    public static func root() -> TemplateValue {
        .variable(.root())
    }
}


public protocol View {

    /// A value indicating if the template should render when itis used as localization info
    var renderWhenLocalizing: Bool { get }

    /// Renders a compiled template to a html document
    ///
    /// - Parameter manager: A manager that contains the context
    /// - Returns: A html document
    /// - Throws: If the html can not be rendered for some reason
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String

    /// Brews a mappable object in to a formula
    ///
    ///     formula.add(string: "<\(name)/>")   // A constant string
    ///     formula.add(self)                   // Not able to be predetermand
    ///
    /// - Parameter formula: The formula to brew in to
    /// - Throws: If there occured some error
    func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws
}

extension View {
    public var renderWhenLocalizing: Bool { return true }
}


extension Array: Prerenderable where Element == View {

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        try forEach { try $0.prerender(formula) }
    }
}

extension Array: View where Element == View {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }
}

extension String: View {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return self
    }

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: self)
    }
}

extension Int: View {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Double: View {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Float: View {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Bool: View {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}


extension Optional: View where Wrapped: View {

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        switch self {
        case .some(let wrapped): try wrapped.prerender(formula)
        default: break
        }
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch self {
        case .none: return ""
        case .some(let wrapped): return try wrapped.render(with: manager)
        }
    }
}

extension UUID: View {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return self.uuidString
    }

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: self.uuidString)
    }
}


/// Concats two values
public func + (lhs: View, rhs: View) -> View {
    var output: Array<View> = []

    if let list = lhs as? Array<View> {
        output.append(contentsOf: list)
    } else {
        output.append(lhs)
    }

    if let list = rhs as? Array<View> {
        output.append(list)
    } else {
        output.append(rhs)
    }
    return output
}
