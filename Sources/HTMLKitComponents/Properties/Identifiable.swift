
/// A type that describes a component with an identifier.
internal protocol Identifiable {
    
    /// The identifier of the component.
    var id: String? { get set }
}

extension Identifiable {
    
    internal func mutate(id: String) -> Self {
        
        var newSelf = self
        newSelf.id = id
        
        return newSelf
    }
}
