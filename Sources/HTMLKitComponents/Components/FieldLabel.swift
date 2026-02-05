import HTMLKit

/// A view that represents a field label.
///
/// Use `FieldLabel` to display the name for the form control.
///
/// ```swift
/// FieldLabel(for: "lorem") {
///     "Lorem ipsum"
/// }
/// ```
public struct FieldLabel: View {
    
    /// The identifier of the element the label is related to.
    internal let id: String
    
    /// The body content of the label.
    internal let content: [Content]
    
    /// The class names for the label.
    internal var classes: [String]
    
    /// The event handlers on the label.
    internal var events: [String]?
    
    /// Create a field label.
    ///
    /// - Parameters:
    ///   - id: The identifier of the field to associate the label with.
    ///   - content: The text content to display in the label.
    public init(for id: String, @ContentBuilder<Content> content: () -> [Content]) {
      
        self.id = id
        self.content = content()
        self.classes = ["label"]
    }
    
    /// Create a field label.
    ///
    /// - Parameters:
    ///   - localizedStringKey: The key of the localized string to look for.
    ///   - id: The identifier of the field to associate the label with.
    public init(_ localizedStringKey: LocalizedStringKey, for id: String) {
        
        self.id = id
        self.content = [LocalizedString(key: localizedStringKey)]
        self.classes = ["label"]
    }
    
    public var body: Content {
        Label {
            content
        }
        .for(id)
        .class(classes)
    }
}
