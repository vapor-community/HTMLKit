import Foundation

/// A type thats holds the information for the localization
@_documentation(visibility: internal)
public struct LocalizedString: Content, Sendable {

    /// The key of the translation value
    internal let key: LocalizedStringKey
    
    /// The name of the translation table
    internal let table: String?
    
    /// Initializes a localized string with context
    ///
    /// - Parameters:
    ///   - key: The string key to be translated
    ///   - table: The table where the string key should be looked up. Default is nil.
    public init(key: LocalizedStringKey, table: String? = nil) {
        
        self.key = key
        self.table = table
    }
}
