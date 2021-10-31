import Foundation

extension Array: HTMLContent where Element == HTMLContent {

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: HTMLContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == HTMLAttribute {
    public func add(attribute: HTMLAttribute) -> [HTMLAttribute] {
        var attributes = self
        for (index, attr) in attributes.enumerated() {
            if attr.attribute == attribute.attribute {
                guard
                    let value = attr.value,
                    let newValue = attribute.value
                else {
                    break
                }
                var values: [HTMLContent] = [IF(attr.isIncluded) {value}]
                values.append(IF(attr.isIncluded && attribute.isIncluded) { " " })
                values.append(IF(attribute.isIncluded) { newValue })
                attributes.append(.init(attribute: attr.attribute, value: values, isIncluded: attr.isIncluded || attribute.isIncluded))
                attributes.remove(at: index)
                return attributes
            }
        }
        return attributes + [attribute]
    }

    public func add(attributes: [HTMLAttribute]) -> [HTMLAttribute] {
        var newNode = self
        for attribute in attributes {
            newNode = newNode.add(attribute: attribute)
        }
        return newNode
    }

    public func wrapAttributes(with condition: Conditionable) -> [HTMLAttribute] {
        self.map { attribute in
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

extension String: HTMLContent {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return self
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: self)
    }
}

extension String: RawRepresentable {
    public typealias RawValue = String

    public var rawValue: String { self }

    public init?(rawValue: String) {
        self = rawValue
    }
}

extension Int: HTMLContent {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Double: HTMLContent {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Float: HTMLContent {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Bool: HTMLContent {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Bool: Conditionable {
    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return self
    }
}

extension Optional: HTMLContent where Wrapped: HTMLContent {

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        switch self {
        case .some(let wrapped): try wrapped.prerender(formula)
        default: break
        }
    }

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch self {
        case .none: return ""
        case .some(let wrapped): return try wrapped.render(with: manager)
        }
    }

    public var scripts: HTMLContent {
        switch self {
        case .none: return ""
        case .some(let wrapped): return wrapped.scripts
        }
    }
}

extension Optional: Defineable {
    var isDefinded: Bool {
        switch self {
        case .none: return false
        default: return true
        }
    }
}

extension UUID: HTMLContent {

    // View `HTML` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return self.uuidString
    }

    // View `HTML` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: self.uuidString)
    }
}
