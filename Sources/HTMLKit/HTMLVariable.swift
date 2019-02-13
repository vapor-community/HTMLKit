
public struct HTMLVariable<Root, Value>: HTMLRepresentable where Root: HTMLViewTemplate, Value: HTMLRepresentable {


    enum Errors: Error {
        case unableToRender
    }
    
    let keyPath: KeyPath<Root.Context, Value>


    public func render<T>(for templateType: T.Type, with context: T.Context) throws -> HTML where T : HTMLViewTemplate {
        guard let rootContext = context as? Root.Context else {
            fatalError()
        }
        return try rootContext[keyPath: keyPath].render(for: templateType, with: context)
    }

    public func prerender(in builder: HTMLBuilder) throws {
        builder.add(variable: self)
    }

    func embed<Template: HTMLViewTemplate>(with templateKey: KeyPath<Template.Context, Root.Context>) -> HTMLVariable<Template, Value> {
        return HTMLVariable<Template, Value>(keyPath: templateKey.appending(path: keyPath))
    }
}


extension HTMLViewTemplate {
    public static func variable<Value>(at keyPath: KeyPath<Self.Context, Value>) -> HTMLVariable<Self, Value> {
        return HTMLVariable(keyPath: keyPath)
    }
}
