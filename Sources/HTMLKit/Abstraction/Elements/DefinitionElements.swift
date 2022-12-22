/*
 Abstract:
 The file contains the definition elements. The html-element 'description' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element TermName.
///
/// Dt is the official tag and can be used instead of TermName.
///
/// ```html
/// <dt>
/// ```
public typealias Dt = TermName

/// The alias for the element TermDefinition.
///
/// Dd is the official tag and can be used instead of TermDefinition.
///
/// ```html
/// <dd></dd>
/// ```
public typealias Dd = TermDefinition

/// The element specifies a term name.
///
/// ```html
/// <dt>
/// ```
public struct TermName: ContentNode, DescriptionElement {

    internal var name: String { "dt" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TermName) -> TermName) -> TermName {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TermName, T) -> TermName) -> TermName {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TermName: GlobalAriaAttributes {
    
    public func aria(atomic value: Bool) -> TermName {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TermName {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TermName {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TermName {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TermName {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TermName {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TermName {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TermName {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TermName {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TermName {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TermName {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TermName {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TermName {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TermName {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TermName {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TermName {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TermName {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TermName {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TermName {
        return mutate(ariaroledescription: value)
    }
}

/// The element specifies a term definition.
///
/// ```html
/// <dd></dd>
/// ```
public struct TermDefinition: ContentNode, DescriptionElement {

    internal var name: String { "dd" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TermDefinition) -> TermDefinition) -> TermDefinition {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TermDefinition, T) -> TermDefinition) -> TermDefinition {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TermDefinition: GlobalAriaAttributes {
    
    public func aria(atomic value: Bool) -> TermDefinition {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TermDefinition {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TermDefinition {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TermDefinition {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TermDefinition {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TermDefinition {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TermDefinition {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TermDefinition {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TermDefinition {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TermDefinition {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TermDefinition {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TermDefinition {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TermDefinition {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TermDefinition {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TermDefinition {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TermDefinition {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TermDefinition {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TermDefinition {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TermDefinition {
        return mutate(ariaroledescription: value)
    }
}
