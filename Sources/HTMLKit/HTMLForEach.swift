
struct HTMLForEach<Root: HTMLViewTemplate, Value>: HTMLRepresentable {

    enum State {
        case runtime((Value) -> HTMLRepresentable)
        case view(HTMLRepresentable)
    }

    enum Errors: Error {
        case unableToRender
    }

    let collectionKeyPath: KeyPath<Root.Context, [Value]>

    func prerender(in builder: HTMLBuilder) throws {
        builder.add(self)
        #warning("Prerender the subviews. In its own HTMLRenderer.Builder?")
    }

    func render<T>(for templateType: T.Type, with context: T.Context) throws -> HTML where T : HTMLViewTemplate {
        guard let rootContext = context as? Root.Context else {
            throw Errors.unableToRender
        }

        for element in rootContext[keyPath: collectionKeyPath] {
            #warning("Fix For Each loop")
        }
        return "MISSING FOR EACH"
    }
}
