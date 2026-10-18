import HTMLKit
import Vapor

extension Application {
    
    /// Access the provider through the application.
    public var htmlkit: HtmlKit  {
        return .init(application: self)
    }
    
    /// A type that represents the provider.
    public struct HtmlKit: Sendable {
        
        /// Manage the environment for the application.
        public var environment: HTMLKit.Environment {
            
            get {
                configuration.environment
            }
            
            nonmutating set {
                configuration.environment = newValue
            }
        }
        
        /// Manage the localization for the application.
        public var localization: HTMLKit.Localization {
            
            get {
                configuration.localization
            }
            
            nonmutating set {
                configuration.localization = newValue
            }
        }
        
        /// Manage the features for the application.
        public var features: HTMLKit.Features {
            
            get {
                configuration.features
            }
            
            nonmutating set {
                configuration.features = newValue
            }
        }
        
        /// The configuration for the renderer.
        private var configuration: Configuration {
            
            if let configuration = application.storage[Configuration.StorageKey.self] {
                return configuration
            }
            
            let configuration = Configuration()
            
            application.storage[Configuration.StorageKey.self] = configuration
            
            return configuration
        }
        
        /// Holds a reference to the application.
        private let application: Application
        
        /// Create the provider.
        ///
        /// - Parameter application: The application to provide for.
        public init(application: Application) {

            self.application = application
        }
    }
}

extension Request {
    
    /// Access the provider through the request.
    public var htmlkit: HtmlKit  {
        return .init(request: self)
    }
    
    /// A type that represents the provider.
    public struct HtmlKit: Sendable {
        
        /// Manage the environment for the request.
        public var environment: HTMLKit.Environment {
            
            get {
                configuration.environment
            }
            
            nonmutating set {
                configuration.environment = newValue
            }
        }
        
        /// The configuration for the renderer.
        private var configuration: Configuration {
            
            if let configuration = request.storage[Configuration.StorageKey.self] {
                return configuration
            }
            
            let configuration = Configuration(localization: request.application.htmlkit.localization, environment: HTMLKit.Environment(from: request.application.htmlkit.environment), features: request.application.htmlkit.features)
            
            request.storage[Configuration.StorageKey.self] = configuration
            
            return configuration
        }
        
        /// Holds a reference to the request.
        private let request: Request
        
        /// Create the provider.
        ///
        /// - Parameter request: The request to provide for.
        public init(request: Request) {

            self.request = request
        }
        
        /// Render the view and transform it into a response.
        ///
        /// - Parameter view: The view to render.
        ///
        /// - Returns: The response.
        public func render(_ view: some HTMLKit.View) -> EventLoopFuture<Vapor.View> {
            
            let renderer = Renderer(localization: configuration.localization,
                                    environment: configuration.environment,
                                    features: configuration.features,
                                    logger: request.logger)
            
            do  {
                
                var buffer = ByteBufferAllocator().buffer(capacity: 4096)
                buffer.writeString(try renderer.render(view: view))
                
                return request.eventLoop.makeSucceededFuture(View(data: buffer))
                
            } catch(let error) {
                return request.eventLoop.makeFailedFuture(error)
            }
        }
        
        /// Render the view and transform it into a response.
        ///
        /// - Parameter view: The view to render.
        ///
        /// - Returns: The response.
        public func render(_ view: some HTMLKit.View) async throws -> Vapor.View {
            return try await render(view).get()
        }
    }
}

extension HTMLKit.Renderer.Error: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension HTMLKit.Renderer.Error: DebuggableError {

    @_implements(DebuggableError, reason)
    public var debuggableReason: String {  description }
}

extension HTMLKit.Environment.Error: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension HTMLKit.Environment.Error: DebuggableError {

    @_implements(DebuggableError, reason)
    public var debuggableReason: String {  description }
}

extension HTMLKit.Localization.Error: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension HTMLKit.Localization.Error: DebuggableError {
    
    @_implements(DebuggableError, reason)
    public var debuggableReason: String { description }
}
