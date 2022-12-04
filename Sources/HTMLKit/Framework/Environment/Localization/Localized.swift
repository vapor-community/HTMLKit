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

extension Localized: Node {
    
    internal func prerender(with formula: Formula) {
        formula.add(ingridient: self)
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        
        var result = ""
        
        if let lingo = manager.lingo {
            
            let locale = manager.locale ?? lingo.defaultLocale
            
            if let context = self.context {

                if let value = try? context.value(from: manager) {
                    
                    if let data = try? JSONEncoder().encode(value) {

                        let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
                        
                        result += lingo.localize(self.key, locale: locale, interpolations: dictionary)
                    }
                }
            } else {
                result += lingo.localize(self.key, locale: locale)
            }
        }
        
        return result
    }
}
