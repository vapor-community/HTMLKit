/// A type representing a loop rendering content within the environment
@_documentation(visibility: internal)
public struct Sequence: Content {
    
    /// The environment value of the sequence
    internal let value: EnvironmentValue
    
    /// The accumulated content
    internal let content: [Content]
    
    /// Initializes a loop
    ///
    /// - Parameters:
    ///   - value: The environment value to retrieve the sequence from
    ///   - content: The content to render for each item in the sequence
    public init(value: EnvironmentValue, content: [Content]) {
        
        self.value = value
        self.content = content
    }
}
