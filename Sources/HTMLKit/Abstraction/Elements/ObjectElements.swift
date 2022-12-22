/*
 Abstract:
 The file contains the object elements. The html-element 'object' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element defines parameters for plugins invoked by an object element.
///
/// ```html
/// <param>
/// ```
public struct Parameter: EmptyNode, ObjectElement {
    
    internal var name: String { "param" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Parameter) -> Parameter) -> Parameter {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Parameter, T) -> Parameter) -> Parameter {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Parameter: NameAttribute, ValueAttribute {

    public func name(_ value: String) -> Parameter {
        return mutate(name: value)
    }
    
    public func value(_ value: String) -> Parameter {
        return mutate(value: value)
    }
}
