
protocol AttributableNode {

    /// Adds an attribute to a node
    ///
    /// - Parameter attribute: The attribute to be added
    /// - Returns: A new modified version of the called object
    func add(_ attribute: HTML.AttributeNode) -> Self
}

extension AttributableNode {
    public func `class`(_ values: CompiledTemplate...) -> Self {
        let attr = HTML.AttributeNode(attribute: "class", value: String(values.reduce("") { $0 + " \($1)" }.dropFirst()))
        return self.add(attr)
    }

    public func id(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "id", value: value)
        return self.add(attr)
    }

    public func lang(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "lang", value: value)
        return self.add(attr)
    }

    public func alt(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "alt", value: value)
        return self.add(attr)
    }

    public func name(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "name", value: value)
        return self.add(attr)
    }

    public func content(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "content", value: value)
        return self.add(attr)
    }

    public func rel(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "rel", value: value)
        return self.add(attr)
    }

    public func href(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "href", value: value)
        return self.add(attr)
    }

    public func src(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "scr", value: value)
        return self.add(attr)
    }

    public func type(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "type", value: value)
        return self.add(attr)
    }

    public func charset(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "charset", value: value)
        return self.add(attr)
    }

    public func dataToggle(_ toggle: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "data-toggle", value: toggle)
        return self.add(attr)
    }

    public func dataTarget(_ target: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "data-target", value: target)
        return self.add(attr)
    }

    public func onClick(_ functionName: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "onclick", value: functionName)
        return self.add(attr)
    }

    public func width(_ width: Int) -> Self {
        let attr = HTML.AttributeNode(attribute: "widt", value: "\(width)")
        return self.add(attr)
    }

    public func height(_ height: Int) -> Self {
        let attr = HTML.AttributeNode(attribute: "height", value: "\(height)")
        return self.add(attr)
    }

    public func `for`(_ value: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "for", value: value)
        return self.add(attr)
    }

    public var checked: Self {
        let attr = HTML.AttributeNode(attribute: "checked", value: nil)
        return self.add(attr)
    }

    public func placeholder(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "placeholder", value: text)
        return self.add(attr)
    }

    public func action(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "action", value: text)
        return self.add(attr)
    }

    public func method(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "method", value: text)
        return self.add(attr)
    }

    public var `required`: Self {
        let attr = HTML.AttributeNode(attribute: "required", value: nil)
        return self.add(attr)
    }

    public func style(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "style", value: text)
        return self.add(attr)
    }

    public func role(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "role", value: text)
        return self.add(attr)
    }

    public func ariaHaspopup(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "aria-haspopup", value: text)
        return self.add(attr)
    }

    public func ariaExpanded(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "aria-expanded", value: text)
        return self.add(attr)
    }

    public func ariaValuenow(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "aria-valuenow", value: text)
        return self.add(attr)
    }

    public func ariaValuemin(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "aria-valuemin", value: text)
        return self.add(attr)
    }

    public func ariaValuemax(_ text: CompiledTemplate) -> Self {
        let attr = HTML.AttributeNode(attribute: "aria-valuemax", value: text)
        return self.add(attr)
    }
}
