/// A type that holds the modification details for the environment
///
/// The modifier is received by the renderer and applied to the environment.
@_documentation(visibility: internal)
public struct EnvironmentModifier: Content {

    /// The environment key
    internal let key: AnyKeyPath
    
    /// The environment value
    internal let value: Any?
    
    /// The sub-content
    internal let content: [Content]
    
    /// Initializes an environment modifier
    ///
    /// - Parameters:
    ///   - key: The key path of the environment value to be modified
    ///   - value: The new value to update the environment value with
    ///   - content: The sub-content to be rendered
    public init(key: AnyKeyPath, value: Any? = nil, content: [Content]) {
        
        self.key = key
        self.value = value
        self.content = content
    }
}
