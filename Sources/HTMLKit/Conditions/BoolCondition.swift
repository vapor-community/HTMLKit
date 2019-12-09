
struct BoolCondition: Conditionable {

    let value: Bool

    func evaluate(with values: [Any]) throws -> Bool { value }
}

struct TemplateBoolCondition: Conditionable {

    let valueIndex: Int

    func evaluate(with values: [Any]) throws -> Bool {
        guard let value = values[valueIndex] as? Bool else {
            throw TemplateError.missingValue(at: valueIndex, needed: Bool.self)
        }
        return value
    }
}

extension Bool: ConditionTemplate {
    public var runtimeValues: [TemplateRuntimeValue] { [] }

    public func compile(with compiler: TemplateCompiler) throws -> Conditionable {
        BoolCondition(value: self)
    }
}

extension HTMLContext: ConditionTemplate where Value == Bool {

    public var runtimeValues: [TemplateRuntimeValue] {
        [runtimeValue]
    }

    public func compile(with compiler: TemplateCompiler) throws -> Conditionable {
        try TemplateBoolCondition(valueIndex: compiler.index(for: runtimeValue))
    }
}
