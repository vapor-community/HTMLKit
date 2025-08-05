/// A type that won't be escaped during rendering.
///
/// > Warning: Use with caution, as this may expose vulnerabilities.
@_documentation(visibility: internal)
public struct HtmlString: Content {
    
    /// The wrapped string
    internal let value: String
    
    /// Initializes an html string
    public init(_ value: String) {
        self.value = value
    }
}
