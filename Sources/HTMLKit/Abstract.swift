internal indirect enum ContextValue {
    case none
    case root(AnyKeyPath)
    case listElement(AnyKeyPath, ContextValue)
}

internal indirect enum TemplateNode: ContentRepresentable, _HTML {
    typealias HTMLScope = Scopes.Never
    
    case none
    case list([TemplateNode])
    case tag(name: StaticString, content: TemplateNode, modifiers: [_Modifier])
    case lazy(() -> TemplateNode)
    case literal(String)
//    case anyLocalizable()
    case contextValue(AnyKeyPath, String)
    case computedList(AnyKeyPath, String, String, TemplateNode)
    
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

public struct TemplateLiteral: ExpressibleByStringLiteral {
    internal enum Storage {
        case string(String)
    }
    
    let storage: Storage
    
    public init(stringLiteral value: String) {
        self.storage = .string(value)
    }
    
    public init(string: String) {
        self.storage = .string(string)
    }
}

public struct TemplateValue: ExpressibleByStringLiteral {
    enum Storage {
        case compileTime(TemplateLiteral)
        case runtime(AnyKeyPath)
    }
    
    let storage: Storage
    
    public init(literal value: String) {
        self.storage = .compileTime(.init(string: value))
    }
    
    internal init(value: TemplateLiteral) {
        self.storage = .compileTime(value)
    }
    
    internal init(keyPath: AnyKeyPath) {
        self.storage = .runtime(keyPath)
    }
    
    public init(stringLiteral value: String) {
        self.storage = .compileTime(.init(string: value))
    }
}

public protocol TemplateLiteralRepresentable: TemplateValueRepresentable {
    func makeTemplateLiteral() -> TemplateLiteral
}

extension TemplateLiteralRepresentable {
    public func makeTemplateValue() -> TemplateValue {
        TemplateValue(value: makeTemplateLiteral())
    }
}

public protocol TemplateValueRepresentable {
    func makeTemplateValue() -> TemplateValue
}

extension String: TemplateLiteralRepresentable {
    public func makeTemplateLiteral() -> TemplateLiteral {
        TemplateLiteral(string: self)
    }
}

internal enum _Modifier {
    case attribute(name: String, value: TemplateValue)
    case style(type: StyleType, value: [AnyStyle])
}

public struct Modifier {
    let modifier: _Modifier
}

enum StyleType: String {
    case `class`, id
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
    case missingValue(AnyKeyPath, needed: Any.Type)
}
