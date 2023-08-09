/*
 Abstract:
 The file contains the modifiers for components with drag interaction.
 */

/// A type that describes the modifier of a draggable component.
public protocol DragModifier {
    
    /// The identifier of the component.
    func tag(_ value: String) -> Self
    
    /// Acts on a drag event.
    func onDrag(perfom action: Actions) -> Self
    
    /// Acts on a drop event
    func onDrop(perfom action: Actions) -> Self
}

extension DragModifier where Self: Actionable {
    
    internal func mutate(dragevent script: String) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        return self.mutate(event: Events.drag(selector: identifier, script: script))
    }
    
    internal func mutate(dropevent script: String) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        return self.mutate(event: Events.drop(selector: identifier, script: script))
    }
}
