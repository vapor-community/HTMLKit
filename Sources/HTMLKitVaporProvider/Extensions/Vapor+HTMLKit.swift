/*
 Abstract:
 The file contains the extensions of some Vapor directives.
 */

import HTMLKit
import Vapor

extension Application.Views.Provider {
    
    public static var htmlkit: Self {
        return .init {
            $0.views.use {
                $0.htmlkit.renderer
            }
        }
    }
}

extension Application {
    
    public var htmlkit: HtmlKit  {
        return .init(application: self)
    }
    
    public struct HtmlKit {
        
        public let application: Application
        
        public var renderer: VaporRenderer {
            return .init(eventLoop: self.application.eventLoopGroup.next(), cache: self.cache)
        }
        
        public struct VariablesStorageKey: StorageKey {
            public typealias Value = VaporCache
        }
        
        public var cache: VaporCache {
            
            if let cache = self.application.storage[VariablesStorageKey.self] {
                return cache
                
            } else {
                
                let cache = VaporCache()
                
                self.application.storage[VariablesStorageKey.self] = cache
                
                return cache
            }
        }
        
        public func add<T: HTMLKit.AnyLayout>(layout: T) {
            self.renderer.add(layout: layout)
        }
    }
}

extension Request {
    
    public var htmlkit: VaporRenderer {
        return .init(eventLoop: self.eventLoop, cache: self.application.htmlkit.cache)
    }
}
