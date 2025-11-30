import Foundation
import OrderedCollections

/// An element that represents a media source.
///
/// Use `Source` to specify multiple alternative sources for media elements like ``Audio`` or ``Video``.
///
/// ```swift
/// Video {
///     Source()
///         .source("...mp4")
///     Source()
///         .source("...ogg")
/// }
/// ```
public struct Source: EmptyNode, MediaElement {

    internal var name: String { "source" }

    internal var attributes: OrderedDictionary<String, Any>?

    /// Create a source.
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

extension Source: GlobalAttributes, GlobalEventAttributes, TypeAttribute, SourceAttribute, SizesAttribute, MediaAttribute, WidthAttribute, HeightAttribute, SourceSetAttribute {
    
    public func accessKey(_ value: Character) -> Source {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Source {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Source {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Source {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Source {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Source {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Source {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Source {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Source {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Source {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Source {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, unavailable, message: "Use the inputMode(_:) modifier instead.")
    public func inputMode(_ value: String) -> Source {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Source {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Source {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Source {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Source {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Source {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Source {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Source {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Source {
        return mutate(itemscope: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Source {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Source {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Source {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Source {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Source {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Source {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Source {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Source {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Source {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Source {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Source {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Source {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Source {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Source {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Source {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func type(_ value: Values.Media) -> Source {
        return mutate(type: value.rawValue)
    }
    
    public func source(_ value: String) -> Source {
        return mutate(source: value)
    }
    
    public func source(_ value: EnvironmentValue) -> Source {
        return mutate(source: value)
    }
    
    @available(*, deprecated, message: "Use the sourceSet(_:) modifier instead.")
    public func sourceSet(_ value: String) -> Source {
        return mutate(sourceset: value)
    }
    
    public func sourceSet(_ candidates: [SourceCandidate]) -> Source {
        return mutate(sourceset: candidates.map { $0.rawValue }.joined(separator: ", "))
    }
    
    public func sourceSet(_ candidates: SourceCandidate...) -> Source {
        return mutate(sourceset: candidates.map { $0.rawValue }.joined(separator: ", "))
    }
    
    public func sizes(_ candidates: [SizeCandidate]) -> Source {
        return mutate(sizes: candidates.map { $0.rawValue }.joined(separator: ", "))
    }
    
    public func sizes(_ candidates: SizeCandidate...) -> Source {
        return mutate(sizes: candidates.map { $0.rawValue }.joined(separator: ", "))
    }
    
    public func media(_ value: String) -> Source {
        return mutate(media: value)
    }
    
    public func media(_ queries: [MediaQuery]) -> Source {
        return mutate(media: queries.map { $0.rawValue }.joined(separator: ", "))
    }
    
    public func media(_ queries: MediaQuery...) -> Source {
        return mutate(media: queries.map { $0.rawValue }.joined(separator: ", "))
    }
    
    public func width(_ size: Int) -> Source {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Source {
        return mutate(height: size)
    }
    
    public func popover(_ value: Values.Popover.State) -> Source {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Source {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
}

/// An element that represents a text track.
///
/// Use `Track` to specify timed text tracks for media elements like ``Audio`` or ``Video``.
///
/// ```swift
/// Video {
///     Source()
///         .source("...mp4")
///         .type(.mp4)
///     Track()
///         .source("...vtt")
///         .kind(.subtitles)
///         .label("English")
/// }
/// ```
public struct Track: EmptyNode, MediaElement {

    internal var name: String { "track" }

    internal var attributes: OrderedDictionary<String, Any>?

    /// Create a track.
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

extension Track: GlobalAttributes, GlobalEventAttributes, KindAttribute, SourceAttribute, LabelAttribute, DefaultAttribute, SourceLanguageAttribute {
    
    public func accessKey(_ value: Character) -> Track {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Track {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Track {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Track {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Track {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Track {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Track {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Track {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Track {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Track {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Track {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, unavailable, message: "Use the inputMode(_:) modifier instead.")
    public func inputMode(_ value: String) -> Track {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Track {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Track {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as  schema: URL? = nil, for elements: [String]? = nil) -> Track {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as  schema: URL? = nil, for elements: String...) -> Track {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Track {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Track {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Track {
        return mutate(itemref: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Track {
        return mutate(itemtype: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Track {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Track {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Track {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Track {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Track {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Track {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Track {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Track {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Track {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Track {
        return  mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Track {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Track {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Track {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Track {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Track {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func kind(_ value: Values.Kind) -> Track {
        return mutate(kind: value.rawValue)
    }
    
    public func source(_ value: String) -> Track {
        return mutate(source: value)
    }
    
    public func source(_ value: EnvironmentValue) -> Track {
        return mutate(source: value)
    }
    
    public func sourceLanguage(_ value: Values.Language) -> Track {
        return mutate(sourcelanguage: value.rawValue)
    }
    
    public func label(_ value: String) -> Track {
        return mutate(label: value)
    }
    
    public func `default`() -> Track {
        return  mutate(default: "default")
    }
    
    public func popover(_ value: Values.Popover.State) -> Track {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Track {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
}
