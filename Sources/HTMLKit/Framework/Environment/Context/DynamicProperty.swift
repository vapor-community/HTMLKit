/// A type, that defines a property
public protocol DynamicProperty: Content {
    
    associatedtype ValueType
    
    var name: String { get }
    
    var path: AnyKeyPath { get }
    
    var type: ValueType { get }
}
