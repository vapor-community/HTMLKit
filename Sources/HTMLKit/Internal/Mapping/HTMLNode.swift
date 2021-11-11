/// The protocol defines
///
///
public protocol HTMLNode: Content, GlobalAttributes {
    
    var name: String { get }
    
    var attributes: [HTMLAttribute] { get }
    
    func add(_ attribute: HTMLAttribute, withSpace: Bool) -> Self

    func add(attributes: [HTMLAttribute], withSpace: Bool) -> Self

    func value(of attribute: String) -> Content?
    
    func copy(with attributes: [HTMLAttribute]) -> Self

    func modify(if condition: Conditionable, modifyer: (Self) -> Self) -> Self

    func wrapAttributes(with condition: Conditionable) -> [HTMLAttribute]
}

extension HTMLNode {

    public func add(_ attribute: HTMLAttribute, withSpace: Bool = true) -> Self {
        
        return copy(with: attributes.add(attribute: attribute))
    }

    public func add(attributes: [HTMLAttribute], withSpace: Bool = true) -> Self {
        
        return self.copy(with: self.attributes.add(attributes: attributes))
    }

    public func value(of attribute: String) -> Content? {
        
        attributes.first(where: { $0.attribute == attribute })?.value
    }

    public func modify(if condition: Conditionable, modifyer: (Self) -> Self) -> Self {
        
        let emptyNode = self.copy(with: [])
        let modified = modifyer(emptyNode)
        return self.add(attributes: modified.wrapAttributes(with: condition))
    }

    public func modify<Value>(unwrap value: TemplateValue<Value?>, modifyer: (TemplateValue<Value>, Self) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            guard let value = optional else {
                return self
            }
            let emptyNode = self.copy(with: [])
            let modified = modifyer(.constant(value), emptyNode)

            return self.add(attributes: modified.attributes)
        case .dynamic(let context):
            let emptyNode = self.copy(with: [])
            var modified: Self!
            if context.isMascadingOptional {
                modified = modifyer(.dynamic(context.unsafeCast(to: Value.self)), emptyNode)
            } else {
                modified = modifyer(.dynamic(context.unsafelyUnwrapped), emptyNode)
            }

            return self.add(attributes: modified.wrapAttributes(with: context.isDefinded))
        }
    }

    public func wrapAttributes(with condition: Conditionable) -> [HTMLAttribute] {
        
        attributes.map { attribute in
            if let value = attribute.value {
                return HTMLAttribute(
                    attribute: attribute.attribute,
                    value: value,
                    isIncluded: condition
                )
            } else {
                return HTMLAttribute(
                    attribute: attribute.attribute,
                    value: nil,
                    isIncluded: condition
                )
            }
        }
    }
}
