/// A type representing a conditional block within the environment
@_documentation(visibility: internal)
public struct Statement: GlobalElement {
    
    /// The compound condition
    internal let compound: Conditional
    
    /// The first statement
    internal let first: [Content]
    
    /// The second statement
    internal let second: [Content]
    
    /// Initializes a statement
    ///
    /// - Parameters:
    ///   - compound: The compound of conditionals
    ///   - first: The statement to execute if conditionals are true
    ///   - second: The statement to execute if conditionals are false
    public init(compound: Conditional, first: [Content], second: [Content]) {
        
        self.compound = compound
        self.first = first
        self.second = second
    }
}
