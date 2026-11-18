/// A type that represents an environment string.
@_documentation(visibility: internal)
public struct EnvironmentString: Content {
    
    internal var values: [Content] = []
}

extension EnvironmentString: ExpressibleByStringLiteral {
    
    public init(stringLiteral: String) {
        self.values.append(stringLiteral)
    }
}

extension EnvironmentString: ExpressibleByStringInterpolation {
    
    public init(stringInterpolation: EnvironmentString) {
        self.values.append(contentsOf: stringInterpolation.values)
    }
}

extension EnvironmentString: StringInterpolationProtocol {
    
    public init(literalCapacity: Int, interpolationCount: Int) {
        values.reserveCapacity(interpolationCount)
    }
    
    public mutating func appendLiteral(_ literal: String) {
        values.append(literal)
    }
    
    public mutating func appendInterpolation(_ value: EnvironmentValue) {
        values.append(value)
    }
}
