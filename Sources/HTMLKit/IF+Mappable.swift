
extension HTML.IF.Condition: AnyMappableCondition {

    public func anyEvaluate(with context: Any) -> Bool {
        return condition.anyEvaluate(with: context)
    }

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Template {
        guard let rootContext = context as? Root.Context else {
            throw HTML.Errors.incorrectGenericType
        }
        return try localFormula.render(with: rootContext)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T : Template {
        try view.brew(localFormula)
    }
}

extension HTML.IF: Mappable {

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Template {
        guard let rootContext = context as? Root.Context else {
            throw HTML.Errors.incorrectGenericType
        }
        for condition in conditions {
            if condition.anyEvaluate(with: context) {
                return try condition.map(for: Root.self, with: rootContext)
            }
        }
        return ""
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T : Template {
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
    func elseIf<C>(_ condition: Condition<C>, _ render: Mappable) -> HTML.IF<Root> where C: Conditionable {
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
    func elseIf(_ path: KeyPath<Root.Context, Bool>, _ render: Mappable) -> HTML.IF<Root> {
        let condition = HTML.IF.Condition(condition: BoolCondition<Root>(path: path))
        condition.view = render
        conditions.append(condition)
        return self
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - condition: The path to evaluate
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    func elseIf<Value>(notNull path: KeyPath<Root.Context, Value?>, _ render: Mappable) -> HTML.IF<Root> {
        let condition = HTML.IF.Condition(condition: NotNullCondition<Root, Value>(path: path))
        condition.view = render
        conditions.append(condition)
        return self
    }

    /// Add an else condition
    ///
    /// - Parameter render: The view to be rendered
    /// - Returns: A mappable object
    func `else`(render: Mappable) -> Mappable {
        let trueCondition = Condition(condition: AllwaysTrueCondition<Root>())
        trueCondition.view = render
        conditions.append(trueCondition)
        return self
    }
}
