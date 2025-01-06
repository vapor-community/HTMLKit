/*
 Abstract:
 The file contains the renderer. The renderer runs through the content and transforms it into string output.
 */

import Foundation
import OrderedCollections
import Logging

@_documentation(visibility: internal)
public final class Renderer {

    /// An enumeration of possible rendering errors.
    public enum Errors: Error {
        
        /// Indicates a casting error.
        case unableToCastEnvironmentValue
        
        /// Indicates a wrong environment key.
        case unindendedEnvironmentKey
        
        /// Indicates a missing environment object.
        case environmentObjectNotFound
        
        /// Indicates a missing environment value.
        case environmentValueNotFound

        /// A brief error description.
        public var description: String {
            
            switch self {
            case .unableToCastEnvironmentValue:
                return "Unable to cast the environment value."
                
            case .unindendedEnvironmentKey:
                return "The environment key is not indended."
                
            case .environmentValueNotFound:
                return "Unable to retrieve environment value."
                
            case .environmentObjectNotFound:
                return "Unable to retrieve environment object."
            }
        }
    }
    
    /// The context environment
    private var environment: Environment
    
    /// The localization configuration
    private var localization: Localization?
    
    /// The security configuration
    private var security: Security
    
    /// The markdown parser
    private var markdown: Markdown
    
    /// The feature flag used to manage the visibility of new and untested features.
    private var features: Features
    
    /// The logger used to log all operations
    private var logger: Logger

    /// Initiates the renderer.
    public init(localization: Localization? = nil, 
                environment: Environment = Environment(),
                security: Security = Security(),
                features: Features = [],
                logger: Logger = Logger(label: "HTMLKit")) {
        
        self.localization = localization
        self.environment = environment
        self.security = security
        self.markdown = Markdown()
        self.features = features
        self.logger = logger
    }
    
    /// Renders a view and transforms it into a string representation.
    public func render(view: some View) throws -> String {
        
        var result = ""
        
        if let contents = view.body as? [Content] {
            result += try render(contents: contents)
        }
        
        return result
    }
    
    /// Reads the view content and transforms it.
    private func render(contents: [Content]) throws -> String {
        
        var result = ""
        
        for content in contents {
            
            if let contents = content as? [Content] {
                result += try render(contents: contents)
            }
            
            if let element = content as? (any View) {
                result += try render(view: element)
            }
            
            if let element = content as? (any ContentNode) {
                result += try render(element: element)
            }
            
            if let element = content as? (any EmptyNode) {
                result += try render(element: element)
            }
            
            if let element = content as? (any DocumentNode) {
                result += render(element: element)
            }
            
            if let element = content as? (any CommentNode) {
                result += render(element: element)
            }
            
            if let element = content as? (any CustomNode) {
                result += try render(element: element)
            }
            
            if let string = content as? LocalizedString {
                result += try render(localized: string)
            }
            
            if let modifier = content as? EnvironmentModifier {
                result += try render(modifier: modifier)
            }
            
            if let value = content as? EnvironmentValue {
                result += escape(content: try render(value: value))
            }
            
            if let statement = content as? Statement {
                
                if let yield = try render(statement: statement) {
                    result += yield
                }
            }
            
            if let loop = content as? Sequence {
                result += try render(loop: loop)
            }
            
            if let string = content as? MarkdownString {
                
                if !features.contains(.markdown) {
                    result += escape(content: string.raw)
                    
                } else {
                    result += try render(markdown: string)
                }
            }
            
            if let envstring = content as? EnvironmentString {
                result += try render(envstring: envstring)
            }
            
            if let element = content as? String {
                result += escape(content: element)
            }
        }
        
        return result
    }
    
    /// Renders a content element. A content element usually has descendants, which need to be rendered as well.
    private func render(element: some ContentNode) throws -> String {
        
        var result = ""
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            result += try render(attributes: attributes)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            
            for content in contents {
                
                if let contents = content as? [Content] {
                    result += try render(contents: contents)
                }
                
                if let element = content as? (any View) {
                    result += try render(view: element)
                }
                
                if let element = content as? (any ContentNode) {
                    result += try render(element: element)
                }
                
                if let element = content as? (any EmptyNode) {
                    result += try render(element: element)
                }
                
                if let element = content as? (any DocumentNode) {
                    result += render(element: element)
                }
                
                if let element = content as? (any CommentNode) {
                    result += render(element: element)
                }
                
                if let element = content as? (any CustomNode) {
                    result += try render(element: element)
                }
                
                if let string = content as? LocalizedString {
                    result += try render(localized: string)
                }
                
                if let modifier = content as? EnvironmentModifier {
                    result += try render(modifier: modifier)
                }
                
                if let value = content as? EnvironmentValue {
                    result += escape(content: try render(value: value))
                }
                
                if let loop = content as? Sequence {
                    result += try render(loop: loop)
                }
                
                if let statement = content as? Statement {
                    
                    if let yield = try render(statement: statement) {
                        result += yield
                    }
                }
                
                if let string = content as? MarkdownString {
                    
                    if !features.contains(.markdown) {
                        result += escape(content: string.raw)
                        
                    } else {
                        result += try render(markdown: string)
                    }
                }
                
                if let envstring = content as? EnvironmentString {
                    result += try render(envstring: envstring)
                }
                
                if let element = content as? String {
                    result += escape(content: element)
                }
            }
        }
        
        result += "</\(element.name)>"
        
        return result
    }
    
    /// Renders a empty element. An empty element has no descendants.
    private func render(element: some EmptyNode) throws -> String {
        
        var result = ""
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            result += try render(attributes: attributes)
        }
        
        result += ">"
        
        return result
    }
    
    /// Renders a document element. The document element holds the metadata.
    private func render(element: some DocumentNode) -> String {
        
        var result = ""

        result += "<!DOCTYPE "
        
        result += element.content
        
        result += ">"
        
        return result
    }
    
    /// Renders a comment element.
    private func render(element: some CommentNode) -> String {
        
        var result = ""
        
        result += "<!--"
        
        result += escape(content: element.content)
        
        result += "-->"
        
        return result
    }
    
    /// Renders a  custom element.
    private func render(element: some CustomNode) throws -> String {
        
        var result = ""
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            result += try render(attributes: attributes)
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            
            for content in contents {
                
                if let contents = content as? [Content] {
                    result += try render(contents: contents)
                }
                
                if let element = content as? (any View) {
                    result += try render(view: element)
                }
                
                if let element = content as? (any ContentNode) {
                    result += try render(element: element)
                }
                
                if let element = content as? (any EmptyNode) {
                    result += try render(element: element)
                }
                
                if let element = content as? (any DocumentNode) {
                    result += render(element: element)
                }
                
                if let element = content as? (any CommentNode) {
                    result += render(element: element)
                }
                
                if let element = content as? (any CustomNode) {
                    result += try render(element: element)
                }
                
                if let string = content as? LocalizedString {
                    result += try render(localized: string)
                }
                
                if let value = content as? EnvironmentValue {
                    result += escape(content: try render(value: value))
                }
                
                if let statement = content as? Statement {
                    
                    if let yield = try render(statement: statement) {
                        result += yield
                    }
                }
                
                if let loop = content as? Sequence {
                    result += try render(loop: loop)
                }
                
                if let string = content as? MarkdownString {
                    
                    if !features.contains(.markdown) {
                        result += escape(content: string.raw)
                        
                    } else {
                        result += try render(markdown: string)
                    }
                }
                
                if let envstring = content as? EnvironmentString {
                    result += try render(envstring: envstring)
                }
                
                if let element = content as? String {
                    result += escape(content: element)
                }
            }
        }
        
        result += "</\(element.name)>"
        
        return result
    }
    
    /// Renders a localized string key.
    private func render(localized string: LocalizedString) throws -> String {
        
        guard let localization = self.localization else {
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
    
    /// Renders a environment modifier.
    private func render(modifier: EnvironmentModifier) throws -> String {
        
        if let value = modifier.value {
            self.environment.upsert(value, for: modifier.key)
        }
        
        return try render(contents: modifier.content)
    }
    
    /// Renders a environment value.
    private func render(value: EnvironmentValue) throws -> String {
        
        guard let parent = self.environment.retrieve(for: value.parentPath) else {
            throw Errors.environmentObjectNotFound
        }

        guard let value = parent[keyPath: value.valuePath] else {
            throw Errors.environmentValueNotFound
        }
        
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
            formatter.timeZone = self.environment.timeZone ?? TimeZone.current
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            
            return formatter.string(from: dateValue)
            
        default:
            throw Errors.unableToCastEnvironmentValue
        }
    }

    /// Renders a environment statement
    private func render(statement: Statement) throws -> String? {
        
        var result = false
        
        if let value = statement.compound as? EnvironmentValue {
            
            guard let parent = self.environment.retrieve(for: value.parentPath) else {
                throw Errors.environmentObjectNotFound
            }

            guard let value = parent[keyPath: value.valuePath] else {
                throw Errors.environmentValueNotFound
            }
            
            guard let boolValue = value as? Bool else {
                throw Errors.unableToCastEnvironmentValue
            }
            
            if boolValue {
                result = true
            }
        }
        
        if let condition = statement.compound as? Condition {
            result = try render(condition: condition)
        }
        
        if let negation = statement.compound as? Negation {
            result = try render(negation: negation)
        }
        
        if let relation = statement.compound as? Relation {
            result = try render(relation: relation)
        }
        
        if result {
            return try render(contents: statement.first)
        }
        
        return try render(contents: statement.second)
    }
    
    private func render(negation: Negation) throws -> Bool {
        
        if let value = negation.lhs as? EnvironmentValue {
            
            guard let parent = self.environment.retrieve(for: value.parentPath) else {
                throw Errors.environmentObjectNotFound
            }

            guard let value = parent[keyPath: value.valuePath] else {
                throw Errors.environmentValueNotFound
            }
            
            guard let boolValue = value as? Bool else {
                throw Errors.unableToCastEnvironmentValue
            }
            
            if !boolValue {
                return true
            }
        }
        
        return false
    }
    
    private func render(relation: Relation) throws -> Bool {
        
        switch relation.term {
        case .conjunction:
            
            var result = true
            
            if let condition = relation.lhs as? Condition {
                result = try render(condition: condition)
            }
            
            if let relation = relation.lhs as? Relation {
                result = try render(relation: relation)
            }
            
            if !result {
                /// Bail early if the first result already is false
                return result
            }

            if let condition = relation.rhs as? Condition {
                result = try render(condition: condition)
            }
            
            if let relation = relation.rhs as? Relation {
                result = try render(relation: relation)
            }
            
            return result
            
        case .disjunction:
            
            var result = false
            
            if let condition = relation.lhs as? Condition {
                result = try render(condition: condition)
            }
            
            if let relation = relation.lhs as? Relation {
                result = try render(relation: relation)
            }
            
            if result {
                /// Bail early if the first result is already true
                return result
            }
            
            if let condition = relation.rhs as? Condition {
                result = try render(condition: condition)
            }
            
            if let relation = relation.rhs as? Relation {
                result = try render(relation: relation)
            }
            
            return result
        }
    }
    
    private func render(condition: Condition) throws -> Bool {
        
        guard let parent = self.environment.retrieve(for: condition.lhs.parentPath) else {
            throw Errors.environmentObjectNotFound
        }

        guard let value = parent[keyPath: condition.lhs.valuePath] else {
            throw Errors.environmentValueNotFound
        }
        
        switch condition.comparison {
        case .equal:
            return condition.rhs.equal(value)
            
        case .greater:
            return condition.rhs.greater(value)
            
        case .unequal:
            return condition.rhs.unequal(value)
            
        case .less:
            return condition.rhs.less(value)
        }
    }
    
    /// Renders the node attributes.
    private func render(attributes: OrderedDictionary<String, Any>) throws -> String {
        
        var result = ""
        
        for attribute in attributes {
            
            result += " \(attribute.key)=\""
            
            if let value = attribute.value as? EnvironmentValue {
                result += escape(attribute: try render(value: value))
                
            } else {
                result += escape(attribute: "\(attribute.value)")
            }
            
            result += "\""
        }
        
        return result
    }
    
    /// Renders the markdown content.
    private func render(markdown: MarkdownString) throws -> String {
        return self.markdown.render(string: escape(content: markdown.raw))
    }
    
    /// Renders a environment interpolation
    private func render(envstring: EnvironmentString) throws -> String {
        return try render(contents: envstring.values)
    }
    
    /// Converts specific charaters into encoded values.
    private func escape(attribute value: String) -> String {
        
        if security.autoEscaping {
            return value.replacingOccurrences(of: "&", with: "&amp;")
                .replacingOccurrences(of: "\"", with: "&quot;")
                .replacingOccurrences(of: "'", with: "&apos;")
        }
        
        return value
    }
    
    /// Converts specific charaters into encoded values.
    private func escape(content value: String) -> String {
        
        if security.autoEscaping {
            return value.replacingOccurrences(of: "<", with: "&lt;")
                .replacingOccurrences(of: ">", with: "&gt;")
        }
        
        return value
    }
    
    private func render(loop: Sequence) throws -> String {
        
        guard let parent = self.environment.retrieve(for: loop.value.parentPath) else {
            throw Errors.environmentObjectNotFound
        }

        guard let values = parent[keyPath: loop.value.valuePath] as? (any Swift.Sequence) else {
            throw Errors.environmentValueNotFound
        }
        
        var result = ""
        
        for value in values {
            try render(loop: loop.content, with: value, on: &result)
        }
        
        return result
    }
    
    private func render(loop contents: [Content], with value: Any, on result: inout String) throws {
        
        for content in contents {
            
            if let element = content as? (any ContentNode) {
                try render(loop: element, with: value, on: &result)
            }

            if let element = content as? (any CustomNode) {
                try render(loop: element, with: value, on: &result)
            }
            
            if let element = content as? (any EmptyNode) {
                result += try render(element: element)
            }
            
            if let element = content as? (any CommentNode) {
                result += render(element: element)
            }
            
            if let string = content as? LocalizedString {
                result += try render(localized: string)
            }
            
            if let string = content as? MarkdownString {
                
                if !features.contains(.markdown) {
                    result += escape(content: string.raw)
                    
                } else {
                    result += try render(markdown: string)
                }
            }
            
            if let envstring = content as? EnvironmentString {
                result += try render(envstring: envstring)
            }
            
            if let element = content as? String {
                result += escape(content: element)
            }
            
            if content is EnvironmentValue {
                
                switch value {
                case let floatValue as Float:
                    result += String(floatValue)
                    
                case let intValue as Int:
                    result += String(intValue)
                    
                case let doubleValue as Double:
                    result += String(doubleValue)
                    
                case let stringValue as String:
                    result += stringValue
                    
                default:
                    break
                }
            }
        }
    }
    
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
    
    private func render(loop envstring: EnvironmentString, with value: Any, on result: inout String) throws {
        try render(loop: envstring.values, with: value, on: &result)
    }
}
