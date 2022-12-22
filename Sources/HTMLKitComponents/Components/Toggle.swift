/*
 Abstract:
 The file contains everything related to the text component.
 */

import HTMLKit

/// A component that shows an on or off state.
public struct Toggle: Component {
    
    /// The identifier of the toggle.
    internal let name: String
    
    /// The classes of the toggle.
    internal var classes: [String]
    
    /// The events of the toggle.
    internal var events: [String]?
    
    /// Creates a toggle.
    public init(name: String) {
        
        self.name = name
        self.classes = ["toggle"]
    }
    
    /// Creates a toggle.
    internal init(name: String, classes: [String], events: [String]?) {
        
        self.name = name
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Label {
            Input()
                .type(.checkbox)
                .id(name)
                .name(name)
            Division {
            }
            .class("toggle-slider")
        }
        .tabIndex(0)
        .class(classes.joined(separator: " "))
    }
    
    /// The behaviour of the toggle.
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}
