
/// A struct making it possible to have a if in the template
///
///     runtimeIf(\.name == "Name", view: ...)
public struct IF {

    /// One condition in the if
    public class Condition {

        /// The condition to evaluate
        let condition: Conditionable

        /// The local formula for optimazation
        var localFormula: HTMLRenderer.Formula<Any>

        /// The view to render.
        /// Set to an empty string in order to create a condition on `\.name == ""`
        /// This should probably be re designed a little
        var view: HTML = ""

        /// Creates an if condition
        ///
        /// - Parameter condition: The condition to evaluate
        init(condition: Conditionable) {
            self.condition = condition
            localFormula = HTMLRenderer.Formula(context: Any.self)
        }
    }

    /// The different conditions that can happen
    let conditions: [Condition]

    public init(_ condition: Conditionable, @HTMLBuilder content: () -> HTML) {
        let ifCondition = Condition(condition: condition)
        ifCondition.view = content()
        self.conditions = [ifCondition]
    }

    init(conditions: [Condition]) {
        self.conditions = conditions
    }
}
