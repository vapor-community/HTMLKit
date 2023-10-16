public struct ViewAction: Action {
    
    public var actions: [String] = []
    
    public func show(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').show();")
        
        return newSelf
    }

    public func hide(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').hide();")
        
        return newSelf
    }

    public func animate(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').animate();")
        
        return newSelf
    }

    public func open(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').open();")
        
        return newSelf
    }

    public func close(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').close();")
        
        return newSelf
    }
}
