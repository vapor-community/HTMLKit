import HTMLKit
import Vapor

/// A type that holds configuration for the renderer.
internal final class Configuration: @unchecked Sendable {
    
    /// Holds the localization configuration.
    internal var localization: Localization
    
    /// Holds the environment configuration.
    internal var environment: HTMLKit.Environment
    
    /// Holds the enabled features.
    internal var features: Features
    
    /// Create a configuration.
    internal init() {
        
        self.localization = Localization()
        self.environment = Environment()
        self.features = [.escaping]
    }
    
    /// Create a configuration.
    /// 
    /// - Parameters:
    ///   - localization: The localization configuration to hold.
    ///   - environment: The environment configuration to hold.
    ///   - features: The enabled features to hold.
    internal init(localization: Localization, environment: HTMLKit.Environment, features: Features) {
        
        self.localization = localization
        self.environment = environment
        self.features = features
    }
}

extension Configuration {
    
    /// The key used to store the configuration in the storage.
    internal struct StorageKey: Vapor.StorageKey {
        
        internal typealias Value = Configuration
    }
}
