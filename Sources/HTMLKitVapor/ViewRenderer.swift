/*
 Abstract:
 The file contains the Vapor view renderer.
 */

import HTMLKit
import Vapor
import Lingo

/// The view renderer
public class ViewRenderer {
    
    /// The event loop the view renderer is running on
    internal var eventLoop: EventLoop
    
    /// The renderer for the view renderer
    internal var renderer: Renderer
    
    /// Creates the view renderer
    public init(eventLoop: EventLoop, lingo: LingoConfiguration) {
        
        self.eventLoop = eventLoop
        self.renderer = Renderer(lingo: lingo.lingo)
    }
    
    /// Renders a layout and its context
    public func render(_ view: some HTMLKit.View) -> EventLoopFuture<Vapor.View> {
        
        let content = renderer.render(view: view)
        
        var buffer = ByteBufferAllocator().buffer(capacity: 4096)
        buffer.writeString(content)
        
        return self.eventLoop.makeSucceededFuture(View(data: buffer))
    }
    
    /// Renders a layout and its context
    public func render(_ view: some HTMLKit.View) async throws -> Vapor.View {
        return try await render(view).get()
    }
}
