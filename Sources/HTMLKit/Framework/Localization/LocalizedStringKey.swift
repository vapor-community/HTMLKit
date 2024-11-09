import Foundation

/// A string key for the localization
public struct LocalizedStringKey {
 
    /// The actual key value
    internal let value: String
    
    /// The arguments for the interpolation
    internal var interpolation: [InterpolationArgument]?
    
    /// Initializes a string key for localization
    ///
    /// - Parameters:
    ///   - value: The key value
    ///   - interpolation:  An array of values that will replace placeholders within the translation string.
    public init(value: String, interpolation: [InterpolationArgument]? = nil) {
        
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
        
        var arguments: [InterpolationArgument] = []
        
        public init(literalCapacity: Int, interpolationCount: Int) {
            
            key.reserveCapacity(literalCapacity + interpolationCount * 2)
            
            arguments.reserveCapacity(interpolationCount)
        }
        
        public mutating func appendLiteral(_ literal: String) {
            key.append(literal)
        }
        
        public mutating func appendInterpolation(_ value: String) {
            
            let argument = InterpolationArgument.string(value)
            
            key += argument.placeholder
            
            arguments.append(argument)
        }
        
        public mutating func appendInterpolation(_ value: Int) {
            
            let argument = InterpolationArgument.int(value)
            
            key += argument.placeholder
            
            arguments.append(argument)
        }
        
        public mutating func appendInterpolation(_ value: Double) {
            
            let argument = InterpolationArgument.double(value)
            
            key += argument.placeholder
            
            arguments.append(argument)
        }
        
        public mutating func appendInterpolation(_ value: Float) {
            
            let argument = InterpolationArgument.float(value)
            
            key += argument.placeholder
            
            arguments.append(.float(value))
        }
        
        public mutating func appendInterpolation(_ value: Date) {
            
            let argument = InterpolationArgument.date(value)
            
            key += argument.placeholder
            
            arguments.append(argument)
        }
    }
}
