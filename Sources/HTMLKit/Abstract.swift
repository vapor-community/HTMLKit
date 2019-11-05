internal indirect enum TemplateNode: ContentRepresentable, _HTML {
    typealias HTMLScope = Scopes.Never
    
    case none
    case list([TemplateNode])
    case tag(name: StaticString, content: TemplateNode, modifiers: [Modifier])
    case lazy(() -> TemplateNode)
    case literal(String)
//    case anyLocalizable()
    case contextValue([String], broken: Bool)
    case computedList([String], TemplateNode)
    
    var node: TemplateNode { self }
    var html: TemplateNode { self }
    
    init<Content: _HTML>(from content: Content) {
        switch content {
        case let node as TemplateNode:
            self = node
        case let content as ContentRepresentable:
            self = content.node
        default:
            self.init(from: content.html)
        }
    }
}

internal enum AnyTemplateValue: ExpressibleByStringLiteral {
    case literal(String)
    case runtime([String])
    
    init(stringLiteral value: String) {
        self = .literal(value)
    }
}

public struct TemplateValue: ExpressibleByStringLiteral {
    let value: AnyTemplateValue
    
    public init(literal value: String) {
        self.value = .literal(value)
    }
    
    internal init(value: AnyTemplateValue) {
        self.value = value
    }
    
    public init(stringLiteral value: String) {
        self.value = .literal(value)
    }
}

public protocol TemplateValueRepresentable {
    func makeTemplateValue() -> TemplateValue
}

extension String: TemplateValueRepresentable {
    public func makeTemplateValue() -> TemplateValue {
        TemplateValue(literal: self)
    }
}

internal enum Modifier {
    case attribute(name: String, value: AnyTemplateValue)
}

enum CompiledNode: UInt8 {
    case none = 0x00
    case tag = 0x01
    case literal = 0x02
    case list = 0x03
    case contextValue = 0x04
    case computedList = 0x05
}

enum CompiledTemplateValue: UInt8 {
//    case none = 0x00
    case literal = 0x01
    case runtime = 0x02
}

enum Constants {
    static let space: UInt8 = 0x20
    static let quote: UInt8 = 0x22
    static let less: UInt8 = 0x3c
    static let equal: UInt8 = 0x3d
    static let greater: UInt8 = 0x3e
    static let forwardSlash: UInt8 = 0x2f
}

public enum TemplateError: Error {
    case internalCompilerError
    case errorCompilingPropertyAccessor([String])
    case missingValue(String, needed: Any.Type)
}
