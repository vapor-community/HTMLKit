
extension HTML.ContentNode: CompiledTemplate {

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.brew(formula)
        }
        formula.add(string: ">")
        try content.brew(formula)
        formula.add(string: "</\(name)>")
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try "<\(name)"
            + attributes.reduce("") { try $0 + " \($1.render(with: manager))" }
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
    public func child(_ child: CompiledTemplate...) -> HTML.ContentNode {
        return HTML.ContentNode(name: name, attributes: attributes, content: child)
    }
}

extension HTML.ContentNode: AttributableNode {

    // View `AttributableNode` documentation
    public func add(_ attribute: HTML.AttributeNode) -> HTML.ContentNode {
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
}

extension HTML.ContentNode.Dynamic: CompiledTemplate {

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: "<\(node.name)")
        try node.attributes.forEach {
            formula.add(string: " ")
            try $0.brew(formula)
        }
        try dynamicAttributes.brew(formula)
        formula.add(string: ">")
        try node.content.brew(formula)
        formula.add(string: "</\(node.name)>")
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {

        return try "<\(node.name)"
            + node.attributes.reduce("") { try $0 + " \($1.render(with: manager))" }
            + dynamicAttributes.render(with: manager)
            + ">\(node.content.render(with: manager))</\(node.name)>"
    }
}

extension HTML.ContentNode.Dynamic: AttributableNode, DynamicAttributable where Root : ContextualTemplate {

    // View `AttributableNode` documentation
    public func add(_ attribute: HTML.AttributeNode) -> HTML.ContentNode.Dynamic<Root> {
        return .init(node: node.add(attribute), dynamicAttributes: dynamicAttributes)
    }

    // View `DynamicAttributable` documentation
    public func addDynamic(_ attribute: HTML.AttributeNode, with condition: HTML.IF<Root>.Condition) -> HTML.ContentNode.Dynamic<Root> {
        var attributes = self.node.attributes
        for (index, attr) in attributes.enumerated() {
            if attr.attribute == attribute.attribute {
                guard let value = attr.value, let newValue = attribute.value else {
                    break
                }
                condition.view = [" ", newValue]
                attributes.append(.init(attribute: attr.attribute, value: [value, HTML.IF(conditions: condition)]))
                attributes.remove(at: index)
                return .init(name: node.name, attributes: attributes, content: node.content, dynamicAttributes: dynamicAttributes)
            }
        }
        condition.view = [" ", attribute]
        let ifCondition = HTML.IF(conditions: condition)
        return .init(node: node, dynamicAttributes: [dynamicAttributes, ifCondition])
    }
}

extension HTML.ContentNode.Dynamic {

    /// Sets the child to the node
    ///
    ///     div.child("Hello") // <div>Hello</div>
    ///
    /// - Parameter child: The child to set
    /// - Returns: A new node with the child added
    public func child(_ child: CompiledTemplate...) -> HTML.ContentNode.Dynamic<Root> {
        return HTML.ContentNode.Dynamic<Root>(name: node.name, attributes: node.attributes, content: child, dynamicAttributes: dynamicAttributes)
    }
}
