public protocol FormModifier {
    
    /// Acts on a submit event.
    func onSubmit(perfom action: Actions) -> Self
}

extension FormModifier where Self: Actionable {
    
    internal func mutate(submitevent script: String) -> Self {
        
        guard let identifier = self.id else {
            fatalError("Initiative identifier unkown.")
        }
        
        return self.mutate(event: Events.submit(selector: identifier, script: script))
    }
}
