/*
 Abstract:
 The file contains the renderer. The renderer runs through the content and transforms it into string output.
 */

import Foundation
import Lingo

/// A struct containing the different formulas for the different views.
public class Renderer {

    public enum Errors: LocalizedError {
        
        case unableToFindFormula

        public var errorDescription: String? {
            
            switch self {
            case .unableToFindFormula:
                return "Unable to find a formula for the given view type"
            }
        }
        
        public var failureReason: String? {
            return self.errorDescription ?? ""
        }

        public var recoverySuggestion: String? {
            
            switch self {
            case .unableToFindFormula:
                return "Remember to add the template to the renderer with .add(template: ) or .add(view: )"
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
        
        self.cache.upsert(formula: formula, for: ObjectIdentifier(T.self))
    }
    
    /// Registers a localization.
    public func add(localization: Localization) throws {
        self.lingo = try Lingo(rootPath: localization.source, defaultLocale: localization.locale.rawValue)
    }

    /// Renders a formula.
    public func render<T: AnyLayout>(layout: T.Type) throws -> String {
        return ""
    }
    
    /// Renders a formula.
    public func render<T: AnyLayout, C>(layout: T.Type, with context: C) throws -> String {
        return ""
    }
}
