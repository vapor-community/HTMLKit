import Foundation
import Lingo

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
        return try render(with: ContextManager(context: context, lingo: lingo))
    }

    public func render<T>(with manager: ContextManager<T>) throws -> String {
        
        return try ingredients.reduce(into: "") { (result, ingridient) in
            return result += try ingridient.render(with: manager)
        }
    }
}
