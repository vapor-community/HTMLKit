public protocol ContentNode: AttributeNode {

    var name: String { get }

    var content: HTMLContent { get }

    init(attributes: [HTMLAttribute], content: HTMLContent)
}

extension ContentNode {
    public func copy(with attributes: [HTMLAttribute]) -> Self {
        .init(attributes: attributes, content: content)
    }

    public var scripts: HTMLContent { content.scripts }
}

extension ContentNode {
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.prerender(formula)
        }
        formula.add(string: ">")
        try content.prerender(formula)
        formula.add(string: "</\(name)>")
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try "<\(name)"
            + attributes.reduce("") { try $0 + " \($1.render(with: manager))" }
            + ">\(content.render(with: manager))</\(name)>"
    }
}

public protocol DatableNode: AttributeNode {

    var name: String { get }

    init(attributes: [HTMLAttribute])
}

extension DatableNode {
    public func copy(with attributes: [HTMLAttribute]) -> Self {
        .init(attributes: attributes)
    }
}

extension DatableNode {
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.prerender(formula)
        }
        formula.add(string: ">")
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try "<\(name)" + attributes.reduce("") { try $0 + " \($1.render(with: manager))" } + ">"
    }
}

public protocol AttributeNode: AddableAttributeNode {

    func copy(with attributes: [HTMLAttribute]) -> Self

    func modify(if condition: Conditionable, modifyer: (Self) -> Self) -> Self

    func wrapAttributes(with condition: Conditionable) -> [HTMLAttribute]
}

extension AttributeNode {

    public func add(_ attribute: HTMLAttribute, withSpace: Bool = true) -> Self {
        return copy(with: attributes.add(attribute: attribute))
    }

    public func add(attributes: [HTMLAttribute], withSpace: Bool = true) -> Self {
        return self.copy(with: self.attributes.add(attributes: attributes))
    }

    public func value(of attribute: String) -> HTMLContent? {
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

public protocol AddableAttributeNode: HTMLContent, GlobalAttributes {

    var attributes: [HTMLAttribute] { get }

    func add(_ attribute: HTMLAttribute, withSpace: Bool) -> Self

    func add(attributes: [HTMLAttribute], withSpace: Bool) -> Self

    func value(of attribute: String) -> HTMLContent?
}
