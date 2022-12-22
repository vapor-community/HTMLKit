/*
 Abstract:
 The file contains the list elements. The html-element 'ol' or 'ul' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element ListItem.
///
/// Li is the official tag and can be used instead of ListItem.
///
/// ```html
/// <li></li>
/// ```
public typealias Li = ListItem

/// The element represents a item of a list.
///
/// ```html
/// <li></li>
/// ```
public struct ListItem: ContentNode, ListElement {

    internal var name: String { "li" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (ListItem) -> ListItem) -> ListItem {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (ListItem, T) -> ListItem) -> ListItem {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension ListItem: GlobalAriaAttributes, ValueAttribute {
    
    public func value(_ value: String) -> ListItem {
        return mutate(value: value)
    }
    
    public func aria(atomic value: Bool) -> ListItem {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> ListItem {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> ListItem {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> ListItem {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> ListItem {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> ListItem {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> ListItem {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> ListItem {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> ListItem {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> ListItem {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> ListItem {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> ListItem {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> ListItem {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> ListItem {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> ListItem {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> ListItem {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> ListItem {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> ListItem {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> ListItem {
        return mutate(ariaroledescription: value)
    }
}
