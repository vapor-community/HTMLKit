/*
 Abstract:
 The file contains the localized.
 */

import Foundation

/// The struct ist for
public struct NoData: Encodable {}

/// The struct ist for
public struct Localized<B>: Content where B: Encodable {

    public enum Errors: Error {
        case missingLingoConfig
    }

    public let key: String

    public let context: TemplateValue<B>?

    public init(key: String, context: TemplateValue<B>) {
        self.key = key
        self.context = context
    }
}

extension Localized where B == NoData {
    
    public init(key: String) {
        self.key = key
        self.context = nil
    }
}
