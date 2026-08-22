import Foundation

/// A string key for the localization
@_documentation(visibility: internal)
public struct LocalizedStringKey {
 
    /// The key value
    /// 
    /// ```
    /// Hello %@
    /// ```
    internal var value: String
    
    /// A fallback literal string
    /// 
    /// ```
    /// Hello World
    /// ```
    ///
    /// > Note: This literal is not intended for lookup in the translation table. Instead, it serves as
    /// > a default value if localization is not set up or if the key is not found at all.
    internal var fallback: String
    
    /// The arguments for the interpolation
    internal var arguments: [InterpolationArgument]
    
    /// Initializes a string key for localization
    /// 
    /// - Parameters:
    ///   - value: The key value
    ///   - literal: The default value
    ///   - interpolation: The arguments toreplace placeholders within the translation string
    public init(value: String, fallback: String, arguments: [InterpolationArgument] = []) {
        
        self.value = value
        self.fallback = fallback
        self.arguments = arguments
    }
}

extension LocalizedStringKey: ExpressibleByStringLiteral {
 
    public init(stringLiteral: String) {

        self.value = stringLiteral
        self.fallback = stringLiteral
        self.arguments = []
    }
}

extension LocalizedStringKey: ExpressibleByStringInterpolation {
    
    public init(stringInterpolation: LocalizedStringKey) {
        
        self.value = stringInterpolation.value
        self.fallback = stringInterpolation.fallback
        self.arguments = stringInterpolation.arguments
    }
}

extension LocalizedStringKey: StringInterpolationProtocol {
    
    public init(literalCapacity: Int, interpolationCount: Int) {

        self.value = ""
        self.fallback = ""
        self.arguments = []
    }
    
    public mutating func appendLiteral(_ literal: String) {
        
        self.value += literal
        
        self.fallback += literal
    }
    
    public mutating func appendInterpolation(_ value: String) {
        
        let argument = InterpolationArgument.string(value)
        
        self.value += argument.placeholder
        
        self.fallback += value
        
        self.arguments.append(argument)
    }
    
    public mutating func appendInterpolation(_ value: Int) {
        
        let argument = InterpolationArgument.int(value)
        
        self.value += argument.placeholder
        
        self.fallback += String(value)
        
        self.arguments.append(argument)
    }
    
    public mutating func appendInterpolation(_ value: Double) {
        
        let argument = InterpolationArgument.double(value)
        
        self.value += argument.placeholder
        
        self.fallback += String(value)
        
        self.arguments.append(argument)
    }
    
    public mutating func appendInterpolation(_ value: Float) {
        
        let argument = InterpolationArgument.float(value)
    
        self.value += argument.placeholder
        
        self.fallback += String(value)
        
        self.arguments.append(argument)
    }
    
    public mutating func appendInterpolation(_ value: Date) {
        
        let argument = InterpolationArgument.date(value)
        
        self.value += argument.placeholder
        
        let formatter = DateFormatter()
        
        self.fallback += formatter.string(from: value)
        
        self.arguments.append(argument)
    }
}

extension LocalizedStringKey: Hashable {
    
    /// Compare two string keys.
    public static func == (lhs: LocalizedStringKey, rhs: LocalizedStringKey) -> Bool {
        return lhs.fallback == rhs.fallback
    }
}

extension LocalizedStringKey: CustomStringConvertible {
    
    public var description: String {
        return self.value
    }
}
