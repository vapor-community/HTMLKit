/*
 Abstract:
 The file contains the formula definition.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import Foundation
import Lingo

extension Renderer {
    
    public class Formula {

        /// The different ingredients of the content.
        public var ingredient: [AnyContent]

        /// The calender for localization.
        public var calendar: Calendar

        /// The time zone for localization.
        public var timeZone: TimeZone

        /// Initiates a formula.
        public init(calendar: Calendar = .current, timeZone: TimeZone = .current) {
            
            self.ingredient = []
            self.calendar = calendar
            self.timeZone = timeZone
        }

        /// Appends the ingredients with a string.
        public func add(string: String) {
            
            if let last = ingredient.last as? String {
                
                _ = ingredient.removeLast()
                
                self.ingredient.append(last + string)
                
            } else {
                self.ingredient.append(string)
            }
        }

        public func add(mappable: AnyContent) {
            
            if let stringRepresentation = mappable as? String {
                
                add(string: stringRepresentation)
                
            } else {
                
                self.ingredient.append(mappable)
            }
        }

        public func render<T>(with context: T, lingo: Lingo?) throws -> String {
            
            let contextManager = ContextManager(rootContext: context, lingo: lingo)
            
            return try render(with: contextManager)
        }

        public func render<U>(with manager: ContextManager<U>) throws -> String {
            
            return try ingredient.reduce(into: "") {
                $0 += try $1.render(with: manager)
            }
        }
    }
}
