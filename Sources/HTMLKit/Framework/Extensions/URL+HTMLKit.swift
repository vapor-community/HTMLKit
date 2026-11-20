#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

extension URL: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
