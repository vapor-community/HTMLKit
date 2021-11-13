import Foundation

extension Array: Content where Element == Content {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: Content {
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
                var values: [Content] = [IF(attr.isIncluded) {value}]
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

extension String: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return self
    }

    public func prerender(_ formula: Renderer.Formula) throws {
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

extension Int: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Double: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Float: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Bool: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Bool: Conditionable {
    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        return self
    }
}

extension Optional: Content where Wrapped: Content {

    public func prerender(_ formula: Renderer.Formula) throws {
        switch self {
        case .some(let wrapped): try wrapped.prerender(formula)
        default: break
        }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        switch self {
        case .none: return ""
        case .some(let wrapped): return try wrapped.render(with: manager)
        }
    }

    public var scripts: Content {
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

extension UUID: Content {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return self.uuidString
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: self.uuidString)
    }
}
