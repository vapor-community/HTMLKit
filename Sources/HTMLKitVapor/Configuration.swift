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
    
    /**
     Create a new configuration by duplicating the given configuration.
     
     The is mostly meant as an internal convenience and should rarely be used. 
     
     - Important: The configuration contains many variables which are also reference types (why?? it’s a configuration, everything should be value types… but I diverge).
     This init will _not_ deep copy the references. */
    internal init(duplicating otherConfiguration: Configuration) {
        self.localization = otherConfiguration.localization
        self.environment = otherConfiguration.environment
        self.features = otherConfiguration.features
    }
}
