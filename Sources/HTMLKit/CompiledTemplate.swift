import NIO

public struct CompiledTemplate {
    private var _template: UnsafeByteBuffer
    
    init(template: UnsafeByteBuffer) {
        self._template = template
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
    
    private static func compileNextNode(template: inout UnsafeByteBuffer, into output: inout ByteBuffer) throws {
        while let byte = template.readInteger(as: UInt8.self) {
            guard let node = CompiledNode(rawValue: byte) else {
                throw TemplateError.internalCompilerError
            }
            
            switch node {
//            case .none:
//                return
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
                    let value = try template.parseSlice()
                    
                    output.writeBytes(key)
                    output.writeInteger(Constants.equal)
                    output.writeInteger(Constants.quote)
                    output.writeBytes(value)
                    output.writeInteger(Constants.quote)
                }
                    
                output.writeInteger(Constants.greater)
                
                try compileNextNode(template: &template, into: &output)
                
                output.writeInteger(Constants.less)
                output.writeInteger(Constants.forwardSlash)
                output.writeBytes(tag)
                output.writeInteger(Constants.greater)
            case .list:
                guard let nodeCount = template.readInteger(as: UInt8.self) else {
                    throw TemplateError.internalCompilerError
                }
            
                for _ in 0..<nodeCount {
                    try compileNextNode(template: &template, into: &output)
                }
            case .contextValue:
                let path = try template.parseSlice()
                
            case .computedList:
                let path = try template.parseSlice()
            }
        }
    }
    
    public static func render(
        template: CompiledTemplate,
        output: inout ByteBuffer
    ) throws {
        struct None: HTMLProperty {}
        
        try render(
            template: template,
            output: &output,
            properties: None()
        )
    }
    
    public static func render<Properties: HTMLProperty>(
        template: CompiledTemplate,
        output: inout ByteBuffer,
        properties: Properties
    ) throws {
        var template = template
        try compileNextNode(
            template: &template._template,
            into: &output
        )
    }
}
