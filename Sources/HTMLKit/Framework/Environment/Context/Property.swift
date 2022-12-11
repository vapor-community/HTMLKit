/// A type, that acts as a variable
public struct Property<Value>: DynamicProperty {
    
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
}
