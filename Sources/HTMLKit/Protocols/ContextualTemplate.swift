
@dynamicMemberLookup
public class ContextVariable<Value> {

    let pathId: String
    let rootId: String

    let root: AnyKeyPath

    private let escaping: EscapingOption

    init(value: AnyKeyPath, id: String, rootId: String = "", escaping: EscapingOption = .safeHTML) {
        self.root = value
        self.pathId = id
        self.rootId = rootId
        self.escaping = escaping
    }

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> ContextVariable<Subject> {

        guard let newPath = root.appending(path: keyPath) else {
            fatalError("Unable to create new path")
        }
        return ContextVariable<Subject>(value: newPath, id: pathId + "-" + String(reflecting: Subject.self), rootId: rootId)
    }

    public func escaping(_ option: EscapingOption) -> ContextVariable<Value> {
        .init(value: root, id: pathId, rootId: rootId, escaping: option)
    }

    func append<V>(_ context: ContextVariable<V>) throws -> ContextVariable<V> {
        guard let path = root.appending(path: context.root) else {
            fatalError("Error appending ContextVariable")
        }
        return .init(value: path, id: pathId + "-" + context.pathId, rootId: rootId, escaping: escaping)
    }
}

extension ContextVariable {
    public static func root<T>(_ value: T.Type = T.self, rootId: String = "") -> ContextVariable<T> {
        ContextVariable<T>(value: \T.self, id: rootId + String(reflecting: T.self), rootId: rootId)
    }
}

extension ContextVariable: Prerenderable where Value : View {
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
    }
}

extension ContextVariable: View where Value: View {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        let render = try manager.value(for: self)
            .render(with: manager)

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

/// A struct making it possible to have a for each loop in the template
public struct ForEach<Value> {

    public let context: TemplateValue<[Value]>

    public let content: View

    let localFormula: HTMLRenderer.Formula<Value>

    public init(in context: TemplateValue<[Value]>, @HTMLBuilder content: (TemplateValue<Value>) -> View) {

        self.context = context
        switch context {
        case .value(let values):
            self.content = values.reduce("") { $0 + content(.value($1)) }

        case .variable(let variable):
            self.content = content(.variable(.root(Value.self, rootId: variable.pathId + "-loop")))
        }
        localFormula = .init(context: Value.self)
    }
}

extension ForEach: View {

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
        try content.prerender(localFormula)
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch context {
        case .value(_):
            return try content.render(with: manager)
        case .variable(let variable):
            var rendering = ""
            let arrayCount = try manager.value(for: variable).count
            for index in 0..<arrayCount {
                manager.prepend(variable[index], for: variable.pathId + "-loop")
                rendering += try localFormula.render(with: manager)
            }
            return rendering
        }
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

    var context: TemplateValue<Context> { get }

    var body: View { get }
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
