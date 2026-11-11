import Foundation
import OrderedCollections

/// The alias for the element ``RubyText``.
@_documentation(visibility: internal)
public typealias Rt = RubyText

/// The alias for the element ``RubyPronunciation``.
@_documentation(visibility: internal)
public typealias Rp = RubyPronunciation

/// An element that represents a ruby annotation.
///
/// Use `RubyText` to help with the pronunciation or meaning of the base character.
///
/// ```swift
/// Ruby {
///     "改"
///     RubyText {
///         "かい"
///     }
/// }
/// ```
public struct RubyText: ContentNode, RubyElement {

    internal var name: String { "rt" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a ruby text.
    ///
    /// - Parameter content: The text's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (RubyText) -> RubyText) -> RubyText {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (RubyText, T) -> RubyText) -> RubyText {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension RubyText: GlobalContentAttributes, GlobalEventAttributes, GlobalAccessibilityAttributes {
    
    public func accessKey(_ value: Character) -> RubyText {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> RubyText {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> RubyText {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> RubyText {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> RubyText {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func editable(_ value: Bool = true) -> RubyText {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> RubyText {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> RubyText {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> RubyText {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> RubyText {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func hidden(_ value: Values.Condition) -> RubyText {
        return mutate(hidden: .init(value.rawValue, context: .trusted))
    }
    
    public func inputMode(_ value: Values.Mode) -> RubyText {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> RubyText {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> RubyText {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        if let elements = elements {
            copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        }
        
        return copy
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> RubyText {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        
        return copy
    }

    public func itemProperty(_ value: String) -> RubyText {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> RubyText {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> RubyText {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> RubyText {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ values: [Values.Role]) -> RubyText {
        return mutate(role: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func role(_ values:  Values.Role...) -> RubyText {
        return mutate(role: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> RubyText {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> RubyText {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> RubyText {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> RubyText {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyText {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> RubyText {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func translate(_ value: Bool = true) -> RubyText {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> RubyText {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> RubyText {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> RubyText {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> RubyText {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> RubyText {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> RubyText {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> RubyText {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> RubyText {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func accessibilityAtomic(_ value: Bool = true) -> RubyText {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func accessibilityBusy(_ value: Bool = true) -> RubyText {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func accessibilityControls(_ ids: [String]) -> RubyText {
        return mutate(ariacontrols: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityControls(_ ids: String...) -> RubyText {
        return mutate(ariacontrols: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityCurrent(_ value: Values.Accessibility.Current) -> RubyText {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityCurrent(_ value: Bool = true) -> RubyText {
        return mutate(ariacurrent: .init(value, context: .trusted))
    }
    
    public func accessibilityDescriptions(_ ids: [String]) -> RubyText {
        return mutate(ariadescribedby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityDescriptions(_ ids: String...) -> RubyText {
        return mutate(ariadescribedby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityDetail(_ id: String) -> RubyText {
        return mutate(ariadetails: .init(id, context: .tainted(.html)))
    }
    
    @available(*, unavailable)
    public func accessibilityDisabled(_ value: Bool = true) -> RubyText {
        return mutate(key: "aria-disabled", value: .init(value, context: .trusted))
    }
    
    public func accessibilityFlow(_ ids: [String]) -> RubyText {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityFlow(_ ids: String...) -> RubyText {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    @available(*, unavailable)
    public func accessibilityPopup(_ value: Values.Accessibility.Popup) -> RubyText {
        return mutate(key: "aria-haspopup", value: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityHidden(_ value: Bool = true) -> RubyText {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    @available(*, unavailable)
    public func accessibilityInvalid(_ value: Values.Accessibility.Invalid) -> RubyText {
        return mutate(key: "aria-invalid", value: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, unavailable)
    public func accessibilityInvalid(_ value: Bool = true, message id: String? = nil) -> RubyText {

        if let id = id {
            return mutate(key: "aria-invalid", value: .init(value, context: .trusted)).mutate(key: "aria-errormessage", value: .init(id, context: .tainted(.html)))
        }
        
        return mutate(key: "aria-invalid", value: .init(value, context: .trusted))
    }
    
    public func accessibilityShortcuts(_ values: [KeyboardShortcut]) -> RubyText {
        return mutate(ariakeyshortcuts: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func accessibilityShortcuts(_ values: KeyboardShortcut...) -> RubyText {
        return mutate(ariakeyshortcuts: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    @_disfavoredOverload
    public func accessibilityLabel(_ value: String) -> RubyText {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyText {
        return mutate(arialabel: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityLabel(verbatim value: String) -> RubyText {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabels(_ ids: [String]) -> RubyText {
        return mutate(arialabeledby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityLabels(_ ids: String...) -> RubyText {
        return mutate(arialabeledby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityLive(_ value: Values.Accessibility.Live) -> RubyText {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityOwns(_ ids: [String]) -> RubyText {
        return mutate(ariaowns: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityOwns(_ ids: String...) -> RubyText {
        return mutate(ariaowns: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityRelevant(_ values: [Values.Accessibility.Relevant]) -> RubyText {
        return mutate(ariarelevant: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func accessibilityRelevant(_ values: Values.Accessibility.Relevant...) -> RubyText {
        return mutate(ariarelevant: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    @_disfavoredOverload
    public func accessibilityRoleDescription(_ value: String) -> RubyText {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityRoleDescription(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyText {
        return mutate(ariaroledescription: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityRoleDescription(verbatim value: String) -> RubyText {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}

/// An element that represents the ruby fallback.
///
/// Use `RubyPronunciation` to provide an alternative text for browsers that don't support ``Ruby``.
///
/// ```swift
/// Ruby {
///     "改"
///     RubyPronuncation {
///         "("
///     }
///     RubyText {
///         "かい"
///     }
///     RubyPronuncation {
///         ")"
///     }
/// }
/// ```
public struct RubyPronunciation: ContentNode, RubyElement {

    internal var name: String { "rp" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext
    
    /// Create a ruby pronunciation.
    ///
    /// - Parameter content: The pronunciation's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (RubyPronunciation) -> RubyPronunciation) -> RubyPronunciation {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (RubyPronunciation, T) -> RubyPronunciation) -> RubyPronunciation {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension RubyPronunciation: GlobalContentAttributes, GlobalEventAttributes, GlobalAccessibilityAttributes {
    
    public func accessKey(_ value: Character) -> RubyPronunciation {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> RubyPronunciation {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> RubyPronunciation {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> RubyPronunciation {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> RubyPronunciation {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func editable(_ value: Bool = true) -> RubyPronunciation {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> RubyPronunciation {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> RubyPronunciation {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> RubyPronunciation {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> RubyPronunciation {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func hidden(_ value: Values.Condition) -> RubyPronunciation {
        return mutate(hidden: .init(value.rawValue, context: .trusted))
    }

    public func inputMode(_ value: Values.Mode) -> RubyPronunciation {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }
    
    public func `is`(_ value: String) -> RubyPronunciation {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> RubyPronunciation {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        if let elements = elements {
            copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        }
        
        return copy
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> RubyPronunciation {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        
        return copy
    }

    public func itemProperty(_ value: String) -> RubyPronunciation {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> RubyPronunciation {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> RubyPronunciation {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> RubyPronunciation {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ values: [Values.Role]) -> RubyPronunciation {
        return mutate(role: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func role(_ values:  Values.Role...) -> RubyPronunciation {
        return mutate(role: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> RubyPronunciation {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> RubyPronunciation {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> RubyPronunciation {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> RubyPronunciation {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyPronunciation {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> RubyPronunciation {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func translate(_ value: Bool = true) -> RubyPronunciation {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> RubyPronunciation {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> RubyPronunciation {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func accessibilityAtomic(_ value: Bool = true) -> RubyPronunciation {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func accessibilityBusy(_ value: Bool = true) -> RubyPronunciation {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func accessibilityControls(_ ids: [String]) -> RubyPronunciation {
        return mutate(ariacontrols: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityControls(_ ids: String...) -> RubyPronunciation {
        return mutate(ariacontrols: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityCurrent(_ value: Values.Accessibility.Current) -> RubyPronunciation {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityCurrent(_ value: Bool = true) -> RubyPronunciation {
        return mutate(ariacurrent: .init(value, context: .trusted))
    }
    
    public func accessibilityDescriptions(_ ids: [String]) -> RubyPronunciation {
        return mutate(ariadescribedby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityDescriptions(_ ids: String...) -> RubyPronunciation {
        return mutate(ariadescribedby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityDetail(_ id: String) -> RubyPronunciation {
        return mutate(ariadetails: .init(id, context: .tainted(.html)))
    }
    
    @available(*, unavailable)
    public func accessibilityDisabled(_ value: Bool = true) -> RubyPronunciation {
        return mutate(key: "aria-disabled", value: .init(value, context: .trusted))
    }
    
    public func accessibilityFlow(_ ids: [String]) -> RubyPronunciation {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityFlow(_ ids: String...) -> RubyPronunciation {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    @available(*, unavailable)
    public func accessibilityPopup(_ value: Values.Accessibility.Popup) -> RubyPronunciation {
        return mutate(key: "aria-haspopup", value: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityHidden(_ value: Bool = true) -> RubyPronunciation {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    @available(*, unavailable)
    public func accessibilityInvalid(_ value: Values.Accessibility.Invalid) -> RubyPronunciation {
        return mutate(key: "aria-invalid", value: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, unavailable)
    public func accessibilityInvalid(_ value: Bool = true, message id: String? = nil) -> RubyPronunciation {

        if let id = id {
            return mutate(key: "aria-invalid", value: .init(value, context: .trusted)).mutate(key: "aria-errormessage", value: .init(id, context: .tainted(.html)))
        }
        
        return mutate(key: "aria-invalid", value: .init(value, context: .trusted))
    }
    
    public func accessibilityShortcuts(_ values: [KeyboardShortcut]) -> RubyPronunciation {
        return mutate(ariakeyshortcuts: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func accessibilityShortcuts(_ values: KeyboardShortcut...) -> RubyPronunciation {
        return mutate(ariakeyshortcuts: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    @_disfavoredOverload
    public func accessibilityLabel(_ value: String) -> RubyPronunciation {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyPronunciation {
        return mutate(arialabel: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityLabel(verbatim value: String) -> RubyPronunciation {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabels(_ ids: [String]) -> RubyPronunciation {
        return mutate(arialabeledby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityLabels(_ ids: String...) -> RubyPronunciation {
        return mutate(arialabeledby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityLive(_ value: Values.Accessibility.Live) -> RubyPronunciation {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityOwns(_ ids: [String]) -> RubyPronunciation {
        return mutate(ariaowns: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityOwns(_ ids: String...) -> RubyPronunciation {
        return mutate(ariaowns: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityRelevant(_ values: [Values.Accessibility.Relevant]) -> RubyPronunciation {
        return mutate(ariarelevant: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func accessibilityRelevant(_ values: Values.Accessibility.Relevant...) -> RubyPronunciation {
        return mutate(ariarelevant: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    @_disfavoredOverload
    public func accessibilityRoleDescription(_ value: String) -> RubyPronunciation {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityRoleDescription(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyPronunciation {
        return mutate(ariaroledescription: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityRoleDescription(verbatim value: String) -> RubyPronunciation {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}
