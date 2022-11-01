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
        
        /// The view renderer
        public var renderer: VaporRenderer {
            return .init(eventLoop: self.application.eventLoopGroup.next(), cache: self.cache, lingo: localization)
        }
        
        public struct VariablesStorageKey: StorageKey {
            public typealias Value = VaporCache
        }
        
        /// The view cache
        public var cache: VaporCache {
            
            if let cache = self.application.storage[VariablesStorageKey.self] {
                return cache
            }
            
            let cache = VaporCache()
            
            self.application.storage[VariablesStorageKey.self] = cache
            
            return cache
        }
        
        internal struct LocalizationKey: StorageKey {
            
            public typealias Value = ViewLocalization
        }
        
        /// The view localization
        public var localization: ViewLocalization {
            
            get {
        
                if let lingo = self.application.storage[LocalizationKey.self] {
                    return lingo
                }
                
                let lingo = ViewLocalization()
                
                self.application.storage[LocalizationKey.self] = lingo
                
                return lingo
            }
            
            nonmutating set {
                self.application.storage[LocalizationKey.self] = newValue
            }
        }
        
        public let application: Application
        
        public func add<T: HTMLKit.AnyLayout>(layout: T) {
            
            let formula = HTMLKit.Formula()
            
            try? layout.prerender(formula)
            
            self.cache.upsert(name: String(reflecting: T.self), formula: formula)
        }
    }
}

extension Request {
    
    /// Access to the view renderer
    public var htmlkit: VaporRenderer {
        return .init(eventLoop: self.eventLoop, cache: self.application.htmlkit.cache, lingo: self.application.htmlkit.localization)
    }
}
