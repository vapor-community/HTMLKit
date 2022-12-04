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
        
        return render(layout: view, manager: manager)
    }
    
    /// Renders a layout.
    public func render(view: some View, with context: some Codable) -> String {
        
        let manager = ContextManager(context: context, lingo: self.lingo)
    
        let name = type(of: view).name
        
        if let formula = self.cache.retrieve(key: name) {
            return rerender(formula: formula, manager: manager)
        }
        
        return  render(layout: view, manager: manager)
    }
    
    /// Prerenders the layout
    internal func prerender(view: some View) -> Formula {
        
        let formula = Formula()
        
        if let contents = view.body as? [Content] {
            
            for content in contents {
                
                if let layout = content as? Layout {
                    prerender(layout: layout, on: formula)
                }
                
                if let element = content as? (any ContentElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? (any EmptyElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? (any DocumentElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? (any CommentElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? String {
                    formula.add(ingridient: element)
                }
            }
        }
        
        return formula
    }
    
    /// Prerenders the layout.
    internal func prerender(layout: some Layout, on formula: Formula) {
        
        if let contents = layout.body as? [Content] {
            
            for content in contents {
                
                if let layout = content as? Layout {
                    prerender(layout: layout, on: formula)
                }
                
                if let element = content as? (any ContentElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? (any EmptyElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? (any DocumentElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? (any CommentElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? String {
                    formula.add(ingridient: element)
                }
            }
        }
    }
    
    /// Prerenders a content element
    internal func prerender(element: some ContentElement, on formula: Formula) {
        
        formula.add(ingridient: element.startTag)
        
        if let contents = element.content as? [Content] {
            
            for content in contents {
                
                if let layout = content as? Layout {
                    prerender(layout: layout, on: formula)
                }
                
                if let contents = content as? [Content] {
                    
                    for content in contents {
                        
                        if let element = content as? (any ContentElement) {
                            prerender(element: element, on: formula)
                        }
                    }
                }
                
                if let element = content as? (any ContentElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? (any EmptyElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? (any DocumentElement) {
                    prerender(element: element, on: formula)
                }
                
                if let element = content as? (any CommentElement) {
                    prerender(element: element, on: formula)
                }
                
                if let string = content as? String {
                    formula.add(ingridient: string)
                }
                
                if let value = content as? TemplateValue<String> {
                    prerender(value: value, on: formula)
                }
            }
        }
        
        formula.add(ingridient: element.endTag)
    }
    
    /// Prerenders a empty element
    internal func prerender(element: some EmptyElement, on formula: Formula) {
        
        formula.add(ingridient: element.startTag)
    }
    
    /// Prerenders a comment element
    internal func prerender(element: some CommentElement, on formula: Formula) {
        
        formula.add(ingridient: element.startTag)
        formula.add(ingridient: element.content)
        formula.add(ingridient: element.endTag)
    }
    
    /// Prerenders a document element
    internal func prerender(element: some DocumentElement, on formula: Formula) {
        
        formula.add(ingridient: element.startTag)
    }
    
    internal func prerender(value: TemplateValue<String>, on formula: Formula) {
        
        switch value {
        case .constant(let value):
            formula.add(ingridient: value)
            
        case .dynamic(let variable):
            formula.add(ingridient: variable)
        }
    }
    
    /// Rerenders the formula
    internal func rerender<T>(formula: Formula, manager: ContextManager<T>) -> String {
        
        var result = ""
        
        for ingridient in formula.ingredients {
            
            if let string = ingridient as? String {
                result += string
                
            } else {
                
                if let layout = ingridient as? Layout {
                    result += render(layout: layout, manager: manager)
                }
                
                if let variable = ingridient as? HTMLContext<String> {
                    result += render(variable: variable, manager: manager)
                }
            }
        }
        
        return result
    }
    
    
    /// Renders a layout
    internal func render<T>(layout: some Layout, manager: ContextManager<T>) -> String {
        
        var result = ""
        
        if let contents = layout.body as? [Content] {
            
            for content in contents {
                
                if let element = content as? (any ContentElement) {
                    result += render(element: element, manager: manager)
                }
                
                if let element = content as? (any EmptyElement) {
                    result += render(element: element)
                }
                
                if let element = content as? (any DocumentElement) {
                    result += render(element: element)
                }
                
                if let element = content as? (any CommentElement) {
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
    internal func render<T>(element: some ContentElement, manager: ContextManager<T>) -> String {
        
        var result = ""
        
        result += element.startTag
        
        if let contents = element.content as? [Content] {
            
            for content in contents {
                
                if let element = content as? (any ContentElement) {
                    result += render(element: element, manager: manager)
                }
                
                if let element = content as? (any EmptyElement) {
                    result += render(element: element)
                }
                
                if let element = content as? (any DocumentElement) {
                    result += render(element: element)
                }
                
                if let element = content as? (any CommentElement) {
                    result += render(element: element)
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
    internal func render(element: some EmptyElement) -> String {
        return element.startTag
    }
    
    /// Renders a comment element
    internal func render(element: some CommentElement) -> String {
        return element.startTag
    }
    
    /// Renders a document element
    internal func render(element: some DocumentElement) -> String {
        return element.startTag
    }
    
    /// Renders a template value
    internal func render<T>(value: TemplateValue<String>, manager: ContextManager<T>) -> String {
        
        var result = ""
        
        switch value {
        case .constant(let value):
            result += value
            
        case .dynamic(let variable):
            result += render(variable: variable, manager: manager)
        }
        
        return result
    }
    
    /// Renders a template value
    internal func render<T>(variable: HTMLContext<String>, manager: ContextManager<T>) -> String {
        
        var result = ""
        
        if let value = try? manager.value(for: variable) {
            result += value
        }
        
        return result
    }
}
