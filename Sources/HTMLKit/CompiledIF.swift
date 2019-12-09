import NIO

public protocol ConditionTemplate {
    var runtimeValues: [TemplateRuntimeValue] { get }
    func compile(with compiler: TemplateCompiler) throws -> Conditionable
}

public protocol Conditionable {
    func evaluate(with values: [Any]) throws -> Bool
}

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

public func ==<Base, Value> (lhs: HTMLContext<Base, Value>, rhs: Value) -> EqualCondition<Base, Value> where Value : Equatable {
    EqualCondition(contextValue: lhs, value: rhs)
}

struct BoolCondition: Conditionable {

    let valueIndex: Int

    func evaluate(with values: [Any]) throws -> Bool {
        values[valueIndex] as! Bool
    }
}

extension HTMLContext: ConditionTemplate where Value == Bool {
    
    public var runtimeValues: [TemplateRuntimeValue] {
        [runtimeValue]
    }

    public func compile(with compiler: TemplateCompiler) throws -> Conditionable {
        try BoolCondition(valueIndex: compiler.index(for: runtimeValue))
    }
}

class CompiledIF: RuntimeEvaluatable {

    class Path: Conditionable, RuntimeEvaluatable {
        let _template: UnsafeByteBuffer
        let condition: Conditionable

        init(template: UnsafeByteBuffer, condition: Conditionable) {
            self._template = template
            self.condition = condition
        }

        func evaluate(with values: [Any]) throws -> Bool {
            try condition.evaluate(with: values)
        }

        func compileNextNode<Properties>(
            template: inout UnsafeByteBuffer,
            into output: inout ByteBuffer,
            values: [Any],
            keyPaths: [[AnyKeyPath]],
            runtimeEvaluated: [RuntimeEvaluatable],
            properties: Properties
        ) throws {
            var template = _template
            try CompiledTemplate<Any>.compileNextNode(
                template: &template,
                into: &output,
                values: values,
                keyPaths: keyPaths,
                runtimeEvaluated: runtimeEvaluated,
                properties: properties
            )
        }
    }

    private let paths: [Path]

    init(paths: [Path]) {
        self.paths = paths
    }

    func compileNextNode<Properties>(template: inout UnsafeByteBuffer, into output: inout ByteBuffer, values: [Any], keyPaths: [[AnyKeyPath]], runtimeEvaluated: [RuntimeEvaluatable], properties: Properties) throws {

        for path in paths {
            if try path.evaluate(with: values) {
                try path.compileNextNode(
                    template: &template,
                    into: &output,
                    values: values,
                    keyPaths: keyPaths,
                    runtimeEvaluated: runtimeEvaluated,
                    properties: properties
                )
                return
            }
        }
    }
}
