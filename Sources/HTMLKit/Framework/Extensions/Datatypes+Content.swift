/*
 Abstract:
 The file contains extensions for some data types.
 */

import Foundation

extension Array: Content {}

extension Bool: Content {}

extension Double: Content {}

extension Float: Content {}

extension Int: Content {}

extension Optional: Content{}

extension String: Content {
    
    static public func + (lhs: Content, rhs: Self) -> Content {
        return [lhs, rhs]
    }
}

extension UUID: Content {}

extension Date: Content {}
