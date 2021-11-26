import Foundation
import Lingo

/// A struct containing the different formulas for the different views.
///
///     try renderer.add(template: WelcomeView())           // Builds the formula
///     try renderer.render(WelcomeView.self)               // Renders the formula
public class Renderer {

    static let empty = ContextManager<Void>(rootContext: ())

    /// The different Errors that can happen when rendering or pre-rendering a template
    public enum Errors: LocalizedError {
        case unableToFindFormula
        case unableToRetriveValue
        case unableToRegisterKeyPath
        case unableToAddVariable
        case unableToCastVariable

        public var errorDescription: String? {
            switch self {
            case .unableToFindFormula:      return "Unable to find a formula for the given view type"
            case .unableToRetriveValue:     return "Unable to retrive the wanted value in the context"
            case .unableToRegisterKeyPath:  return "Unable to register a KeyPath when creating the template formula"
            case .unableToAddVariable:      return "Unable to add variable to formula"
            case .unableToCastVariable:     return "Unable to cast value when retriving variable"
            }
        }

        public var recoverySuggestion: String? {
            switch self {
            case .unableToFindFormula:
                return "Remember to add the template to the renderer with .add(template: ) or .add(view: )"
            default: return nil
            }
        }
    }

    /// A cache that contains all the brewed `Template`'s
    var formulaCache: [ObjectIdentifier: Formula]

    /// The localization to use when rendering
    var lingo: Lingo?

    /// The calendar to use when rendering dates
    public var calendar: Calendar = Calendar(identifier: .gregorian)

    /// The time zone to use when rendering dates
    public var timeZone: TimeZone = TimeZone(secondsFromGMT: 0) ?? TimeZone.current

    public init() {
        formulaCache = [:]
    }

    public func render<T: Page>(raw type: T.Type) throws -> String {
        guard let formula = formulaCache[ObjectIdentifier(type)] else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: (), lingo: lingo)
    }
    
    public func render<T: View>(raw type: T.Type, with context: T.Context) throws -> String {
        guard let formula = formulaCache[ObjectIdentifier(type)] else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: context, lingo: lingo)
    }

    /// Adds a forumla to the renderer
    ///
    ///     try renderer.add(view: WelcomeView())
    ///
    /// - Parameter view: The view type to add
    /// - Throws: If the pre-rendering process fails for some reason
    public func add<T: Page>(view: T) throws {
        let formula = Formula()
        try view.prerender(formula)
        formulaCache[ObjectIdentifier(T.self)] = formula
    }

    /// Adds a forumla to the renderer
    ///
    ///     try renderer.add(view: WelcomeView())
    ///
    /// - Parameter view: The view type to add
    /// - Throws: If the pre-rendering process fails for some reason
    public func add<T: View>(view: T) throws {
        let formula = Formula()
        try view.prerender(formula)
        formulaCache[ObjectIdentifier(T.self)] = formula
    }

    /// Registers a localization directory to the renderer
    ///
    ///     try renderer.registerLocalization() // Using default values
    ///     try renderer.registerLocalization(atPath: "Localization", defaultLocale: "nb")
    ///
    /// - Parameters:
    ///   - path: A relative path to the localization folder. This is by *default* set to "Resource/Localization"
    ///   - defaultLocale: The default locale to use. This is by *default* set to "en"
    /// - Throws: If there is an error registrating the lingo
    public func registerLocalization(atPath path: String = "Resources/Localization", defaultLocale: String = "en") throws {
        lingo = try Lingo(rootPath: path, defaultLocale: defaultLocale)
    }
}
