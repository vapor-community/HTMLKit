
internal indirect enum TemplateNode: ContentRepresentable, _HTML {
    typealias HTMLScope = Scopes.Never
    
    case noContent
    case list([TemplateNode])
    case tag(name: StaticString, content: TemplateNode?, modifiers: [_Modifier])
    case lazy(() -> TemplateNode)
    case literal(String)
//    case anyLocalizable()
    case contextValue(TemplateRuntimeValue)
    case conditional([_Conditional])
    case computedList(TemplateRuntimeValue, String, TemplateNode)
    
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

public struct TemplateLiteral: ExpressibleByStringLiteral, ExpressibleByBooleanLiteral {
    internal enum Storage {
        case string(String)
        case boolean(Bool)
    }
    
    let storage: Storage
    
    public init(stringLiteral value: String) {
        self.storage = .string(value)
    }
    
    public init(booleanLiteral value: Bool) {
        self.storage = .boolean(value)
    }
    
    public init(string: String) {
        self.storage = .string(string)
    }
    
    public init(boolean: Bool) {
        self.storage = .boolean(boolean)
    }
}

public struct TemplateRuntimeValue {
    let path: AnyKeyPath
    let rootId: String
}

public struct TemplateValue: ExpressibleByStringLiteral {
    enum Storage {
        case compileTime(TemplateLiteral)
        case runtime(TemplateRuntimeValue)
    }
    
    let storage: Storage
    
    public init(literal value: String) {
        self.storage = .compileTime(.init(string: value))
    }
    
    internal init(value: TemplateLiteral) {
        self.storage = .compileTime(value)
    }
    
    internal init(value: TemplateRuntimeValue) {
        self.storage = .runtime(value)
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
    @inlinable
    public func makeTemplateLiteral() -> TemplateLiteral {
        TemplateLiteral(string: self)
    }
}

extension Bool: TemplateLiteralRepresentable {
    @inlinable
    public func makeTemplateLiteral() -> TemplateLiteral {
        TemplateLiteral(boolean: self)
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
    case noContent = 0x00
    case shortTag = 0x01
    case longTag = 0x02
    case literal = 0x03
    case list = 0x04
    case contextValue = 0x05
    case runtimeEvaluated = 0x06
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
    case cannotRender(Any.Type)
    case cannotEvaluateCondition(Any.Type)
    case errorCompilingPropertyAccessor([String])
    case missingValue(AnyKeyPath, needed: Any.Type)
}

public struct TemplateCondition {
    internal enum _Condition {
        case runtime(TemplateRuntimeValue)
    }
    
    let condition: _Condition
    
    internal init<Base>(contextValue: HTMLContext<Base, Bool>) {
        self.condition = .runtime(contextValue.runtimeValue)
    }
}
