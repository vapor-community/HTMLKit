
struct AndCondition: ConditionTemplate {

    let lhs: ConditionTemplate
    let rhs: ConditionTemplate

    var runtimeValues: [TemplateRuntimeValue] { lhs.runtimeValues + rhs.runtimeValues }

    func compile(with compiler: TemplateCompiler) throws -> Conditionable {
        try Compiled(
            lhs: lhs.compile(with: compiler),
            rhs: rhs.compile(with: compiler)
        )
    }

    struct Compiled: Conditionable {

        let lhs: Conditionable
        let rhs: Conditionable

        func evaluate(with values: [Any]) throws -> Bool {
            try lhs.evaluate(with: values) && rhs.evaluate(with: values)
        }
    }
}


public func && (lhs: ConditionTemplate, rhs: ConditionTemplate) -> ConditionTemplate {
    AndCondition(lhs: lhs, rhs: rhs)
}
