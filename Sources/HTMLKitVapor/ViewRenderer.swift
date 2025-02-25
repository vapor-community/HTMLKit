import HTMLKit
import Vapor

/// A type responsible for rendering views in Vapor using HTMLKit
public class ViewRenderer {
    
    /// The event loop that the renderer operates on
    internal var eventLoop: EventLoop
    
    /// The actual renderer
    internal var renderer: Renderer
    
    /// The logger used to log all operations
    private var logger: Logger
    
    /// Initializes the view renderer
    /// 
    /// - Parameters:
    ///   - eventLoop: The event loop used for asynchronous operations
    ///   - configuration: The configuration for the renderer
    ///   - logger: The logger used to log all operations
    public init(eventLoop: EventLoop, configuration: Configuration, logger: Logger) {
        
        self.eventLoop = eventLoop
        self.renderer = Renderer(localization: configuration.localization,
                                 environment: configuration.environment,
                                 features: configuration.features,
                                 logger: logger)
        self.logger = logger
    }
    
    /// Renders the given view and transforms it into a view response
    ///
    /// - Parameter view: The view to render
    ///
    /// - Returns: The view response
    public func render(_ view: some HTMLKit.View) -> EventLoopFuture<Vapor.View> {
        
        do  {
            
            var buffer = ByteBufferAllocator().buffer(capacity: 4096)
            buffer.writeString(try renderer.render(view: view))
            
            return eventLoop.makeSucceededFuture(View(data: buffer))
            
        } catch(let error) {
            return eventLoop.makeFailedFuture(error)
        }
    }
    
    /// Renders the given view and transforms it into a view response
    ///
    /// - Parameter view: The view to render
    ///
    /// - Returns: The view response
    public func render(_ view: some HTMLKit.View) async throws -> Vapor.View {
        return try await render(view).get()
    }
}
