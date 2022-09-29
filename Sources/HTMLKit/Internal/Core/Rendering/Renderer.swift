/*
 Abstract:
 The file contains the renderer.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import Foundation
import Lingo

/// A struct containing the different formulas for the different views.
public class Renderer {

    public enum Errors: LocalizedError {
        
        case unableToFindFormula
        case unableToRetriveValue
        case unableToRegisterKeyPath
        case unableToAddVariable
        case unableToCastVariable

        public var errorDescription: String? {
            
            switch self {
            case .unableToFindFormula:
                return "Unable to find a formula for the given view type"
                
            case .unableToRetriveValue:
                return "Unable to retrive the wanted value in the context"
                
            case .unableToRegisterKeyPath:
                return "Unable to register a KeyPath when creating the template formula"
                
            case .unableToAddVariable:
                return "Unable to add variable to formula"
                
            case .unableToCastVariable:
                return "Unable to cast value when retriving variable"
            }
        }
        
        public var failureReason: String? {
            return self.errorDescription ?? ""
        }

        public var recoverySuggestion: String? {
            
            switch self {
            case .unableToFindFormula:
                return "Remember to add the template to the renderer with .add(template: ) or .add(view: )"
                
            default:
                return nil
            }
        }
    }

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
    public func add<T: AnyLayout>(layout: T) throws {
        
        let formula = Formula()
        
        try layout.prerender(formula)
        
        self.cache.upsert(formula: formula, for: ObjectIdentifier(T.self))
    }

    /// Renders a formula.
    public func render<T: AnyLayout>(layout: T.Type) throws -> String {
        
        guard let formula = self.cache.retrieve(identifier: ObjectIdentifier(layout)) else {
            throw Errors.unableToFindFormula
        }
        
        return try formula.render(with: (), lingo: lingo)
    }
    
    /// Renders a formula.
    public func render<T: AnyLayout, C>(layout: T.Type, with context: C) throws -> String {
        
        guard let formula = self.cache.retrieve(identifier: ObjectIdentifier(layout)) else {
            throw Errors.unableToFindFormula
        }
        
        return try formula.render(with: context, lingo: lingo)
    }
    
    /// Registers a localization directory for the renderer.
    public func registerLocalization(atPath path: String = "Resources/Localization", defaultLocale: String = "en") throws {
        self.lingo = try Lingo(rootPath: path, defaultLocale: defaultLocale)
    }
}

extension Renderer {
    
    public class Formula {

        /// The different ingredients of the content.
        public var ingredients: [AnyContent]

        /// The calender for localization.
        public var calendar: Calendar

        /// The time zone for localization.
        public var timeZone: TimeZone

        /// Initiates a formula.
        public init(calendar: Calendar = .current, timeZone: TimeZone = .current) {
            
            self.ingredients = []
            self.calendar = calendar
            self.timeZone = timeZone
        }

        /// Appends the ingredients
        public func add<T: AnyContent>(content: T) {
            self.ingredients.append(content)
        }

        public func render<T>(with context: T, lingo: Lingo?) throws -> String {
            return try render(with: ContextManager(rootContext: context, lingo: lingo))
        }

        public func render<T>(with manager: ContextManager<T>) throws -> String {
            
            return try ingredients.reduce(into: "") { (result, ingridient) in
                return result += try ingridient.render(with: manager)
            }
        }
    }
    
    public class Cache {
        
        private var stack: [ObjectIdentifier: Formula]
        
        public var count: Int {
            return self.stack.keys.count
        }
        
        public init() {
            self.stack = [:]
        }
        
        public func retrieve(identifier: ObjectIdentifier) -> Formula? {
            return self.stack[identifier] ?? nil
        }
        
        public func upsert(formula: Formula, for identifier: ObjectIdentifier) {
            self.stack.updateValue(formula, forKey: identifier)
        }
        
        public func remove(identifier: ObjectIdentifier) {
            self.stack.removeValue(forKey: identifier)
        }
    }
}
