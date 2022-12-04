/*
 Abstract:
 The file contains the default definition of an element. It defines which properties and methods an element should come with.
 */

/// A type that represents any html-element.
public protocol AnyElement: Content {
    
    /// The behavoir of the the element.
    var scripts: String { get }
}

extension AnyElement {
    
    public var scripts: String { "" }
    
    public func environment(locale: String) -> EnvironmentModifier {
        return EnvironmentModifier(view: self, locale: .constant(locale))
    }
    
    public func environment(locale: TemplateValue<String>) -> EnvironmentModifier {
        return EnvironmentModifier(view: self, locale: locale)
    }
}
