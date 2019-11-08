import Foundation
import NIO

fileprivate func equal(lhs: StaticString, rhs: StaticString) -> Bool {
    if lhs.utf8CodeUnitCount != rhs.utf8CodeUnitCount {
        return false
    }
    
    return memcmp(lhs.utf8Start, rhs.utf8Start, lhs.utf8CodeUnitCount) == 0
}

public struct TemplateCompiler {
    var buffer: ByteBuffer
    
    init() {
        buffer = ByteBufferAllocator().buffer(capacity: 4_096)
    }
    
    private mutating func compileTemplateValue(_ value: AnyTemplateValue) {
        switch value {
        case .literal(let literal):
            buffer.writeInteger(CompiledTemplateValue.literal.rawValue)
            compileString(literal)
        case .runtime(let path):
            buffer.writeInteger(CompiledTemplateValue.runtime.rawValue)
            compileString(path.joined(separator: "."))
        }
    }
    
    private mutating func compile(_ modifier: Modifier) {
        switch modifier {
        case .attribute(let name, let value):
            compileString(name)
            compileTemplateValue(value)
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
        case .none:
            buffer.writeInteger(CompiledNode.none.rawValue)
        case .tag(let name, let content, let modifiers):
            let data = Data(bytes: name.utf8Start, count: name.utf8CodeUnitCount)
            let name = String(data: data, encoding: .utf8)!
            
            buffer.writeInteger(CompiledNode.tag.rawValue)
            compileString(name)
            buffer.writeInteger(UInt8(modifiers.count))
            
            for modifier in modifiers {
                compile(modifier)
            }
            
            try compile(content)
        case .literal(let literal):
            buffer.writeInteger(CompiledNode.literal.rawValue)
            compileString(literal)
        case .list(let nodes):
            buffer.writeInteger(CompiledNode.list.rawValue)
            buffer.writeInteger(UInt8(nodes.count))
            
            for node in nodes {
                try compile(node)
            }
        case .lazy(let render):
            try compile(render())
        case .contextValue(let path, let broken):
            if broken {
                throw TemplateError.errorCompilingPropertyAccessor(path)
            }
            
            let path = path.joined(separator: ".")
            buffer.writeInteger(CompiledNode.contextValue.rawValue)
            compileString(path)
        case .computedList(let path, let node):
            let path = path.joined(separator: ".")
            
            buffer.writeInteger(CompiledNode.computedList.rawValue)
            compileString(path)
            try compile(node)
        }
    }
    
    public static func compile<T: Template>(_ type: T.Type) throws -> CompiledTemplate {
        var compiler = TemplateCompiler()
        var node = TemplateNode(from: T())
        _ = optimize(&node)
        try compiler.compile(node)
        return compiler.export()
    }
    
    public static func compile(_ root: Root) throws -> CompiledTemplate {
        var compiler = TemplateCompiler()
        var node = root.node
        _ = optimize(&node)
        try compiler.compile(node)
        return compiler.export()
    }
    
    private static func optimize(_ node: inout TemplateNode) -> Bool {
        switch node {
        case .none:
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
                case .none:
                    continue nextSubnode
                case .list(let nestedList):
                    flushOptimization()
                    nodes.append(contentsOf: nestedList)
                    shouldReoptimize = true
                case .tag(let name, var content, let modifiers):

                    var modifierTemplate = modifiers.makeTemplateNode()

                    result += "<\(name)"
                    if case .literal(let literalModifierString) = modifierTemplate {
                        result += "\(literalModifierString)>"
                    } else {
                        flushOptimization()
                        _ = optimize(&modifierTemplate)
                        nodes.append(modifierTemplate)
                    }
                    
                    let isOptimized = optimize(&content)
                    if isOptimized, case .literal(let value) = content {
                        result += value
                    } else {
                        flushOptimization()
                        nodes.append(content)
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
                case .contextValue, .computedList:
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
                node = nodes.first ?? .none
            }
            return true
        case .tag(let name, var content, let modifiers):

            var modifierTemplate = modifiers.makeTemplateNode()

            var start = "<\(name)"
            if case .literal(let literalModifierString) = modifierTemplate {
                start += "\(literalModifierString)>"
            } else {
                _ = optimize(&modifierTemplate)
                content = .list([
                    modifierTemplate,
                    content
                ])
            }
            let end = "</\(name)>"
            let isOptimized = optimize(&content)
            
            switch (isOptimized, content) {
            case (true, .literal(let value)):
                node = .literal(start + value + end)
            case (true, .none):
                node = .literal(start + end)
            case (true, .list):
                node = .list([
                    .literal(start),
                    content,
                    .literal(end)
                ])
            case (true, .computedList(let path, let content)):
                node = .list([
                    .literal(start),
                    .computedList(path, content),
                    .literal(end)
                ])
            case (true, .contextValue(_, _)):
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
        case .computedList(_, var node):
            _ = optimize(&node)
            return true
        case .contextValue:
            return false
        }
    }
    
    func export() -> CompiledTemplate {
        let size = buffer.readableBytes
        let pointer = UnsafeMutableRawPointer.allocate(byteCount: size, alignment: 1)
        
        buffer.withUnsafeReadableBytes { buffer in
            _ = memcpy(pointer, buffer.baseAddress, size)
        }
        
        let buffer = UnsafeByteBuffer(pointer: pointer, size: size)
        return CompiledTemplate(template: buffer)
    }
}
