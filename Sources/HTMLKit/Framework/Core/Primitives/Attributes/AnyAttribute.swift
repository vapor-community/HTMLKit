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
    
    /// The func adds
    func custom(key: String, value: Any) -> Self
}

extension AnyAttribute where Self: ContentNode {
    
    internal func mutate(key: String, value: Any) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: [key: value], content: content)
        }
        
        attributes[key] = value
        
        return .init(attributes: attributes, content: content)
    }
}

extension AnyAttribute where Self: EmptyNode {
    
    internal func mutate(key: String, value: Any) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes:  [key: value])
        }
        
        attributes[key] = value
        
        return .init(attributes: attributes)
    }
}
