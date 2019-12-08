import NIO

class CompiledForEach: RuntimeEvaluatable {

    private var _template: UnsafeByteBuffer
    private let arrayValueIndex: Int
    private let keyPathIndex: Int

    init(template: UnsafeByteBuffer, arrayValueIndex: Int, keyPathIndex: Int) {
        self._template = template
        self.arrayValueIndex = arrayValueIndex
        self.keyPathIndex = keyPathIndex
    }

    func compileNextNode<Properties>(template: inout UnsafeByteBuffer, into output: inout ByteBuffer, values: [Any], keyPaths: [[AnyKeyPath]], runtimeEvaluated: [RuntimeEvaluatable], properties: Properties) throws {
        let value = values[arrayValueIndex] as! [Any]
        var valueStart = 0
        for i in 0..<keyPathIndex {
            valueStart += keyPaths[i].count
        }

        var newValues = values
        for element in value {
            _template.moveReaderIndex(to: 0)
            for (index, keyPath) in keyPaths[keyPathIndex].enumerated() {
                newValues[valueStart + index] = element[keyPath: keyPath] ?? ""
            }
            try CompiledTemplate<Any>.compileNextNode(
                template: &_template,
                into: &output,
                values: newValues,
                keyPaths: keyPaths,
                runtimeEvaluated: runtimeEvaluated,
                properties: element
            )
        }
    }
}
