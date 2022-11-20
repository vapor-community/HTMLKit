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
        
        internal struct LingoStorageKey: StorageKey {
            
            public typealias Value = LingoConfiguration
        }
        
        internal struct ViewsStorageKey: StorageKey {
            
            public typealias Value = ViewsConfiguration
        }
        
        /// The view cache
        public var views: ViewsConfiguration {
            
            if let configuration = self.application.storage[ViewsStorageKey.self] {
                return configuration
            }
            
            let configuration = ViewsConfiguration()
            
            self.application.storage[ViewsStorageKey.self] = configuration
            
            return configuration
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
            return .init(eventLoop: self.application.eventLoopGroup.next(), views: views, lingo: lingo)
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
        return .init(eventLoop: self.eventLoop, views: self.application.htmlkit.views, lingo: self.application.htmlkit.lingo)
    }
}
