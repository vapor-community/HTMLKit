/// The class is for
///
///
@propertyWrapper @dynamicMemberLookup public class HTMLContext<Value> {

    enum Errors: Error {
        case unknownKeyPath
    }

    let pathId: String
    let rootId: String
    let escaping: EscapingOption
    let isMascadingOptional: Bool

    let keyPath: AnyKeyPath

    public var wrappedValue: HTMLContext { self }

    init<Root>(keyPath: KeyPath<Root, Value>, id: String, rootId: String = "", escaping: EscapingOption = .safeHTML, isMascadingOptional: Bool = false) {
        self.keyPath = keyPath
        self.pathId = id
        self.rootId = rootId
        self.escaping = escaping
        self.isMascadingOptional = isMascadingOptional
    }

    init(keyPath: AnyKeyPath, id: String, rootId: String = "", escaping: EscapingOption = .safeHTML, isMascadingOptional: Bool = false) {
        self.keyPath = keyPath
        self.pathId = id
        self.rootId = rootId
        self.escaping = escaping
        self.isMascadingOptional = isMascadingOptional
    }

    public init(_ value: Value.Type) {
        self.keyPath = \Value.self
        self.pathId = ""
        self.rootId = ""
        self.escaping = .safeHTML
        self.isMascadingOptional = false
    }

    public func escaping(_ option: EscapingOption) -> HTMLContext<Value> {
        .init(keyPath: keyPath, id: pathId, rootId: rootId, escaping: option, isMascadingOptional: isMascadingOptional)
    }

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> HTMLContext<Subject> {
        guard let newPath = self.keyPath.appending(path: keyPath) else {
            fatalError()
        }
        return HTMLContext<Subject>(keyPath: newPath, id: pathId + "-" + String(reflecting: Subject.self), rootId: rootId, isMascadingOptional: isMascadingOptional)
    }

    public static func root(_ type: Value.Type, rootId: String) -> HTMLContext<Value> {
        .init(keyPath: \Value.self, id: "", rootId: rootId)
    }

    public func makeOptional() -> HTMLContext<Value?> {
        .init(keyPath: keyPath, id: pathId, rootId: rootId, escaping: escaping, isMascadingOptional: true)
    }

    public func unsafeCast<T>(to type: T.Type) -> HTMLContext<T> {
        .init(keyPath: keyPath, id: pathId, rootId: rootId, escaping: escaping)
    }
}

extension HTMLContext: AnyContent where Value: AnyContent {
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        applyEscaping(
            try manager.value(for: self)
                .render(with: manager)
        )
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(mappable: self)
    }

    func applyEscaping(_ render: String) -> String {
        switch escaping {
        case .safeHTML:
            return render
                .reduce(into: "") { string, char in
                    switch char {
                    case "&":   string += "&amp;"
                    case "<":   string += "&lt;"
                    case ">":   string += "&gt;"
                    case "\"":  string += "&quot;"
                    case "'":   string += "&#39;"
                    default:    string += String(char)
                    }
                }
        case .unsafeNone:
            return render
        }
    }
}

extension HTMLContext: Conditionable where Value == Bool {
    
    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try manager.value(for: self)
    }
}
