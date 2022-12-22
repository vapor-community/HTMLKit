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
public struct OptionGroup: ContentNode, InputElement {

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
    
    public func modify(if condition: Bool, element: (OptionGroup) -> OptionGroup) -> OptionGroup {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (OptionGroup, T) -> OptionGroup) -> OptionGroup {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension OptionGroup: GlobalAriaAttributes, DisabledAttribute, LabelAttribute {
    
    public func disabled() -> OptionGroup {
        return mutate(disabled: "disabled")
    }
    
    public func label(_ value: String) -> OptionGroup {
        return mutate(label: value)
    }
    
    public func aria(atomic value: Bool) -> OptionGroup {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> OptionGroup {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> OptionGroup {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> OptionGroup {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> OptionGroup {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> OptionGroup {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> OptionGroup {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> OptionGroup {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> OptionGroup {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> OptionGroup {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> OptionGroup {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> OptionGroup {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> OptionGroup {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> OptionGroup {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> OptionGroup {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> OptionGroup {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> OptionGroup {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> OptionGroup {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> OptionGroup {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents an option.
///
/// ```html
/// <option></option>
/// ```
public struct Option: ContentNode, InputElement {

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
    
    public func modify(if condition: Bool, element: (Option) -> Option) -> Option {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Option, T) -> Option) -> Option {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Option: GlobalAriaAttributes, DisabledAttribute, LabelAttribute, ValueAttribute, SelectedAttribute {

    public func disabled() -> Option {
        return mutate(disabled: "disabled")
    }
    
    public func label(_ value: String) -> Option {
        return mutate(label: value)
    }
    
    public func value(_ value: String) -> Option {
        return mutate(value: value)
    }
    
    public func selected() -> Option {
        return mutate(selected: "selected")
    }
    
    public func aria(atomic value: Bool) -> Option {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Option {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Option {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Option {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Option {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Option {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Option {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Option {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Option {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Option {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Option {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Option {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Option {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Option {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Option {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Option {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Option {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Option {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Option {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents a caption for the rest of the contents of a fieldset.
///
/// ```html
/// <legend></legend>
/// ```
public struct Legend: ContentNode, InputElement {

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
    
    public func modify(if condition: Bool, element: (Legend) -> Legend) -> Legend {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Legend, T) -> Legend) -> Legend {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Legend: GlobalAriaAttributes {
    
    public func aria(atomic value: Bool) -> Legend {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Legend {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Legend {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Legend {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Legend {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Legend {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Legend {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Legend {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Legend {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Legend {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Legend {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Legend {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Legend {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Legend {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Legend {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Legend {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Legend {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Legend {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Legend {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents a summary, caption, or legend for the rest of the content.
///
/// ```html
/// <summary></summary>
/// ```
public struct Summary: ContentNode, InputElement {

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
    
    public func modify(if condition: Bool, element: (Summary) -> Summary) -> Summary {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Summary, T) -> Summary) -> Summary {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Summary: GlobalAriaAttributes {
    
    public func aria(atomic value: Bool) -> Summary {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Summary {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Summary {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Summary {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Summary {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Summary {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Summary {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Summary {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Summary {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Summary {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Summary {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Summary {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Summary {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Summary {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Summary {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Summary {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Summary {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Summary {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Summary {
        return mutate(ariaroledescription: value)
    }
}
