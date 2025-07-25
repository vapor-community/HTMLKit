/// A type that describes a component with decorates.
internal protocol Modifiable {
    
    /// The classes of the component.
    var classes: [String] { get set }
}

extension Modifiable {
    
    internal func mutate(`class`: String) -> Self {
        
        var newSelf = self
        newSelf.classes.append(`class`)
        
        return newSelf
    }
    
    internal func mutate(classes: [String]) -> Self {
        
        var newSelf = self
        newSelf.classes.append(contentsOf: classes)
        
        return newSelf
    }
}
