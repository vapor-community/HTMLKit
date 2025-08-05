/// A type thats describes the modifier of a pressable component.
public protocol PressEvent {
    
    /// The identifier of the component.
    func tag(_ value: String) -> Self
    
    /// Acts on a click event.
    func onClick(@ActionBuilder action: (ViewAction) -> [Action]) -> Self
    
    /// Acts on a tap event.
    func onTap(@ActionBuilder action: (ViewAction) -> [Action]) -> Self
    
    /// Acts on a press event.
    func onPress(@ActionBuilder action: (ViewAction) -> [Action]) -> Self
}

extension PressEvent where Self: Actionable {
    
    internal func mutate(clickevent actions: [Action]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onClick(function(){\
                \(actions.map { $0.description }.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
    
    internal func mutate(tapevent actions: [Action]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onTapGesture(function(){\
                \(actions.map { $0.description }.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
    
    internal func mutate(pressevent actions: [Action]) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onLongPressGesture(function(){\
                \(actions.map { $0.description }.joined())\
                });
                """
        
        return self.mutate(event: event)
    }
}
