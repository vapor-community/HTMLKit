/// A markdown string wrapper
@_documentation(visibility: internal)
public struct MarkdownString: Content {
    
    /// The origin string
    public let raw: String
    
    /// Initiates the markdown string
    public init(string: String) {
        self.raw = string
    }
}
