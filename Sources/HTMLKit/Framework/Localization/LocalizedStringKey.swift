/*
 Abstract:
 The file contains the localized.
 */

import Foundation

/// The struct thats contains the information for the localization
@_documentation(visibility: internal)
public struct LocalizedStringKey: Content {

    /// The key of the translation value
    public let key: String
    
    /// The name of the translation table
    public let table: String?
    
    /// The interpolation for the translation string
    public var interpolation: [Any]?
    
    /// Initiates a localized string key with a context
    public init(key: String, table: String? = nil, interpolation: [Any]? = nil) {
        
        self.key = key
        self.table = table
        self.interpolation = interpolation
    }
}
