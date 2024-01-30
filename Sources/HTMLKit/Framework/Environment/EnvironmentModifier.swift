/*
 Abstract:
 The file contains the environment modifier.
 */

/// A type that contains the value and the following content, after modifing the environment.
@_documentation(visibility: internal)
public struct EnvironmentModifier: Content {

    /// The environment key
    public var key: AnyKeyPath
    
    /// The environment value
    public var value: Any?
    
    /// The following content
    public var content: [Content]
    
    /// Initiates a environment modifier
    public init(key: AnyKeyPath, value: Any? = nil, content: [Content]) {
        
        self.key = key
        self.value = value
        self.content = content
    }
}
