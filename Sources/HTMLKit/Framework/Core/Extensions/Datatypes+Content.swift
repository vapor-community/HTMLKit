/*
 Abstract:
 The file contains extensions for some data types.
 */

import Foundation

extension Array: AnyContent where Element == AnyContent {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == String {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == BodyElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == DescriptionElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == FigureElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == FormElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == BasicElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == HeadElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == InputElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == ListElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == MapElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == MediaElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == ObjectElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == RubyElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == TableElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == HtmlElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Array where Element == VectorElement {

    public var scripts: AnyContent {
        return self.reduce("") { $0 + $1.scripts }
    }
}

extension Bool: AnyContent {}

extension Bool: Conditionable {
    public func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return self
    }
}

extension Double: AnyContent {}

extension Float: AnyContent {}

extension Int: AnyContent {}

extension Optional: AnyContent where Wrapped: AnyContent {

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

extension String: AnyContent {}

extension UUID: AnyContent {}

extension Sequence {
    
    public func htmlForEach(@ContentBuilder<AnyContent> content: (TemplateValue<Element>) -> AnyContent) -> AnyContent {
        ForEach(in: .constant(self), content: content)
    }
}
