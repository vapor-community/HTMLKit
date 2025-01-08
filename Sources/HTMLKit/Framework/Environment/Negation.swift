/// A type thats represents an invert condition
@_documentation(visibility: internal)
public struct Negation: Conditionable {
    
    /// The left-hand side conditional
    internal let value: EnvironmentValue
    
    /// Initializes the negation
    ///
    /// - Parameter lhs: The conditional to evaluate
    public init(value: EnvironmentValue) {
        
        self.value = value
    }
}


/// Creates a invert condition
///
/// ```swift
/// Environment.when(!value) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///
/// - Returns: A invert
public prefix func ! (value: EnvironmentValue) -> Negation {
    return Negation(value: value)
}
