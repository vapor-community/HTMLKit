import NIO

public struct CompiledTemplate<Context> {
    private var _template: UnsafeByteBuffer
    private var keyPaths: [AnyKeyPath]
    
    init(template: UnsafeByteBuffer, keyPaths: [AnyKeyPath]) {
        self._template = template
        self.keyPaths = keyPaths
    }
    
    private struct ByteBufferSlicePosition {
        let offset: Int
        let length: Int
    }
    
    private static func getString(from template: inout ByteBuffer) throws -> String {
        guard
            let length = template.readInteger(as: UInt32.self),
            let data = template.readString(length: Int(length))
        else {
            throw TemplateError.internalCompilerError
        }
        
        return data
    }
    
    private static func getKeyPath(
        from template: inout UnsafeByteBuffer,
        keyPaths: [AnyKeyPath]
    ) throws -> AnyKeyPath {
        guard let index = template.readInteger(as: Int.self) else {
            throw TemplateError.internalCompilerError
        }
        
        assert(index >= 0 && index < keyPaths.count, "KeyPath references did not exist")
        
        return keyPaths[index]
    }
    
    private static func compileNextNode<Properties>(
        template: inout UnsafeByteBuffer,
        into output: inout ByteBuffer,
        keyPaths: [AnyKeyPath],
        properties: Properties
    ) throws {
        guard
            let byte = template.readInteger(as: UInt8.self),
            let node = CompiledNode(rawValue: byte)
        else {
            throw TemplateError.internalCompilerError
        }
        
        switch node {
        case .none:
            return
        case .literal:
            let buffer = try template.parseSlice()
            output.writeBytes(buffer)
        case .tag:
            let tag = try template.parseSlice()
            output.writeInteger(Constants.less)
            output.writeBytes(tag)

            guard let modifierCount = template.readInteger(as: UInt8.self) else {
                throw TemplateError.internalCompilerError
            }
            
            for _ in 0..<modifierCount {
                let key = try template.parseSlice()
                
                output.writeInteger(Constants.space)
                output.writeBytes(key)
                output.writeInteger(Constants.equal)
                output.writeInteger(Constants.quote)
                
                guard
                    let byte = template.readInteger(as: UInt8.self),
                    let type = CompiledTemplateValue(rawValue: byte)
                else {
                    throw TemplateError.internalCompilerError
                }
                
                switch type {
                case .literal:
                    let value = try template.parseSlice()
                    output.writeBytes(value)
                case .runtime:
                    let keyPath = try getKeyPath(from: &template, keyPaths: keyPaths)
                    let value = properties[keyPath: keyPath] as! TemplateLiteralRepresentable
                    
                    switch value.makeTemplateLiteral().storage {
                    case .string(let string):
                        output.writeString(string)
                    }
                }
                
                output.writeInteger(Constants.quote)
            }
                
            output.writeInteger(Constants.greater)
            
            try compileNextNode(
                template: &template,
                into: &output,
                keyPaths: keyPaths,
                properties: properties
            )
            
            output.writeInteger(Constants.less)
            output.writeInteger(Constants.forwardSlash)
            output.writeBytes(tag)
            output.writeInteger(Constants.greater)
        case .list:
            guard let nodeCount = template.readInteger(as: UInt8.self) else {
                throw TemplateError.internalCompilerError
            }
        
            for _ in 0..<nodeCount {
                try compileNextNode(
                    template: &template,
                    into: &output,
                    keyPaths: keyPaths,
                    properties: properties
                )
            }
        case .contextValue:
            let keyPath = try getKeyPath(from: &template, keyPaths: keyPaths)
            let value = properties[keyPath: keyPath] as! TemplateLiteralRepresentable
            
            switch value.makeTemplateLiteral().storage {
            case .string(let string):
                output.writeString(string)
            }
        case .computedList:
            let keyPath = try getKeyPath(from: &template, keyPaths: keyPaths)
            let value = properties[keyPath: keyPath] as! TemplateLiteralRepresentable
            
            switch value.makeTemplateLiteral().storage {
            case .string:
                throw TemplateError.missingValue(keyPath, needed: [TemplateValue].self)
//            case .array(let array):
//                let readerIndex = template.readerIndex
//
//                for element in array {
//                    template.moveReaderIndex(to: readerIndex)
//                    try compileNextNode(template: &template, into: &output, keyPaths: keyPaths, properties: element)
//                }
            }
        }
    }
    
    public func render(
        output: inout ByteBuffer,
        properties: Context
    ) throws {
        var template = self
        
        while template._template.readableBytes > 0 {
            try CompiledTemplate<Context>.compileNextNode(
                template: &template._template,
                into: &output,
                keyPaths: keyPaths,
                properties: properties
            )
        }
    }
}
