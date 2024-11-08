import Foundation

/// A string key for the localization
public struct LocalizedStringKey {
 
    /// The actual key value
    public let value: String
    
    /// The arguments for the interpolation
    public var interpolation: [Any]?
    
    /// Initializes a string key for localization
    ///
    /// - Parameters:
    ///   - value: The key value
    ///   - interpolation:  An array of values that will replace placeholders within the translation string.
    public init(value: String, interpolation: [Any]? = nil) {
        
        self.value = value
        self.interpolation = interpolation
    }
}

extension LocalizedStringKey: ExpressibleByStringLiteral, ExpressibleByStringInterpolation {
    
    public init(stringLiteral: String) {
        self.init(value: stringLiteral)
    }
    
    public init(stringInterpolation: StringInterpolation) {
        self.init(value: stringInterpolation.key, interpolation: stringInterpolation.arguments)
    }
    
    public struct StringInterpolation: StringInterpolationProtocol {
        
        var key: String = ""
        
        var arguments: [Any] = []
        
        public init(literalCapacity: Int, interpolationCount: Int) {
            
            key.reserveCapacity(literalCapacity + interpolationCount * 2)
            
            arguments.reserveCapacity(interpolationCount)
        }
        
        public mutating func appendLiteral(_ literal: String) {
            key.append(literal)
        }
        
        public mutating func appendInterpolation(_ value: String) {
            
            key += "%st"
            
            arguments.append(value)
        }
        
        public mutating func appendInterpolation(_ value: Int) {
            
            key += "%in"
            
            arguments.append(value)
        }
        
        public mutating func appendInterpolation(_ value: Double) {
            
            key += "%do"
            
            arguments.append(value)
        }
        
        public mutating func appendInterpolation(_ value: Float) {
            
            key += "%do"
            
            arguments.append(value)
        }
        
        public mutating func appendInterpolation(_ value: Date) {
            
            key += "%dt"
            
            arguments.append(value)
        }
    }
}
