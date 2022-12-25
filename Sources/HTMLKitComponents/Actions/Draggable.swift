//
//  File.swift
//  
//
//  Created by Mattes Mohr on 25.12.22.
//

internal protocol Draggable: Identifiable {
    
    /// The events of the component.
    var events: [String]? { get set }
}

extension Draggable {
    
    public func onDrag(perfom action: Actions) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        var newSelf = self
        
        let event = Events.drag(selector: identifier, action: action.script)
        
        if var events = newSelf.events {

            events.append(event)
            
            newSelf.events = events
            
        } else {
            newSelf.events = [event]
        }
        
        return newSelf
    }
    
    public func onDrop(perfom action: Actions) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        var newSelf = self
        
        let event = Events.drop(selector: identifier, action: action.script)
        
        if var events = newSelf.events {

            events.append(event)
            
            newSelf.events = events
            
        } else {
            newSelf.events = [event]
        }
        
        return newSelf
    }
}
