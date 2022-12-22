/*
 Abstract:
 The file contains the figure elements. The html-element 'figure' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element FigureCaption.
///
/// Figcaption is the official tag and can be used instead of FigureCaption.
///
/// ```html
/// <figcaption></figcaption>
/// ```
public typealias Figcaption = FigureCaption

/// The element is used to label a figure.
///
/// ```html
/// <figcaption></figcaption>
/// ```
public struct FigureCaption: ContentNode, FigureElement {

    internal var name: String { "figcaption" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (FigureCaption) -> FigureCaption) -> FigureCaption {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (FigureCaption, T) -> FigureCaption) -> FigureCaption {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension FigureCaption: GlobalAriaAttributes {
      
    public func aria(atomic value: Bool) -> FigureCaption {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> FigureCaption {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> FigureCaption {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> FigureCaption {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> FigureCaption {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> FigureCaption {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> FigureCaption {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> FigureCaption {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> FigureCaption {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> FigureCaption {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> FigureCaption {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> FigureCaption {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> FigureCaption {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> FigureCaption {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> FigureCaption {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> FigureCaption {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> FigureCaption {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> FigureCaption {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> FigureCaption {
        return mutate(ariaroledescription: value)
    }
}
