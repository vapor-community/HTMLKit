import Foundation
import NIO

fileprivate func equal(lhs: StaticString, rhs: StaticString) -> Bool {
    if lhs.utf8CodeUnitCount != rhs.utf8CodeUnitCount {
        return false
    }
    
    return memcmp(lhs.utf8Start, rhs.utf8Start, lhs.utf8CodeUnitCount) == 0
}

struct ContextValueStore {
    let runtimeValue: TemplateRuntimeValue
    var subPaths: Set<AnyKeyPath>
}

public struct TemplateCompiler<Properties> {

    private var contexts = [
        ContextValueStore(
            runtimeValue: TemplateRuntimeValue(
                path: \ContextValueStore.self,
                rootId: ""
            ),
            subPaths: []
        )
    ]

    private var rootIdIndexes = [String: Int]()

    var buffer: ByteBuffer
    var keyPaths = [[AnyKeyPath]]()
    let stylesheet = StyleRegistery()
    
    init() {
        buffer = ByteBufferAllocator().buffer(capacity: 4_096)
    }

    private func index(for value: TemplateRuntimeValue) throws -> Int {
        let rootIndex = rootIdIndexes[value.rootId] ?? 0
        var pathIndex = 0
        for i in 0..<rootIndex {
            pathIndex += keyPaths[i].count
        }
        guard let subIndex = keyPaths[rootIndex].firstIndex(where: { $0 == value.path }) else {
            throw TemplateError.internalCompilerError
        }
        return pathIndex + subIndex
    }
    
    private mutating func compileTemplateValue(_ value: TemplateValue) throws {
        switch value.storage {
        case .compileTime(let literal):
            buffer.writeInteger(CompiledTemplateValue.literal.rawValue)
            
            switch literal.storage {
            case .boolean:
                throw TemplateError.cannotRender(Bool.self)
            case .string(let string):
                compileString(string)
            }
        case .runtime(let runtimeValue):
            buffer.writeInteger(CompiledTemplateValue.runtime.rawValue)
            buffer.writeInteger(try index(for: runtimeValue), endianness: .little)
        }
    }
    
    private mutating func compile(_ modifier: _Modifier) throws {
        switch modifier {
        case .attribute(let name, let value):
            compileString(name)
            try compileTemplateValue(value)
        case .style(let type, let styles):
            compileString(type.rawValue)
            
            buffer.writeInteger(CompiledTemplateValue.literal.rawValue)
            compileString(styles.map { $0.styleName }.joined(separator: " "))
            
            for style in styles {
                style.register?(self.stylesheet)
            }
        }
    }

    private mutating func compileKeyPaths() {
        keyPaths = [Array(contexts[0].subPaths)]
        let loopContextes = contexts.dropFirst()
        for context in loopContextes {
            if context.runtimeValue.rootId.isEmpty {
                keyPaths[0].append(context.runtimeValue.path)
            } else if let rootIndex = rootIdIndexes[context.runtimeValue.rootId] {
                keyPaths[rootIndex].append(context.runtimeValue.path)
            }
            keyPaths.append(Array(context.subPaths))
        }
    }
    
    private mutating func compileString(_ string: String) {
        buffer.writeInteger(UInt32(string.utf8.count), endianness: .little)
        buffer.writeString(string)
    }
    
    private mutating func compileString(_ string: StaticString) {
        buffer.writeInteger(UInt32(string.utf8CodeUnitCount), endianness: .little)
        buffer.writeStaticString(string)
    }
    
    private mutating func compile(_ node: TemplateNode) throws {
        switch node {
        case .noContent:
            buffer.writeInteger(CompiledNode.noContent.rawValue)
        case .literal(let literal):
            buffer.writeInteger(CompiledNode.literal.rawValue)
            compileString(literal)
        case .tag(let name, let content, let modifiers):
            let data = Data(bytes: name.utf8Start, count: name.utf8CodeUnitCount)
            let name = String(data: data, encoding: .utf8)!
            
            let compiledNode: CompiledNode = content == nil ? .shortTag : .longTag
            buffer.writeInteger(compiledNode.rawValue)
            compileString(name)
            buffer.writeInteger(UInt8(modifiers.count))
            
            for modifier in modifiers {
                try compile(modifier)
            }
            
            try compile(content ?? .noContent)
        case .list(let nodes):
            buffer.writeInteger(CompiledNode.list.rawValue)
            buffer.writeInteger(UInt8(nodes.count))
            
            for node in nodes {
                try compile(node)
            }
        case .lazy(let render):
            try compile(render())
        case .contextValue(let runtimeValue):
            buffer.writeInteger(CompiledNode.contextValue.rawValue)
            buffer.writeInteger(try index(for: runtimeValue), endianness: .little)
        case .conditional(let runtimeValue, let contextId, let trueNode, let falseNode):
            guard let contextIndex = rootIdIndexes[contextId + "-condition-"] else {
                throw TemplateError.internalCompilerError
            }
            
            buffer.writeInteger(CompiledNode.conditional.rawValue)
            buffer.writeInteger(try index(for: runtimeValue), endianness: .little)
            buffer.writeInteger(contextIndex, endianness: .little)
            
            try compile(trueNode)
            try compile(falseNode)
        case .computedList(let runtimeValue, let contextId, let node):
            guard let contextIndex = rootIdIndexes[contextId + "-loop-"] else {
                throw TemplateError.internalCompilerError
            }
            
            buffer.writeInteger(CompiledNode.computedList.rawValue)
            buffer.writeInteger(try index(for: runtimeValue), endianness: .little)
            buffer.writeInteger(contextIndex, endianness: .little)
            
            try compile(node)
        }
    }
    
    public static func compile<T: Template>(_ type: T.Type) throws -> CompiledTemplate<Properties> {
        var compiler = TemplateCompiler()
        var node = TemplateNode(from: T())
        _ = compiler.optimize(&node)
        compiler.compileKeyPaths()
        try compiler.compile(node)
        return compiler.export()
    }
    
    public static func compile(_ root: Root) throws -> CompiledTemplate<Properties> {
        var compiler = TemplateCompiler()
        var node = root.node
        _ = compiler.optimize(&node)
        compiler.compileKeyPaths()
        try compiler.compile(node)
        return compiler.export()
    }
    
    private mutating func optimize(_ node: inout TemplateNode) -> Bool {
        switch node {
        case .noContent:
            return true
        case .list(let subnodes):
            var nodes = [TemplateNode]()
            var shouldReoptimize = false
            var result = ""
            
            func flushOptimization() {
                if result.isEmpty { return }
                
                nodes.append(.literal(result))
                result = ""
            }
            
            var iterator = subnodes.makeIterator()
            
            nextSubnode: while var subnode = iterator.next() {
                _ = optimize(&subnode)
                
                switch subnode {
                case .noContent:
                    continue nextSubnode
                case .list(let nestedList):
                    flushOptimization()
                    nodes.append(contentsOf: nestedList)
                    shouldReoptimize = true
                case .tag(let name, let content, let modifiers):
                    var modifierTemplate = modifiers.makeTemplateNode()

                    result += "<\(name)"
                    if case .literal(let literalModifierString) = modifierTemplate {
                        result += "\(literalModifierString)>"
                    } else {
                        flushOptimization()
                        _ = optimize(&modifierTemplate)
                        nodes.append(modifierTemplate)
                        result += ">"
                    }
                    
                    if var content = content {
                        let isOptimized = optimize(&content)
                        if isOptimized, case .literal(let value) = content {
                            result += value
                        } else {
                            flushOptimization()
                            nodes.append(content)
                        }
                    }
                    
                    result += "</\(name)>"
                case .lazy(let build):
                    var resolved = build()
                    if !optimize(&resolved) {
                        shouldReoptimize = true
                    }
                    nodes.append(resolved)
                case .literal(let value):
                    result += value
                case .contextValue, .computedList, .conditional:
//                    assert(!didOptimize, "Optimized node cannot be a contextValue, these are not optimizable")
                    flushOptimization()
                    nodes.append(subnode)
                }
            }
            
            flushOptimization()
            
            if nodes.count > 1 {
                if shouldReoptimize {
                    var optimizedNode = TemplateNode.list(nodes)
                    _ = optimize(&optimizedNode)
                    node = optimizedNode
                } else {
                    node = .list(nodes)
                }
            } else {
                node = nodes.first ?? .noContent
            }
            return true
        case .tag(let name, let content, let modifiers):
            var modifierTemplate = modifiers.makeTemplateNode()
        
            guard var content = content else {
                if case .literal(let literalModifierString) = modifierTemplate {
                    node = .literal("<\(name)\(literalModifierString) />")
                } else {
                    _ = optimize(&modifierTemplate)
                    node = .list([
                        .literal("<\(name)"),
                        modifierTemplate,
                        .literal("/>")
                    ])
                }
                
                return true
            }

            var start = "<\(name)"
            if case .literal(let literalModifierString) = modifierTemplate {
                start += "\(literalModifierString)>"
            } else {
                _ = optimize(&modifierTemplate)
                content = .list([
                    modifierTemplate,
                    .literal(">"),
                    content
                ])
            }
            let end = "</\(name)>"
            let isOptimized = optimize(&content)
            
            switch (isOptimized, content) {
            case (true, .literal(let value)):
                node = .literal(start + value + end)
            case (true, .noContent):
                node = .literal(start + end)
            case (true, .list):
                node = .list([
                    .literal(start),
                    content,
                    .literal(end)
                ])
            case (true, .computedList(let runtimeValue, let contextId, let content)):
                node = .list([
                    .literal(start),
                    .computedList(runtimeValue, contextId, content),
                    .literal(end)
                ])
            case (true, .contextValue(_)):
                node = .list([
                    .literal(start),
                    content,
                    .literal(end)
                ])
            case (true, _):
                fatalError("Invalid optimizer scenario, non-literal, non-empty and non-list optimized content")
            case (false, _):
                node = .list([
                    .literal(start),
                    content,
                    .literal(end)
                ])
            }
            
            return isOptimized
        case .lazy(let build):
            var resolved = build()
            let success = optimize(&resolved)
            node = resolved
            return success
        case .literal:
            return true
        case .computedList(let runtimeValue, let contextId, var subNode):
            if rootIdIndexes[contextId + "-loop-"] == nil {
                rootIdIndexes[contextId + "-loop-"] = contexts.count
                contexts.append(ContextValueStore(runtimeValue: runtimeValue, subPaths: []))
            }
            _ = optimize(&subNode)
            node = .computedList(runtimeValue, contextId, subNode)
            return true
        case .contextValue(let runtimeValue):
            if runtimeValue.rootId.isEmpty {
                contexts[0].subPaths.insert(runtimeValue.path)
            } else if let index = rootIdIndexes[runtimeValue.rootId] {
                contexts[index].subPaths.insert(runtimeValue.path)
            } else {
                fatalError()
            }
            return true
        case .conditional(let runtimeValue, let contextId, var trueNode, var falseNode):
            if rootIdIndexes[contextId + "-condition-"] == nil {
                rootIdIndexes[contextId + "-condition-"] = contexts.count
                contexts.append(ContextValueStore(runtimeValue: runtimeValue, subPaths: []))
            }
            
            _ = optimize(&trueNode)
            _ = optimize(&falseNode)
            
            node = .conditional(
                runtimeValue,
                contextId,
                trueNode,
                falseNode
            )
            return true
        }
    }
    
    func export() -> CompiledTemplate<Properties> {
        let size = buffer.readableBytes
        let pointer = UnsafeMutableRawPointer.allocate(byteCount: size, alignment: 1)
        
        buffer.withUnsafeReadableBytes { buffer in
            _ = memcpy(pointer, buffer.baseAddress, size)
        }
        
        let buffer = UnsafeByteBuffer(pointer: pointer, size: size)
        return CompiledTemplate(template: buffer, keyPaths: keyPaths)
    }
}
