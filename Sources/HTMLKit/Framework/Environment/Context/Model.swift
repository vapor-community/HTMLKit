/// A type, that holds the model for the view
@dynamicMemberLookup public struct Model<Value> where Value: ViewModel {
    
    /// The name of the model
    private var name: String
    
    /// The path of the model
    private var path: AnyKeyPath
    
    /// The type the model is initated of
    private let type: Value.Type
    
    /// Initiates a model
    public init(_ type: Value.Type) {
        
        self.name = String(reflecting: type)
        self.path = \Value.self
        self.type = type
    }
    
    /// Initiates a model with the parents name
    public init(parent: String, path: AnyKeyPath, type: Value.Type) {
        
        self.name = parent
        self.path = path
        self.type = type
    }
    
    /// Looks up for a property
    public subscript<T>(dynamicMember member: KeyPath<Value, T>) -> Property<T> {
        
        guard let newPath = self.path.appending(path: member) else {
            fatalError()
        }
        
        return .init(parent: name, path: newPath)
    }
    
    /// Looks up for a model
    public subscript<T>(dynamicMember member: KeyPath<Value, T>) -> Model<T> where T: ViewModel {
        
        guard let newPath = self.path.appending(path: member) else {
            fatalError()
        }
        
        return .init(parent: name, path: newPath, type: T.self)
    }
}
