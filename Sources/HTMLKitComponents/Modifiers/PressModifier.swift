/*
 Abstract:
 The file contains the modifiers for components with press interaction.
 */

/// A type thats describes the modifier of a pressable component.
public protocol PressModifier {
    
    /// The identifier of the component.
    func id(_ value: String) -> Self
    
    /// Acts on a click event.
    func onClick(perfom action: Actions) -> Self
    
    /// Acts on a tap event.
    func onTap(perfom action: Actions) -> Self
    
    /// Acts on a press event.
    func onPress(perfom action: Actions) -> Self
}

extension PressModifier where Self: Actionable {
    
    internal func mutate(clickevent script: String) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        return self.mutate(event: Events.click(selector: identifier, script: script))
    }
    
    internal func mutate(tapevent script: String) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        return self.mutate(event: Events.tap(selector: identifier, script: script))
    }
    
    internal func mutate(pressevent script: String) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        return self.mutate(event: Events.press(selector: identifier, script: script))
    }
}
