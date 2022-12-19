/*
 Abstract:
 The file contains the renderer. The renderer runs through the content and transforms it into string output.
 */

import Foundation
import Lingo
import OrderedCollections

/// A struct containing the different formulas for the different views.
public class Renderer {
    
    /// A manager that handles the contexts
    private var manager: Manager
    
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
        
        self.manager = Manager()
        self.cache = Cache()
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
    public func add(lingo: Lingo) {
        self.lingo = lingo
    }
    
    /// Rerenders the formula
    public func rerender(name: String, with context: Encodable) -> String? {
        
        manager.add(context: context)
        
        if let formula = self.cache.retrieve(key: name) {
            return rerender(formula: formula)
        }
        
        return nil
    }
    
    /// Renders a layout
    public func render(view: some View) -> String {
        
        let name = type(of: view).name
        
        if let formula = self.cache.retrieve(key: name) {
            return rerender(formula: formula)
        }
        
        return render(layout: view)
    }
    
    /// Renders a layout.
    public func render(view: some View, with context: some Encodable) -> String {
    
        manager.add(context: context)
    
        let name = type(of: view).name
        
        if let formula = self.cache.retrieve(key: name) {
            return rerender(formula: formula)
        }
        
        return render(layout: view)
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
                
                if let localized = content as? (any LocalizeContent) {
                    prerender(localized: localized, on: formula)
                }
                
                if let variable = content as? (any DynamicContent) {
                    prerender(variable: variable, on: formula)
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
        
        formula.add(ingridient: "<\(element.name)")
        
        if let attributes = element.attributes {
            
            for (key, value) in attributes {
                
                formula.add(ingridient: " \(key)=\"")
                
                if let variable = value as? (any DynamicContent) {
                    prerender(variable: variable, on: formula)
                    
                } else {
                    formula.add(ingridient: "\(value)")
                }
                
                formula.add(ingridient: "\"")
            }
        }
        
        formula.add(ingridient: ">")
        
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
                        
                        if let string = content as? String {
                            formula.add(ingridient: string)
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
                
                if let localized = content as? (any LocalizeContent) {
                    prerender(localized: localized, on: formula)
                }
                
                if let variable = content as? (any DynamicContent) {
                    formula.add(ingridient: variable)
                }
                
                if let string = content as? String {
                    formula.add(ingridient: string)
                }
            }
        }
        
        formula.add(ingridient: "</\(element.name)>")
    }
    
    /// Prerenders a empty element
    internal func prerender(element: some EmptyElement, on formula: Formula) {
        
        formula.add(ingridient: "<\(element.name)")
        
        if let attributes = element.attributes {
            
            for (key, value) in attributes {
                
                formula.add(ingridient: " \(key)=\"")
                
                if let variable = value as? (any DynamicContent) {
                    prerender(variable: variable, on: formula)
                    
                } else {
                    formula.add(ingridient: "\(value)")
                }
                
                formula.add(ingridient: "\"")
            }
        }
        
        formula.add(ingridient: ">")
    }
    
    /// Prerenders a comment element
    internal func prerender(element: some CommentElement, on formula: Formula) {
        
        formula.add(ingridient: "<!--")
        formula.add(ingridient: element.content)
        formula.add(ingridient: "-->")
    }
    
    /// Prerenders a document element
    internal func prerender(element: some DocumentElement, on formula: Formula) {
        
        formula.add(ingridient: "<!DOCTYPE ")
        formula.add(ingridient: element.content)
        formula.add(ingridient: ">")
    }
    
    internal func prerender(localized: some LocalizeContent, on formula: Formula) {
        
        formula.add(ingridient: localized)
    }
    
    internal func prerender(variable: some DynamicContent, on formula: Formula) {
        
        formula.add(ingridient: variable)
    }
    
    /// Rerenders the formula
    internal func rerender(formula: Formula) -> String {
        
        var result = ""
        
        for ingridient in formula.ingredients {
            
            if let string = ingridient as? String {
                result += string
                
            } else {
                
                if let layout = ingridient as? Layout {
                    result += render(layout: layout)
                }
                
                if let localized = ingridient as? (any LocalizeContent) {
                    result += render(localized: localized)
                }
                
                if let variable = ingridient as? (any DynamicContent) {
                    result += render(variable: variable)
                }
            }
        }
        
        return result
    }
    
    
    /// Renders a layout
    internal func render(layout: some Layout) -> String {
        
        var result = ""
        
        if let contents = layout.body as? [Content] {
            
            for content in contents {
                
                if let element = content as? (any ContentElement) {
                    result += render(element: element)
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
    internal func render(element: some ContentElement) -> String {
        
        var result = ""
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            
            for (key, value) in attributes {
                
                result += " \(key)=\""
                
                if let variable = value as? (any DynamicContent) {
                    result += render(variable: variable)
                    
                } else {
                    result += "\(value)"
                }
                
                result += "\""
            }
        }
        
        result += ">"
        
        if let contents = element.content as? [Content] {
            
            for content in contents {
                
                if let element = content as? (any ContentElement) {
                    result += render(element: element)
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
                
                if let localized = content as? (any LocalizeContent) {
                    result += render(localized: localized)
                }
                
                if let element = content as? String {
                    result += element
                }
            }
        }
        
        result += "</\(element.name)>"
        
        return result
    }
    
    /// Renders a empty element
    internal func render(element: some EmptyElement) -> String {
        
        var result = ""
        
        result += "<\(element.name)"
        
        if let attributes = element.attributes {
            
            for (key, value) in attributes {
                
                result += " \(key)=\""
                
                if let variable = value as? (any DynamicContent) {
                    result += render(variable: variable)
                    
                } else {
                    result += "\(value)"
                }
                
                result += "\""
            }
        }
        
        result += ">"
        
        return result
    }
    
    /// Renders a comment element
    internal func render(element: some CommentElement) -> String {
        return "<!--\(element.content)-->"
    }
    
    /// Renders a document element
    internal func render(element: some DocumentElement) -> String {
        return "<!DOCTYPE \(element.content)>"
    }
    
    /// Renders a localized string
    internal func render(localized: some LocalizeContent) -> String {
        
        var result = ""
        
        if let lingo = lingo {
            
            if let variable = localized.variable {
                
                if case .variable(let variable) = variable {
                    
                    if let context = manager.retrieve(for: variable.name) {
                        
                        if let data = try? JSONEncoder().encode(context) {
                            
                            if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                                result += lingo.localize(localized.key, locale: lingo.defaultLocale, interpolations: dictionary)
                            }
                        }
                    }
                }
                
            } else {
                result += lingo.localize(localized.key, locale: lingo.defaultLocale)
            }
        }
        
        return result
    }
    
    internal func render(variable: some DynamicContent) -> String {
        
        var result = ""
    
        if let context = manager.retrieve(for: variable.name) {
            
            if let value = context[keyPath: variable.path] as? String {
                result += value
            }
            
            if let value = context[keyPath: variable.path] as? Int {
                result += String(value)
            }
            
            if let value = context[keyPath: variable.path] as? Double {
                result += String(value)
            }
            
            if let value = context[keyPath: variable.path] as? Bool {
                result += String(value)
            }
        }
        
        return result
    }
}
