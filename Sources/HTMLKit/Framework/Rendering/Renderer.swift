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
        
        try layout.prerender(formula)
        
        self.cache.upsert(formula: formula, for: ObjectIdentifier(T.self))
    }
    
    /// Registers a localization.
    public func add(localization: Localization) throws {
        self.lingo = try Lingo(rootPath: localization.source, defaultLocale: localization.locale.rawValue)
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
}

extension Renderer {
    
    // MARK: Deprecations
    
    /// Adds a formula to the cache.
    @available(*, deprecated, message: "Use add(layout:) instead.")
    public func add<T: Page>(view: T) throws {
        
        let formula = Formula()

        try view.prerender(formula)
        
        self.cache.upsert(formula: formula, for: ObjectIdentifier(T.self))
    }
    
    /// Adds a formula to the cache.
    @available(*, deprecated, message: "Use add(layout:) instead.")
    public func add<T: View>(view: T) throws {

        let formula = Formula()

        try view.prerender(formula)

        self.cache.upsert(formula: formula, for: ObjectIdentifier(T.self))
    }
    
    /// Renders a formula.
    @available(*, deprecated, message: "Use render(layout:) instead.")
    public func render<T: Page>(raw type: T.Type) throws -> String {
        
        guard let formula = self.cache.retrieve(identifier: ObjectIdentifier(type)) else {
            throw Errors.unableToFindFormula
        }

        return try formula.render(with: (), lingo: lingo)
    }
    
    /// Renders a formula.
    @available(*, deprecated, message: "Use render(layout:, with:) instead.")
    public func render<T: View>(raw type: T.Type, with context: Any) throws -> String {
        
        guard let formula = self.cache.retrieve(identifier: ObjectIdentifier(type)) else {
            throw Errors.unableToFindFormula
        }

        return try formula.render(with: context, lingo: lingo)
    }
    
    /// Registers a localization directory for the renderer.
    @available(*, deprecated, message: "Use add(localization:) instead.")
    public func registerLocalization(atPath path: String = "Resources/Localization", defaultLocale: String = "en") throws {
        self.lingo = try Lingo(rootPath: path, defaultLocale: defaultLocale)
    }
}
