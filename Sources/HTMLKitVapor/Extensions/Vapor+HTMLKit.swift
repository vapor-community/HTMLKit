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
            
            public typealias Value = Localization
        }
        
        internal struct EnvironmentStorageKey: StorageKey {
            
            public typealias Value = Environment
        }
        
        /// The view localization
        public var localization: Localization {
            
            if let configuration = self.application.storage[LocalizationStorageKey.self] {
                return configuration
            }
            
            let configuration = Localization()
            
            self.application.storage[LocalizationStorageKey.self] = configuration
            
            return configuration
        }
        
        /// The view environment
        public var environment: Environment {
            
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
                         environment: environment)
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
    
    /// Access to the view renderer
    public var htmlkit: ViewRenderer {
        return .init(eventLoop: self.eventLoop,
                     localization: self.application.htmlkit.localization,
                     environment: self.application.htmlkit.environment)
    }
}
