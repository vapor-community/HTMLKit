/*
 Abstract:
 The file contains the localized.
 */

import Foundation

/// The struct thats contains the information for the localization
public struct LocalizedStringKey: Content {

    public let key: String
    
    public let context: Encodable?
    
    /// Initiates a localized string key with a context
    public init(key: String, context: Encodable? = nil) {
        
        self.key = key
        self.context = context
    }
}
