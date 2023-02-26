/*
 Abstract:
 The file contains the modifiers for form component.
 */

/// A type that describes the modifier of a form component.
public protocol FormModifier {
    
    /// Acts on a submit event.
    func onSubmit(perfom action: Actions) -> Self
}

extension FormModifier where Self: Actionable {
    
    internal func mutate(submitevent script: String, validation: Bool) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        return self.mutate(event: Events.submit(selector: identifier, script: script, validation: validation))
    }
}
