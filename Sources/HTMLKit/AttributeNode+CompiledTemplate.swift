
extension HTML.AttributeNode: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        if let value = value {
            return try "\(attribute)='\(value.render(with: manager))'"
        } else {
            return "\(attribute)"
        }
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: attribute)
        if let value = value {
            formula.add(string: "='")
            try value.brew(formula)
            formula.add(string: "'")
        }
    }
}

extension HTML.AttributeNode {
    public static func `class`(_ values: CompiledTemplate...) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "class", value: String(values.reduce("") { $0 + " \($1)" }.dropFirst()))
    }

    public static func id(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "id", value: value)
    }

    public static func lang(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "lang", value: value)
    }

    public static func alt(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "alt", value: value)
    }

    public static func name(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "name", value: value)
    }

    public static func content(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "content", value: value)
    }

    public static func rel(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "rel", value: value)
    }

    public static func href(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "href", value: value)
    }

    public static func src(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "scr", value: value)
    }

    public static func type(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "type", value: value)
    }

    public static func charset(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "charset", value: value)
    }

    public static func dataToggle(_ toggle: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "data-toggle", value: toggle)
    }

    public static func dataTarget(_ target: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "data-target", value: target)
    }

    public static func onClick(_ functionName: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onclick", value: functionName)
    }

    public static func width(_ width: Int) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "widt", value: "\(width)")
    }

    public static func height(_ height: Int) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "height", value: "\(height)")
    }

    public static func `for`(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "for", value: value)
    }

    public static var checked: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "checked", value: nil)
    }

    public static func placeholder(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "placeholder", value: text)
    }

    public static func action(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "action", value: text)
    }

    public static func method(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "method", value: text)
    }

    public static var `required`: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "required", value: nil)
    }

    public static func style(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "style", value: text)
    }

    public static func role(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "role", value: text)
    }

    public static func ariaHaspopup(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-haspopup", value: text)
    }

    public static func ariaExpanded(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-expanded", value: text)
    }

    public static func ariaValuenow(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-valuenow", value: text)
    }

    public static func ariaValuemin(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-valuemin", value: text)
    }

    public static func ariaValuemax(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-valuemax", value: text)
    }
}
