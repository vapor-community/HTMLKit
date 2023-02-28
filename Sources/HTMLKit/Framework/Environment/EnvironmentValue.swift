import Foundation

/// A type, that acts as a binding value
public struct EnvironmentValue: Content {
    
    /// The path of the values parent
    internal var parentPath: AnyKeyPath
    
    /// The path of the value
    internal var valuePath: AnyKeyPath
    
    /// Initiates a environment value
    public init(parentPath: AnyKeyPath, valuePath: AnyKeyPath) {
        
        self.parentPath = parentPath
        self.valuePath = valuePath
    }
}
