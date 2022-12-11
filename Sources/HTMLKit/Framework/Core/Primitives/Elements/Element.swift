/*
 Abstract:
 The file contains the default definition of an element. It defines which properties and methods an element should come with.
 */

/// A type that represents any html-element.
public protocol Element: Content {
    
    /// The behavoir of the the element.
    var scripts: String { get }
    
    func modify(if condition: Bool, element: (Self) -> Self) -> Self
    
    func modify<T>(unwrap value: Property<T?>, element: (Self, Property<T>) -> Self) -> Self
}

extension Element {
    
    public var scripts: String { "" }
}
