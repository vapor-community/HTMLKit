/// A type representing a loop rendering content within the environment
public struct Sequence: Content {
    
    /// The environment value of the sequence
    let value: EnvironmentValue
    
    /// The accumulated content
    let content: [Content]
    
    /// Initializes a loop
    ///
    /// - Parameters:
    ///   - value: The environment value to retrieve the sequence from
    ///   - content: The content to render for each item in the sequence
    init(value: EnvironmentValue, content: [Content]) {
        
        self.value = value
        self.content = content
    }
}
