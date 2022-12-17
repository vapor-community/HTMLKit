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
public struct Parameter: EmptyElement {
    
    internal var name: String { "param" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Parameter: NameAttribute, ValueAttribute {
    
    public func name(_ value: String) -> Parameter {
        return mutate(name: value)
    }
    
    public func name(_ value: Property<String>) -> Parameter {
        return mutate(name: value)
    }
    
    public func value(_ value: String) -> Parameter {
        return mutate(value: value)
    }
    
    public func value(_ value: Property<String>) -> Parameter {
        return mutate(value: value)
    }
}
