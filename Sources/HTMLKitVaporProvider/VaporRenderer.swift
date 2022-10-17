/*
 Abstract:
 The file contains the Vapor renderer.
 */

import HTMLKit
import Vapor

public class VaporRenderer {
    
    public enum RendererError: Error {
        
        case unkownTemplate(String)
        
        public var description: String {
            
            switch self {
            case .unkownTemplate(let name):
                return "Template '\(name)' not found."
            }
        }
    }
    
    private var renderer: HTMLKit.Renderer {
        return .init()
    }
    
    private var eventLoop: EventLoop
    
    private var cache: VaporCache
    
    public init(eventLoop: EventLoop, cache: VaporCache) {
        self.eventLoop = eventLoop
        self.cache = cache
    }
    
    public func render(name: String, context: Encodable) -> EventLoopFuture<ByteBuffer> {
        
        return self.cache.retrieve(name: name, on: self.eventLoop).flatMap { formula in
        
            guard let formula = formula else {
                return self.eventLoop.makeFailedFuture(RendererError.unkownTemplate(name))
            }
            
            var buffer = ByteBufferAllocator().buffer(capacity: 4096)
            
            let manager = HTMLKit.ContextManager(context: context)
            
            for ingredient in formula.ingredients {
                
                if let value = try? ingredient.render(with: manager) {
                    buffer.writeString(value)
                }
            }
            
            return self.eventLoop.makeSucceededFuture(buffer)
        }
    }
    
    public func add<T:HTMLKit.AnyLayout>(layout: T) {
        
        let formula = HTMLKit.Formula()
        
        try? layout.prerender(formula)
        
        self.cache.upsert(name: String(describing: type(of: layout)), formula: formula)
    }
}

extension VaporRenderer: ViewRenderer {
    
    public func `for`(_ request: Request) -> ViewRenderer {
        return request.htmlkit
    }
    
    public func render<E:Encodable>(_ name: String, _ context: E) -> EventLoopFuture<Vapor.View> {
        return self.render(name: name, context: context).map { buffer in
            return View(data: buffer)
        }
    }
}
