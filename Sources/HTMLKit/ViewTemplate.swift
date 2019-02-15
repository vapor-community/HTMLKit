
public protocol BrewableFormula {
    func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Template
}

public protocol StaticTemplate: ViewBuildable {
    
    static func build() -> Mappable
}

public protocol ContextualTemplate: ViewBuildable {
    associatedtype Context
}

public protocol Template: Mappable, ContextualTemplate {
    init()
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


public protocol ViewTemplate: ContextualTemplate {
    associatedtype ViewContext

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
}
