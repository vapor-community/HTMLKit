
import Foundation

@dynamicMemberLookup
public enum TemplateValue<Root, Value> {
    case constant(Value)
    case dynamic(ContextVariable<Root, Value>)

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> TemplateValue<Root, Subject> {
        switch self {
        case .constant(let value): return .constant(value[keyPath: keyPath])
        case .dynamic(let variable): return .dynamic(variable[dynamicMember: keyPath])
        }
    }

    public func escaping(_ option: EscapingOption) -> TemplateValue<Root, Value> {
        switch self {
        case .dynamic(let variable): return .dynamic(variable.escaping(option))
        default: return self
        }
    }

    public var isDefined: Conditionable { NotNullConditionGeneral(path: self) }
    public var isNotDefined: Conditionable { IsNullConditionGeneral(path: self) }

    public func value<T>(at keyPath: KeyPath<Value, T>) -> TemplateValue<Root, T> {
        return self[dynamicMember: keyPath]
    }

    public func map<T>(transform: @escaping (Value) throws -> T) -> TemplateValueMapping<Root, Value, T> {
        TemplateValueMapping(variable: self, transform: transform)
    }
}

extension TemplateValue: HTML where Value: HTML {

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        switch self {
        case .constant(let value): try value.prerender(formula)
        case .dynamic(let variable): try variable.prerender(formula)
        }
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch self {
        case .constant(let value): return try value.render(with: manager)
        case .dynamic(let variable): return try variable.render(with: manager)
        }
    }
}

extension TemplateValue: ExpressibleByUnicodeScalarLiteral where Value == String {
    public typealias UnicodeScalarLiteralType = String
}

extension TemplateValue: ExpressibleByExtendedGraphemeClusterLiteral where Value == String {
    public typealias ExtendedGraphemeClusterLiteralType = String
}

extension TemplateValue: ExpressibleByStringLiteral where Value == String {
    public typealias StringLiteralType = String

    public init(stringLiteral value: Self.StringLiteralType) {
        self = .constant(value)
    }
}

extension TemplateValue where Value == String, Root == Void {
    public init(stringLiteral value: Self.StringLiteralType) {
        self = .constant(value)
    }
}

extension TemplateValue {
    public static func root<T>() -> TemplateValue<T, T> {
        .dynamic(.root())
    }

    public func value<T>(from manager: HTMLRenderer.ContextManager<T>) throws -> Value {
        switch self {
        case .constant(let value): return value
        case .dynamic(let variable): return try variable.value(from: manager)
        }
    }
}

public protocol HTML {

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

extension HTML {
    public func render() throws -> String {
        try self.render(with: HTMLRenderer.empty)
    }
}

extension HTML {
    public var renderWhenLocalizing: Bool { return true }
}

extension Array: Prerenderable where Element == HTML {

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        try forEach { try $0.prerender(formula) }
    }
}

extension Array: HTML where Element == HTML {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }
}

extension String: HTML {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return self
    }

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: self)
    }
}

extension Int: HTML {

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

extension Double: HTML {

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

extension Float: HTML {

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

extension Bool: HTML {

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

extension Optional: HTML where Wrapped: HTML {

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

extension UUID: HTML {

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
public func + (lhs: HTML, rhs: HTML) -> HTML {
    var output: Array<HTML> = []

    if let list = lhs as? Array<HTML> {
        output.append(contentsOf: list)
    } else {
        output.append(lhs)
    }

    if let list = rhs as? Array<HTML> {
        output.append(list)
    } else {
        output.append(rhs)
    }
    return output
}
