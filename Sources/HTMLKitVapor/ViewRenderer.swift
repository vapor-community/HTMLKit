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
                return "A layout with the name '\(name)' could not be found."
            }
        }
    }
    
    /// The event loop the view renderer is running on
    internal var eventLoop: EventLoop
    
    /// The localization of the view renderer
    internal var lingo: Lingo?
    
    /// The renderer for the view renderer
    internal var renderer: Renderer
    
    /// Creates the view renderer
    public init(eventLoop: EventLoop, views: ViewsConfiguration, lingo: LingoConfiguration) {
        
        self.eventLoop = eventLoop
        self.renderer = views.renderer
        self.lingo = lingo.lingo
    }
    
    /// Renders a layout and its context
    public func render(name: String, context: Encodable) -> EventLoopFuture<ByteBuffer> {
        
        let manager = HTMLKit.ContextManager(context: context, lingo: self.lingo)
        
        var buffer = ByteBufferAllocator().buffer(capacity: 4096)
        
        if let content = self.renderer.rerender(name: name, manager: manager) {
            buffer.writeString(content)
            
        } else {
            return self.eventLoop.makeFailedFuture(RendererError.unkownLayout(name))
        }
        
        return self.eventLoop.makeSucceededFuture(buffer)
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
