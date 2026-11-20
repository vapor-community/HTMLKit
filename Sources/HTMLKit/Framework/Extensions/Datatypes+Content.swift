#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

extension Array: Content {}

extension Bool: Content {}

extension Double: Content {}

extension Float: Content {}

extension Int: Content {}

extension String: Content {
    
    static public func + (lhs: Content, rhs: Self) -> Content {
        return [lhs, rhs]
    }
}

extension UUID: Content {}

extension Date: Content {}
