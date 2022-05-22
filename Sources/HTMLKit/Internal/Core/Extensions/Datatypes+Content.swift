import Foundation

extension Array: AnyContent where Element == AnyContent {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == String {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == BodyElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == DescriptionElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == FigureElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == FormElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == BasicElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == HeadElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == InputElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == ListElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == MapElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == MediaElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == ObjectElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == RubyElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == TableElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == HtmlElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == VectorElement {

    public func prerender(_ formula: Renderer.Formula) throws {
        try forEach { try $0.prerender(formula) }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try self.reduce("") { try $0 + $1.render(with: manager) }
    }

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Bool: AnyContent {

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

extension Double: AnyContent {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Float: AnyContent {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Int: AnyContent {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return String(self)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: String(self))
    }

    public var renderWhenLocalizing: Bool { return false }
}

extension Optional: AnyContent where Wrapped: AnyContent {

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

    public var scripts: AnyContent {
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

extension String: AnyContent {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return self
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: self)
    }
}

extension UUID: AnyContent {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return self.uuidString
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(string: self.uuidString)
    }
}

extension Sequence {
    
    public func htmlForEach(@ContentBuilder<AnyContent> content: (TemplateValue<Element>) -> AnyContent) -> AnyContent {
        ForEach(in: .constant(self), content: content)
    }
}
