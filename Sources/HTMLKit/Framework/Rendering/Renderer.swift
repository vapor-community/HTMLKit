/*
 Abstract:
 The file contains the renderer. The renderer runs through the content and transforms it into string output.
 */

import Foundation
import OrderedCollections

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
        
        /// Indicates a missing localization configuration.
        case missingLocalization

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
                
            case .missingLocalization:
                return "The localization seem to missing."
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

    /// Initiates the renderer.
    public init(localization: Localization? = nil, 
                environment: Environment = Environment(),
                security: Security = Security(),
                features: Features = []) {
        
        self.localization = localization
        self.environment = environment
        self.security = security
        self.markdown = Markdown()
        self.features = features
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
            
            if let stringkey = content as? LocalizedStringKey {
                result += try render(stringkey: stringkey)
            }
            
            if let modifier = content as? EnvironmentModifier {
                result += try render(modifier: modifier)
            }
            
            if let value = content as? EnvironmentValue {
                result += escape(content: try render(value: value))
            }
            
            if let string = content as? MarkdownString {
                
                if !features.contains(.markdown) {
                    result += escape(content: string.raw)
                    
                } else {
                    result += try render(markdown: string)
                }
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
                
                if let stringkey = content as? LocalizedStringKey {
                    result += try render(stringkey: stringkey)
                }
                
                if let modifier = content as? EnvironmentModifier {
                    result += try render(modifier: modifier)
                }
                
                if let value = content as? EnvironmentValue {
                    result += escape(content: try render(value: value))
                }
                
                if let string = content as? MarkdownString {
                    
                    if !features.contains(.markdown) {
                        result += escape(content: string.raw)
                        
                    } else {
                        result += try render(markdown: string)
                    }
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
                
                if let stringkey = content as? LocalizedStringKey {
                    result += try render(stringkey: stringkey)
                }
                
                if let value = content as? EnvironmentValue {
                    result += escape(content: try render(value: value))
                }
                
                if let string = content as? MarkdownString {
                    
                    if !features.contains(.markdown) {
                        result += escape(content: string.raw)
                        
                    } else {
                        result += try render(markdown: string)
                    }
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
    private func render(stringkey: LocalizedStringKey) throws -> String {
        
        guard let localization = self.localization else {
            throw Errors.missingLocalization
        }
        
        if let table = stringkey.table {
            return try localization.localize(key: stringkey.key, table: table, locale: environment.locale, interpolation: stringkey.interpolation)
        }
        
        return try localization.localize(key: stringkey.key, locale: environment.locale, interpolation: stringkey.interpolation)
    }
    
    /// Renders a environment modifier.
    private func render(modifier: EnvironmentModifier) throws -> String {
        
        if let value = modifier.value {
            self.environment.upsert(value, for: modifier.key)
            
        } else {
            
            if let value = self.environment.retrieve(for: modifier.key) {
                
                if let key = modifier.key as? PartialKeyPath<EnvironmentKeys> {
                    
                    switch key {
                    case \.locale:
                        self.environment.locale = value as? Locale
                        
                    case \.calender:
                        self.environment.calendar = value as? Calendar
                        
                    case \.timeZone:
                        self.environment.timeZone = value as? TimeZone
                        
                    case \.colorScheme:
                        self.environment.colorScheme = value as? String
                        
                    default:
                        throw Errors.unindendedEnvironmentKey
                    }
                }
            }
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
}
