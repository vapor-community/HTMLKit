import BSON
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
    
    private static func compileNextNode(
        template: inout UnsafeByteBuffer,
        into output: inout ByteBuffer,
        context: Primitive?
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
                    // TODO: THIS PART HAS SHIT PERFORMANCE
                    let property = try template.parseString()
                    let path = property.split(separator: ".")
                    
                    var value: Primitive? = context
                    
                    for component in path where !component.isEmpty {
                        value = value[String(component)]
                    }
                    
                    if let value = value?.string {
                        output.writeString(value)
                    } else {
                        throw TemplateError.missingValue(property, needed: String.self)
                    }
                }
                
                output.writeInteger(Constants.quote)
            }
                
            output.writeInteger(Constants.greater)
            
            try compileNextNode(
                template: &template,
                into: &output,
                context: context
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
                    context: context
                )
            }
        case .contextValue:
            // TODO: THIS PART HAS SHIT PERFORMANCE
            let property = try template.parseString()
            let path = property.split(separator: ".")
            
            var value: Primitive? = context
            
            for component in path where !component.isEmpty {
                value = value[String(component)]
            }
            
            if let value = value?.string {
                output.writeString(value)
            } else {
                throw TemplateError.missingValue(property, needed: String.self)
            }
        case .computedList:
            // TODO: THIS PART HAS SHIT PERFORMANCE
            let property = try template.parseString()
            let path = property.split(separator: ".")
            
            var value: Primitive? = context
            
            for component in path where !component.isEmpty {
                value = value[String(component)]
            }
            
            guard let array = value as? Document, array.isArray else {
                throw TemplateError.missingValue(property, needed: Array<Void>.self)
            }
            
            let readerIndex = template.readerIndex
            
            for element in array.values {
                template.moveReaderIndex(to: readerIndex)
                try compileNextNode(template: &template, into: &output, context: element)
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
        let document = try BSONEncoder().encodePrimitive(properties)
        try render(
            template: template,
            output: &output,
            properties: document
        )
    }
    
    public static func render(
        template: CompiledTemplate,
        output: inout ByteBuffer,
        properties: Primitive?
    ) throws {
        var template = template
        
        while template._template.readableBytes > 0 {
            try compileNextNode(
                template: &template._template,
                into: &output,
                context: properties
            )
        }
    }
}
