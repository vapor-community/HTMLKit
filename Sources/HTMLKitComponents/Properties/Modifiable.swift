internal protocol Modifiable {
    
    var classes: [String] { get set }
}

extension Modifiable {
    
    internal func mutate(`class`: String) -> Self {
        
        var newSelf = self
        newSelf.classes.append(`class`)
        
        return newSelf
    }
}
