/*
 Abstract:
 The file contains the modifiers for components with hover interaction.
 */

/// A type that describes the modifier of a hoverable component.
public protocol HoverModifier {
    
    /// The identifier of the component.
    func id(_ value: String) -> Self
    
    /// Acts on a hover event.
    func onHover(perfom action: Actions) -> Self
    
    /// Acts on a leave event.
    func onLeave(perfom action: Actions) -> Self
}

extension HoverModifier where Self: Actionable {
    
    internal func mutate(hoverevent script: String) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        return self.mutate(event: Events.hover(selector: identifier, script: script))
    }
    
    internal func mutate(leaveevent script: String) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        return self.mutate(event: Events.leave(selector: identifier, script: script))
    }
}
