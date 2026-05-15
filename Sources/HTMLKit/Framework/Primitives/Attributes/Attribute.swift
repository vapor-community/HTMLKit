import OrderedCollections

/// A type that represents any html-attribute.
///
/// A attribute is a modifier of a html-element.
@_documentation(visibility: internal)
public protocol Attribute {
    
    func custom(key: String, value: String, context: EscapeContext) -> Self
    
    func custom(key: String, value: Int) -> Self
    
    func custom(key: String, value: Double) -> Self
    
    func custom(key: String, value: Bool) -> Self
    
    func custom(key: String, value: Float) -> Self
    
    func custom(key: String, value: EnvironmentValue, context: EscapeContext) -> Self
}

extension Attribute where Self: ContentNode {
    
    internal func mutate(key: String, value: AttributeData) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: [key: value], context: context, content: content)
        }
        
        attributes[key] = value
        
        return .init(attributes: attributes, context: context, content: content)
    }
}

extension Attribute where Self: EmptyNode {
    
    internal func mutate(key: String, value: AttributeData) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes:  [key: value])
        }
        
        attributes[key] = value
        
        return .init(attributes: attributes)
    }
}

extension Attribute where Self: CustomNode {
    
    internal func mutate(key: String, value: AttributeData) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(name: name, attributes:  [key: value], context: context, content: content)
        }
        
        attributes[key] = value
        
        return .init(name: name, attributes: attributes, context: context, content: content)
    }
}
