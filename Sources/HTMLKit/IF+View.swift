
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
        formula.add(mappable: self)
        for condition in conditions {
            condition.localFormula.calendar = formula.calendar
            condition.localFormula.timeZone = formula.timeZone
            try condition.prerender(formula)
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
        conditions.append(ifCondition)
        return self
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
        conditions.append(condition)
        return self
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
        conditions.append(condition)
        return self
    }

    /// Add an else condition
    ///
    /// - Parameter render: The view to be rendered
    /// - Returns: A mappable object
    public func `else`(@HTMLBuilder render: () -> View) -> View {
        let trueCondition = Condition(condition: AllwaysTrueCondition())
        trueCondition.view = render()
        conditions.append(trueCondition)
        return self
    }
}
