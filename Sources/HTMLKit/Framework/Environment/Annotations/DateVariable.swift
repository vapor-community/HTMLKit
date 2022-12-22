/*
 Abstract:
 The file contains a type for a datetime variable.
 */

import Foundation

/// A struct that renders a data in a specified format
///
///
public struct DateVariable: AnyContent {

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

    public func render<T>(with manager: ContextManager<T>) throws -> String {

        var optionalDate: Date?
        
        switch dateReference {
        case .solid(let path):
            
            optionalDate = try path.value(from: manager)
            
        case .optional(let path):
            
            optionalDate = try path.value(from: manager)
        }

        guard let date = optionalDate else { return "" }

        let formatter = DateFormatter()

        if let locale = manager.locale {
            
            formatter.locale = .init(identifier: locale)
        }
        
        switch format {
        case .literal(let format):
            
            formatter.dateFormat = format
            
        case .style(let style):
            
            formatter.dateStyle = style.dateStyle
            formatter.timeStyle = style.timeStyle
        }
        
        return formatter.string(from: date)
    }
}
