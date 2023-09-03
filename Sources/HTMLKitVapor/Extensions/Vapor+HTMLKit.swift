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
        
        internal struct LocalizationStorageKey: StorageKey {
            
            public typealias Value = HTMLKit.Localization
        }
        
        internal struct EnvironmentStorageKey: StorageKey {
            
            public typealias Value = HTMLKit.Environment
        }
        
        internal struct SecurityStorageKey: StorageKey {
            
            public typealias Value = HTMLKit.Security
        }
        
        public var security: HTMLKit.Security {
            
            if let configuration = self.application.storage[SecurityStorageKey.self] {
                return configuration
            }
            
            let configuration = Security()
            
            self.application.storage[SecurityStorageKey.self] = configuration
            
            return configuration
        }
        
        /// The view localization
        public var localization: HTMLKit.Localization {
            
            if let configuration = self.application.storage[LocalizationStorageKey.self] {
                return configuration
            }
            
            let configuration = Localization()
            
            self.application.storage[LocalizationStorageKey.self] = configuration
            
            return configuration
        }
        
        /// The view environment
        public var environment: HTMLKit.Environment {
            
            if let configuration = self.application.storage[EnvironmentStorageKey.self] {
                return configuration
            }
            
            let configuration = Environment()
            
            self.application.storage[EnvironmentStorageKey.self] = configuration
            
            return configuration
        }
        
        /// The view renderer
        internal var renderer: ViewRenderer {
            
            return .init(eventLoop: application.eventLoopGroup.next(),
                         localization: localization,
                         environment: environment,
                         security: security)
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
            self.application.htmlkit.localization.set(locale: acceptLanguage)
        }
        
        return .init(eventLoop: self.eventLoop,
                     localization: self.application.htmlkit.localization,
                     environment: self.application.htmlkit.environment,
                     security: self.application.htmlkit.security)
    }
}
