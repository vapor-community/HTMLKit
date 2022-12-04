/*
 Abstract:
 The file contains the default definition of an attribute. It defines which properties and methods an attribute should come with. A attribute is a part of a element and is contained in a node.
 */

import OrderedCollections

/// A type that represents any html-attribute.
///
/// A attribute is a modifier of a html-element.
public protocol Attribute {
    
    /// The func adds
    func custom(key: String, value: Any) -> Self
}

extension Attribute where Self: ContentElement {
    
    internal func mutate(key: String, value: Any) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: [key: value], content: content)
        }
        
        attributes[key] = value
        
        return .init(attributes: attributes, content: content)
    }
}

extension Attribute where Self: EmptyElement {
    
    internal func mutate(key: String, value: Any) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes:  [key: value])
        }
        
        attributes[key] = value
        
        return .init(attributes: attributes)
    }
}
