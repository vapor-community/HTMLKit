
/// A struct that can be brewed
public protocol BrewableFormula {
    /// Brews a mappable object in to a formula
    ///
    ///     formula.add(string: "<\(nodeName)/>")   // A constant string
    ///     formula.add(self)                       // Not able to be predetermand
    ///
    /// - Parameter formula: The formula to brew in to
    /// - Throws: If there occured some error
    func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Template
}

/// A view that will allways be the same, no matter the context
public protocol StaticTemplate: ViewBuildable {
    
    /// Builds the view
    ///
    /// - Returns: Returns a view that conforms to `Mappable`
    static func build() -> Mappable
}

/// A template that changes dipending on the context
public protocol ContextualTemplate: ViewBuildable {
    associatedtype Context
}

/// A template that changes the information based on the context
/// Checkout `ViewTemplate` if you want something like a BaseTemplate
public protocol Template: Mappable, ContextualTemplate {

    /// Builds the view
    ///
    /// - Returns: a view that conforms to `Mappable`
    static func build() -> Mappable
}

extension Template {
    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Template {
        return try Self.build().map(for: type, with: context)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Template {
        try Self.build()
            .brew(formula)
    }
}


/// A template that can fill take views as placeholders
/// For instance, a base template that will render a navigation bar,
/// but need a other class to set the content view to render.
/// In leaf this is the #get(...) and #set(...)
public protocol ViewTemplate: ContextualTemplate {
    associatedtype ViewContext

    /// Builds the view
    ///
    /// - Parameter context: The view context to render with
    /// - Returns: a view that conforms to `Mappable`
    static func build(with context: ViewContext) -> Mappable
}

extension ContextualTemplate {
    public static func embed<T: Template>(_ template: T.Type, contextPath: KeyPath<Self.Context, T.Context>) -> Mappable {
        return HTML.EmbedTemplate<Self, T>(templateType: template,
                                           contextKeyPath: contextPath)
    }
}

extension Template {
    public static func embed<T: ViewTemplate>(_ template: T.Type, with viewContext: T.ViewContext, contextPath: KeyPath<Self.Context, T.Context>) -> Mappable {
        return HTML.EmbedViewTemplate<Self, T>(templateType: template,
                                   viewContext: viewContext,
                                   contextKeyPath: contextPath)
    }

    public static func forEach<View>(in collectionPath: KeyPath<Self.Context, [View.Context]>, render view: View.Type) -> Mappable where View: Template {
        return HTML.ForEach<Self, View>(view: View.self, collectionPath: collectionPath)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public static func renderIf<C>(_ condition: HTML.IF<Self>.Condition<C>, _ view: Mappable) -> HTML.IF<Self> {
        condition.view = view
        return HTML.IF(conditions: condition)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public static func renderIf(_ path: KeyPath<Self.Context, Bool>, _ view: Mappable) -> HTML.IF<Self> {
        let condition = HTML.IF.Condition(condition: BoolCondition<Self>(path: path))
        condition.view = view
        return HTML.IF(conditions: condition)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - path: The path of the variable
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public static func renderIf<Value>(notNull path: KeyPath<Self.Context, Value?>, _ view: Mappable) -> HTML.IF<Self> {
        let condition = HTML.IF.Condition(condition: NotNullCondition<Self, Value>(path: path))
        condition.view = view
        return HTML.IF(conditions: condition)
    }
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func == <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition<Equal<Root, Value>> where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: Equal(path: lhs, value: rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func != <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition<NotEqual<Root, Value>> where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: NotEqual(path: lhs, value: rhs))
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func < <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition<LessThen<Root, Value>> where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: LessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func > <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition<GreaterThen<Root, Value>> where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: GreaterThen(path: lhs, value: rhs))
}
