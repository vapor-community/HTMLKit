
extension IF.Condition: Conditionable {

    // View `Conditionable` documentation
    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try condition.evaluate(with: manager)
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try localFormula.render(with: manager)
    }

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        try view.prerender(localFormula)
    }
}

/// This is a struct that should never exist in a template, and therefore will be used to evaluate if a `Condition`is dynamic or static
struct ConditionPrerenderTest {}

enum IFPrerenderErrors: Error {
    case dynamiclyEvaluatedCondition
}

extension IF: View {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        for condition in conditions {
            if try condition.evaluate(with: manager) {
                return try condition.render(with: manager)
            }
        }
        return ""
    }

    // View `BrewableFormula` documentation
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        var isStaticlyEvaluated = true
        for condition in conditions {
            condition.localFormula.calendar = formula.calendar
            condition.localFormula.timeZone = formula.timeZone

            do {
                guard isStaticlyEvaluated else {
                    throw IFPrerenderErrors.dynamiclyEvaluatedCondition
                }
                let testContext = HTMLRenderer.ContextManager(rootContext: ConditionPrerenderTest(), locale: nil)
                if try condition.condition.evaluate(with: testContext) {
                    try condition.view.prerender(formula)
                    return // Returning as the first true condition should be the only one that is rendered
                }
            } catch {
                // If an error was thrown, then there is some missing context and therefore the whole condition should be evaluated at runtime
                isStaticlyEvaluated = false
                try condition.prerender(formula)
            }
        }
        if isStaticlyEvaluated == false {
            formula.add(mappable: self)
        }
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - condition: The conditino to be evaluated
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func elseIf(_ condition: Conditionable, @HTMLBuilder render: () -> View) -> IF {
        let ifCondition = Condition(condition: condition)
        ifCondition.view = render()
        return .init(conditions: conditions + [ifCondition])
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - path: The path to evaluate
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func elseIf<A, B>(isNil path: TemplateValue<A, B?>, @HTMLBuilder render: () -> View) -> IF {
        let condition = Condition(condition: IsNullCondition<A, B>(path: path))
        condition.view = render()
        return .init(conditions: conditions + [condition])
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - path: The path to evaluate
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func elseIf<Root, Value>(isNotNil path: TemplateValue<Root, Value?>, @HTMLBuilder render: () -> View) -> IF {
        let condition = Condition(condition: NotNullCondition<Root, Value>(path: path))
        condition.view = render()
        return .init(conditions: conditions + [condition])
    }

    /// Add an else condition
    ///
    /// - Parameter render: The view to be rendered
    /// - Returns: A mappable object
    public func `else`(@HTMLBuilder render: () -> View) -> View {
        let trueCondition = Condition(condition: AllwaysTrueCondition())
        trueCondition.view = render()
        return IF(conditions: conditions + [trueCondition])
    }
}
