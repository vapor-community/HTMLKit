/*
 Abstract:
 The file contains the renderer. The renderer runs through the content and transforms it into string output.
 */

import Foundation
import Lingo

/// A struct containing the different formulas for the different views.
public class Renderer {
    
    /// A cache that contains all the composed content.
    private var cache: Cache
    
    /// The localization to use when rendering.
    private var lingo: Lingo?
    
    /// The calendar to use when rendering dates.
    public var calendar: Calendar
    
    /// The time zone to use when rendering dates.
    public var timeZone: TimeZone
    
    /// Initiates the renderer.
    public init(calendar: Calendar = .current, timeZone: TimeZone = .current) {
        
        self.cache = .init()
        self.calendar = calendar
        self.timeZone = timeZone
    }
    
    /// Adds a formula to the cache.
    public func add(view: some View) {
        
        let formula = prerender(view: view)
        
        let name = type(of: view).name
        
        self.cache.upsert(formula: formula, for: name)
    }
    
    /// Adds the views of a page to the cache.
    public func add(page: some Page) {
        
        for view in page.views {
            self.add(view: view)
        }
    }
    
    /// Registers a localization.
    public func add(localization: Localization) throws {
        self.lingo = try Lingo(rootPath: localization.source, defaultLocale: localization.locale.rawValue)
    }
    
    /// Prerenders the layout
    internal func prerender(view: some View) -> Formula {
        
        let formula = Formula()
        
        if let contents = view.body as? [Content] {
            
            for content in contents {
                
                if let node = content as? Node {
                    node.prerender(with: formula)
                }
                
                if let layout = content as? Layout {
                        
                    if let contents = layout.body as? [Content] {
                        
                        for content in contents {

                            if let node = content as? Node {
                                node.prerender(with: formula)
                            }
                        }
                    }
                }
            }
        }
        
        return formula
    }
    
    /// Rerenders the formula
    internal func rerender<T>(formula: Formula, manager: ContextManager<T>) -> String {
        
        var result = ""
        
        for ingridient in formula.ingredients {
            
            if let node = ingridient as? Node {
                result += node.render(with: manager)
            }
        }
        
        return result
    }
    
    /// Rerenders the formula
    public func rerender<T>(name: String, manager: ContextManager<T>) -> String? {
        
        if let formula = self.cache.retrieve(key: name) {
            return rerender(formula: formula, manager: manager)
        }
        
        return nil
    }

    /// Renders a layout
    public func render(view: some View) -> String {
        
        let manager = ContextManager(context: (), lingo: self.lingo)
        
        let name = type(of: view).name
        
        if let formula = self.cache.retrieve(key: name) {
            return rerender(formula: formula, manager: manager)
        }
        
        var result = ""
        
        if let contents = view.body as? [Content] {
            
            for content in contents {
                
                if let node = content as? Node {
                    result += node.render(with: manager)
                }
            }
        }
        
        return result
    }
    
    /// Renders a layout.
    public func render(view: some View, with context: some Codable) -> String {
        
        let manager = ContextManager(context: context, lingo: self.lingo)
    
        let name = type(of: view).name
        
        if let formula = self.cache.retrieve(key: name) {
            return rerender(formula: formula, manager: manager)
        }
        
        var result = ""
        
        if let contents = view.body as? [Content] {
            
            for content in contents {
                
                if let node = content as? Node {
                    result += node.render(with: manager)
                }
            }
        }
        
        return result
    }
}
