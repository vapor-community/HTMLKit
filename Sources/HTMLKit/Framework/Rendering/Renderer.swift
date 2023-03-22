/*
 Abstract:
 The file contains the renderer. The renderer runs through the content and transforms it into string output.
 */

import Foundation

/// A struct containing the different formulas for the different views.
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

    /// Initiates the renderer.
    public init(localization: Localization? = nil) {
        
        self.environment = Environment()
        self.localization = localization
    }
    
    /// Initiates the renderer.
    public init(localization: Localization? = nil, environment: Environment) {
        
        self.environment = environment
        self.localization = localization
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
                result += render(element: element)
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
                result += try render(value: value)
            }
            
            if let element = content as? String {
                result += element
            }
        }
        
        return result
    }
    
    /// Renders a content element
    internal func render(element: some ContentNode) throws -> String {
        
        var result = ""
        
        result += element.startTag
        
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
                    result += render(element: element)
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
                    result += try render(value: value)
                }
                
                if let element = content as? String {
                    result += element
                }
            }
        }
        
        result += element.endTag
        
        return result
    }
    
    /// Renders a empty element
    internal func render(element: some EmptyNode) -> String {
        return element.startTag
    }
    
    /// Renders a document element
    internal func render(element: some DocumentNode) -> String {
        return element.startTag
    }
    
    /// Renders a comment element
    internal func render(element: some CommentNode) -> String {
        return element.startTag + element.content + element.endTag
    }
    
    /// Renders a content element
    internal func render(element: some CustomNode) throws -> String {
        
        var result = ""
        
        result += element.startTag
        
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
                    result += render(element: element)
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
                
                if let element = content as? String {
                    result += element
                }
            }
        }
        
        result += element.endTag
        
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
            return String(stringValue)
            
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
}
