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
    
    private mutating func compile(_ modifier: Modifier) {
        switch modifier {
        case .attribute(let name, let value):
            compileString(name)
            compileString(value)
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
    
    private mutating func compile(_ node: TemplateNode) {
        switch node {
        case .none:
            return
        case .tag(let name, let content, let modifiers):
            let data = Data(bytes: name.utf8Start, count: name.utf8CodeUnitCount)
            let name = String(data: data, encoding: .utf8)!
            
            buffer.writeInteger(CompiledNode.tag.rawValue)
            compileString(name)
            buffer.writeInteger(UInt8(modifiers.count))
            
            for modifier in modifiers {
                compile(modifier)
            }
            
            compile(content)
        case .literal(let literal):
            buffer.writeInteger(CompiledNode.literal.rawValue)
            compileString(literal)
        case .list(let nodes):
            buffer.writeInteger(CompiledNode.list.rawValue)
            buffer.writeInteger(UInt8(nodes.count))
            
            for node in nodes {
                compile(node)
            }
        case .lazy(let render):
            compile(render())
        case .contextValue(let path):
            let path = path.joined(separator: ".")
            buffer.writeInteger(CompiledNode.contextValue.rawValue)
            compileString(path)
        case .computedList(let path, let node):
            let path = path.joined(separator: ".")
            
            buffer.writeInteger(CompiledNode.computedList.rawValue)
            compileString(path)
            compile(node)
        }
    }
    
    public static func compile<T: Template>(_ type: T.Type) -> CompiledTemplate {
        var compiler = TemplateCompiler()
        var node = TemplateNode(from: T())
        _ = optimize(&node)
        compiler.compile(node)
        return compiler.export()
    }
    
    public static func compile(_ root: Root) -> CompiledTemplate {
        var compiler = TemplateCompiler()
        var node = root.node
        _ = optimize(&node)
        compiler.compile(node)
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
                let didOptimize = optimize(&subnode)
                
                switch subnode {
                case .none:
                    continue nextSubnode
                case .list(let nestedList):
                    if !didOptimize {
                        flushOptimization()
                    }
                    nodes.append(contentsOf: nestedList)
                    shouldReoptimize = true
                case .tag(let name, var content, let modifiers):
                    result += "<\(name)\(modifiers.string)>"
                    
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
                    assert(!didOptimize, "Optimized node cannot be a contextValue, these are not optimizable")
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
            let start = "<\(name)\(modifiers.string)>"
            let end = "</\(name)>"
            let isOptimized = optimize(&content)
            
            if isOptimized, case .literal(let value) = content {
                node = .literal(start + value + end)
                return true
            } else {
                node = .list([
                    .literal(start),
                    content,
                    .literal(end)
                ])
                return false
            }
        case .lazy(let build):
            var resolved = build()
            let success = optimize(&resolved)
            node = resolved
            return success
        case .literal:
            return true
        case .contextValue, .computedList:
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
