/// Makes the node renderable
extension HTML.DataNode: CompiledTemplate {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try "<\(name)" + attributes.reduce("") { try $0 + " \($1.render(with: manager))" } + dynamicAttributes.render(with: manager) + ">"
    }

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.brew(formula)
        }
        try dynamicAttributes.brew(formula)
        formula.add(string: ">")
    }
}

extension HTML.DataNode: AttributableNode, DynamicAttributable {

    // View `AttributableNode` documentation
    public func add(_ attribute: HTML.AttributeNode) -> HTML.DataNode<Root> {
        var attributes = self.attributes
        for (index, attr) in attributes.enumerated() {
            if attr.attribute == attribute.attribute {
                guard let value = attr.value, let newValue = attribute.value else {
                    break
                }
                attributes.append(.init(attribute: attr.attribute, value: [value, " ", newValue]))
                attributes.remove(at: index)
                return .init(name: name, attributes: attributes)
            }
        }
        return .init(name: name, attributes: attributes + [attribute])
    }

    // View `DynamicAttributable` documentation
    public func addDynamic(_ attribute: HTML.AttributeNode, with condition: TemplateIF<Root>.Condition) -> HTML.DataNode<Root> {
        var attributes = self.attributes
        for (index, attr) in attributes.enumerated() {
            if attr.attribute == attribute.attribute {
                guard let value = attr.value, let newValue = attribute.value else {
                    return self
                }
                condition.view = [" ", newValue]
                attributes.append(.init(attribute: attr.attribute, value: [value, TemplateIF(conditions: condition)]))
                attributes.remove(at: index)
                return .init(name: name, attributes: attributes, dynamicAttributes: dynamicAttributes)
            }
        }
        condition.view = [" ", attribute]
        let ifCondition = TemplateIF(conditions: condition)
        return .init(name: name, attributes: attributes, dynamicAttributes: [dynamicAttributes, ifCondition])
    }
}
