/*
 Abstract:
 The file contains
 */

/// A type that describes a component with events.
internal protocol Actionable: Identifiable {
    
    /// The events of the component.
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
