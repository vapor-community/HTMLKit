/*
 Abstract:
 The file contains the modifiers for form component.
 */

/// A type that describes the modifier of a form component.
public protocol FormEvent {
    
    /// The identifier of the component.
    func tag(_ value: String) -> Self
    
    /// Acts on a submit event.
    func onSubmit(@ActionBuilder action: (SubmitAction) -> [Action]) -> Self
}

extension FormEvent where Self: Actionable {
    
    internal func mutate(submitevent actions: [Action]) -> Self {
        
        var validation = false
        
        for action in actions {
            
            if action.description.contains("validate") {
                validation = true
            }
        }
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        let event = """
                $('#\(identifier)').onSubmit(function(){\
                event.preventDefault();\
                \(actions.map { $0.description }.joined())\
                },\(validation));
                """
        
        return self.mutate(event: event)
    }
}
