
public typealias RootValue<Root> = TemplateValue<Root, Root>

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
    public func value<T>(from manager: HTMLRenderer.ContextManager<T>) throws -> Value {
        let value = try manager.value(for: self)
        if let string = value as? String {
            return applyEscaping(string) as! Value
        } else {
            return try manager.value(for: self)
        }
    }

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

extension ContextVariable: HTML where Value: HTML {

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(mappable: self)
    }
    
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        let render = try manager.value(for: self)
            .render(with: manager)
        return applyEscaping(render)
    }
}

public class TemplateValueMapping<A, B, C> {
    let variable: TemplateValue<A, B>
    let transform: (B) throws -> C

    init(variable: TemplateValue<A, B>, transform: @escaping (B) throws -> C) {
        self.variable = variable
        self.transform = transform
    }
}

extension TemplateValueMapping: HTML where C: HTML {

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

public protocol HTMLPage: HTML {
    var body: HTML { get }
}

public typealias HTMLComponent = HTMLPage

extension HTMLPage {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try body.prerender(formula)
    }
}

public protocol HTMLTemplate: HTML {
    associatedtype Context
    var context: TemplateValue<Context, Context> { get }

    var body: HTML { get }
}

extension HTMLTemplate {
    public var context: TemplateValue<Context, Context> { .root() }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try body.prerender(formula)
    }
}
