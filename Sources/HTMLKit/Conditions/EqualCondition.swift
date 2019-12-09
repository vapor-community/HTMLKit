
public struct EqualCondition<Base, Value: Equatable>: ConditionTemplate {

    let contextValue: HTMLContext<Base, Value>
    let value: Value
    public var runtimeValues: [TemplateRuntimeValue] {
        [contextValue.runtimeValue]
    }

    public func compile(with compiler: TemplateCompiler) throws -> Conditionable {
        try Compiled(
            valueIndex: compiler.index(for: contextValue.runtimeValue),
            value: value
        )
    }

    struct Compiled: Conditionable {
        let valueIndex: Int
        let value: Value

        func evaluate(with values: [Any]) throws -> Bool {
            guard let runtimeValue = values[valueIndex] as? Value else {
                return false
            }
            return runtimeValue == value
        }
    }
}

public func == <Base, Value> (lhs: HTMLContext<Base, Value>, rhs: Value) -> ConditionTemplate where Value : Equatable {
    EqualCondition(contextValue: lhs, value: rhs)
}
