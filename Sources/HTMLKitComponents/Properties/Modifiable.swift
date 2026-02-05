/// A type that describes a component with decorates.
internal protocol Modifiable {
    
    /// The classes of the component.
    var classes: [String] { get set }
}

extension Modifiable {
    
    internal func mutate(classes: [String]) -> Self {
        
        var copy = self
        copy.classes.append(contentsOf: classes)
        
        return copy
    }
    
    internal func mutate(classes: String...) -> Self {
        
        var copy = self
        copy.classes.append(contentsOf: classes)
        
        return copy
    }
}
