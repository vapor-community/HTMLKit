import HTMLKit

/// A view that represents an option picker.
///
/// Use `Picker` to pick an option.
///
/// ```swift
/// Picker(name: "lorem", selection: "ipsum") {
///     CheckField(value: "ipsum") {
///         "Lorem ipsum"
///     }
///     .tag("ipsum")
/// }
/// ```
public struct Picker: View, Modifiable, Identifiable {
    
    /// The unique identifier of the picker.
    internal var id: String?

    /// The name of the picker.
    internal let name: String
    
    /// The selected value of the available options.
    internal let selection: String?
    
    /// The body content of the picker.
    internal let content: [Selectable]
    
    /// The class names of the picker.
    internal var classes: [String]
    
    /// Create a picker.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - selection: The option to preselect.
    ///   - content: The picker's content.
    public init(name: String, selection: String? = nil, @ContentBuilder<CheckField> content: () -> [CheckField]) {
        
        self.name = name
        self.selection = selection
        self.content = content()
        self.classes = ["picker"]
    }
    
    /// Create a picker.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - selection: The option to preselect.
    ///   - content: The picker's content.
    public init(name: String, selection: String? = nil, @ContentBuilder<RadioSelect> content: () -> [RadioSelect]) {
        
        self.name = name
        self.selection = selection
        self.content = content()
        self.classes = ["picker"]
    }
    
    public var body: Content {
        Division {
            for item in content {
                item.selected(item.value == selection)
                    .tag(name)
            }
        }
        .class(classes)
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the picker.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The picker
    public func tag(_ value: String) -> Picker {
        return self.mutate(id: value)
    }
}
