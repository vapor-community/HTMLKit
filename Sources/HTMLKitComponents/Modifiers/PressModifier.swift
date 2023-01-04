public protocol PressModifier {
    
    func id(_ value: String) -> Self
    
    func onClick(perfom action: Actions) -> Self
    
    func onTap(perfom action: Actions) -> Self
    
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
