public protocol Hoverable {
    
    func id(_ value: String) -> Self
    
    func onHover(perfom action: Actions) -> Self
    
    func onLeave(perfom action: Actions) -> Self
}

extension Hoverable where Self: Actionable {
    
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
