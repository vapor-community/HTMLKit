/// A type, that acts as a variable
public struct Placeholder<Value>: DynamicContent {
    
    /// The parents name
    public var name: String
    
    /// The path of the property
    public var path: AnyKeyPath
    
    /// The type of the value
    public var type: Value.Type
    
    /// Initiates a property
    public init(parent: String, path: AnyKeyPath) {

        self.name = parent
        self.path = path
        self.type = Value.self
    }
    
    public func unsafeCast<T>(to type: T.Type) -> Placeholder<T> {
        return .init(parent: name, path: path)
    }
}
