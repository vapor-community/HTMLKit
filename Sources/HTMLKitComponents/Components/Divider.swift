/*
 Abstract:
 The file contains a divider component.
 */

import HTMLKit

/// A component that seperates content visually.
public struct Divider: View {
    
    /// The classes of the divider.
    internal  var classes: [String]
    
    /// Creates a divider.
    public init() {
        self.classes = ["divider"]
    }
    
    public var body: Content {
        HorizontalRule()
            .class(classes.joined(separator: " "))
    }
}
