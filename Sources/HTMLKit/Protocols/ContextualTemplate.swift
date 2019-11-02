
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

extension ContextVariable: Prerenderable where Value: HTML {
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
    }
}

extension ContextVariable: HTML where Value: HTML {
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

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
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

//public struct ForEachRuntime<Value>: View {
//
//    let values: [Value]
//    let content: (Value) -> View
//
//    public init(values: [Value], @HTMLBuilderRuntime content: @escaping (Value) -> View) {
//        self.values = values
//        self.content = content
//    }
//
//    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
//        values.reduce("") { try! $0 + content($1).render() }
//    }
//
//    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {}
//}

/// A struct making it possible to have a for each loop in the template
public struct ForEach<Root, Value> {

    public let context: TemplateValue<Root, [Value]>

    let content: HTML

    let localFormula: HTMLRenderer.Formula<Value>

    let condition: Conditionable
    var isEnumerated: Bool = false

    public init(in context: TemplateValue<Root, [Value]>, @HTMLBuilder content: (RootValue<Value>) -> HTML) {

        self.condition = true
        self.context = context
        switch context {
        case .constant(let values): self.content = values.reduce("") { $0 + content(.constant($1)) }
        case .dynamic(let variable): self.content = content(.dynamic(.root(Value.self, rootId: variable.pathId + "-loop")))
        }
        localFormula = .init(context: Value.self)
    }

    public init(in context: TemplateValue<Root, [Value]?>, @HTMLBuilder content: (RootValue<Value>) -> HTML) {

        self.context = context.unsafelyUnwrapped
        switch context {
        case .constant(let values):
            if let values = values {
                self.content = values.reduce("") { $0 + content(.constant($1)) }
            } else {
                self.content = ""
            }
        case .dynamic(let variable):
            self.content = content(.dynamic(.root(Value.self, rootId: variable.unsafelyUnwrapped.pathId + "-loop")))
        }
        self.condition = context.isDefined
        localFormula = .init(context: Value.self)
    }

    public init(enumerated context: TemplateValue<Root, [Value]>, @HTMLBuilder content: ((element: RootValue<Value>, index: RootValue<Int>)) -> HTML) {

        self.condition = true
        self.context = context
        switch context {
        case .constant(let values): self.content = values.enumerated().reduce("") { $0 + content((.constant($1.element), .constant($1.offset))) }
        case .dynamic(let variable): self.content = content(
            (
                .dynamic(.root(Value.self, rootId: "\(variable.pathId)-loop")),
                .dynamic(.root(Int.self, rootId: "\(variable.pathId)-loop-index"))
            ))
        }
        localFormula = .init(context: Value.self)
        self.isEnumerated = true
    }
}

extension ForEach where Root == [Value] {
    public init(enumerated context: [Value], @HTMLBuilder content: ((element: RootValue<Value>, index: RootValue<Int>)) -> HTML) {
        self.init(enumerated: .constant(context), content: content)
    }
}

extension ForEach where Root == [Value] {
    public init(in context: RootValue<[Value]>, @HTMLBuilder content: (RootValue<Value>) -> HTML) {
        self.context = context
        switch context {
        case .constant(let values): self.content = values.reduce("") { $0 + content(.constant($1)) }
        case .dynamic(let variable): self.content = content(.dynamic(.root(Value.self, rootId: variable.pathId + "-loop")))
        }
        localFormula = .init(context: Value.self)
        self.condition = true
    }
}

extension ForEach: HTML {

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
        try content.prerender(localFormula)
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch context {
        case .constant(_):
            return try localFormula.render(with: manager)
        case .dynamic(let variable):
            guard try condition.evaluate(with: manager) else { return "" }
            var rendering = ""
            let elements = try manager.value(for: variable)
            if isEnumerated {
                for (index, element) in elements.enumerated() {
                    manager.set(index, for: .root(Int.self, rootId: variable.pathId + "-loop-index"))
                    manager.set(element, for: .root(Value.self, rootId: variable.pathId + "-loop"))
                    rendering += try localFormula.render(with: manager)
                }
            } else {
                for element in elements {
                    manager.set(element, for: .root(Value.self, rootId: variable.pathId + "-loop"))
                    rendering += try localFormula.render(with: manager)
                }
            }

            return rendering
        }
    }
}

public protocol StaticView: HTML {

    var body: HTML { get }
}

public typealias HTMLComponent = StaticView

extension StaticView {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        try body.prerender(formula)
    }
}

public protocol TemplateView {
    associatedtype Context
    var context: TemplateValue<Context, Context> { get }

    var body: HTML { get }
}

extension TemplateView {
    public var context: TemplateValue<Context, Context> { .root() }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        try body.prerender(formula)
    }
}

//
///// A template that changes dipending on the context
//public protocol ContextualTemplate: TemplateBuilder {
//    associatedtype Context
//}
//
//public struct NoContext: Codable {}
//public protocol StaticView: ContextualTemplate where Context == NoContext {}
//
//
//extension ContextualTemplate {
//    /// Embeds a view in a template
//    ///
//    /// - Parameter path: The path to the `Context` needed to render the embeded view
//    /// - Returns: A `TemplateEmbed` object that conteins the view
//    public func embed<T>(_ template: T, withPath path: KeyPath<Context, T.Context>) -> TemplateEmbed<Self, T> where T: ContextualTemplate {
//        return TemplateEmbed.init(templateType: template, reference: .keyPath(path))
//    }
//
//    /// Embeds a view in a template
//    ///
//    /// - Parameter path: The path to the `Context` needed to render the embeded view
//    /// - Returns: A `TemplateEmbed` object that conteins the view
//    public func embed<T>(_ template: T) -> TemplateEmbed<Self, T> where T: ContextualTemplate, T.Context == Context {
//        return TemplateEmbed.init(templateType: template, reference: .root(Self.self))
//    }
//
//    /// Creates a for each loop in a template
//    ///
//    /// - Parameters:
//    ///   - collectionPath: The path to the context to loop
//    ///   - view: The view to render
//    /// - Returns: A ´CompiledTemplate` that will loop the context
//    public func forEach<View>(in collectionPath: KeyPath<Self.Context, [View.Context]>, render view: View) -> View where View: ContextualTemplate {
//        return TemplateForEach<Self, View>(view: view, reference: .keyPath(collectionPath)) as! View
//    }
//
//    /// Creates a for each loop in a template
//    ///
//    /// - Parameters:
//    ///   - collectionPath: The path to the context to loop
//    ///   - view: The view to render
//    /// - Returns: A ´CompiledTemplate` that will loop the context
//    public func forEach<View>(render view: View) -> View where View: ContextualTemplate, Context == [View.Context] {
//        return TemplateForEach<Self, View>(view: view, reference: .root(Self.self)) as! View
//    }
//
//    /// Creates an if statment in a template
//    ///
//    /// - Parameters:
//    ///   - condition: The condition to use
//    ///   - view: The view to render
//    /// - Returns: An `TemplateIF` object
//    public func renderIf(_ condition: IF<Self>.Condition, _ view: View...) -> IF<Self> {
//        condition.view = view
//        return IF(conditions: condition)
//    }
//
//    /// Creates an if statment in a template
//    ///
//    /// - Parameters:
//    ///   - condition: The condition to use
//    ///   - view: The view to render
//    /// - Returns: An `TemplateIF` object
//    public func renderIf(_ path: KeyPath<Self.Context, Bool>, _ view: View...) -> IF<Self> {
//        let condition = IF<Self>.Condition(condition: BoolCondition<Self>(path: path))
//        condition.view = view
//        return IF(conditions: condition)
//    }
//
//    /// Add an else if condition
//    ///
//    /// - Parameters:
//    ///   - path: The path to evaluate
//    ///   - render: The view to render if true
//    /// - Returns: returns a modified if statment
//    public func renderIf<Value>(isNil path: KeyPath<Self.Context, Value?>, _ render: View...) -> IF<Self> {
//        let condition = IF<Self>.Condition(condition: IsNullCondition<Self.Context, Value>(path: path))
//        condition.view = render
//        return IF<Self>.init(conditions: condition)
//    }
//
//    /// Add an else if condition
//    ///
//    /// - Parameters:
//    ///   - path: The path to evaluate
//    ///   - render: The view to render if true
//    /// - Returns: returns a modified if statment
//    public func renderIf<Value>(isNotNil path: KeyPath<Self.Context, Value?>, _ render: View...) -> IF<Self> {
//        let condition = IF<Self>.Condition(condition: NotNullCondition<Self.Context, Value>(path: path))
//        condition.view = render
//        return IF<Self>.init(conditions: condition)
//    }

//    public func unsafeVariable<T, V>(in template: T.Type, for keyPath: KeyPath<T.Context, V>, escaping: EscapingOption = .safeHTML) -> View where T: ContextualTemplate, V: View {
//        return TemplateVariable<T, V>.init(reference: .keyPath(keyPath), escaping: escaping)
//    }
//}
