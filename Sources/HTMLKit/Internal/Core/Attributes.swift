import OrderedCollections

/// The protocol is for
///
///
public protocol Attribute {
    
    
}

extension Attribute {
    
    internal func set(key: String, value: Any) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(key: String, value: Any, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}
