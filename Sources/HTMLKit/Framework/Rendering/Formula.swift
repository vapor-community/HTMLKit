/*
 Abstract:
 The file contains the formula. The formula contains the string output given by the renderer.
 */

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
}
