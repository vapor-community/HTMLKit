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
public struct Area: ContentElement {

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
}

extension Area: AlternateAttribute, CoordinatesAttribute, ShapeAttribute, ReferenceAttribute, TargetAttribute, DownloadAttribute, PingAttribute, RelationshipAttribute, ReferrerPolicyAttribute {
    
    public func alternate(_ value: String) -> Area {
        return mutate(alternate: value)
    }
    
    public func alternate(_ value: Property<String>) -> Area {
        return mutate(alternate: value)
    }
    
    public func coordinates(_ value: String) -> Area {
        return mutate(coords: value)
    }
    
    public func coordinates(_ value: Property<String>) -> Area {
        return mutate(coords: value)
    }
    
    public func shape(_ value: Values.Shape) -> Area {
        return mutate(shape: value.rawValue)
    }
    
    public func reference(_ value: String) -> Area {
        return mutate(href: value)
    }
    
    public func reference(_ value: Property<String>) -> Area {
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
    
    public func ping(_ value: Property<String>) -> Area {
        return mutate(ping: value)
    }
    
    public func relationship(_ value: Values.Relation) -> Area {
        return mutate(rel: value.rawValue)
    }
    
    public func referrerPolicy(_ value: Values.Policy) -> Area {
        return mutate(referrerpolicy: value.rawValue)
    }
}
