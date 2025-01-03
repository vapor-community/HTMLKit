/// A type representing the logical relation between two conditionals
@_documentation(visibility: internal)
public struct Relation: Conditionable {
    
    /// A enumeration of potential logical terms
    public enum Term {
    
        /// Indicates a conjunction
        ///
        /// All conditions must be true for the relation to be true
        case conjunction
        
        /// Indicates a disjunction
        ///
        /// One condition must be at least true for the relation to be true
        case disjunction
    }
    
    /// The logical term specifying the relation
    public let term: Term
    
    /// The left-hand side conditional
    public let lhs: Conditionable
    
    /// The right-hand side conditional
    public let rhs: Conditionable
}

/// Creates a conjunctional relation between two conditionals
/// 
/// ```swift
/// Environment.when(value > 0 && value < 2) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///   - rhs: The right-hand side conditional
///
/// - Returns: A conjunctional relation
public func && (lhs: Conditionable, rhs: Conditionable) -> Relation {
    return Relation(term: .conjunction, lhs: lhs, rhs: rhs)
}

/// Creates a disjunctional relation between two conditionals
///
/// ```swift
/// Environment.when(value > 0 || value < 2) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///   - rhs: The right-hand side conditional
///
/// - Returns: A disjunctional relation
public func || (lhs: Conditionable, rhs: Conditionable) -> Relation {
    return Relation(term: .disjunction, lhs: lhs, rhs: rhs)
}

