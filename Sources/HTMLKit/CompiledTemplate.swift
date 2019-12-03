import NIO

public struct CompiledTemplate<Context> {
    private var _template: UnsafeByteBuffer
    private var keyPaths: [[AnyKeyPath]]
    
    init(template: UnsafeByteBuffer, keyPaths: [[AnyKeyPath]]) {
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
    
    private static func getValue(
        from template: inout UnsafeByteBuffer,
        values: [Any]
    ) throws -> Any {
        guard let index = template.readInteger(as: Int.self) else {
            throw TemplateError.internalCompilerError
        }
        assert(index >= 0 && index < values.count, "Value references did not exist")
        return values[index]
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
    
    private static func skipNextNode(
        template: inout UnsafeByteBuffer
    ) throws {
        guard
            let byte = template.readInteger(as: UInt8.self),
            let node = CompiledNode(rawValue: byte)
        else {
            throw TemplateError.internalCompilerError
        }
        
        switch node {
        case .noContent:
            return
        case .literal:
            // Literal
            try template.skipSlice()
        case .shortTag, .longTag:
            // Name
            try template.skipSlice()
            
            guard let modifierCount = template.readInteger(as: UInt8.self) else {
                throw TemplateError.internalCompilerError
            }
            
            for _ in 0..<modifierCount {
                // Skip key string
                try template.skipSlice()
                
                // Skip value
                try template.skipSlice()
            }
            
            try skipNextNode(template: &template)
        case .list:
            guard let nodeCount = template.readInteger(as: UInt8.self) else {
                throw TemplateError.internalCompilerError
            }
            
            for _ in 0..<nodeCount {
                // Each node in the list
                try skipNextNode(template: &template)
            }
        case .contextValue:
            // Skip runtime value
            template.moveReaderIndex(forwardBy: MemoryLayout<Int>.size)
        case .conditional:
            // Skip runtime value
            template.moveReaderIndex(forwardBy: MemoryLayout<Int>.size)
            template.moveReaderIndex(forwardBy: MemoryLayout<Int>.size)
            
            // True node
            try skipNextNode(template: &template)
            
            // False node
            try skipNextNode(template: &template)
        case .computedList:
            // Skip runtime value
            template.moveReaderIndex(forwardBy: MemoryLayout<Int>.size)
            template.moveReaderIndex(forwardBy: MemoryLayout<Int>.size)
            
            // Iterated node
            try skipNextNode(template: &template)
        }
    }
    
    private static func compileNextNode<Properties>(
        template: inout UnsafeByteBuffer,
        into output: inout ByteBuffer,
        values: [Any],
        keyPaths: [[AnyKeyPath]],
        properties: Properties
    ) throws {
        guard
            let byte = template.readInteger(as: UInt8.self),
            let node = CompiledNode(rawValue: byte)
        else {
            throw TemplateError.internalCompilerError
        }
        
        switch node {
        case .noContent:
            return
        case .literal:
            let buffer = try template.parseSlice()
            output.writeBytes(buffer)
        case .shortTag, .longTag:
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
                    let byte = template.readInteger(as: UInt8.self)
                    else {
                        throw TemplateError.internalCompilerError
                }
                
                guard
                    let type = CompiledTemplateValue(rawValue: byte)
                    else {
                        throw TemplateError.internalCompilerError
                }
                
                switch type {
                case .literal:
                    let value = try template.parseSlice()
                    output.writeBytes(value)
                case .runtime:
                    let value = try getValue(from: &template, values: values) as! TemplateLiteralRepresentable
                    
                    switch value.makeTemplateLiteral().storage {
                    case .string(let string):
                        output.writeString(string)
                    case .boolean:
                        throw TemplateError.cannotRender(Bool.self)
                    }
                }
                
                output.writeInteger(Constants.quote)
            }
            
            if node == .shortTag {
                output.writeInteger(Constants.forwardSlash)
            }
            
            output.writeInteger(Constants.greater)
            
            if node == .longTag {
                try compileNextNode(
                    template: &template,
                    into: &output,
                    values: values,
                    keyPaths: keyPaths,
                    properties: properties
                )
                
                output.writeInteger(Constants.less)
                output.writeInteger(Constants.forwardSlash)
                output.writeBytes(tag)
                output.writeInteger(Constants.greater)
            }
        case .list:
            guard let nodeCount = template.readInteger(as: UInt8.self) else {
                throw TemplateError.internalCompilerError
            }
            
            for _ in 0..<nodeCount {
                try compileNextNode(
                    template: &template,
                    into: &output,
                    values: values,
                    keyPaths: keyPaths,
                    properties: properties
                )
            }
        case .contextValue:
            let value = try getValue(from: &template, values: values) as! TemplateLiteralRepresentable
            
            switch value.makeTemplateLiteral().storage {
            case .boolean:
                throw TemplateError.cannotRender(Bool.self)
            case .string(let string):
                output.writeString(string)
            }
        case .computedList:
            let value = try getValue(from: &template, values: values) as! [Any]
            guard let index = template.readInteger(as: Int.self) else {
                throw TemplateError.internalCompilerError
            }
            assert(index >= 0 && index < keyPaths.count, "KeyPath references did not exist")
            
            var valueStart = 0
            for i in 0..<index {
                valueStart += keyPaths[i].count
            }
            
            var newValues = values
            let readerIndex = template.readerIndex
            for element in value {
                template.moveReaderIndex(to: readerIndex)
                for (index, keyPath) in keyPaths[index].enumerated() {
                    newValues[valueStart + index] = element[keyPath: keyPath] ?? ""
                }
                try compileNextNode(template: &template, into: &output, values: newValues, keyPaths: keyPaths, properties: element)
            }
        case .conditional:
            let value = try getValue(from: &template, values: values) as! TemplateLiteralRepresentable
            
            switch value.makeTemplateLiteral().storage {
            case .boolean(let bool):
                if bool {
                    try compileNextNode(
                        template: &template,
                        into: &output,
                        values: values,
                        keyPaths: keyPaths,
                        properties: properties
                    )
                    
                    try skipNextNode(template: &template)
                } else {
                    try skipNextNode(template: &template)
                    
                    try compileNextNode(
                        template: &template,
                        into: &output,
                        values: values,
                        keyPaths: keyPaths,
                        properties: properties
                    )
                }
            case .string:
                throw TemplateError.cannotEvaluateCondition(String.self)
            }
        }
    }
    
    public func render(
        output: inout ByteBuffer,
        properties: Context
    ) throws {
        var template = self
        
        var values: [Any] = []
        
        for keyPath in keyPaths[0] {
            values.append(properties[keyPath: keyPath] ?? "")
        }
        if keyPaths.count > 1 {
            for i in 1..<keyPaths.count {
                for _ in keyPaths[i - 1] {
                    values.append("")
                }
            }
        }
        
        while template._template.readableBytes > 0 {
            try CompiledTemplate<Context>.compileNextNode(
                template: &template._template,
                into: &output,
                values: values,
                keyPaths: keyPaths,
                properties: properties
            )
        }
    }
}
