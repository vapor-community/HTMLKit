/*
 Abstract:
 The file contains the localized.
 */

import Foundation

/// A type thats holds the information for the localization
@_documentation(visibility: internal)
public struct LocalizedStringKey: Content {

    /// The key of the translation value
    public let key: String
    
    /// The name of the translation table
    public let table: String?
    
    /// The interpolation for the translation string
    public var interpolation: [Any]?
    
    /// Initialize a localized string key with a context
    ///
    /// - Parameters:
    ///   - key: The string key to be translated
    ///   - table: The table where the string key should be looked up. Default is nil.
    ///   - interpolation: An array of values that will replace placeholders within the translation string.
    public init(key: String, table: String? = nil, interpolation: [Any]? = nil) {
        
        self.key = key
        self.table = table
        self.interpolation = interpolation
    }
}
