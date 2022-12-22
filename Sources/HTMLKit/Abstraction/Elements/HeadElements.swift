/*
 Abstract:
 The file contains the head elements. The html-element 'head' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element represents the document's title.
///
/// ```html
/// <title></title>
/// ```
public struct Title: ContentNode, HeadElement {

    internal var name: String { "title" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [String]
    
    public init(@ContentBuilder<String> content: () -> [String]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [String]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Title) -> Title) -> Title {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Title, T) -> Title) -> Title {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

/// The element specifies the document base url.#
///
/// ```html
/// <base>
/// ```
public struct Base: EmptyNode, HeadElement {

    internal var name: String { "base" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Base) -> Base) -> Base {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Base, T) -> Base) -> Base {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Base: ReferenceAttribute, TargetAttribute {
    
    public func reference(_ value: String) -> Base {
        return mutate(href: value)
    }
    
    public func target(_ value: Values.Target) -> Base {
        return mutate(target: value.rawValue)
    }
}

/// The element provides meta information about the document.
///
/// ```html
/// <meta></meta>
/// ```
public struct Meta: EmptyNode, HeadElement {

    internal var name: String { "meta" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Meta) -> Meta) -> Meta {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Meta, T) -> Meta) -> Meta {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Meta: ContentAttribute, NameAttribute, PropertyAttribute, CharsetAttribute, EquivalentAttribute {

    public func content(_ value: String) -> Meta {
        return mutate(content: value)
    }
    
    public func name(_ value: Values.Name) -> Meta {
        return mutate(name: value.rawValue)
    }
    
    public func property(_ value: Values.Graph) -> Meta {
        return mutate(property: value.rawValue)
    }
    
    public func charset(_ value: Values.Charset) -> Meta {
        return mutate(charset: value.rawValue)
    }
    
    public func equivalent(_ value: Values.Equivalent) -> Meta {
        return mutate(httpequiv: value.rawValue)
    }
}

/// The element contains style information for the document.
///
/// ```html
/// <style></style>
/// ```
public struct Style: ContentNode, HeadElement {

    internal var name: String { "style" }
    
    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Style) -> Style) -> Style {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Style, T) -> Style) -> Style {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Style: TypeAttribute, MediaAttribute {

    public func type(_ value: Values.Media) -> Style {
        return mutate(type: value.rawValue)
    }
    
    public func media(_ value: String) -> Style {
        return mutate(media: value)
    }
}

/// The element represents a comment output.
///
/// ```html
/// <link>
/// ```
public struct Link: EmptyNode, HeadElement {

    internal var name: String { "link" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Link) -> Link) -> Link {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Link, T) -> Link) -> Link {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Link: ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, ReferrerPolicyAttribute, RelationshipAttribute, SizesAttribute, TypeAttribute, FormEventAttribute {
    
    public func reference(_ value: String) -> Link {
        return mutate(href: value)
    }
    
    public func referenceLanguage(_ value: Values.Language) -> Link {
        return mutate(hreflang: value.rawValue)
    }
    
    public func media(_ value: String) -> Link {
        return mutate(media: value)
    }
    
    public func referrerPolicy(_ value: Values.Policy) -> Link {
        return mutate(referrerpolicy: value.rawValue)
    }
    
    public func relationship(_ value: Values.Relation) -> Link {
        return mutate(rel: value.rawValue)
    }
    
    public func sizes(_ size: Int) -> Link {
        return mutate(sizes: size)
    }
    
    public func type(_ value: Values.Media) -> Link {
        return mutate(type: value.rawValue)
    }
    
    public func on(event: Events.Form, _ value: String) -> Link {
        return mutate(key: event.rawValue, value: value)
    }
}
