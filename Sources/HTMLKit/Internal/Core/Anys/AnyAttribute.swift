/*
 Abstract:
 The file contains the attribute definition.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// A type that represents any html-attribute.
///
/// A attribute is a modifier of a html-element.
public protocol AnyAttribute {
}

extension AnyAttribute {
    
    /// Sets the attribute.
    ///
    /// - Parameters:
    ///    - key: The key of the attribute.
    ///    - value: The value of the attribute.
    ///
    /// - Returns:
    internal func set(key: String, value: Any) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    /// Updates the attribute.
    ///
    /// It updates the attribute on a existing collection and returns the same collection.
    ///
    /// - Parameters:
    ///    - key: The key of the attribute.
    ///    - value: The value of the attribute.
    ///
    /// - Returns:
    internal func update(key: String, value: Any, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}
