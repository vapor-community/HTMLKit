
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

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
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
