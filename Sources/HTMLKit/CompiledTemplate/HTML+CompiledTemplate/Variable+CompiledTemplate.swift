import Foundation

extension HTML.Variable: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {

        let render = try manager.value(at: keyPath).render(with: manager)
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

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(variable: self)
    }
}

extension ContextualTemplate {

    /// References an optional variable in the `Context` type
    ///
    /// - Parameters:
    ///   - keyPath: The path to the variable
    ///   - escaping: The escaping option
    /// - Returns: A `CompiledTemplate` `HTML.Variable` object
    public func variable<Value>(_ keyPath: KeyPath<Self.Context, Value>, escaping: EscapingOption = .safeHTML) -> HTML.Variable<Self.Context, Value> {
        return HTML.Variable(keyPath: keyPath, escaping: escaping)
    }

    /// References an optional variable in the `Context` type
    ///
    /// - Parameters:
    ///   - keyPath: The path to the variable
    ///   - escaping: The escaping option
    /// - Returns: A `CompiledTemplate` `HTML.Variable` object
    public func variable<Value>(_ keyPath: KeyPath<Self.Context, Value?>, escaping: EscapingOption = .safeHTML) -> HTML.Variable<Self.Context, Value?> {
        return HTML.Variable(keyPath: keyPath, escaping: escaping)
    }
}
