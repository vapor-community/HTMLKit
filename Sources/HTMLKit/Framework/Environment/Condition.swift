/// A type representing a conditional that compares an environment value against another value
@_documentation(visibility: internal)
public struct Condition {
    
    /// A enumeration of potential comparison
    public enum Comparison {
        
        /// Indicates an equal comparison
        case equal
        
        /// Indicates a not-equal comparison
        case unequal
        
        /// Indicates a greater-than comparison
        case greater
        
        /// Indicates a less-than comparison
        case less
    }
    
    /// The left-hand side value
    internal let lhs: EnvironmentValue
    
    /// The right-hand side value to test against
    internal let rhs: any Comparable
    
    /// The comparison to perfom
    internal let comparison: Comparison
    
    /// Initializes a condition
    ///
    /// - Parameters:
    ///   - lhs: The origin value
    ///   - rhs: The value to atest against
    ///   - operation: The comparison to perfom
    public init(lhs: EnvironmentValue, rhs: any Comparable, comparison: Comparison) {
        
        self.lhs = lhs
        self.rhs = rhs
        self.comparison = comparison
    }
}
