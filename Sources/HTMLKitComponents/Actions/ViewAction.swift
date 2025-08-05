public struct ViewAction: Action {
    
    public var actions: [String] = []
    
    /// Show a target based on a event.
    ///
    /// - Parameter target: The target to show.
    ///
    /// - Returns: The action
    public func show(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').show();")
        
        return newSelf
    }

    /// Hide a target based on a event.
    ///
    /// - Parameter target: The target to hide.
    ///
    /// - Returns: The action
    public func hide(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').hide();")
        
        return newSelf
    }

    /// Play an animation based on a event.
    ///
    /// - Parameter target: The animation to play.
    ///
    /// - Returns: The action
    public func animate(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').animate();")
        
        return newSelf
    }

    /// Open a target based on a event.
    ///
    /// - Parameter target: The target to open.
    ///
    /// - Returns: The action
    public func open(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').open();")
        
        return newSelf
    }

    /// Close a target based on a event.
    ///
    /// - Parameter target: The target to close.
    ///
    /// - Returns: The action
    public func close(_ target: String) -> ViewAction {
        
        var newSelf = self
        newSelf.actions.append("$('#\(target.escape())').close();")
        
        return newSelf
    }
}
