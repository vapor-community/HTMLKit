//import Foundation
//
//extension TemplateVariable: View {
//
//    // View `CompiledTemplate` documentation
//    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
//
//        var render = ""
//        switch referance {
//        case .keyPath(let keyPath): render = try manager.value(at: keyPath).render(with: manager)
//        case .root(let type): render = try (manager.value(for: type) as! View).render(with: manager)
//        }
//
//        switch escaping {
//        case .safeHTML:
//            return render
//                .replacingOccurrences(of: "&", with: "&amp;")
//                .replacingOccurrences(of: "<", with: "&lt;")
//                .replacingOccurrences(of: ">", with: "&gt;")
//                .replacingOccurrences(of: "\"", with: "&quot;")
//                .replacingOccurrences(of: "'", with: "&#39;")
//        case .unsafeNone:
//            return render
//        }
//    }
//
//    // View `BrewableFormula` documentation
//    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
//        try formula.add(variable: self)
//    }
//}
//
//extension TemplateVariable: CustomDebugStringConvertible {
//    public var debugDescription: String {
//        return "Variable: \(referance), escaping: \(escaping)"
//    }
//}
//
//
//extension ContextualTemplate {
//
//    /// References an optional variable in the `Context` type
//    ///
//    /// - Parameters:
//    ///   - keyPath: The path to the variable
//    ///   - escaping: The escaping option
//    /// - Returns: A `CompiledTemplate` `HTML.Variable` object
//    public func variable<Value>(_ keyPath: KeyPath<Self.Context, Value>, escaping: EscapingOption = .safeHTML) -> TemplateVariable<Self, Value> {
//        return TemplateVariable(referance: .keyPath(keyPath), escaping: escaping)
//    }
//
//    /// References an optional variable in the `Context` type
//    ///
//    /// - Parameters:
//    ///   - keyPath: The path to the variable
//    ///   - escaping: The escaping option
//    /// - Returns: A `CompiledTemplate` `HTML.Variable` object
//    public func variable<Value>(_ keyPath: KeyPath<Self.Context, Value?>, escaping: EscapingOption = .safeHTML) -> TemplateVariable<Self, Value?> {
//        return TemplateVariable(referance: .keyPath(keyPath), escaping: escaping)
//    }
//}
