/*
 Abstract:
 The file contains the input elements. The html-element 'input' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element OptionGroup.
///
/// Optgroup is the official tag and can be used instead of OptionGroup.
///
/// ```html
/// <optgroup></optgroup>
/// ```
public typealias Optgroup = OptionGroup

/// The element represents a group of options.
///
/// ```html
/// <optgroup></optgroup>
/// ```
public struct OptionGroup: ContentElement {

    internal var name: String { "optgroup" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension OptionGroup: DisabledAttribute, LabelAttribute {

    public func disabled() -> OptionGroup {
        return mutate(disabled: "disabled")
    }
    
    public func label(_ value: String) -> OptionGroup {
        return mutate(label: value)
    }
    
    public func label(_ value: Property<String>) -> OptionGroup {
        return mutate(label: value)
    }
}

/// The element represents an option.
///
/// ```html
/// <option></option>
/// ```
public struct Option: ContentElement {

    internal var name: String { "option" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [String]

    public init(@ContentBuilder<String> content: () -> [String]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [String]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Option: DisabledAttribute, LabelAttribute, ValueAttribute, SelectedAttribute {
    
    public func disabled() -> Option {
        return mutate(disabled: "disabled")
    }
    
    public func label(_ value: String) -> Option {
        return mutate(label: value)
    }
    
    public func label(_ value: Property<String>) -> Option {
        return mutate(label: value)
    }
    
    public func value(_ value: String) -> Option {
        return mutate(value: value)
    }
    
    public func value(_ value: Property<String>) -> Option {
        return mutate(value: value)
    }
    
    public func selected() -> Option {
        return mutate(selected: "selected")
    }
}

/// The element represents a caption for the rest of the contents of a fieldset.
///
/// ```html
/// <legend></legend>
/// ```
public struct Legend: ContentElement {

    internal var name: String { "legend" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        
        self.attributes = attributes
        self.content = content
    }
}

/// The element represents a summary, caption, or legend for the rest of the content.
///
/// ```html
/// <summary></summary>
/// ```
public struct Summary: ContentElement {

    internal var name: String { "summary" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}
