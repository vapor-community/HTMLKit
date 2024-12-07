/// A protocol that defines a type capable of being localized
@_documentation(visibility: internal)
public protocol Localizable {
    
    /// Initializes a phrasing element intended for localization
    ///
    /// - Parameters:
    ///   - localizedKey: The string key to be translated
    ///   - tableName: The name of the translation table
    init(_ localizedKey: LocalizedStringKey, tableName: String?)
}
