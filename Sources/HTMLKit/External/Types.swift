public enum TargetTypes: String {
    /// The response is displayed in a new window or tab
    case blank

    /// The response is displayed in the same frame (this is default)
    case `self`

    /// The response is displayed in the parent frame
    case parent

    /// The response is displayed in the full body of the window
    case top
}

/// The text direction in HTML
public enum HTMLTextDirection: String, HTMLContent {
    case leftToRight = "ltr"
    case rightToLeft = "rtl"
    case auto
}

extension HTMLTextDirection {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        self.rawValue
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: self.rawValue)
    }
}

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

public enum ButtonType: String {

    case submit
    case button
    case reset
}
