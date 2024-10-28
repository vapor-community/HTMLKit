import Foundation

/// A type that serves as a placeholder for an environment value
///
/// The placeholder will be evaluated and resolved by the renderer when needed.
public struct EnvironmentValue: Content {
    
    /// The path of the values parent
    internal var parentPath: AnyKeyPath
    
    /// The path of the value
    internal var valuePath: AnyKeyPath
    
    /// Initializes a environment value
    ///
    /// - Parameters:
    ///   - parentPath: The key path of the parent
    ///   - valuePath: The key path of the value
    public init(parentPath: AnyKeyPath, valuePath: AnyKeyPath) {
        
        self.parentPath = parentPath
        self.valuePath = valuePath
    }
}

extension EnvironmentValue {
    
    /// Concatenates an environment value with another value
    static public func + (lhs: Content, rhs: Self) -> Content {
        return [lhs, rhs]
    }
}
