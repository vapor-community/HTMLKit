/*
 Abstract:
 The file contains the environment modifier.
 */

public protocol LocalizeContent: Content {
    
    associatedtype ValueType: Encodable
    
    /// The string key
    var key: String { get }
    
    /// The context for string interpolation
    var variable: Property<ValueType>? { get }
}
