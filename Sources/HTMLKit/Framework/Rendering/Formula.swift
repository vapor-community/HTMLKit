/*
 Abstract:
 The file contains the formula. The formula contains the string output given by the renderer.
 */

import Foundation

internal class Formula {

    /// The different ingredients of the content.
    internal var ingredients: [Content]

    /// The calender for localization.
    internal var calendar: Calendar

    /// The time zone for localization.
    internal var timeZone: TimeZone

    /// Initiates a formula.
    internal init(calendar: Calendar = .current, timeZone: TimeZone = .current) {
        
        self.ingredients = []
        self.calendar = calendar
        self.timeZone = timeZone
    }

    /// Appends the ingredients
    internal func add(ingridient: some Content) {
        self.ingredients.append(ingridient)
    }
}
