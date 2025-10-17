/// A type thats represents an invert conditional
@_documentation(visibility: internal)
public struct Negation {
    
    /// The left-hand side conditional
    internal let value: EnvironmentValue
    
    /// Initializes the negation
    ///
    /// - Parameter lhs: The conditional to evaluate
    public init(value: EnvironmentValue) {
        
        self.value = value
    }
}

/// Creates a invert conditional
///
/// ```swift
/// Environment.when(!value) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///
/// - Returns: A invert conditional
public prefix func ! (value: EnvironmentValue) -> Conditional {
    return .negation(Negation(value: value))
}
