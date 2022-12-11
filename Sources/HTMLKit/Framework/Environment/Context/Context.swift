/// A property wrapper type to initate a model for the view
@propertyWrapper public struct Context<Value> where Value: ViewModel {
    
    /// The initial value
    public var wrappedValue: Self {
        return self
    }
    
    /// The projected value
    public var projectedValue: Model<Value>
    
    /// Converts the value into the projected value
    public init(_ type: Value.Type) {
        self.projectedValue = .init(type)
    }
}
