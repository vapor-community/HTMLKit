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
            result += try render(contents: contents)
        }
        
        return result
    }
    
    /// Process the view content
    ///
    /// - Parameter contents: The content to process
    ///
    /// - Returns: A string representation of the content
    private func render(contents: [Content]) throws -> String {
        
        var result = ""
        
        for content in contents {
            
            switch content {
            case let content as [Content]:
                result += try render(contents: content)
                
            case let view as View:
                result += try render(view: view)
                
            case let element as any ContentNode:
                result += try render(element: element)
                
            case let element as EmptyNode:
                result += try render(element: element)
                
            case let element as DocumentNode:
                result += render(element: element)
                
            case let element as CommentNode:
                result += render(element: element)
                
            case let element as any CustomNode:
                result += try render(element: element)
                
            case let modifier as EnvironmentModifier:
                result += try render(modifier: modifier)
                
            case let value as EnvironmentValue:
                result += escape(content: try render(envvalue: value))
                
            case let statement as Statement:
                result += try render(statement: statement)
                
            case let sequence as Sequence:
                result += try render(loop: sequence)
                
            case let string as LocalizedString:
                result += try render(localized: string)
                
            case let string as MarkdownString:
                
                if !features.contains(.markdown) {
                    result += escape(content: string.raw)
                    
                } else {
                    result += try render(markstring: string)
                }
                
            case let string as EnvironmentString:
                result += try render(envstring: string)
                
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
                
                result = formatter.string(from: date)
                
            default:
                throw Error.unknownContentType
            }
        }
        
        return result
    }
    
    /// Renders a content element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some ContentNode) throws -> String {
        
        var result = ""
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            result += try render(attributes: attributes)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            result += try render(contents: contents)
        }
        
        result += "</\(element.name)>"
        
        return result
    }
    
    /// Renders a empty element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some EmptyNode) throws -> String {
        
        var result = ""
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            result += try render(attributes: attributes)
        }
        
        result += ">"
        
        return result
    }
    
    /// Renders a document element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some DocumentNode) -> String {
        
        var result = ""

        result += "<!DOCTYPE "
        
        result += element.content
        
        result += ">"
        
        return result
    }
    
    /// Renders a comment element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some CommentNode) -> String {
        
        var result = ""
        
        result += "<!--"
        
        result += escape(content: element.content)
        
        result += "-->"
        
        return result
    }
    
    /// Renders a custom element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some CustomNode) throws -> String {
        
        var result = ""
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            result += try render(attributes: attributes)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            result += try render(contents: contents)
        }
        
        result += "</\(element.name)>"
        
        return result
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
            
        } catch Localization.Errors.missingKey(let key, let locale) {
            
            logger.warning("Unable to find translation key '\(key)' for the locale '\(locale)'.")
            
            // Check if the fallback was already in charge
            if environment.locale != nil {
                
                // Seems not, let's try to recover by using the fallback
                return try localization.localize(string: string)
            }
            
            return string.key.literal
        }
    }
    
    /// Renders a environment modifier
    ///
    /// - Parameter modifier: The modifier to apply to
    ///
    /// - Returns: The string interpolation of the fellow content
    private func render(modifier: EnvironmentModifier) throws -> String {
        
        if let value = modifier.value {
            self.environment.upsert(value, for: modifier.key)
        }
        
        return try render(contents: modifier.content)
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
    private func render(statement: Statement) throws -> String {
        
        var result = false
        
        switch statement.compound {
        case .optional(let optional):
            result = try environment.evaluate(optional: optional)
            
        case .value(let value):
            result = try environment.evaluate(value: value)
            
        case .condition(let condition):
            result = try environment.evaluate(condition: condition)
            
        case .negation(let negation):
            result = try environment.evaluate(negation: negation)
            
        case .relation(let relation):
            result = try environment.evaluate(relation: relation)
        }
        
        if result {
            return try render(contents: statement.first)
        }
        
        return try render(contents: statement.second)
    }
    
    /// Renders the attributes
    ///
    /// - Parameter attributes: The attributes to render
    ///
    /// - Returns: The string representation
    private func render(attributes: OrderedDictionary<String, Any>) throws -> String {
        
        var result = ""
        
        for attribute in attributes {
            
            result += " \(attribute.key)=\""
            
            if let value = attribute.value as? EnvironmentValue {
                result += escape(attribute: try render(envvalue: value))
                
            } else {
                result += escape(attribute: "\(attribute.value)")
            }
            
            result += "\""
        }
        
        return result
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
    private func render(envstring: EnvironmentString) throws -> String {
        return try render(contents: envstring.values)
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
    
    /// Renders an environment loop
    ///
    /// - Parameter loop: The sequence to resolve
    ///
    /// - Returns: The string representation
    private func render(loop: Sequence) throws -> String {
        
        let value = try environment.resolve(value: loop.value)
        
        guard let sequence = value as? (any Swift.Sequence) else {
            throw Environment.Errors.unableToCastEnvironmentValue
        }
        
        var result = ""
        
        for value in sequence {
            try render(loop: loop.content, with: value, on: &result)
        }
        
        return result
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
                result += try render(element: element)
                
            case let element as CommentNode:
                result += render(element: element)
                
            case let string as LocalizedString:
                result += try render(localized: string)
                
            case let string as MarkdownString:
                result += try render(markstring: string)
                
            case let string as EnvironmentString:
                result += try render(envstring: string)
                
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
            result += try render(attributes: attributes)
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
            result += try render(attributes: attributes)
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
}
