
public protocol HTMLBuilder: class {
    func add(_ representer: HTMLRepresentable)
    func add<E, T>(embedded: HTMLRenderer.EmbeddedBuilder<E, T>)
    func add<E, T>(variable: HTMLVariable<E, T>)
}

/// Used to render a full HTML document
public struct HTMLRenderer {

    typealias TemplateName = String

    var prerenders: [TemplateName : Builder] = [:]

    public class Builder: HTMLBuilder {

        var representers: [HTMLRepresentable]

        init() {
            representers = []
        }

        public func add(_ representer: HTMLRepresentable) {
            if let stringValue = representer as? String,
                let last = representers.last as? String {
                _ = representers.removeLast()
                representers.append(last + stringValue)
            } else {
                representers.append(representer)
            }
        }

        public func add<E, T>(embedded: HTMLRenderer.EmbeddedBuilder<E, T>) {
            embedded.representers.forEach { representers.append($0) }
        }

        public func add<E, T>(variable: HTMLVariable<E, T>) {
            representers.append(variable)
        }
    }

    public class EmbeddedBuilder<Embedder, Template>: HTMLBuilder where Embedder: HTMLViewTemplate, Template: HTMLViewTemplate {

        let keyPath: KeyPath<Embedder.Context, Template.Context>

        var representers: [HTMLRepresentable]

        init(keyPath: KeyPath<Embedder.Context, Template.Context>) {
            self.keyPath = keyPath
            representers = []
        }

        public func add(_ representer: HTMLRepresentable) {
            if let stringValue = representer as? String,
                let last = representers.last as? String {
                _ = representers.removeLast()
                representers.append(last + stringValue)
            } else {
                representers.append(representer)
            }
        }

        public func add<E, T>(embedded: HTMLRenderer.EmbeddedBuilder<E, T>) {
            embedded.representers.forEach { representers.append($0) }
        }

        public func add<E, T>(variable: HTMLVariable<E, T>) {
            if E.self == Embedder.self {
                add(variable)
            } else if let embedKey = keyPath as? KeyPath<Embedder.Context, E.Context> {
                add(HTMLVariable<Embedder, T>(keyPath: embedKey.appending(path: variable.keyPath)))
            }
        }
    }

    func render<T: HTMLViewTemplate>(_ template: T.Type, with context: T.Context) throws -> HTML {
        guard let builder = prerenders["\(T.self)"] else {
            fatalError()
        }
        return try builder.representers.reduce("") { try $0 + $1.render(for: T.self, with: context) }
    }

    mutating func add<T: HTMLTemplate>(_ view: T.Type) throws {
        let builder = Builder()
        try view.prebuild(for: builder)
        prerenders["\(T.self)"] = builder
        print(builder.representers)
    }
}
