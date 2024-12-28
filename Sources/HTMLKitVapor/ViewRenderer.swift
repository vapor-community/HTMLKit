/*
 Abstract:
 The file contains the Vapor view renderer.
 */

import HTMLKit
import Vapor

/// The view renderer
public class ViewRenderer {
    
    /// The event loop the view renderer is running on
    internal var eventLoop: EventLoop
    
    /// The renderer for the view renderer
    internal var renderer: Renderer
    
    /// The logger used to log all operations
    private var logger: Logger
    
    /// Creates the view renderer
    public init(eventLoop: EventLoop, configuration: Configuration, logger: Logger) {
        
        self.eventLoop = eventLoop
        self.renderer = Renderer(localization: configuration.localization,
                                 environment: configuration.environment,
                                 security: configuration.security,
                                 features: configuration.features,
                                 logger: logger)
        self.logger = logger
    }
    
    /// Renders a view and transforms it into a view response.
    public func render(_ view: some HTMLKit.View) -> EventLoopFuture<Vapor.View> {
        
        do  {
            
            var buffer = ByteBufferAllocator().buffer(capacity: 4096)
            buffer.writeString(try renderer.render(view: view))
            
            return self.eventLoop.makeSucceededFuture(View(data: buffer))
            
        } catch(let error) {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
    
    /// Renders a view and transforms it into a view response.
    public func render(_ view: some HTMLKit.View) async throws -> Vapor.View {
        return try await render(view).get()
    }
}
