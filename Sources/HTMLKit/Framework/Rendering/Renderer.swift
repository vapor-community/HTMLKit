/*
 Abstract:
 The file contains the renderer. The renderer runs through the content and transforms it into string output.
 */

import Foundation
import OrderedCollections

/// A struct containing the different formulas for the different views.
@_documentation(visibility: internal)
public class Renderer {

    /// A enumeration  of possible render errors
    public enum Errors: Error {
        
        case unableToCastEnvironmentValue
        case unindendedEnvironmentKey
        case environmentObjectNotFound
        case environmentValueNotFound
        case missingLocalization

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
    
    private var environment: Environment
    
    private var localization: Localization?
    
    private var security: Security
    
    private var markdown: Markdown
    
    public var features: FeatureSet

    /// Initiates the renderer.
    public init(localization: Localization? = nil) {
        
        self.localization = localization
        self.environment = Environment()
        self.security = Security()
        self.markdown = Markdown()
        self.features = []
    }
    
    /// Initiates the renderer.
    public init(localization: Localization? = nil, security: Security) {
        
        self.localization = localization
        self.environment = Environment()
        self.security = security
        self.markdown = Markdown()
        self.features = []
    }
    
    /// Initiates the renderer.
    public init(localization: Localization? = nil, environment: Environment, security: Security) {
        
        self.localization = localization
        self.environment = environment
        self.security = security
        self.markdown = Markdown()
        self.features = []
    }
    
    /// Renders a view
    public func render(view: some View) throws -> String {
        
        var result = ""
        
        if let contents = view.body as? [Content] {
            result += try render(contents: contents)
        }
        
        return result
    }
    
    internal func render(contents: [Content]) throws -> String {
        
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
                    result += string.raw
                    
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
    
    /// Renders a content element
    internal func render(element: some ContentNode) throws -> String {
        
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
                        result += string.raw
                        
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
    
    /// Renders a empty element
    internal func render(element: some EmptyNode) throws -> String {
        
        var result = ""
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            result += try render(attributes: attributes)
        }
        
        result += ">"
        
        return result
    }
    
    /// Renders a document element
    internal func render(element: some DocumentNode) -> String {
        
        var result = ""
        
        result += "<!DOCTYPE "
        
        result += element.content
        
        result += ">"
        
        return result
    }
    
    /// Renders a comment element
    internal func render(element: some CommentNode) -> String {
        
        var result = ""
        
        result += "<!--"
        
        result += escape(content: element.content)
        
        result += "-->"
        
        return result
    }
    
    /// Renders a content element
    internal func render(element: some CustomNode) throws -> String {
        
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
                        result += string.raw
                        
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
    
    /// Renders a localized string key
    internal func render(stringkey: LocalizedStringKey) throws -> String {
        
        guard let localization = self.localization else {
            throw Errors.missingLocalization
        }
        
        if let table = stringkey.table {
            return try localization.localize(key: stringkey.key, table: table, locale: environment.locale, interpolation: stringkey.interpolation)
        }
        
        return try localization.localize(key: stringkey.key, locale: environment.locale, interpolation: stringkey.interpolation)
    }
    
    /// Renders a environment modifier
    internal func render(modifier: EnvironmentModifier) throws -> String {
        
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
    
    /// Renders a environment value
    internal func render(value: EnvironmentValue) throws -> String {
        
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
    
    /// Renders the node attributes
    internal func render(attributes: OrderedDictionary<String, Any>) throws -> String {
        
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
    
    /// Renders the markdown content
    internal func render(markdown: MarkdownString) throws -> String {
        return self.markdown.render(string: markdown.raw)
    }
    
    /// Converts specific charaters into encoded values.
    internal func escape(attribute value: String) -> String {
        
        if security.autoEscaping {
            return value.replacingOccurrences(of: "&", with: "&amp;")
                .replacingOccurrences(of: "\"", with: "&quot;")
                .replacingOccurrences(of: "'", with: "&apos;")
        }
        
        return value
    }
    
    /// Converts specific charaters into encoded values.
    internal func escape(content value: String) -> String {
        
        if security.autoEscaping {
            return value.replacingOccurrences(of: "<", with: "&lt;")
                .replacingOccurrences(of: ">", with: "&gt;")
        }
        
        return value
    }
}
