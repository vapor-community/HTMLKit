import Foundation
import HTMLKit

final public class ViewsConfiguration {
    
    private(set) var renderer: Renderer
    
    public init() {

        self.renderer = Renderer()
    }
    
    /// Adds a view to the storage
    public func add(view: some View) {
        self.renderer.add(view: view)
    }
    
    /// Adds the view of page to the storage
    public func add(page: some Page) {
        
        for view in page.views {
            self.renderer.add(view: view)
        }
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
