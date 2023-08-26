import Foundation

public protocol ViewAction {
    
    /// Shows the target.
    func show(_ target: String) -> String
    
    /// Hides the target.
    func hide(_ target: String) -> String
    
    /// Animates the target.
    func animate(_ target: String) -> String
    
    /// Opens the target.
    func open(_ target: String) -> String
    
    /// Closes the target.
    func close(_ target: String) -> String
}

extension ViewAction {
    
    public func show(_ target: String) -> String {
        return "$('#\(target)').show();"
    }
    
    public func hide(_ target: String) -> String {
        return "$('#\(target)').hide();"
    }
    
    public func animate(_ target: String) -> String {
        return "$('#\(target)').animate();"
    }
    
    public func open(_ target: String) -> String {
        return "$('#\(target)').open();"
    }
    
    public func close(_ target: String) -> String {
        return "$('#\(target)').close();"
    }
}
