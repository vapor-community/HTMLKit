
extension HTML.AttributeNode: Mappable {

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Template {
        if let value = value {
            return try "\(attribute)='\(value.map(for: type, with: context))'"
        } else {
            return "\(attribute)"
        }
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Template {
        formula.add(string: attribute)
        if let value = value {
            formula.add(string: "='")
            try value.brew(formula)
            formula.add(string: "'")
        }
    }
}

/// Some standard attributes, made easy to use
extension HTML.AttributeNode {

    public static func `class`(_ values: Mappable...) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "class", value: String(values.reduce("") { $0 + " \($1)" }.dropFirst()))
    }

    public static func id(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "id", value: value)
    }

    public static func lang(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "id", value: value)
    }

    public static func alt(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "alt", value: value)
    }

    public static func name(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "name", value: value)
    }

    public static func content(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "content", value: value)
    }

    public static func rel(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "rel", value: value)
    }

    public static func href(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "href", value: value)
    }

    public static func src(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "src", value: value)
    }

    public static func type(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "type", value: value)
    }

    public static func charset(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "name", value: value)
    }

    public static func dataToggle(_ toggle: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "data-toggle", value: toggle)
    }

    public static func dataTarget(_ target: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "data-target", value: target)
    }

    public static func onClick(_ functionName: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onclick", value: functionName)
    }

    public static func width(_ width: Int) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "width", value: "\(width)")
    }

    public static func height(_ height: Int) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "width", value: "\(height)")
    }

    public static func `for`(_ value: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "for", value: value)
    }

    public static var checked: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "checked", value: nil)
    }

    public static func placeholder(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "placeholder", value: text)
    }

    public static func action(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "action", value: text)
    }

    public static func method(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "method", value: text)
    }

    public static var `required`: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "required", value: nil)
    }

    public static func style(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "style", value: text)
    }

    public static func role(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "role", value: text)
    }

    public static func ariaHaspopup(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-haspopup", value: text)
    }

    public static func ariaExpanded(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-expanded", value: text)
    }

    public static func ariaValuenow(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-valuenow", value: text)
    }

    public static func ariaValuemin(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-valuemin", value: text)
    }

    public static func ariaValuemax(_ text: Mappable) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-valuemax", value: text)
    }
}
