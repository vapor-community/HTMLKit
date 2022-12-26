public protocol DragModifier {
    
    func id(_ value: String) -> Self
    
    func onDrag(perfom action: Actions) -> Self
    
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
