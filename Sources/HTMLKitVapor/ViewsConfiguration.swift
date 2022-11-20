import Foundation
import HTMLKit

final public class ViewsConfiguration {
    
    private(set) var renderer: Renderer
    
    public init() {

        self.renderer = Renderer()
    }
    
    /// Adds a view to the storage
    public func add(view: some AnyLayout) {
        self.renderer.add(layout: view)
    }
    
    /// Sets the root path
    public func set(calendar: Calendar) {
        self.renderer.calendar = calendar
    }
    
    /// Sets the default locale indentifier
    public func set(timezone: TimeZone) {
        self.renderer.timeZone = timezone
    }
}
