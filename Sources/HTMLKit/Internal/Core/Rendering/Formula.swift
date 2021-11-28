import Foundation
import Lingo

extension Renderer {
    
    /// A formula for a view
    /// This contains the different parts to pice to gether, in order to increase the performance
    public class Formula {

        /// The different pices or ingredients needed to render the view
        var ingredient: [AnyContent]

        /// The calendar to use when rendering dates
        var calendar: Calendar

        /// The time zone to use when rendering dates
        var timeZone: TimeZone

        /// Init's a view
        ///
        /// - Parameters:
        ///   - view: The view type
        ///   - contextPaths: The contextPaths. *Is empty by default*
        init(calendar: Calendar = .current, timeZone: TimeZone = .current) {
            ingredient = []
            self.calendar = calendar
            self.timeZone = timeZone
        }

        /// Adds a static string to the formula
        ///
        /// - Parameter string: The string to add
        public func add(string: String) {
            if let last = ingredient.last as? String {
                _ = ingredient.removeLast()
                ingredient.append(last + string)
            } else {
                ingredient.append(string)
            }
        }

        /// Adds a generic `Mappable` object
        ///
        /// - Parameter mappable: The `Mappable` to add
        public func add(mappable: AnyContent) {
            if let stringRepresentation = mappable as? String {
                add(string: stringRepresentation)
            } else {
                ingredient.append(mappable)
            }
        }

        /// Renders a formula
        ///
        /// - Parameters:
        /// - context: The context needed to render the formula
        /// - lingo: The lingo to use when rendering
        /// - Returns: A rendered formula
        /// - Throws: If some of the formula fails, for some reason
        func render<T>(with context: T, lingo: Lingo?) throws -> String {
            let contextManager = ContextManager(rootContext: context, lingo: lingo)
            return try render(with: contextManager)
        }

        /// Render a formula with a existing `ContextManager`
        /// This may be needed when using a local formula
        ///
        /// - Parameter manager: The manager to use when rendering
        /// - Returns: A rendered formula
        /// - Throws: If some of the formula fails, for some reason
        func render<U>(with manager: ContextManager<U>) throws -> String {
            return try ingredient.reduce(into: "") { $0 += try $1.render(with: manager) }
        }
    }
}
