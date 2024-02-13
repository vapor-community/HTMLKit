import HTMLKit

public final class Configuration {
    
    var localization: HTMLKit.Localization
    var environment: HTMLKit.Environment
    var security: HTMLKit.Security
    var features: HTMLKit.Features
    
    init() {
        
        self.localization = Localization()
        self.environment = Environment()
        self.security = Security()
        self.features = []
    }
}
