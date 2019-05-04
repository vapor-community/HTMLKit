
/// A struct making it possible to have a if in the template
///
///     runtimeIf(\.name == "Name", view: ...)
public class TemplateIF<Root> where Root: ContextualTemplate {

    /// One condition in the if
    public class Condition {

        /// The condition to evaluate
        let condition: Conditionable

        /// The local formula for optimazation
        var localFormula: HTMLRenderer.Formula<Root>

        /// The view to render.
        /// Set to an empty string in order to create a condition on `\.name == ""`
        /// This should probably be re designed a little
        var view: CompiledTemplate = ""

        /// Creates an if condition
        ///
        /// - Parameter condition: The condition to evaluate
        init(condition: Conditionable) {
            self.condition = condition
            localFormula = HTMLRenderer.Formula(view: Root.self, calendar: .current, timeZone: .current)
        }
    }

    /// The different conditions that can happen
    var conditions: [Condition]

    /// Create an if, with the first condition
    ///
    /// - Parameter conditions: The first condition
    init(conditions: Condition) {
        self.conditions = [conditions]
    }
}
