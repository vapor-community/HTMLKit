/*
 Abstract:
 The file contains the extensions of some Vapor directives.
 */

import HTMLKit
import Vapor

extension Application {
    
    /// Access to the vapor provider
    public var htmlkit: HtmlKit  {
        return .init(application: self)
    }
    
    /// The vapor provider
    public struct HtmlKit {
        
        public var security: HTMLKit.Security {
            
            get {
                self.configuration.security
            }
            
            nonmutating set {
                self.configuration.security = newValue
            }
        }
        
        public var environment: HTMLKit.Environment {
            
            get {
                self.configuration.environment
            }
            
            nonmutating set {
                self.configuration.environment = newValue
            }
        }
        
        public var localization: HTMLKit.Localization {
            
            get {
                self.configuration.localization
            }
            
            nonmutating set {
                self.configuration.localization = newValue
            }
        }
        
        public var features: HTMLKit.Features {
            
            get {
                self.configuration.features
            }
            
            nonmutating set {
                self.configuration.features = newValue
            }
        }
        
        internal struct ConfigurationKey: StorageKey {
            
            public typealias Value = Configuration
        }
        
        /// The configuration storage
        internal var configuration: Configuration {
            
            if let configuration = self.application.storage[ConfigurationKey.self] {
                return configuration
            }
            
            let configuration = Configuration()
            
            self.application.storage[ConfigurationKey.self] = configuration
            
            return configuration
        }
        
        /// The view renderer
        internal var renderer: ViewRenderer {
            
            return .init(eventLoop: application.eventLoopGroup.next(), configuration: configuration, logger: application.logger)
        }
        
        /// The application dependency
        internal let application: Application
        
        /// Creates the provider
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
            self.application.htmlkit.environment.locale = HTMLKit.Locale(tag: acceptLanguage)
        }
        
        return .init(eventLoop: self.eventLoop, configuration: self.application.htmlkit.configuration, logger: self.logger)
    }
}

extension HTMLKit.Renderer.Errors: AbortError {
 
    @_implements(AbortError, reason)
    public var abortReason: String { self.description }
    
    public var status: HTTPResponseStatus { .internalServerError }
}

extension HTMLKit.Renderer.Errors: DebuggableError {

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
