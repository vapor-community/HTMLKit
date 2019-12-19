import NIO
import Foundation

protocol RuntimeEvaluatable {

    func compileNextNode(
        template: inout UnsafeByteBuffer,
        into output: inout ByteBuffer,
        env: CompiledTemplateEnviroment
    ) throws
}

public class CompiledTemplateEnviroment {
    let keyPaths: [[AnyKeyPath]]
    let values: [Any]
    let runtimeEvaluated: [RuntimeEvaluatable]
    let dateFormatters: [DateFormattable]
    var locale: String

    init(
        keyPaths: [[AnyKeyPath]],
        values: [Any],
        runtimeEvaluated: [RuntimeEvaluatable],
        dateFormatters: [DateFormattable]
    ) {
        self.keyPaths = keyPaths
        self.values = values
        self.runtimeEvaluated = runtimeEvaluated
        self.dateFormatters = dateFormatters
        self.locale = ""
    }
}

public struct CompiledTemplate<Context> {

    private var _template: UnsafeByteBuffer
    private let keyPaths: [[AnyKeyPath]]
    private let runtimeEvaluated: [RuntimeEvaluatable]
    private let dateFormatters: [DateFormattable]
    
    init(
        template: UnsafeByteBuffer,
        keyPaths: [[AnyKeyPath]],
        runtimeEvaluated: [RuntimeEvaluatable],
        dateFormatters: [DateFormattable]
    ) {
        self._template = template
        self.keyPaths = keyPaths
        self.runtimeEvaluated = runtimeEvaluated
        self.dateFormatters = dateFormatters
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
    
    static func compileNextNode(
        template: inout UnsafeByteBuffer,
        into output: inout ByteBuffer,
        env: CompiledTemplateEnviroment
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
                    let value = try getValue(from: &template, values: env.values) as! TemplateLiteralRepresentable
                    
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
                    env: env
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
                    env: env
                )
            }
        case .contextValue:
            let value = try getValue(from: &template, values: env.values) as! TemplateLiteralRepresentable
            
            switch value.makeTemplateLiteral().storage {
            case .boolean:
                throw TemplateError.cannotRender(Bool.self)
            case .string(let string):
                output.writeString(string)
            }
        case .runtimeEvaluated:
            guard let index = template.readInteger(as: Int.self) else {
                throw TemplateError.internalCompilerError
            }
            try env.runtimeEvaluated[index].compileNextNode(
                template: &template,
                into: &output,
                env: env
            )
        case .formattedDate:
            guard
                let date = try getValue(from: &template, values: env.values) as? Date,
                let formatterIndex = template.readInteger(as: Int.self)
            else {
                throw TemplateError.internalCompilerError
            }
            output.writeString(
                env.dateFormatters[formatterIndex]
                    .format(date: date, with: env)
            )
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
                env: .init(
                    keyPaths: keyPaths,
                    values: values,
                    runtimeEvaluated: runtimeEvaluated,
                    dateFormatters: dateFormatters
                )
            )
        }
    }
}
