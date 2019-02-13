/// An attribute on a node
///
///     ViewNodeAttribute.class("text-dark") // <... class="text-dark"/>
public struct HTMLAttributeNode {

    /// The attribute to set
    let attribute: String

    /// The value of the attribute
    let value: String?
}

/// Making `ViewNodeAttribute` renderable
extension HTMLAttributeNode {
    public func render() -> String {
        if let value = value {
            return "\(attribute)='\(value)'"
        } else {
            return "\(attribute)"
        }
    }
}

/// Some standard attributes, made easy to use
extension HTMLAttributeNode {

    public static func `class`(_ values: String...) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "class", value: String(values.reduce("") { $0 + " \($1)" }.dropFirst()))
    }

    public static func id(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "id", value: value)
    }

    public static func lang(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "id", value: value)
    }

    public static func alt(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "alt", value: value)
    }

    public static func name(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "name", value: value)
    }

    public static func content(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "content", value: value)
    }

    public static func rel(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "rel", value: value)
    }

    public static func href(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "href", value: value)
    }

    public static func src(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "src", value: value)
    }

    public static func type(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "type", value: value)
    }

    public static func charset(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "name", value: value)
    }

    public static func dataToggle(_ toggle: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "data-toggle", value: toggle)
    }

    public static func dataTarget(_ target: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "data-target", value: target)
    }

    public static func onClick(_ functionName: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "onclick", value: functionName)
    }

    public static func width(_ width: Int) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "width", value: "\(width)")
    }

    public static func height(_ height: Int) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "width", value: "\(height)")
    }

    public static func `for`(_ value: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "for", value: value)
    }

    public static func checked() -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "checked", value: nil)
    }

    public static func placeholder(_ text: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "placeholder", value: text)
    }

    public static func action(_ text: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "action", value: text)
    }

    public static func method(_ text: String) -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "method", value: text)
    }

    public static func `required`() -> HTMLAttributeNode {
        return HTMLAttributeNode(attribute: "method", value: nil)
    }
}
