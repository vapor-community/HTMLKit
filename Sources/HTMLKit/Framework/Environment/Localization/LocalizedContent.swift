/*
 Abstract:
 The file contains the environment modifier.
 */

public protocol LocalizedContent: Content {
    
    associatedtype ValueType: Encodable
    
    /// The string key
    var key: String { get }
    
    /// The context for string interpolation
    var context: TemplateValue<ValueType>? { get }
}
