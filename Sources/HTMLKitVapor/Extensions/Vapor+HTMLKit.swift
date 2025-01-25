import HTMLKit
import Vapor

extension Application {
    
    /// Provides access to the provider for the application
    public var htmlkit: HtmlKit  {
        return .init(application: self)
    }
    
    /// Represents the provider for Vapor
    public struct HtmlKit {
        
        /// Manages security settings
        public var security: HTMLKit.Security {
            
            get {
                configuration.security
            }
            
            nonmutating set {
                configuration.security = newValue
            }
        }
        
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
        internal struct ConfigurationKey: StorageKey {
            
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
    
    /// The accept language header of the request
    private var acceptLanguage: String? {
        
        if let languageHeader = headers.first(name: .acceptLanguage) {
            return languageHeader.components(separatedBy: ",").first
        }
        
        return nil
    }
    
    /// Access to the view renderer
    public var htmlkit: ViewRenderer {
        
        if let acceptLanguage = acceptLanguage {
            application.htmlkit.environment.upsert(HTMLKit.Locale(tag: acceptLanguage), for: \HTMLKit.EnvironmentKeys.locale)
        }
        
        return .init(eventLoop: eventLoop, configuration: application.htmlkit.configuration, logger: logger)
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

extension HTMLKit.Environment.Errors: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension HTMLKit.Environment.Errors: DebuggableError {

    @_implements(DebuggableError, reason)
    public var debuggableReason: String {  description }
}

extension HTMLKit.Localization.Errors: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension HTMLKit.Localization.Errors: DebuggableError {
    
    @_implements(DebuggableError, reason)
    public var debuggableReason: String { description }
}
