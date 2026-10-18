import HTMLKit
import Vapor

extension Application {
    
    /// Provides access to the provider for the application
    public var htmlkit: HtmlKit  {
        return .init(application: self)
    }
    
    /// Represents the provider for Vapor
    public struct HtmlKit: Sendable {
        
        /// Manages environment settings
        public var environment: HTMLKit.Environment {
            
            get {
                configuration.environment
            }
            
            nonmutating set {
                configuration.environment = newValue
            }
        }
        
        /// Manages localization settings
        public var localization: HTMLKit.Localization {
            
            get {
                configuration.localization
            }
            
            nonmutating set {
                configuration.localization = newValue
            }
        }
        
        /// Manages feature flags
        public var features: HTMLKit.Features {
            
            get {
                configuration.features
            }
            
            nonmutating set {
                configuration.features = newValue
            }
        }
        
        /// The key used to store the configuration in Vapor's storage
        private struct ConfigurationKey: StorageKey {
            
            public typealias Value = Configuration
        }
        
        /// The configuration for the view renderer
        internal var configuration: Configuration {
            
            if let configuration = application.storage[ConfigurationKey.self] {
                return configuration
            }
            
            let configuration = Configuration()
            
            application.storage[ConfigurationKey.self] = configuration
            
            return configuration
        }
        
        /// Holds a reference to the Vapor application
        internal let application: Application
        
        /// Initializes the HTMLKit provider for a given Vapor application
        ///
        /// - Parameter application: The application instance from Vapor
        public init(application: Application) {

            self.application = application
        }
    }
}

extension Request {
    
    /// Access the provider on the request.
    public var htmlkit: HtmlKit  {
        return .init(request: self)
    }
    
    /// A type that represents the provider for Vapor.
    public struct HtmlKit: Sendable {
        
        /// The key used to store the configuration in Vapor's storage.
        private struct ConfigurationKey: StorageKey {
            
            public typealias Value = Configuration
        }
        
        /// Manage the environment settings for the request.
        public var environment: HTMLKit.Environment {
            
            get {
                configuration.environment
            }
            
            nonmutating set {
                configuration.environment = newValue
            }
        }
        
        /// The configuration for renderer.
        private var configuration: Configuration {
            
            if let configuration = request.storage[ConfigurationKey.self] {
                return configuration
            }
            
            let configuration = Configuration(localization: request.application.htmlkit.localization, environment: HTMLKit.Environment(from: request.application.htmlkit.environment), features: request.application.htmlkit.features)
            
            request.storage[ConfigurationKey.self] = configuration
            
            return configuration
        }
        
        /// Holds a reference to the Vapor application
        private let request: Request
        
        /// Initializes the HTMLKit provider for a given Vapor application
        ///
        /// - Parameter request: The request instance from Vapor
        public init(request: Request) {

            self.request = request
        }
        
        /// Renders the given view and transforms it into a view response
        ///
        /// - Parameter view: The view to render
        ///
        /// - Returns: The view response
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
        
        /// Renders the given view and transforms it into a view response.
        ///
        /// - Parameter view: The view to render.
        ///
        /// - Returns: The view response.
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
