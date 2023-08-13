/*
 Abstract:
 The file contains the modifiers for components with press interaction.
 */

/// A type thats describes the modifier of a pressable component.
public protocol PressEvent: ViewAction {
    
    /// The identifier of the component.
    func tag(_ value: String) -> Self
    
    /// Acts on a click event.
    func onClick(@StringBuilder action: (ViewAction) -> [String]) -> Self
    
    /// Acts on a tap event.
    func onTap(@StringBuilder action: (ViewAction) -> [String]) -> Self
    
    /// Acts on a press event.
    func onPress(@StringBuilder action: (ViewAction) -> [String]) -> Self
}

extension PressEvent where Self: Actionable {
    
    internal func mutate(clickevent actions: [String]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onClick(function(){\
                \(actions.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
    
    internal func mutate(tapevent actions: [String]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onTapGesture(function(){\
                \(actions.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
    
    internal func mutate(pressevent actions: [String]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onLongPressGesture(function(){\
                \(actions.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
}
