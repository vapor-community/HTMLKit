/*
 Abstract:
 The file contains the renderer. The renderer runs through the content and transforms it into string output.
 */

import Foundation
import Lingo

/// A struct containing the different formulas for the different views.
public class Renderer {

    /// The localization to use when rendering.
    private var lingo: Lingo?

    /// Initiates the renderer.
    public init() {}
    
    /// Registers a localization.
    public func add(localization: Localization) throws {
        self.lingo = try Lingo(rootPath: localization.source, defaultLocale: localization.locale.rawValue)
    }
    
    /// Renders a view
    public func render(view: some View) -> String {
        
        var result = ""
        
        if let contents = view.body as? [AnyContent] {
            
            for content in contents {
                
                if let element = content as? (any ContentNode) {
                    result += render(element: element)
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
        }
        
        return result
    }
    
    /// Renders a content element
    internal func render(element: some ContentNode) -> String {
        
        var result = ""
        
        if let contents = element.content as? [AnyContent] {
            
            for content in contents {
                
                if let element = content as? (any ContentNode) {
                    result += render(element: element)
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
        }
        
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
}
