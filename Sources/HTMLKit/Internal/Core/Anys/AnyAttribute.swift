/// # Description:
/// The file contains the attribute definition.
///
/// # Note:
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// # Authors:
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

import OrderedCollections

/// # Description:
/// The protocol defines a html attribute.
///
/// # References:
///
public protocol AnyAttribute {
}

extension AnyAttribute {
    
    internal func set(key: String, value: Any) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(key: String, value: Any, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}
