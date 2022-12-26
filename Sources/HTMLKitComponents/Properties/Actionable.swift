internal protocol Actionable: Identifiable {
    
    var events: [String]? { get set }
}

extension Actionable {
    
    internal func mutate(event: String) -> Self {
        
        var newSelf = self
        
        if var events = newSelf.events {
            
            events.append(event)
            
            newSelf.events = events
            
        } else {
            newSelf.events = [event]
        }
        
        return newSelf
    }
}
