import HTMLKit

/// A type that holds configuration for the renderer
public final class Configuration {
    
    /// Holds the localization configuration
    internal var localization: HTMLKit.Localization
    
    /// Holds the environment configuration
    internal var environment: HTMLKit.Environment
    
    /// Holds the enabled features
    internal var features: HTMLKit.Features
    
    /// Initializes a configuration
    public init() {
        
        self.localization = Localization()
        self.environment = Environment()
        self.features = [.escaping]
    }
}
