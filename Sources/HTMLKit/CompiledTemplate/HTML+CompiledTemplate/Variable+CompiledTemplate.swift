import Foundation

extension TemplateVariable: CompiledTemplate {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {

        var value: Value!

        switch referance {
        case .keyPath(let keyPath): value = try manager.value(at: keyPath)
        case .root(let type): value = (try manager.value(for: type) as! Value)
        }

        let render = try transformation(value)
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

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        try formula.add(variable: self)
    }
}

extension TemplateVariable: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Variable: \(referance), escaping: \(escaping)"
    }
}


extension ContextualTemplate {

    /// References an optional variable in the `Context` type
    ///
    /// - Parameters:
    ///   - keyPath: The path to the variable
    ///   - escaping: The escaping option
    ///   - transformation: A closure that maps a value to another
    /// - Returns: A `CompiledTemplate` `HTML.Variable` object
    public func variable<Value>(_ keyPath: KeyPath<Self.Context, Value>, escaping: EscapingOption = .safeHTML, transformation: @escaping (Value) -> CompiledTemplate = { $0 }) -> TemplateVariable<Self.Context, Value> {
        return TemplateVariable(referance: .keyPath(keyPath), escaping: escaping, transformation: transformation)
    }

    /// References an optional variable in the `Context` type
    ///
    /// - Parameters:
    ///   - keyPath: The path to the variable
    ///   - escaping: The escaping option
    ///   - transformation: A closure that maps a value to another
    /// - Returns: A `CompiledTemplate` `HTML.Variable` object
    public func variable<Value>(_ keyPath: KeyPath<Self.Context, Value?>, escaping: EscapingOption = .safeHTML, transformation: @escaping (Value?) -> CompiledTemplate = { $0 }) -> TemplateVariable<Self.Context, Value?> {
        return TemplateVariable(referance: .keyPath(keyPath), escaping: escaping, transformation: transformation)
    }
}
