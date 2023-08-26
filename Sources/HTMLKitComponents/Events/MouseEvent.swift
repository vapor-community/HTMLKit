/*
 Abstract:
 The file contains the modifiers for components with hover interaction.
 */

/// A type that describes the modifier of a hoverable component.
public protocol MouseEvent: ViewAction {
    
    /// The identifier of the component.
    func tag(_ value: String) -> Self
    
    /// Acts on a hover event.
    func onHover(@StringBuilder action: (ViewAction) -> [String]) -> Self
    
    /// Acts on a leave event.
    func onLeave(@StringBuilder action: (ViewAction) -> [String]) -> Self
}

extension MouseEvent where Self: Actionable {
    
    internal func mutate(hoverevent actions: [String]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onHover(function(){\
                \(actions.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
    
    internal func mutate(leaveevent actions: [String]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onLeave(function(){\
                \(actions.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
}
