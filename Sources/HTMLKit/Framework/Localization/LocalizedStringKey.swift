import Foundation

/// A string key for the localization
@_documentation(visibility: internal)
public struct LocalizedStringKey {
 
    /// The key value
    internal let value: String
    
    /// A fallback literal string
    ///
    /// > Note: This literal is not intended for lookup in the translation table. Instead, it serves as
    /// > a default value if localization is not set up or if the key is not found at all.
    internal let literal: String
    
    /// The arguments for the interpolation
    internal var interpolation: [InterpolationArgument]?
    
    /// Initializes a string key for localization
    /// 
    /// - Parameters:
    ///   - value: The key value
    ///   - literal: The default value
    ///   - interpolation: The arguments toreplace placeholders within the translation string
    public init(value: String, literal: String, interpolation: [InterpolationArgument]? = nil) {
        
        self.value = value
        self.literal = literal
        self.interpolation = interpolation
    }
}

extension LocalizedStringKey: ExpressibleByStringLiteral, ExpressibleByStringInterpolation {
    
    public init(stringLiteral: String) {
        self.init(value: stringLiteral, literal: stringLiteral)
    }
    
    public init(stringInterpolation: StringInterpolation) {
        self.init(value: stringInterpolation.key,
                  literal: stringInterpolation.literal,
                  interpolation: stringInterpolation.arguments)
    }
    
    public struct StringInterpolation: StringInterpolationProtocol {
        
        /// The key to be localized
        var key = ""
        
        /// The arguments for the interpolation
        var arguments: [InterpolationArgument] = []
        
        /// The string literal
        var literal = ""
        
        public init(literalCapacity: Int, interpolationCount: Int) {
            
            key.reserveCapacity(literalCapacity + interpolationCount * 2)
            
            arguments.reserveCapacity(interpolationCount)
        }
        
        public mutating func appendLiteral(_ literal: String) {
            
            self.literal += literal
            
            key.append(literal)
        }
        
        public mutating func appendInterpolation(_ value: String) {
            
            literal += value
            
            let argument = InterpolationArgument.string(value)
            
            key += argument.placeholder
            
            arguments.append(argument)
        }
        
        public mutating func appendInterpolation(_ value: Int) {
            
            literal += String(value)
            
            let argument = InterpolationArgument.int(value)
            
            key += argument.placeholder
            
            arguments.append(argument)
        }
        
        public mutating func appendInterpolation(_ value: Double) {
            
            literal += String(value)
            
            let argument = InterpolationArgument.double(value)
            
            key += argument.placeholder
            
            arguments.append(argument)
        }
        
        public mutating func appendInterpolation(_ value: Float) {
            
            literal += String(value)
            
            let argument = InterpolationArgument.float(value)
            
            key += argument.placeholder
            
            arguments.append(.float(value))
        }
        
        public mutating func appendInterpolation(_ value: Date) {
            
            let formatter = DateFormatter()
            
            literal += formatter.string(from: value)
            
            let argument = InterpolationArgument.date(value)
            
            key += argument.placeholder
            
            arguments.append(argument)
        }
    }
}
