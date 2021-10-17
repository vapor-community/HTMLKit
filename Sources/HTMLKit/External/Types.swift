/// The enum is for
///
///
public enum TargetTypes: String {
    case blank
    case `self`
    case parent
    case top
}

/// The enum is for
///
///
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

/// The enum is for
///
///
public enum FormEncodeTypes: String {
    case urlEncoded = "application/x-www-form-urlencoded"
    case formData = "multipart/form-data"
    case plain = "text/plain"
}

/// The enum is for
///
///
public enum FormMethodTypes: String {
    case post
    case get
}

/// The enum is for
///
///
public enum ButtonType: String {

    case submit
    case button
    case reset
}
