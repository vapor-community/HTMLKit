/// A type that describes a component with an identifier.
internal protocol Identifiable {
    
    /// The identifier of the component.
    var id: String? { get set }
}

extension Identifiable {
    
    /// Mutate the identifier.
    ///
    /// - Parameter id: The identifier to set.
    ///
    /// - Returns: The component
    internal func mutate(id: String) -> Self {
        
        var copy = self
        copy.id = id
        
        return copy
    }
}
