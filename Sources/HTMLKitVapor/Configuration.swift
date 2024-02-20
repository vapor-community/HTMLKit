import HTMLKit

/// Holds the renderer configuration
public final class Configuration {
    
    /// Holds the localization configuration
    internal var localization: HTMLKit.Localization
    
    /// Holds the environment configuration
    internal var environment: HTMLKit.Environment
    
    /// Holds the security configuration
    internal var security: HTMLKit.Security
    
    /// Holds the enabled features
    internal var features: HTMLKit.Features
    
    /// Creates a configuration
    public init() {
        
        self.localization = Localization()
        self.environment = Environment()
        self.security = Security()
        self.features = []
    }
}
