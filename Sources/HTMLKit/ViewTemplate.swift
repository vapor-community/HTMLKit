
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
//
//    public static func `if`<C: Condition, Value>(_ condition: IFCondition<Self, Value, C>) {
//    }
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
}

//public func == <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> IFCondition<Root, Value, Equal<Root, Value>> where Root: ContextualTemplate, Value: Equatable {
//    return IFCondition(condition: Equal(path: lhs, value: rhs))
//}
//
//public func < <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> IFCondition<Root, Value, LessThen<Root, Value>> where Root: ContextualTemplate, Value: Comparable {
//    return IFCondition(condition: LessThen(path: lhs, value: rhs))
//}
//
//public func > <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> IFCondition<Root, Value, GreaterThen<Root, Value>> where Root: ContextualTemplate, Value: Comparable {
//    return IFCondition(condition: GreaterThen(path: lhs, value: rhs))
//}
