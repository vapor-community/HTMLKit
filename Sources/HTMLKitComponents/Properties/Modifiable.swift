
/// A type that describes a component with classes.
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
}
