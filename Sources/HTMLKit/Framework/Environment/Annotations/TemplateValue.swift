/*
 Abstract:
 The file contains the template value.
 */

import Foundation

/// The enum is for
@propertyWrapper @dynamicMemberLookup public enum TemplateValue<Value> {
    
    case constant(Value)
    case dynamic(HTMLContext<Value>)

    public var wrappedValue: TemplateValue {
        
        get { self }
        set { self = newValue }
    }
    
    public var rawValue: String {
        
        get {
            switch self {
            case .constant(let value):
                return "\(value)"
                
            default:
                return ""
            }
        }
    }
    
    internal var isMasqueradingOptional: Bool {
        
        switch self {
        case .constant:
            return false
            
        case .dynamic(let variable):
            return variable.isMasqueradingOptional
        }
    }
    
    public init(_ value: Value.Type) {
        self = .dynamic(HTMLContext(value.self))
    }

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> TemplateValue<Subject> {
        
        switch self {
        case .constant(let value):
            return .constant(value[keyPath: keyPath])
            
        case .dynamic(let variable):
            return .dynamic(variable[dynamicMember: keyPath])
        }
    }

    public func value<T>(at keyPath: KeyPath<Value, T>) -> TemplateValue<T> {
        return self[dynamicMember: keyPath]
    }
    
    public func value<T>(from manager: ContextManager<T>) throws -> Value {
        
        switch self {
        case .constant(let value):
            return value
            
        case .dynamic(let variable):
            return try manager.value(for: variable)
        }
    }

    public func makeOptional() -> TemplateValue<Value?> {
        
        switch self {
        case .constant(let value):
            return .constant(value)
            
        case .dynamic(let variable):
            return .dynamic(variable.makeOptional())
        }
    }
    
    public func escaping(_ option: EscapingOption) -> TemplateValue<Value> {
        
        switch self {
        case .dynamic(let variable):
            return .dynamic(variable.escaping(option))
            
        default:
            return self
        }
    }
    
    public func unsafeCast<T>(to type: T.Type) -> TemplateValue<T> {
        
        switch self {
        case .constant(let value):
            return .constant(value as! T)
            
        case .dynamic(let variable):
            return .dynamic(variable.unsafeCast(to: T.self))
        }
    }
}

extension TemplateValue: ExpressibleByStringLiteral, ExpressibleByUnicodeScalarLiteral, ExpressibleByExtendedGraphemeClusterLiteral where Value == String {

    public init(stringLiteral value: String) {
        self = .constant(value)
    }

    public init(unicodeScalarLiteral value: String) {
        self = .constant(value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self = .constant(value)
    }
}

extension TemplateValue: ExpressibleByIntegerLiteral where Value == Int {

    public init(integerLiteral value: Int) {
        self = .constant(value)
    }
}

extension TemplateValue where Value == Date {
    
    public func style(date: DateFormatter.Style = .short, time: DateFormatter.Style = .short) -> AnyContent {
        return DateVariable(dateReference: .solid(self), format: .style(.init(dateStyle: date, timeStyle: time)))
    }

    public func formatted(string format: String) -> AnyContent {
        return DateVariable(dateReference: .solid(self), format: .literal(format))
    }
}

extension TemplateValue where Value == Date? {

    public func style(date: DateFormatter.Style = .short, time: DateFormatter.Style = .short) -> AnyContent {
        return DateVariable(dateReference: .optional(self), format: .style(.init(dateStyle: date, timeStyle: time)))
    }

    public func formatted(string format: String) -> AnyContent {
        return DateVariable(dateReference: .optional(self), format: .literal(format))
    }
}
