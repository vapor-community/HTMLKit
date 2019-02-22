
public protocol AttributableNode: CompiledTemplate {

    /// Adds an attribute to a node
    ///
    /// - Parameter attribute: The attribute to be added
    /// - Returns: A new modified version of the called object
    func add(_ attribute: HTML.AttributeNode) -> Self
}

extension AttributableNode {
    public func `class`(_ values: CompiledTemplate...) -> Self {
        return self.add( .class(values))
    }

    public func id(_ value: CompiledTemplate) -> Self {
        return self.add( .id(value))
    }

    public func lang(_ value: CompiledTemplate) -> Self {
        return self.add( .lang(value))
    }

    public func alt(_ value: CompiledTemplate) -> Self {
        return self.add( .alt(value))
    }

    public func name(_ value: CompiledTemplate) -> Self {
        return self.add( .name(value))
    }

    public func content(_ value: CompiledTemplate) -> Self {
        return self.add( .content(value))
    }

    public func rel(_ value: CompiledTemplate) -> Self {
        return self.add( .rel(value))
    }

    public func href(_ value: CompiledTemplate) -> Self {
        return self.add( .href(value))
    }

    public func src(_ value: CompiledTemplate) -> Self {
        return self.add( .src(value))
    }

    public func type(_ value: CompiledTemplate) -> Self {
        return self.add( .type(value))
    }

    public func charset(_ value: CompiledTemplate) -> Self {
        return self.add( .charset(value))
    }

    public func dataToggle(_ toggle: CompiledTemplate) -> Self {
        return self.add( .dataTarget(toggle))
    }

    public func dataTarget(_ target: CompiledTemplate) -> Self {
        return self.add( .dataTarget(target))
    }

    public func onClick(_ functionName: CompiledTemplate) -> Self {
        return self.add( .onClick(functionName))
    }

    public func width(_ width: Int) -> Self {
        return self.add( .width(width))
    }

    public func height(_ height: Int) -> Self {
        return self.add( .height(height))
    }

    public func `for`(_ value: CompiledTemplate) -> Self {
        return self.add( .for(value))
    }

    public var checked: Self {
        return self.add( .checked)
    }

    public func placeholder(_ text: CompiledTemplate) -> Self {
        return self.add( .placeholder(text))
    }

    public func action(_ text: CompiledTemplate) -> Self {
        return self.add( .action(text))
    }

    public func method(_ text: CompiledTemplate) -> Self {
        return self.add( .method(text))
    }

    public var `required`: Self {
        return self.add( .required)
    }

    public func style(_ text: CompiledTemplate) -> Self {
        return self.add( .style(text))
    }

    public func role(_ text: CompiledTemplate) -> Self {
        return self.add( .role(text))
    }

    public func ariaHaspopup(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaHaspopup(text))
    }

    public func ariaExpanded(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaExpanded(text))
    }

    public func ariaValuenow(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaValuenow(text))
    }

    public func ariaValuemin(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaValuemin(text))
    }

    public func ariaValuemax(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaValuemax(text))
    }
}

extension AttributableNode where Self : ContextualTemplate {
    public func `if`(_ condition: HTML.IF<Self>.Condition, add attribute: HTML.AttributeNode) -> CompiledTemplate {
        condition.view = self
        return HTML.IF<Self>(conditions: condition).else(self.add(attribute))
    }
}
