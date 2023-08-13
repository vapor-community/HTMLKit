/*
 Abstract:
 The file contains the modifiers for components with drag interaction.
 */

/// A type that describes the modifier of a draggable component.
public protocol DragEvent: ViewAction {
    
    /// The identifier of the component.
    func tag(_ value: String) -> Self
    
    /// Acts on a drag event.
    func onDrag(@StringBuilder action: (ViewAction) -> [String]) -> Self
    
    /// Acts on a drop event
    func onDrop(@StringBuilder action: (ViewAction) -> [String]) -> Self
}

extension DragEvent where Self: Actionable {
    
    internal func mutate(dragevent actions: [String]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onDrag(function(){\
                \(actions.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
    
    internal func mutate(dropevent actions: [String]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onDrop(function(){\
                \(actions.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
}
