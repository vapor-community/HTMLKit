import NIO

protocol Conditionable {
    func evaluate(with values: [Any]) -> Bool
}

struct BoolCondition: Conditionable {

    let valueIndex: Int

    func evaluate(with values: [Any]) -> Bool {
        values[valueIndex] as! Bool
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

        func evaluate(with values: [Any]) -> Bool {
            condition.evaluate(with: values)
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
            if path.evaluate(with: values) {
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
