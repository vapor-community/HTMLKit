//
//  File.swift
//  
//
//  Created by Mattes Mohr on 25.12.22.
//

internal protocol Pressable: Identifiable {
    
    /// The events of the component.
    var events: [String]? { get set }
}

extension Pressable {
    
    public func onClick(perfom action: Actions) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        var newSelf = self
        
        let event = Events.click(selector: identifier, action: action.script)
        
        if var events = newSelf.events {

            events.append(event)
            
            newSelf.events = events
            
        } else {
            newSelf.events = [event]
        }
        
        return newSelf
    }
    
    public func onTap(perfom action: Actions) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        var newSelf = self
        
        let event = Events.tap(selector: identifier, action: action.script)
        
        if var events = newSelf.events {

            events.append(event)
            
            newSelf.events = events
            
        } else {
            newSelf.events = [event]
        }
        
        return newSelf
    }
    
    public func onPress(perfom action: Actions) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        var newSelf = self
        
        let event = Events.press(selector: identifier, action: action.script)
        
        if var events = newSelf.events {

            events.append(event)
            
            newSelf.events = events
            
        } else {
            newSelf.events = [event]
        }
        
        return newSelf
    }
}
