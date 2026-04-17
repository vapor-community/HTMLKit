/// A type that describes the modifier of a draggable component.
public protocol DragEvent {
    
    /// The identifier of the component.
    func tag(_ value: String) -> Self
    
    /// Acts on a drag event.
    func onDrag(@ActionBuilder action: (ViewAction) -> [Action]) -> Self
    
    /// Acts on a drop event
    func onDrop(@ActionBuilder action: (ViewAction) -> [Action]) -> Self
}

extension DragEvent where Self: Actionable {
    
    internal func mutate(dragevent actions: [Action]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unknown.")
        }
        
        let event = """
                $('#\(identifier)').onDrag(function(){\
                \(actions.map { $0.description }.joined())\
                });
                """
        
        return self.mutate(events: event)
    }
    
    internal func mutate(dropevent actions: [Action]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unknown.")
        }
        
        let event = """
                $('#\(identifier)').onDrop(function(){\
                \(actions.map { $0.description }.joined())\
                });
                """
        
        return self.mutate(events: event)
    }
}
