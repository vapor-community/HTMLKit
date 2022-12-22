/*
 Abstract:
 The file contains the media elements. The html-element 'audio' or 'video' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element allows authors to specify multiple alternative source for other elements.
///
/// ```html
/// <source>
/// ```
public struct Source: EmptyNode, MediaElement {

    internal var name: String { "source" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Source) -> Source) -> Source {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Source, T) -> Source) -> Source {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Source: TypeAttribute, SourceAttribute, SizesAttribute, MediaAttribute, WidthAttribute, HeightAttribute {

    public func type(_ value: Values.Media) -> Source {
        return mutate(type: value.rawValue)
    }
    
    public func source(_ value: String) -> Source {
        return mutate(source: value)
    }
    
    public func sizes(_ size: Int) -> Source {
        return mutate(sizes: size)
    }
    
    public func media(_ value: String) -> Source {
        return mutate(media: value)
    }
    
    public func width(_ size: Int) -> Source {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Source {
        return mutate(height: size)
    }
}

/// The element allows to specify explicit external timed text tracks for media elements.
///
/// ```html
/// <track>
/// ```
public struct Track: EmptyNode, MediaElement {

    internal var name: String { "track" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Track) -> Track) -> Track {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Track, T) -> Track) -> Track {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Track: KindAttribute, SourceAttribute, LabelAttribute, DefaultAttribute {
    
    public func kind(_ value: Values.Kind) -> Track {
        return mutate(kind: value.rawValue)
    }
    
    public func source(_ value: String) -> Track {
        return mutate(source: value)
    }
    
    public func label(_ value: String) -> Track {
        return mutate(label: value)
    }
    
    public func `default`() -> Track {
        return  mutate(default: "default")
    }
}
