import NIO

class CompiledForEach: RuntimeEvaluatable {

    private let _template: UnsafeByteBuffer
    private let arrayValueIndex: Int
    private let keyPathIndex: Int

    init(template: UnsafeByteBuffer, arrayValueIndex: Int, keyPathIndex: Int) {
        self._template = template
        self.arrayValueIndex = arrayValueIndex
        self.keyPathIndex = keyPathIndex
    }

    func compileNextNode(
        template: inout UnsafeByteBuffer,
        into output: inout ByteBuffer,
        env: CompiledTemplateEnviroment
    ) throws {
        let value = env.values[arrayValueIndex] as! [Any]
        var valueStart = 0
        for i in 0..<keyPathIndex {
            valueStart += env.keyPaths[i].count
        }

        var newValues = env.values
        var template = _template
        for element in value {
            template.moveReaderIndex(to: 0)
            for (index, keyPath) in env.keyPaths[keyPathIndex].enumerated() {
                newValues[valueStart + index] = element[keyPath: keyPath] ?? ""
            }
            try CompiledTemplate<Any>.compileNextNode(
                template: &template,
                into: &output,
                env: CompiledTemplateEnviroment(
                    keyPaths: env.keyPaths,
                    values: newValues,
                    runtimeEvaluated: env.runtimeEvaluated,
                    dateFormatters: env.dateFormatters
                )
            )
        }
    }
}
