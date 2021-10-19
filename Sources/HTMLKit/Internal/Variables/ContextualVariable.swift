

@propertyWrapper
@dynamicMemberLookup
public class HTMLContext<Value> {

    enum Errors: Error {
        case unknownKeyPath
    }

    let pathId: String
    let rootId: String
    let escaping: EscapingOption
    let isMascadingOptional: Bool

    let keyPath: AnyKeyPath

    public var wrappedValue: HTMLContext { self }

    init<Root>(keyPath: KeyPath<Root, Value>, id: String, rootId: String = "", escaping: EscapingOption = .safeHTML, isMascadingOptional: Bool = false) {
        self.keyPath = keyPath
        self.pathId = id
        self.rootId = rootId
        self.escaping = escaping
        self.isMascadingOptional = isMascadingOptional
    }

    init(keyPath: AnyKeyPath, id: String, rootId: String = "", escaping: EscapingOption = .safeHTML, isMascadingOptional: Bool = false) {
        self.keyPath = keyPath
        self.pathId = id
        self.rootId = rootId
        self.escaping = escaping
        self.isMascadingOptional = isMascadingOptional
    }

    public init(_ value: Value.Type) {
        self.keyPath = \Value.self
        self.pathId = ""
        self.rootId = ""
        self.escaping = .safeHTML
        self.isMascadingOptional = false
    }

    public func escaping(_ option: EscapingOption) -> HTMLContext<Value> {
        .init(keyPath: keyPath, id: pathId, rootId: rootId, escaping: option, isMascadingOptional: isMascadingOptional)
    }

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> HTMLContext<Subject> {
        guard let newPath = self.keyPath.appending(path: keyPath) else {
            fatalError()
        }
        return HTMLContext<Subject>(keyPath: newPath, id: pathId + "-" + String(reflecting: Subject.self), rootId: rootId, isMascadingOptional: isMascadingOptional)
    }

    public static func root(_ type: Value.Type, rootId: String) -> HTMLContext<Value> {
        .init(keyPath: \Value.self, id: "", rootId: rootId)
    }

    public func makeOptional() -> HTMLContext<Value?> {
        .init(keyPath: keyPath, id: pathId, rootId: rootId, escaping: escaping, isMascadingOptional: true)
    }

    public func unsafeCast<T>(to type: T.Type) -> HTMLContext<T> {
        .init(keyPath: keyPath, id: pathId, rootId: rootId, escaping: escaping)
    }
} 

extension HTMLContext: HTMLContent where Value: HTMLContent {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        applyEscaping(
            try manager.value(for: self)
                .render(with: manager)
        )
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(mappable: self)
    }

    func applyEscaping(_ render: String) -> String {
        switch escaping {
        case .safeHTML:
            return render
                .reduce(into: "") { string, char in
                    switch char {
                    case "&":   string += "&amp;"
                    case "<":   string += "&lt;"
                    case ">":   string += "&gt;"
                    case "\"":  string += "&quot;"
                    case "'":   string += "&#39;"
                    default:    string += String(char)
                    }
                }
        case .unsafeNone:
            return render
        }
    }
}

@dynamicMemberLookup
public class ContextVariable<Root, Value> {

    let pathId: String
    let rootId: String

    let root: KeyPath<Root, Value>

    let escaping: EscapingOption

    init(value: KeyPath<Root, Value>, id: String, rootId: String = "", escaping: EscapingOption = .safeHTML) {
        self.root = value
        self.pathId = id
        self.rootId = rootId
        self.escaping = escaping
    }

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> ContextVariable<Root, Subject> {
        let newPath = root.appending(path: keyPath)
        return ContextVariable<Root, Subject>(value: newPath, id: pathId + "-" + String(reflecting: Subject.self), rootId: rootId)
    }

    public func escaping(_ option: EscapingOption) -> ContextVariable<Root, Value> {
        .init(value: root, id: pathId, rootId: rootId, escaping: option)
    }

    func append<V>(_ context: ContextVariable<Value, V>) throws -> ContextVariable<Root, V> {
        let path = root.appending(path: context.root)
        return .init(value: path, id: pathId + "-" + context.pathId, rootId: rootId, escaping: escaping)
    }

//    func cast<T>(to: T.Type) -> ContextVariable<Root, T> {
//        let anyPath: AnyKeyPath = root
//        switch anyPath {
//        case let castRoot as KeyPath<Root, T>:
//            return .init(value: castRoot, id: pathId, rootId: rootId, escaping: escaping)
//        default:
//            fatalError("Can not cast value form \(Value.self) to \(T.self).")
//        }
//    }
}

extension ContextVariable {
    public static func root<T>(_ value: T.Type = T.self, rootId: String = "") -> ContextVariable<T, T> {
        ContextVariable<T, T>(value: \T.self, id: rootId + String(reflecting: T.self), rootId: rootId)
    }
}

extension ContextVariable {

    func applyEscaping(_ render: String) -> String {
        switch escaping {
        case .safeHTML:
            return render
                .replacingOccurrences(of: "&", with: "&amp;")
                .replacingOccurrences(of: "<", with: "&lt;")
                .replacingOccurrences(of: ">", with: "&gt;")
                .replacingOccurrences(of: "\"", with: "&quot;")
                .replacingOccurrences(of: "'", with: "&#39;")
        case .unsafeNone:
            return render
        }
    }
}

public class TemplateValueMapping<B, C> {
    let variable: TemplateValue<B>
    let transform: (B) throws -> C

    init(variable: TemplateValue<B>, transform: @escaping (B) throws -> C) {
        self.variable = variable
        self.transform = transform
    }
}

extension TemplateValueMapping: HTMLContent where C: HTMLContent {

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        switch variable {
        case .constant(let value): try transform(value).prerender(formula)
        case .dynamic(_): formula.add(mappable: self)
        }
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        let value = try variable.value(from: manager)
        return try transform(value).render(with: manager)
    }
}

@dynamicMemberLookup
struct StringValue {
    public subscript<Type: ExpressibleByStringLiteral>(dynamicMember string: Type) -> StringValue {
        return .init()
    }
}

public protocol HTMLPage: HTMLContent {
    var body: HTMLContent { get }
}

public typealias HTMLComponent = HTMLPage

extension HTMLPage {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: HTMLContent { body.scripts }
}

public protocol HTMLTemplate: HTMLContent {
    associatedtype Context
    var context: TemplateValue<Context> { get }

    var body: HTMLContent { get }
}

extension HTMLTemplate {
    public var context: TemplateValue<Context> { .root() }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: HTMLContent { body.scripts }
}
