/// A type that represents any html-element.
@_documentation(visibility: internal)
public protocol Element: Content {
}

extension Element {
    
    /// Sets the environment for the sub-content
    ///
    /// - Parameter key: The key
    ///
    /// - Returns: The environment modifier
    public func environment<V>(key: KeyPath<EnvironmentKeys, V>) -> EnvironmentModifier {
        return .init(key: key, content: [self])
    }
    
    /// Supplies a value to the environment
    ///
    /// - Parameters:
    ///   - key: The key to store the value with
    ///   - value: The value to be stored
    ///
    /// - Returns: The environment modifier
    public func environment<V>(key: KeyPath<EnvironmentKeys, V>, value: V) -> EnvironmentModifier {
        return .init(key: key, value: value, content: [self])
    }
    
    /// Supplies the object to the environment
    ///
    /// - Parameter object: The object to be stored
    ///
    /// - Returns: The environment modifier
    public func environment<T>(object: T) -> EnvironmentModifier {
        return .init(key: \T.self, value: object, content: [self])
    }
}
