/*
 Abstract:
 The file contains the default definition of an element. It defines which properties and methods an element should come with.
 */

/// A type that represents any html-element.
public protocol Element: Content {
}

extension Element {
    
    public func environment<V>(key: KeyPath<EnvironmentKeys, V>) -> EnvironmentModifier {
        return .init(key: key, content: [self])
    }
    
    public func environment<V>(key: KeyPath<EnvironmentKeys, V>, value: V) -> EnvironmentModifier {
        return .init(key: key, value: value, content: [self])
    }
    
    public func environment<T>(object: T) -> EnvironmentModifier {
        return .init(key: \T.self, value: object, content: [self])
    }
}
