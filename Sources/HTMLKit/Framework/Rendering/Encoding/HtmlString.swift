/// A type that remains unescaped during rendering.
///
/// > Warning: Use with caution, as this may lead to security vulnerabilities
/// > if the argument is not properly validated or not trusted.
@_documentation(visibility: internal)
public struct HtmlString: Content {
    
    /// The wrapped string
    internal let value: String
    
    /// Initializes an html string
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initializes an html string
    internal init(_ values: [String]) {
        self.value = values.joined()
    }
}
