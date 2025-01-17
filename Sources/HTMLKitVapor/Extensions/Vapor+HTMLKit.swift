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
                self.configuration.security
            }
            
            nonmutating set {
                self.configuration.security = newValue
            }
        }
        
        /// Manages environment settings
        public var environment: HTMLKit.Environment {
            
            get {
                self.configuration.environment
            }
            
            nonmutating set {
                self.configuration.environment = newValue
            }
        }
        
        /// Manages localization settings
        public var localization: HTMLKit.Localization {
            
            get {
                self.configuration.localization
            }
            
            nonmutating set {
                self.configuration.localization = newValue
            }
        }
        
        /// Manages feature flags
        public var features: HTMLKit.Features {
            
            get {
                self.configuration.features
            }
            
            nonmutating set {
                self.configuration.features = newValue
            }
        }
        
        /// The key used to store the configuration in Vapor's storage
        internal struct ConfigurationKey: StorageKey {
            
            public typealias Value = Configuration
        }
        
        /// The configuration for the view renderer
        internal var configuration: Configuration {
            
            if let configuration = self.application.storage[ConfigurationKey.self] {
                return configuration
            }
            
            let configuration = Configuration()
            
            self.application.storage[ConfigurationKey.self] = configuration
            
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
        
        if let languageHeader = self.headers.first(name: .acceptLanguage) {
            return languageHeader.components(separatedBy: ",").first
        }
        
        return nil
    }
    
    /// Access to the view renderer
    public var htmlkit: ViewRenderer {
        
        if let acceptLanguage = self.acceptLanguage {
            self.application.htmlkit.environment.upsert(HTMLKit.Locale(tag: acceptLanguage), for: \HTMLKit.EnvironmentKeys.locale)
        }
        
        return .init(eventLoop: self.eventLoop, configuration: self.application.htmlkit.configuration, logger: self.logger)
    }
}

extension HTMLKit.Environment.Errors: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { self.description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension HTMLKit.Environment.Errors: DebuggableError {

    @_implements(DebuggableError, reason)
    public var debuggableReason: String {  self.description }
}

extension HTMLKit.Localization.Errors: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { self.description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension HTMLKit.Localization.Errors: DebuggableError {
    
    @_implements(DebuggableError, reason)
    public var debuggableReason: String { self.description }
}
