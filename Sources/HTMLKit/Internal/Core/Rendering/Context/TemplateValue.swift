import Foundation

/// The enum is for
///
///
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
    
    public var isDefined: Conditionable {
        
        if isMasqueradingOptional {
            return true
        } else {
            return NotNullConditionGeneral(path: self)
        }
    }
    
    public var isNotDefined: Conditionable {
        
        if isMasqueradingOptional {
            return false
        } else {
            return IsNullConditionGeneral(path: self)
        }
    }
    
    var isMasqueradingOptional: Bool {
        
        switch self {
        case .constant: return false
        case .dynamic(let variable): return variable.isMascadingOptional
        }
    }

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> TemplateValue<Subject> {
        
        switch self {
        case .constant(let value): return .constant(value[keyPath: keyPath])
        case .dynamic(let variable): return .dynamic(variable[dynamicMember: keyPath])
        }
    }
    
    public init(_ root: Value.Type) {
        
        self = .root()
    }

    public func escaping(_ option: EscapingOption) -> TemplateValue<Value> {
        
        switch self {
        case .dynamic(let variable): return .dynamic(variable.escaping(option))
        default: return self
        }
    }

    public func value<T>(at keyPath: KeyPath<Value, T>) -> TemplateValue<T> {
        
        return self[dynamicMember: keyPath]
    }
    
    public func value<T>(from manager: Renderer.ContextManager<T>) throws -> Value {
        
        switch self {
        case .constant(let value): return value
        case .dynamic(let variable): return try manager.value(for: variable)
        }
    }

    public func makeOptional() -> TemplateValue<Value?> {
        
        switch self {
        case .constant(let value): return .constant(value)
        case .dynamic(let variable): return .dynamic(variable.makeOptional())
        }
    }

    public func unsafeCast<T>(to type: T.Type) -> TemplateValue<T> {
        
        switch self {
        case .constant(let value): return .constant(value as! T)
        case .dynamic(let variable): return .dynamic(variable.unsafeCast(to: T.self))
        }
    }
    
    public static func root<T>() -> TemplateValue<T> {
        
        .dynamic(HTMLContext(T.self))
    }
}

extension TemplateValue: AnyContent where Value: AnyContent {

    public func prerender(_ formula: Renderer.Formula) throws {
        
        switch self {
        case .constant(let value): try value.prerender(formula)
        case .dynamic(let variable): try variable.prerender(formula)
        }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        
        switch self {
        case .constant(let value): return try value.render(with: manager)
        case .dynamic(let variable): return try variable.render(with: manager)
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
