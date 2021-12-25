import Foundation
import Lingo

extension Renderer {
    
    public class Formula {

        public var ingredient: [AnyContent]

        public var calendar: Calendar

        public var timeZone: TimeZone

        public init(calendar: Calendar = .current, timeZone: TimeZone = .current) {
            
            self.ingredient = []
            self.calendar = calendar
            self.timeZone = timeZone
        }

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
