
struct HTMLEmbed<E, T>: HTMLRepresentable where E: HTMLViewTemplate, T: HTMLViewTemplate {

    let template: T.Type
    let viewContext: T.ViewContext
    let contextKeyPath: KeyPath<E.Context, T.Context>

    func render<T>(for templateType: T.Type, with context: T.Context) throws -> HTML where T : HTMLViewTemplate {
        return try template.build(with: viewContext).render(for: templateType, with: context)
    }

    func prerender(in builder: HTMLBuilder) throws {
        let embededBuilder = HTMLRenderer.EmbeddedBuilder<E, T>(keyPath: contextKeyPath)
        try template.build(with: viewContext).prerender(in: embededBuilder)
        builder.add(embedded: embededBuilder)
    }
}
