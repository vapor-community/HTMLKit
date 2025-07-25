/// A type that describes a component with events.
internal protocol Actionable: Identifiable {
    
    /// The event handlers for the component.
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
    
    internal func mutate(events: [String]) -> Self {
        
        var newSelf = self
        
        if var events = newSelf.events {
            
            events.append(contentsOf: events)
            
            newSelf.events = events
            
        } else {
            newSelf.events = events
        }
        
        return newSelf
    }
}
