/*
 Abstract:
 The file contains the Vapor view renderer.
 */

import HTMLKit
import Vapor
import Lingo

/// The view renderer
public class ViewRenderer {
    
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
    
    /// The event loop the view renderer is running on
    internal var eventLoop: EventLoop
    
    /// The cache of the view renderer
    internal var cache: ViewCache
    
    /// The localiatzion of the view renderer
    internal var lingo: Lingo?
    
    /// Creates the view renderer
    public init(eventLoop: EventLoop, cache: ViewCache, lingo: LingoConfiguration) {
        
        self.eventLoop = eventLoop
        self.cache = cache
        self.lingo = try? Lingo(rootPath: lingo.defaultDirectory, defaultLocale: lingo.defaultLocale)
    }
    
    /// Renders a layout and its context
    public func render(name: String, context: Encodable) -> EventLoopFuture<ByteBuffer> {
        
        return self.cache.retrieve(name: name, on: self.eventLoop).flatMap { formula in
        
            guard let formula = formula else {
                return self.eventLoop.makeFailedFuture(RendererError.unkownLayout(name))
            }
            
            var buffer = ByteBufferAllocator().buffer(capacity: 4096)

            let manager = HTMLKit.ContextManager(context: context, lingo: self.lingo)
            
            for ingredient in formula.ingredients {
                
                if let value = try? ingredient.render(with: manager) {
                    buffer.writeString(value)
                }
            }
            
            return self.eventLoop.makeSucceededFuture(buffer)
        }
    }
}

extension ViewRenderer: Vapor.ViewRenderer {
    
    public func `for`(_ request: Request) -> Vapor.ViewRenderer {
        return request.htmlkit
    }
    
    public func render<E:Encodable>(_ name: String, _ context: E) -> EventLoopFuture<Vapor.View> {
        return self.render(name: name, context: context).map { buffer in
            return View(data: buffer)
        }
    }
}

extension ViewRenderer.RendererError: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { self.description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension ViewRenderer.RendererError: DebuggableError {

    @_implements(DebuggableError, reason)
    public var debuggableReason: String { self.description }
}
