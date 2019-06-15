
@dynamicMemberLookup
public class ContextVariable<Root, Value> {

    let pathId: String
    let rootId: String

    let root: KeyPath<Root, Value>

    private let escaping: EscapingOption

    init(value: KeyPath<Root, Value>, id: String, rootId: String = "", escaping: EscapingOption = .safeHTML) {
        self.root = value
        self.pathId = id
        self.rootId = rootId
        self.escaping = escaping
    }

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> ContextVariable<Root, Subject> {
        return ContextVariable<Root, Subject>(value: root.appending(path: keyPath), id: pathId + "-" + String(reflecting: Subject.self))
    }

    public func escaping(_ option: EscapingOption) -> ContextVariable<Root, Value> {
        .init(value: root, id: pathId, escaping: option)
    }

    func append<V>(_ context: ContextVariable<Value, V>) -> ContextVariable<Root, V> {
        let path = root.appending(path: context.root)
        return .init(value: path, id: pathId + "-" + context.pathId, escaping: escaping)
    }
}

extension ContextVariable {
    public static func root<T>(_ value: T.Type, rootId: String = "") -> ContextVariable<T, T> {
        ContextVariable<T, T>(value: \T.self, id: String(reflecting: T.self), rootId: rootId)
    }
}

extension ContextVariable: Prerenderable where Value: View {
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
    }
}

extension ContextVariable: View where Value: View {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try manager.value(for: self)
            .render(with: manager)
    }
}

public protocol StaticView : View {

    var body: View { get }
}

extension StaticView {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        try body.prerender(formula)
    }
}

public protocol TemplateView : StaticView {

    associatedtype Context
    associatedtype Root

    var context: ContextVariable<Root, Context> { get }

    var body: View { get }
}

public struct ForEach<Root, Value> {

    public let context: ContextVariable<Root, [Value]>

    public let content: View

    let localFormula: HTMLRenderer.Formula<Value>

    public init(context: ContextVariable<Root, [Value]>, @HTMLBuilder content: (ContextVariable<Value, Value>) -> View) {
        self.context = context
        self.content = content(.root(Value.self, rootId: context.pathId))
        localFormula = .init(context: Value.self)
    }
}

extension ForEach: View {

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
        try content.prerender(localFormula)
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        let arrayCount = try manager.value(for: context).count
        var rendering = ""
        for index in 0..<arrayCount {
            manager.prepend(context[index], for: context.pathId)
            rendering += try localFormula.render(with: manager)
        }
        return rendering
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
//    public func embed<T>(_ template: T, withPath path: KeyPath<Context, T.Context>) -> TemplateEmbed<Self, T> where T : ContextualTemplate {
//        return TemplateEmbed.init(templateType: template, referance: .keyPath(path))
//    }
//
//    /// Embeds a view in a template
//    ///
//    /// - Parameter path: The path to the `Context` needed to render the embeded view
//    /// - Returns: A `TemplateEmbed` object that conteins the view
//    public func embed<T>(_ template: T) -> TemplateEmbed<Self, T> where T : ContextualTemplate, T.Context == Context {
//        return TemplateEmbed.init(templateType: template, referance: .root(Self.self))
//    }
//
//    /// Creates a for each loop in a template
//    ///
//    /// - Parameters:
//    ///   - collectionPath: The path to the context to loop
//    ///   - view: The view to render
//    /// - Returns: A ´CompiledTemplate` that will loop the context
//    public func forEach<View>(in collectionPath: KeyPath<Self.Context, [View.Context]>, render view: View) -> View where View: ContextualTemplate {
//        return TemplateForEach<Self, View>(view: view, referance: .keyPath(collectionPath)) as! View
//    }
//
//    /// Creates a for each loop in a template
//    ///
//    /// - Parameters:
//    ///   - collectionPath: The path to the context to loop
//    ///   - view: The view to render
//    /// - Returns: A ´CompiledTemplate` that will loop the context
//    public func forEach<View>(render view: View) -> View where View: ContextualTemplate, Context == [View.Context] {
//        return TemplateForEach<Self, View>(view: view, referance: .root(Self.self)) as! View
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

//    public func unsafeVariable<T, V>(in template: T.Type, for keyPath: KeyPath<T.Context, V>, escaping: EscapingOption = .safeHTML) -> View where T : ContextualTemplate, V : View {
//        return TemplateVariable<T, V>.init(referance: .keyPath(keyPath), escaping: escaping)
//    }
//}
