/*
 Abstract:
 The file contains a type for a datetime variable.
 */

import Foundation

/// A struct that renders a data in a specified format
///
///
public struct DateVariable: Content {

    public enum Errors: LocalizedError {
        
        case unableToCopyFormatter

        public var errorDescription: String? {
            return "Unable to copy the DateFormatter when rendering a date with a locale"
        }
    }

    public enum Reference {
        
        case solid(TemplateValue<Date>)
        case optional(TemplateValue<Date?>)
    }

    public enum Format {
        
        case style(Style)
        case literal(String)

        public struct Style {
            
            let dateStyle: DateFormatter.Style
            let timeStyle: DateFormatter.Style
        }
    }

    public let dateReference: Reference

    public var format: Format
}
