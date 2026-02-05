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
    
    /// The encoder used to encode html entities
    private var encoder: Encoder
    
    /// The sanitizer used to clean up html output
    private var sanitizer: Sanitizer

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
        self.sanitizer = Sanitizer()
    }
    
    /// Renders the provided view
    ///
    /// - Parameter view: The view to render
    ///
    /// - Returns: A string representation
    public func render(view: some View) throws -> String {
        
        var result = ""
        
        if let contents = view.body as? [Content] {
            try render(contents: contents, on: &result, within: .tainted(.html))
        }
        
        return result
    }
    
    /// Process the view content
    ///
    /// - Parameter contents: The content to process
    ///
    /// - Returns: A string representation of the content
    private func render(contents: [Content], on result: inout String, within context: EscapeContext) throws {
        
        for content in contents {
            
            switch content {
            case let content as [Content]:
                try render(contents: content, on: &result, within: context)
                
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
                
            case let string as String:
                
                switch context {
                case .trusted:
                    result += string
                    
                case .tainted(let subcontext):
                    result += escape(element: string, with: subcontext)
                }
                
            case let double as Double:
                result += "\(double)"
                
            case let int as Int:
                result += "\(int)"
                
            case let float as Float:
                result += "\(float)"
                
            case let bool as Bool:
                result += "\(bool)"
                
            case let date as Date:
                
                let formatter = DateFormatter()
                formatter.timeZone = environment.timeZone ?? TimeZone.current
                formatter.dateStyle = .medium
                formatter.timeStyle = .short
                
                result += formatter.string(from: date)
            
            case let string as LocalizedString:

                switch context {
                case .trusted:
                    result += try render(localized: string)
                    
                case .tainted(let subcontext):
                    result +=  escape(element: try render(localized: string), with: subcontext)
                }
                
            case let string as MarkdownString:
                result += try render(markdownstring: string, within: context)
                
            case let modifier as EnvironmentModifier:
                try render(modifier: modifier, on: &result, within: context)
                
            case let value as EnvironmentValue:
                result += try render(envelement: value, within: context)
                
            case let statement as Statement:
                try render(statement: statement, on: &result, within: context)
                
            case let sequence as Sequence:
                try render(loop: sequence, on: &result, within: context)
                
            case let string as EnvironmentString:
                try render(envstring: string, on: &result, within: context)
                
            case let string as HtmlString:
                result += string.value
                
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
            try render(contents: contents, on: &result, within: element.context)
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
        
        switch element.context {
        case .trusted:
            result += element.content
            
        case .tainted(let subcontext):
            result += escape(element: element.content, with: subcontext)
        }
        
        result += ">"
    }
    
    /// Renders a comment element
    ///
    /// - Parameter element: The element to transform
    ///
    /// - Returns: The string representation
    private func render(element: some CommentNode, on result: inout String) {
        
        result += "<!--"
    
        switch element.context {
        case .trusted:
            result += element.content
            
        case .tainted(let subcontext):
            result += escape(element: element.content, with: subcontext)
        }
        
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
            try render(contents: contents, on: &result, within: element.context)
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
    private func render(modifier: EnvironmentModifier, on result: inout String, within context: EscapeContext) throws {
        
        if let value = modifier.value {
            self.environment.upsert(value, for: modifier.key)
        }
        
        try render(contents: modifier.content, on: &result, within: context)
    }
    
    /// Renders a environment value
    ///
    /// - Parameter value: The environment value to resolve
    ///
    /// - Returns: The string representation
    private func render(envattribute value: EnvironmentValue, within context: EscapeContext) throws -> String {
        
        let value = try self.environment.resolve(value: value)
        
        switch value {
        case let stringValue as String:
            
            switch context {
            case .trusted:
                return stringValue
                
            case .tainted(let subcontext):
                return escape(attribute: stringValue, with: subcontext)
            }
            
        case let floatValue as Float:
            return String(floatValue)
            
        case let intValue as Int:
            return String(intValue)
            
        case let doubleValue as Double:
            return String(doubleValue)
            
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
    
    /// Renders a environment value
    ///
    /// - Parameter value: The environment value to resolve
    ///
    /// - Returns: The string representation
    private func render(envelement value: EnvironmentValue, within context: EscapeContext) throws -> String {
        
        let value = try self.environment.resolve(value: value)
        
        switch value {
        case let stringValue as String:

            switch context {
            case .trusted:
                return stringValue
                
            case .tainted(let subcontext):
                return escape(element: stringValue, with: subcontext)
            }
            
        case let floatValue as Float:
            return String(floatValue)
            
        case let intValue as Int:
            return String(intValue)
            
        case let doubleValue as Double:
            return String(doubleValue)
            
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
    private func render(statement: Statement, on result: inout String, within context: EscapeContext) throws {
        
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
            try render(contents: statement.first, on: &result, within: context)
            
        } else {
            try render(contents: statement.second, on: &result, within: context)
        }
    }
    
    /// Renders the attributes
    ///
    /// - Parameter attributes: The attributes to render
    ///
    /// - Returns: The string representation
    private func render(attributes: OrderedDictionary<String, AttributeData>, on result: inout String) throws {
        
        for attribute in attributes {
            
            result += " \(attribute.key)=\""
            
            switch attribute.value.value {
            case .string(let string):
                
                switch attribute.value.context {
                case .trusted:
                    result += string
                    
                case .tainted(let subcontext):
                    result += escape(attribute: string, with: subcontext)
                }
                
            case .bool(let bool):
                
                result += "\(bool)"
                
            case .double(let double):
                
                result += "\(double)"
                
            case .float(let float):
                
                result += "\(float)"
                
            case .int(let int):
                
                result += "\(int)"
                
            case .localized(let localized):
                
                switch attribute.value.context {
                case .trusted:
                    result += try render(localized: localized)
                    
                case .tainted(let subcontext):
                    result += try escape(attribute: render(localized: localized), with: subcontext)
                }
                
            case .environment(let environment):
                
                result += try render(envattribute: environment, within: attribute.value.context)
                
            case .list(let enumerated):
                
                switch attribute.value.context {
                case .trusted:
                    result += enumerated.description
                    
                case .tainted(let subcontext):
                    result += escape(attribute: enumerated.description, with: subcontext)
                }
            }
            
            result += "\""
        }
    }
    
    /// Renders the markdown string
    ///
    /// - Parameter markstring: The string to render
    ///
    /// - Returns: The string representation
    private func render(markdownstring: MarkdownString, within context: EscapeContext) throws -> String {
        
        if !features.contains(.markdown) {
            return markdownstring.raw
        }
        
        switch context {
        case .trusted:
            return self.markdown.render(string: markdownstring.raw)
            
        case .tainted(let subcontext):
            return self.markdown.render(string: escape(element: markdownstring.raw, with: subcontext))
        }
    }
    
    /// Renders a environment string
    ///
    /// - Parameter envstring: The string to render
    ///
    /// - Returns: The string representation
    private func render(envstring: EnvironmentString, on result: inout String, within context: EscapeContext) throws {
        return try render(contents: envstring.values, on: &result, within: context)
    }
    
    /// Renders an environment loop
    ///
    /// - Parameter loop: The sequence to resolve
    ///
    /// - Returns: The string representation
    private func render(loop: Sequence, on result: inout String, within context: EscapeContext) throws {
        
        let value = try environment.resolve(value: loop.value)
        
        guard let sequence = value as? (any Swift.Sequence) else {
            throw Environment.Errors.unableToCastEnvironmentValue
        }
        
        for value in sequence {
            try render(loop: loop.content, with: value, on: &result, within: context)
        }
    }
    
    /// Renders the content within an environment loop
    ///
    /// - Parameters:
    ///   - contents: The content to render
    ///   - value: The value to resolve the environment value with
    ///   - result: The rendered content
    private func render(loop contents: [Content], with value: Any, on result: inout String, within context: EscapeContext) throws {
        
        for content in contents {
            
            switch content {
            case let element as any ContentNode:
                try render(loop: element, with: value, on: &result, within: context)
                
            case let element as EmptyNode:
                try render(element: element, on: &result)
                
            case let element as CommentNode:
                render(element: element, on: &result)
                
            case let element as any CustomNode:
                try render(loop: element, with: value, on: &result, within: context)
                
            case let string as String:

                switch context {
                case .trusted:
                    result += string
                    
                case .tainted(let subcontext):
                    result += escape(element: string, with: subcontext)
                }
                
            case let string as LocalizedString:

                switch context {
                case .trusted:
                    result += try render(localized: string)
                    
                case .tainted(let subcontext):
                    result +=  escape(element: try render(localized: string), with: subcontext)
                }
                
            case let string as MarkdownString:
                result += try render(markdownstring: string, within: context)
                
            case let string as EnvironmentString:
                try render(envstring: string, on: &result, within: context)
                
            case is EnvironmentValue:
                
                switch value {
                case let stringValue as String:

                    switch context {
                    case .trusted:
                        result += stringValue
                        
                    case .tainted(let subcontext):
                        result += escape(element: stringValue, with: subcontext)
                    }
                    
                case let floatValue as Float:
                    result += String(floatValue)
                    
                case let intValue as Int:
                    result += String(intValue)
                    
                case let doubleValue as Double:
                    result += String(doubleValue)
                    
                case let dateValue as Date:
                    
                    let formatter = DateFormatter()
                    formatter.timeZone = environment.timeZone ?? TimeZone.current
                    formatter.dateStyle = .medium
                    formatter.timeStyle = .short
                    
                    result += formatter.string(from: dateValue)
                    
                default:
                    throw Error.unknownValueType
                }
                
            case let string as HtmlString:
                result += string.value
                
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
    private func render(loop element: some ContentNode, with value: Any, on result: inout String, within context: EscapeContext) throws {
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            try render(attributes: attributes, on: &result)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            try render(loop: contents, with: value, on: &result, within: context)
        }
        
        result += "</\(element.name)>"
    }
    
    /// Renders a custom element within an environment loop
    ///
    /// - Parameters:
    ///   - element: The element to render
    ///   - value: The value to resolve the environment value with
    ///   - result: The string representation
    private func render(loop element: some CustomNode, with value: Any, on result: inout String, within context: EscapeContext) throws {
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            try render(attributes: attributes, on: &result)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            try render(loop: contents, with: value, on: &result, within: context)
        }
        
        result += "</\(element.name)>"
    }
    
    /// Renders an environment string within a environment loop
    ///
    /// - Parameters:
    ///   - envstring: The environment string to render
    ///   - value: The raw value to resolve the environment value with
    ///   - result: The string representation
    private func render(loop envstring: EnvironmentString, with value: Any, on result: inout String, within context: EscapeContext) throws {
        try render(loop: envstring.values, with: value, on: &result, within: context)
    }
    
    /// Escapes a tainted element.
    ///
    /// - Parameter string: The string value to escape.
    /// - Parameter context: The context of the string.
    ///  
    /// - Returns: The untainted string
    private func escape(element string: String, with context: EscapeContext.Subcontext) -> String {
        
        if !features.contains(.escaping) {
            return string
        }
        
        switch context {
        case .html:
            return encoder.encode(string, as: .html(.element))
            
        case .css:
            
            // To prevent breaking out of context
            let sanitized = sanitizer.strip("style", from: string)
            
            return encoder.encode(sanitized, as: .css(.element))
            
        case .js:
            
            // To prevent breaking out of context
            let sanitized = sanitizer.strip("script", from: string)
            
            return encoder.encode(sanitized, as: .js(.element))
            
        case .url:
            return encoder.encode(string, as: .html(.element))
        }
    }
    
    /// Escapes a tainted attribute.
    /// 
    /// - Parameter string: The string value to escape.
    /// - Parameter context: The context of the string.
    ///  
    /// - Returns: The untainted string
    private func escape(attribute string: String, with context: EscapeContext.Subcontext) -> String {
        
        if !features.contains(.escaping) {
            return string
        }
        
        switch context {
        case .html:
            return encoder.encode(string, as: .html(.attribute))
            
        case .css:
            return encoder.encode(string, as: .css(.attribute))
            
        case .js:
            return encoder.encode(string, as: .js(.attribute))
            
        case .url:
            return encoder.encode(string, as: .html(.attribute))
        }
    }
}
