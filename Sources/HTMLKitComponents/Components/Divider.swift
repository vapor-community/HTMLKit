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
    
    /// Creates a divider.
    internal init(classes: [String]) {
        self.classes = classes
    }
    
    public var body: AnyContent {
        HorizontalRule()
            .class(classes.joined(separator: " "))
    }
}
