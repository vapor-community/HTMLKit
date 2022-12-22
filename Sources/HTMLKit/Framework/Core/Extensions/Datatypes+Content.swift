/*
 Abstract:
 The file contains extensions for some data types.
 */

import Foundation

extension Array: AnyContent {}

extension Bool: AnyContent {}

extension Double: AnyContent {}

extension Float: AnyContent {}

extension Int: AnyContent {}

extension Optional: AnyContent{}

extension Optional: Defineable {
    
    var isDefinded: Bool {
        switch self {
        case .none: return false
        default: return true
        }
    }
}

extension String: AnyContent {}

extension UUID: AnyContent {}
