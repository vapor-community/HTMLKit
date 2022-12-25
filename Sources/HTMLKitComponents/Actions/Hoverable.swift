internal protocol Hoverable: Identifiable {
    
    /// The events of the component.
    var events: [String]? { get set }
}

extension Hoverable {
    
    public func onHover(perfom action: Actions) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        var newSelf = self
        
        let event = Events.hover(selector: identifier, action: action.script)
        
        if var events = newSelf.events {

            events.append(event)
            
            newSelf.events = events
            
        } else {
            newSelf.events = [event]
        }
        
        return newSelf
    }
    
    public func onLeave(perfom action: Actions) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        var newSelf = self
        
        let event = Events.leave(selector: identifier, action: action.script)
        
        if var events = newSelf.events {

            events.append(event)
            
            newSelf.events = events
            
        } else {
            newSelf.events = [event]
        }
        
        return newSelf
    }
}
