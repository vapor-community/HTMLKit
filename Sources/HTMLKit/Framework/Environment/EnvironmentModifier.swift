/// A type that holds the modification details for the environment
///
/// The modifier is received by the renderer and applied to the environment.
@_documentation(visibility: internal)
public struct EnvironmentModifier: Content {

    /// The environment key
    public var key: AnyKeyPath
    
    /// The environment value
    public var value: Any?
    
    /// The sub-content
    public var content: [Content]
    
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
