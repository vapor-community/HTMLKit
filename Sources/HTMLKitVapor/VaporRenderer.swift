/*
 Abstract:
 The file contains the Vapor view renderer.
 */

import HTMLKit
import Vapor

/// The view renderer
public class VaporRenderer {
    
    /// A enumeration of possible errors of the view renderer
    public enum RendererError: Error {
        
        case unkownLayout(String)
        
        public var description: String {
            
            switch self {
            case .unkownLayout(let name):
                return "Layout with the name '\(name)' could not be found."
            }
        }
    }
    
    /// The renderer of htmlkit
    private var renderer: HTMLKit.Renderer {
        return .init()
    }
    
    /// The event loop the view renderer is running on
    private var eventLoop: EventLoop
    
    /// The cache of the view renderer
    private var cache: VaporCache
    
    /// Creates the view renderer
    public init(eventLoop: EventLoop, cache: VaporCache) {
        self.eventLoop = eventLoop
        self.cache = cache
    }
    
    /// Adds the layout to the cache
    public func add<T:HTMLKit.AnyLayout>(layout: T) {
        
        let formula = HTMLKit.Formula()
        
        try? layout.prerender(formula)
        
        self.cache.upsert(name: String(reflecting: T.self), formula: formula)
    }
    
    /// Renders a layout and its context
    public func render(name: String, context: Encodable) -> EventLoopFuture<ByteBuffer> {
        
        return self.cache.retrieve(name: name, on: self.eventLoop).flatMap { formula in
        
            guard let formula = formula else {
                return self.eventLoop.makeFailedFuture(RendererError.unkownLayout(name))
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

extension VaporRenderer.RendererError: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { self.description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension VaporRenderer.RendererError: DebuggableError {

    @_implements(DebuggableError, reason)
    public var debuggableReason: String { self.description }
}
