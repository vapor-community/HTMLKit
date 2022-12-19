/// A type, that acts as a variable
public enum Property<Value> {
    
    case constant(Value)
    case variable(Placeholder<Value>)
}

extension Property where Value: Content {

    public var value: Content {
        
        switch self {
        case .constant(let value):
            return value
            
        case .variable(let variable):
            return variable
        }
    }
    
    public func unsafeCast<T>(to type: T.Type) -> Property<T> {
        
        switch self {
        case .constant(let value):
            return .constant(value as! T)
            
        case .variable(let variable):
            return .variable(variable.unsafeCast(to: T.self))
        }
    }
}

extension Property {
    
    public init(parent: String, path: AnyKeyPath) {
        self = .variable(Placeholder(parent: parent, path: path))
    }
}

extension Property: ExpressibleByStringLiteral where Value == String {
    
    public init(stringLiteral value: String) {
        self = .constant(value)
    }
}

extension Property: ExpressibleByUnicodeScalarLiteral where Value == String {
    
    public init(unicodeScalarLiteral value: String) {
        self = .constant(value)
    }
}

extension Property: ExpressibleByExtendedGraphemeClusterLiteral where Value == String {
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self = .constant(value)
    }
}

extension Property: ExpressibleByIntegerLiteral where Value == Int {

    public init(integerLiteral value: Int) {
        self = .constant(value)
    }
}
