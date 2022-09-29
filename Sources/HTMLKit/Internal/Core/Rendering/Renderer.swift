/*
 Abstract:
 The file contains the renderer.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import Foundation
import Lingo

/// A struct containing the different formulas for the different views.
public class Renderer {

    public static let empty = ContextManager<Void>(rootContext: ())

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
    public var formulaCache: [ObjectIdentifier: Formula]

    /// The localization to use when rendering.
    public var lingo: Lingo?
    
    /// The calendar to use when rendering dates.
    public var calendar: Calendar = Calendar(identifier: .gregorian)
    
    /// The time zone to use when rendering dates.
    public var timeZone: TimeZone = TimeZone(secondsFromGMT: 0) ?? TimeZone.current

    /// Initiates the renderer.
    public init() {
        self.formulaCache = [:]
    }

    /// Renders a formula.
    public func render<T: Page>(raw type: T.Type) throws -> String {
        
        guard let formula = formulaCache[ObjectIdentifier(type)] else {
            throw Errors.unableToFindFormula
        }
        
        return try formula.render(with: (), lingo: lingo)
    }
    
    /// Renders a formula.
    public func render<T: View>(raw type: T.Type, with context: T.Context) throws -> String {
        
        guard let formula = formulaCache[ObjectIdentifier(type)] else {
            throw Errors.unableToFindFormula
        }
        
        return try formula.render(with: context, lingo: lingo)
    }

    /// Adds a formula to the cache.
    public func add<T: Page>(view: T) throws {
        
        let formula = Formula()
        
        try view.prerender(formula)
        
        self.formulaCache[ObjectIdentifier(T.self)] = formula
    }

    /// Adds a formula to the cache.
    public func add<T: View>(view: T) throws {
        
        let formula = Formula()
        
        try view.prerender(formula)
        
        self.formulaCache[ObjectIdentifier(T.self)] = formula
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
}
