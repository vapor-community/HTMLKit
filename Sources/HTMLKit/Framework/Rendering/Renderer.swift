/*
 Abstract:
 The file contains the renderer. The renderer runs through the content and transforms it into string output.
 */

import Foundation
import Lingo

/// A struct containing the different formulas for the different views.
public class Renderer {

    /// A enumeration  of possible render errors
    public enum Errors: Error {
        
        case missingLingoConfiguration

        public var description: String {
            
            switch self {
            case .missingLingoConfiguration:
                return "The lingo configuration seem to missing."
            }
        }
    }
    
    /// The localization to use when rendering.
    private var lingo: Lingo?

    /// Initiates the renderer.
    public init(lingo: Lingo? = nil) {
        self.lingo = lingo
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
                
                if let localize = content as? LocalizedStringKey {
                    result += try render(localize: localize)
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
    
    /// Renders a localized string
    internal func render(localize: LocalizedStringKey) throws -> String {
        
        guard let lingo = self.lingo else {
            throw Errors.missingLingoConfiguration
        }
        
        if let context = localize.context {
            
            if let data = try? JSONEncoder().encode(context) {
                
                if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                    return lingo.localize(localize.key, locale: lingo.defaultLocale, interpolations: dictionary)
                }
            }
        }
        
        return lingo.localize(localize.key, locale: lingo.defaultLocale)
    }
}
