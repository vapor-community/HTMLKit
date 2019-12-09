
struct NotEqualCondition<Base, Value>: ConditionTemplate where Value : Equatable {

    let contextValue: HTMLContext<Base, Value>
    let value: Value

    var runtimeValues: [TemplateRuntimeValue] { [contextValue.runtimeValue] }

    func compile(with compiler: TemplateCompiler) throws -> Conditionable {
        try Compiled(
            valueIndex: compiler.index(for: contextValue.runtimeValue),
            value: value
        )
    }

    struct Compiled: Conditionable {

        let valueIndex: Int
        let value: Value

        func evaluate(with values: [Any]) throws -> Bool {
            guard let contextValue = values[valueIndex] as? Value else {
                throw TemplateError.missingValue(at: valueIndex, needed: Value.self)
            }
            return contextValue != value
        }
    }
}


public func != <Base, Value> (lhs: HTMLContext<Base, Value>, rhs: Value) -> ConditionTemplate where Value : Equatable {
    NotEqualCondition(contextValue: lhs, value: rhs)
}
