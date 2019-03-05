
extension HTML.ContentNode: CompiledTemplate {

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.brew(formula)
        }
        try dynamicAttributes.brew(formula)
        formula.add(string: ">")
        try content.brew(formula)
        formula.add(string: "</\(name)>")
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try "<\(name)"
            + attributes.reduce("") { try $0 + " \($1.render(with: manager))" }
            + dynamicAttributes.render(with: manager)
            + ">\(content.render(with: manager))</\(name)>"
    }
}

extension HTML.ContentNode {

    /// Sets the child to the node
    ///
    ///     div.child("Hello") // <div>Hello</div>
    ///
    /// - Parameter child: The child to set
    /// - Returns: A new node with the child added
    public func child(_ child: CompiledTemplate...) -> HTML.ContentNode<Root> {
        return HTML.ContentNode(name: name, attributes: attributes, content: child)
    }
}

extension HTML.ContentNode: AttributableNode, DynamicAttributable {

    // View `AttributableNode` documentation
    public func add(_ attribute: HTML.AttributeNode) -> HTML.ContentNode<Root> {
        var attributes = self.attributes
        for (index, attr) in attributes.enumerated() {
            if attr.attribute == attribute.attribute {
                guard let value = attr.value, let newValue = attribute.value else {
                    break
                }
                attributes.append(.init(attribute: attr.attribute, value: [value, " ", newValue]))
                attributes.remove(at: index)
                return .init(name: name, attributes: attributes, content: content)
            }
        }
        return .init(name: name, attributes: attributes + [attribute], content: content)
    }

    // View `DynamicAttributable` documentation
    public func addDynamic(_ attribute: HTML.AttributeNode, with condition: TemplateIF<Root>.Condition) -> HTML.ContentNode<Root> {
        var attributes = self.attributes
        for (index, attr) in attributes.enumerated() {
            if attr.attribute == attribute.attribute {
                guard let value = attr.value, let newValue = attribute.value else {
                    break
                }
                condition.view = [" ", newValue]
                attributes.append(.init(attribute: attr.attribute, value: [value, TemplateIF(conditions: condition)]))
                attributes.remove(at: index)
                return .init(name: name, attributes: attributes, content: content, dynamicAttributes: dynamicAttributes)
            }
        }
        condition.view = [" ", attribute]
        let ifCondition = TemplateIF(conditions: condition)
        return .init(name: name, attributes: attributes, content: content, dynamicAttributes: [dynamicAttributes, ifCondition])
    }
}
