/// A type that describes a component with events.
internal protocol Actionable: Identifiable {
    
    /// The event handlers for the component.
    var events: [String]? { get set }
}

extension Actionable {
    
    internal func mutate(events: [String]) -> Self {
        
        var copy = self
        
        if var events = copy.events {
            
            events.append(contentsOf: events)
            
            copy.events = events
            
        } else {
            copy.events = events
        }
        
        return copy
    }
    
    internal func mutate(events: String...) -> Self {
        
        var copy = self
        
        if var events = copy.events {
            
            events.append(contentsOf: events)
            
            copy.events = events
            
        } else {
            copy.events = events
        }
        
        return copy
    }
}
