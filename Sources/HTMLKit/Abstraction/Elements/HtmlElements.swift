/*
 Abstract:
 The file contains the html elements. The html-element 'html' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element contains the information about the document's content.
///
/// ```html
/// <head></head>
/// ```
public struct Head: ContentNode, HtmlElement {

    internal var name: String { "head" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [HeadElement]

    public init(@ContentBuilder<HeadElement> content: () -> [HeadElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [HeadElement]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Head) -> Head) -> Head {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Head, T) -> Head) -> Head {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

/// The element contains the document's content.
///
/// ```html
/// <body></body>
/// ```
public struct Body: ContentNode, HtmlElement {

    internal var name: String { "body" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [BodyElement]

    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [BodyElement]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Body) -> Body) -> Body {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Body, T) -> Body) -> Body {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Body: GlobalAriaAttributes, WindowEventAttribute {
    
    public func on(event: Events.Window, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> Body {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Body {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Body {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Body {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Body {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Body {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Body {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Body {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Body {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Body {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Body {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Body {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Body {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Body {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Body {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Body {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Body {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Body {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Body {
        return mutate(ariaroledescription: value)
    }
}
