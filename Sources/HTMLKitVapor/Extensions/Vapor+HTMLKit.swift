/*
 Abstract:
 The file contains the extensions of some Vapor directives.
 */

import HTMLKit
import Vapor

extension Application.Views.Provider {
    
    /// Access to the view renderer
    public static var htmlkit: Self {
        return .init {
            $0.views.use {
                $0.htmlkit.renderer
            }
        }
    }
}

extension Application {
    
    /// Access to the vapor provider
    public var htmlkit: HtmlKit  {
        return .init(application: self)
    }
    
    /// The vapor provider
    public struct HtmlKit {
        
        internal struct CacheStorageKey: StorageKey {
            
            public typealias Value = ViewCache
        }
        
        /// The view cache
        public var views: ViewCache {
            
            if let cache = self.application.storage[CacheStorageKey.self] {
                return cache
            }
            
            let cache = ViewCache()
            
            self.application.storage[CacheStorageKey.self] = cache
            
            return cache
        }
        
        internal struct LingoStorageKey: StorageKey {
            
            public typealias Value = LingoConfiguration
        }
        
        /// The view localization
        public var lingo: LingoConfiguration {
            
            if let configuration = self.application.storage[LingoStorageKey.self] {
                return configuration
            }
            
            let configuration = LingoConfiguration()
            
            self.application.storage[LingoStorageKey.self] = configuration
            
            return configuration
        }
        
        /// The view renderer
        internal var renderer: ViewRenderer {
            return .init(eventLoop: self.application.eventLoopGroup.next(), cache: self.views, lingo: lingo)
        }
        
        /// The application dependency
        public let application: Application
        
        /// Creates the provider
        public init(application: Application) {
            
            self.application = application
        }
    }
}

extension Request {
    
    /// Access to the view renderer
    public var htmlkit: ViewRenderer {
        return .init(eventLoop: self.eventLoop, cache: self.application.htmlkit.views, lingo: self.application.htmlkit.lingo)
    }
}
