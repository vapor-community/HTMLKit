extension LocalizableNode {
    public init<T>(_ localizedKey: String, with context: T) where T: Encodable {
        self.init(localizedKey, with: TemplateValue<T>.constant(context))
    }
}

@_functionBuilder
public class HTMLBuilder {

    public static func buildBlock(_ children: HTML...) -> HTML {
        return children
    }
}

public struct HTMLNode: ContentNode {

    public var name: String { "html" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTML

    public init(@HTMLBuilder builder: () -> HTML) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTML = "") {
        self.content = content
        self.attributes = attributes
    }
}

typealias Acronym = Abbreviation

public typealias Hyperlink = Anchor

public enum FormEncodeTypes: String {
    /// Default. All characters are encoded before sent (spaces are converted to "+" symbols, and special characters are converted to ASCII HEX values)
    case urlEncoded = "application/x-www-form-urlencoded"

    /// No characters are encoded. This value is required when you are using forms that have a file upload control
    case formData = "multipart/form-data"

    /// Spaces are converted to "+" symbols, but no special characters are encoded
    case plain = "text/plain"
}

public enum FormMethodTypes: String {
    case post
    case get
}
