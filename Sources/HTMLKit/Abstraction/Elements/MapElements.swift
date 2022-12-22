/*
 Abstract:
 The file contains the map elements. The html-element 'map' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element defines an image map.
///
/// ```html
/// <area></area>
/// ```
public struct Area: ContentNode, MapElement {

    internal var name: String { "area" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Area) -> Area) -> Area {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Area, T) -> Area) -> Area {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Area: GlobalAriaAttributes, AlternateAttribute, CoordinatesAttribute, ShapeAttribute, ReferenceAttribute, TargetAttribute, DownloadAttribute, PingAttribute, RelationshipAttribute, ReferrerPolicyAttribute {
    
    public func alternate(_ value: String) -> Area {
        return mutate(alternate: value)
    }
    
    public func coordinates(_ value: String) -> Area {
        return mutate(coords: value)
    }
    
    public func shape(_ value: Values.Shape) -> Area {
        return mutate(shape: value.rawValue)
    }
    
    public func reference(_ value: String) -> Area {
        return mutate(href: value)
    }
    
    public func target(_ value: Values.Target) -> Area {
        return mutate(target: value.rawValue)
    }
    
    public func download() -> Area {
        return mutate(download: "download")
    }
    
    public func ping(_ value: String) -> Area {
        return mutate(ping: value)
    }
    
    public func relationship(_ value: Values.Relation) -> Area {
        return mutate(rel: value.rawValue)
    }
    
    public func referrerPolicy(_ value: Values.Policy) -> Area {
        return mutate(referrerpolicy: value.rawValue)
    }
    
    public func aria(atomic value: Bool) -> Area {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Area {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Area {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Area {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Area {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Area {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Area {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Area {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Area {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Area {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Area {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Area {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Area {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Area {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Area {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Area {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Area {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Area {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Area {
        return mutate(ariaroledescription: value)
    }
}
