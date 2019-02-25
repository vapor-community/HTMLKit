
extension HTML.IF.Condition: Conditionable {

    // View `Conditionable` documentation
    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try condition.evaluate(with: manager)
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try localFormula.render(with: manager)
    }

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        try view.brew(localFormula)
    }
}

extension HTML.IF: CompiledTemplate {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        for condition in conditions {
            if try condition.evaluate(with: manager) {
                return try condition.render(with: manager)
            }
        }
        return ""
    }

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(mappable: self)
        for condition in conditions {
            try condition.brew(formula)
        }
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - condition: The conditino to be evaluated
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func elseIf(_ condition: Condition, _ render: CompiledTemplate...) -> HTML.IF<Root> {
        condition.view = render
        conditions.append(condition)
        return self
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - path: The path to evaluate
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func elseIf(_ path: KeyPath<Root.Context, Bool>, _ render: CompiledTemplate...) -> HTML.IF<Root> {
        let condition = Condition(condition: BoolCondition<Root>(path: path))
        condition.view = render
        conditions.append(condition)
        return self
    }

    /// Add an else condition
    ///
    /// - Parameter render: The view to be rendered
    /// - Returns: A mappable object
    public func `else`(_ render: CompiledTemplate) -> CompiledTemplate {
        let trueCondition = Condition(condition: AllwaysTrueCondition())
        trueCondition.view = render
        conditions.append(trueCondition)
        return self
    }
}
