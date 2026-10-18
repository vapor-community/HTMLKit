/// A type that holds the modification for the environment.
///
/// The modifier is received by the renderer and applied to the environment.
@_documentation(visibility: internal)
public struct EnvironmentModifier: Content {

    /// The environment key.
    internal let key: AnyKeyPath
    
    /// The environment value.
    internal let value: Any?
    
    /// The subcontent.
    internal let content: [Content]
    
    /// Creates an environment modifier.
    ///
    /// - Parameters:
    ///   - key: The key path of the environment value to be modified.
    ///   - value: The new value to update the environment value with.
    ///   - content: The subcontent to be rendered.
    public init(key: AnyKeyPath, value: Any? = nil, content: [Content]) {
        
        self.key = key
        self.value = value
        self.content = content
    }
}
