import Foundation
import OrderedCollections
import Logging

/// The renderer responsible for processing content and transforming it into a string representation
///
/// ```swift
/// Html {
///     Head {
///         Title {
///             "Lorem ipsum..."
///         }
///     }
/// }
/// ```
///
/// ```html
/// <html><head><title>Lorem ipsum...</title></head></html>
/// ```
///
@_documentation(visibility: internal)
public struct Renderer {
    
    /// A enumeration of potential errors during rendering
    public enum Error: Swift.Error {
        
        /// Indicates a unknown conten type
        case unknownContentType
        
        /// Indicates a unknown value type
        case unknownValueType
        
        /// Returns a description about the failure reason
        public var description: String {
            
            switch self {
            case .unknownContentType:
                return "The type of the content could not be determined."
                
            case .unknownValueType:
                return "The type of the value could not be determined."
            }
        }
    }
    
    /// The context environment used during rendering
    private var environment: Environment
    
    /// The localization configuration
    private var localization: Localization?
    
    /// The markdown parser
    private var markdown: Markdown
    
    /// The feature flag used to manage the visibility of new and untested features
    private var features: Features
    
    /// The logger used to log all operations
    private var logger: Logger
    
    ///  The encoder used to encode html entities
    private var encoder: Encoder

    /// Initializes the renderer
    ///
    /// - Parameters:
    ///   - localization: The localization
    ///   - environment: The environment
    ///   - security: The security configuration
    ///   - features: The feature set
    public init(localization: Localization? = nil,
                environment: Environment = Environment(),
                features: Features = [.escaping],
                logger: Logger = Logger(label: "HTMLKit")) {
        
        self.localization = localization
        self.environment = environment
        self.markdown = Markdown()
        self.features = features
        self.logger = logger
        self.encoder = Encoder()
    }
    
    /// Renders the provided view
    ///
    /// - Parameter view: The view to render
    ///
    /// - Returns: A string representation
    public func render(view: some View) throws -> String {
        
        var result = ""
        
        if let contents = view.body as? [Content] {
            try render(contents: contents, on: &result)
        }
        
        return result
    }
    
    /// Process the view content
    ///
    /// - Parameter contents: The content to process
    ///
    /// - Returns: A string representation of the content
    private func render(contents: [Content], on result: inout String) throws {
        
        for content in contents {
            
            switch content {
            case let content as [Content]:
                try render(contents: content, on: &result)
                
            case let view as View:
                result += try render(view: view)
                
            case let element as any ContentNode:
                try render(element: element, on: &result)
                
            case let element as EmptyNode:
                try render(element: element, on: &result)
                
            case let element as DocumentNode:
                render(element: element, on: &result)
                
            case let element as CommentNode:
                render(element: element, on: &result)
                
            case let element as any CustomNode:
                try render(element: element, on: &result)
                
            case let modifier as EnvironmentModifier:
                try render(modifier: modifier, on: &result)
                
            case let value as EnvironmentValue:
                result += escape(content: try render(envvalue: value))
                
            case let statement as Statement:
                try render(statement: statement, on: &result)
                
            case let sequence as Sequence:
                try render(loop: sequence, on: &result)
                
            case let string as LocalizedString:
                result += try render(localized: string)
                
            case let string as MarkdownString:
                
                if !features.contains(.markdown) {
                    result += escape(content: string.raw)
                    
                } else {
                    result += try render(markstring: string)
                }
                
            case let string as EnvironmentString:
                try render(envstring: string, on: &result)
                
            case let string as HtmlString:
                result += string.value
                
            case let doubleValue as Double:
                result += String(doubleValue)
                
            case let floatValue as Float:
                result += String(floatValue)
                
            case let intValue as Int:
                result += String(intValue)
                
            case let stringValue as String:
                result += escape(content: stringValue)
                
            case let date as Date:
                
                let formatter = DateFormatter()
                formatter.timeZone = environment.timeZone ?? TimeZone.current
                formatter.dateStyle = .medium
                formatter.timeStyle = .short
                
                result += formatter.string(from: date)
                
            default:
                throw Error.unknownContentType
            }
        }
    }
    
    /// Renders a content element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some ContentNode, on result: inout String) throws {
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            try render(attributes: attributes, on: &result)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            try render(contents: contents, on: &result)
        }
        
        result += "</\(element.name)>"
    }
    
    /// Renders a empty element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some EmptyNode, on result: inout String) throws {
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            try render(attributes: attributes, on: &result)
        }
        
        result += ">"
    }
    
    /// Renders a document element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some DocumentNode, on result: inout String) {

        result += "<!DOCTYPE "
        
        result += element.content
        
        result += ">"
    }
    
    /// Renders a comment element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some CommentNode, on result: inout String) {
        
        result += "<!--"
    
        result += escape(content: element.content)
        
        result += "-->"
    }
    
    /// Renders a custom element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some CustomNode, on result: inout String) throws {
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            try render(attributes: attributes, on: &result)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            try render(contents: contents, on: &result)
        }
        
        result += "</\(element.name)>"
    }
    
    /// Renders a localized string
    ///
    /// - Parameter string: The localized string to transform
    ///
    /// - Returns: The string representation
    private func render(localized string: LocalizedString) throws -> String {
        
        guard let localization = localization else {
            // Bail early with the fallback since the localization is not in use
            return string.key.literal
        }
        
        if !localization.isConfigured {
            // Bail early, since the localization is not properly configured
            return string.key.literal
        }
        
        do {
            
            return try localization.localize(string: string, for: environment.locale)
            
        } catch let error as Localization.Errors {
            
            logger.warning("\(error.description)")
            
            switch error {
            case .missingKey:
                
                if environment.locale != nil {
                    
                    logger.debug("Trying to recover from missing key")
                    
                    return try localization.recover(from: error, with: string)
                }
                
                fallthrough
                
            case .missingTable:
                
                logger.debug("Trying to recover from missing table")
                
                // Clear the locale on the environment, since it cannot be used for the remainder of the rendering,
                // otherwise it will throw an error each time
                environment.upsert(Optional<Locale>.none, for: \EnvironmentKeys.locale)
                
                return try localization.recover(from: error, with: string)
                
            default:
                return string.key.literal
            }
        }
    }
    
    /// Renders a environment modifier
    ///
    /// - Parameter modifier: The modifier to apply to
    ///
    /// - Returns: The string interpolation of the fellow content
    private func render(modifier: EnvironmentModifier, on result: inout String) throws {
        
        if let value = modifier.value {
            self.environment.upsert(value, for: modifier.key)
        }
        
        try render(contents: modifier.content, on: &result)
    }
    
    /// Renders a environment value
    ///
    /// - Parameter value: The environment value to resolve
    ///
    /// - Returns: The string representation
    private func render(envvalue: EnvironmentValue) throws -> String {
        
        let value = try self.environment.resolve(value: envvalue)
        
        switch value {
        case let floatValue as Float:
            return String(floatValue)
            
        case let intValue as Int:
            return String(intValue)
            
        case let doubleValue as Double:
            return String(doubleValue)
            
        case let stringValue as String:
            return stringValue
            
        case let dateValue as Date:
            
            let formatter = DateFormatter()
            formatter.timeZone = environment.timeZone ?? TimeZone.current
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            
            return formatter.string(from: dateValue)
            
        default:
            throw Error.unknownValueType
        }
    }

    /// Renders a environment statement
    ///
    /// - Parameter statement: The statement to resolve
    ///
    /// - Returns: The rendered condition
    private func render(statement: Statement, on result: inout String) throws {
        
        var evaluation = false
        
        switch statement.compound {
        case .optional(let optional):
            evaluation = try environment.evaluate(optional: optional)
            
        case .value(let value):
            evaluation = try environment.evaluate(value: value)
            
        case .condition(let condition):
            evaluation = try environment.evaluate(condition: condition)
            
        case .negation(let negation):
            evaluation = try environment.evaluate(negation: negation)
            
        case .relation(let relation):
            evaluation = try environment.evaluate(relation: relation)
        }
        
        if evaluation {
            try render(contents: statement.first, on: &result)
            
        } else {
            try render(contents: statement.second, on: &result)
        }
    }
    
    /// Renders the attributes
    ///
    /// - Parameter attributes: The attributes to render
    ///
    /// - Returns: The string representation
    private func render(attributes: OrderedDictionary<String, Any>, on result: inout String) throws {
        
        for attribute in attributes {
            
            result += " \(attribute.key)=\""
            
            switch attribute.value {
            case let string as LocalizedString:
                result += try render(localized: string)
                
            case let value as EnvironmentValue:
                result += escape(attribute: try render(envvalue: value))
                
            default:
                result += escape(attribute: "\(attribute.value)")
            }
            
            result += "\""
        }
    }
    
    /// Renders the markdown string
    ///
    /// - Parameter markstring: The string to render
    ///
    /// - Returns: The string representation
    private func render(markstring: MarkdownString) throws -> String {
        return markdown.render(string: escape(content: markstring.raw))
    }
    
    /// Renders a environment string
    ///
    /// - Parameter envstring: The string to render
    ///
    /// - Returns: The string representation
    private func render(envstring: EnvironmentString, on result: inout String) throws {
        return try render(contents: envstring.values, on: &result)
    }
    
    /// Renders an environment loop
    ///
    /// - Parameter loop: The sequence to resolve
    ///
    /// - Returns: The string representation
    private func render(loop: Sequence, on result: inout String) throws {
        
        let value = try environment.resolve(value: loop.value)
        
        guard let sequence = value as? (any Swift.Sequence) else {
            throw Environment.Errors.unableToCastEnvironmentValue
        }
        
        for value in sequence {
            try render(loop: loop.content, with: value, on: &result)
        }
    }
    
    /// Renders the content within an environment loop
    ///
    /// - Parameters:
    ///   - contents: The content to render
    ///   - value: The value to resolve the environment value with
    ///   - result: The rendered content
    private func render(loop contents: [Content], with value: Any, on result: inout String) throws {
        
        for content in contents {
            
            switch content {
            case let element as any ContentNode:
                try render(loop: element, with: value, on: &result)
                
            case let element as any CustomNode:
                try render(loop: element, with: value, on: &result)
                
            case let element as EmptyNode:
                try render(element: element, on: &result)
                
            case let element as CommentNode:
                render(element: element, on: &result)
                
            case let string as LocalizedString:
                result += try render(localized: string)
                
            case let string as MarkdownString:
                result += try render(markstring: string)
                
            case let string as EnvironmentString:
                try render(envstring: string, on: &result)
                
            case let string as HtmlString:
                result += string.value
                
            case let string as String:
                result += escape(content: string)
                
            case is EnvironmentValue:
                
                switch value {
                case let floatValue as Float:
                    result += String(floatValue)
                    
                case let intValue as Int:
                    result += String(intValue)
                    
                case let doubleValue as Double:
                    result += String(doubleValue)
                    
                case let stringValue as String:
                    result += stringValue
                    
                case let dateValue as Date:
                    
                    let formatter = DateFormatter()
                    formatter.timeZone = environment.timeZone ?? TimeZone.current
                    formatter.dateStyle = .medium
                    formatter.timeStyle = .short
                    
                    result += formatter.string(from: dateValue)
                    
                default:
                    throw Error.unknownValueType
                }
                
            default:
                throw Error.unknownContentType
            }
        }
    }
    
    /// Renders a content element within an environment loop
    ///
    /// - Parameters:
    ///   - element: The element to render
    ///   - value: The value to resolve the environment value with
    ///   - result: The result
    private func render(loop element: some ContentNode, with value: Any, on result: inout String) throws {
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            try render(attributes: attributes, on: &result)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            try render(loop: contents, with: value, on: &result)
        }
        
        result += "</\(element.name)>"
    }
    
    /// Renders a custom element within an environment loop
    ///
    /// - Parameters:
    ///   - element: The element to render
    ///   - value: The value to resolve the environment value with
    ///   - result: The string representation
    private func render(loop element: some CustomNode, with value: Any, on result: inout String) throws {
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            try render(attributes: attributes, on: &result)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            try render(loop: contents, with: value, on: &result)
        }
        
        result += "</\(element.name)>"
    }
    
    /// Renders an environment string within a environment loop
    ///
    /// - Parameters:
    ///   - envstring: The environment string to render
    ///   - value: The raw value to resolve the environment value with
    ///   - result: The string representation
    private func render(loop envstring: EnvironmentString, with value: Any, on result: inout String) throws {
        try render(loop: envstring.values, with: value, on: &result)
    }
    
    /// Escapes special characters in the given attribute value
    ///
    /// The special characters for the attribute are the backslash, the ampersand and the single quotation mark.
    ///
    /// - Parameter value: The attribute value to be escaped
    ///
    /// - Returns: The escaped value
    private func escape(attribute value: String) -> String {
        
        if !features.contains(.escaping) {
            return value
        }
        
        return encoder.encode(value, as: .attribute)
    }
    
    /// Escapes special characters in the given content value
    ///
    /// The special characters for the content are the Greater than, Less than symbol.
    ///
    /// - Parameter value: The content value to be escaped
    ///
    /// - Returns: The escaped value
    private func escape(content value: String) -> String {
        
        if !features.contains(.escaping) {
            return value
        }
        
        return encoder.encode(value, as: .entity)
    }
}
