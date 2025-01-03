/// A type that represents an environment string
@_documentation(visibility: internal)
public struct EnvironmentString: ExpressibleByStringLiteral, ExpressibleByStringInterpolation, Content {
    
    internal var values: [Content] = []
    
    public init(stringLiteral: String) {
        self.values.append(stringLiteral)
    }
    
    public init(stringInterpolation: StringInterpolation) {
        self.values.append(contentsOf: stringInterpolation.values)
    }
    
    public struct StringInterpolation: StringInterpolationProtocol {
        
        internal var values: [Content] = []
    
        public init(literalCapacity: Int, interpolationCount: Int) {
            values.reserveCapacity(interpolationCount)
        }
        
        public mutating func appendLiteral(_ literal: String) {
            values.append(literal)
        }
        
        public mutating func appendInterpolation(_ env: EnvironmentValue) {
            values.append(env)
        }
    }
}
