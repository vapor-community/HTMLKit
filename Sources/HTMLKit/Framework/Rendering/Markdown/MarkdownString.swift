/// A markdown string wrapper
@_documentation(visibility: internal)
public struct MarkdownString: Content {
    
    /// The origin string
    public let raw: String
    
    /// Initiates the markdown string
    public init(_ string: String) {
        self.raw = string
    }
    
    /// Initiates the markdown string
    public init(_ string: () -> String) {
        self.raw = string()
    }
}

/// Extends string interpolation to include helper functions for Markdown
extension String.StringInterpolation {

    /// Enables interpolation of italic text in Markdown format
    ///
    /// ```
    /// \(italic: "text")
    /// ```
    public mutating func appendInterpolation(italic text: String) {
        appendLiteral("_\(text)_")
    }

    /// Enables interpolation of bold text in Markdown format
    ///
    /// ```
    /// \(bold: "text")
    /// ```
    mutating public func appendInterpolation(bold text: String) {
        appendLiteral("**\(text)**")
    }
    
    /// Enables interpolation of strikethrough text in Markdown format
    ///
    /// ```
    /// \(strike: "text")
    /// ```
    public mutating func appendInterpolation(strike text: String) {
        appendLiteral("~\(text)~")
    }
    
    /// Enables interpolation of a hyperlink in Markdown format
    ///
    /// ```
    /// \(link: "https://www.example.com")
    /// ```
    public mutating func appendInterpolation(link url: String) {
        appendLiteral("[\(url)](\(url)")
    }
    
    /// Enables interpolation of a email link in Markdown format
    ///
    /// ```
    /// \(email: "example@example.com")
    /// ```
    public mutating func appendInterpolation(email address: String) {
        appendLiteral("[\(address)](mailto:\(address)")
    }
    
    /// Enables interpolation of a phone number link in Markdown format
    ///
    /// ```
    /// \(phone: "123-456-7890")
    /// ```
    public mutating func appendInterpolation(phone number: String) {
        appendLiteral("[\(number)](tel:\(number)")
    }
    
    /// Enables interpolation of italicized text in Markdown format
    ///
    /// ```
    /// \(code: "code")
    /// ```
    public mutating func appendInterpolation(code text: String) {
        appendLiteral("`\(text)`")
    }
}
