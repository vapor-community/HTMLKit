/*
 Abstract:
 The file contains the modifiers for components with hover interaction.
 */

/// A type that describes the modifier of a hoverable component.
public protocol MouseEvent {
    
    /// The identifier of the component.
    func tag(_ value: String) -> Self
    
    /// Acts on a hover event.
    func onHover(@ActionBuilder action: (ViewAction) -> [Action]) -> Self
    
    /// Acts on a leave event.
    func onLeave(@ActionBuilder action: (ViewAction) -> [Action]) -> Self
}

extension MouseEvent where Self: Actionable {
    
    internal func mutate(hoverevent actions: [Action]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onHover(function(){\
                \(actions.map { $0.description }.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
    
    internal func mutate(leaveevent actions: [Action]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onLeave(function(){\
                \(actions.map { $0.description }.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
}
