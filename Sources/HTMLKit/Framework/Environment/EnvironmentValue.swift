import Foundation

/// A type that serves as a placeholder for an environment value
///
/// The placeholder will be evaluated and resolved by the renderer when needed.
@_documentation(visibility: internal)
public struct EnvironmentValue: Content {
    
    /// The path of the values parent
    internal let parentPath: AnyKeyPath
    
    /// The path of the value
    internal let valuePath: AnyKeyPath
    
    /// Initializes a environment value
    ///
    /// - Parameters:
    ///   - parentPath: The key path of the parent
    ///   - valuePath: The key path of the value
    internal init(parentPath: AnyKeyPath, valuePath: AnyKeyPath) {
        
        self.parentPath = parentPath
        self.valuePath = valuePath
    }
}

extension EnvironmentValue: Conditionable {
    
    /// Concat environment value with environment value
    public static func + (lhs: Content, rhs: Self) -> Content {
        return [lhs, rhs]
    }
    
    /// Compare an environment value with another comparable value
    ///
    /// Makes an unequal evaluation
    public static func != (lhs: Self, rhs: some Comparable) -> Condition {
        return Condition(lhs: lhs, rhs: rhs, comparison: .unequal)
    }
    
    /// Compare an environment value with another comparable value
    ///
    /// Makes an equal evaluation
    public static func == (lhs: Self, rhs: some Comparable) -> Condition {
        return Condition(lhs: lhs, rhs: rhs, comparison: .equal)
    }
    
    /// Compare an environment value with another comparable value
    ///
    /// Makes an less than evaluation
    public static func < (lhs: Self, rhs: some Comparable) -> Condition {
        return Condition(lhs: lhs, rhs: rhs, comparison: .less)
    }
    
    /// Compare an environment value with another comparable value
    ///
    /// Makes an greater than evaluation
    public static func > (lhs: Self, rhs: some Comparable) -> Condition {
        return Condition(lhs: lhs, rhs: rhs, comparison: .greater)
    }
}
