import Foundation
import OrderedCollections

/// An element that represents a map area.
///
/// Use `Area` to define a region within an ``Map``.
///
/// ```swift
/// Image()
///     .source("...png")
///     .useMap("lorem")
/// Map {
///     Area()
///         .shape(.circle, coordinates: "10, 10, 10 ,10")
///         .alternate("Lorem ipsum...")
///         .reference("https://...")
/// }
/// .name("lorem")
/// ```
public struct Area: EmptyNode, MapElement {

    internal var name: String { "area" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    /// Creates a area.
    public init() {}
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Area) -> Area) -> Area {
        
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
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Area, T) -> Area) -> Area {
        
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

extension Area: GlobalContentAttributes, GlobalEventAttributes, GlobalAccessibilityAttributes, AlternateAttribute, ShapeAttribute, ReferenceAttribute, TargetAttribute, DownloadAttribute, PingAttribute, RelationshipAttribute, ReferrerPolicyAttribute {
        
    public func accessKey(_ value: Character) -> Area {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Area {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> Area {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> Area {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Area {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func editable(_ value: Bool = true) -> Area {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> Area {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> Area {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> Area {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }

    public func hidden(_ condition: Bool = true) -> Area {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func hidden(_ value: Values.Condition) -> Area {
        return mutate(hidden: .init(value.rawValue, context: .trusted))
    }

    public func inputMode(_ value: Values.Mode) -> Area {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }
    
    public func `is`(_ value: String) -> Area {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Area {

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
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Area {

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

    public func itemProperty(_ value: String) -> Area {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> Area {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> Area {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> Area {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ values: [Values.Role]) -> Area {
        return mutate(role: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func role(_ values:  Values.Role...) -> Area {
        return mutate(role: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> Area {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> Area {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> Area {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Area {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Area {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> Area {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func translate(_ value: Bool = true) -> Area {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> Area {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    @_disfavoredOverload
    public func alternate(_ value: String) -> Area {
        return mutate(alternate: .init(value, context: .tainted(.html)))
    }
    
    public func alternate(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Area {
        return mutate(alternate: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func alternate(verbatim value: String) -> Area {
        return mutate(alternate: .init(value, context: .tainted(.html)))
    }
    
    public func shape() -> Area {
        return mutate(shape: .init("default", context: .trusted))
    }
    
    public func shape(_ value: Values.Shape, coordinates: String) -> Area {
        return mutate(shape: .init(value.rawValue, context: .trusted)).mutate(coords: .init(coordinates, context: .tainted(.html)))
    }
    
    public func reference(_ value: String) -> Area {
        return mutate(href: .init(value, context: .tainted(.url)))
    }
    
    public func target(_ value: Values.Target) -> Area {
        return mutate(target: .init(value.rawValue, context: .trusted))
    }
    
    public func download(_ condition: Bool = true) -> Area {
        
        if condition {
            return mutate(download: .init("download", context: .trusted))
        }
        
        return self
    }
    
    @_disfavoredOverload
    public func download(_ name: String) -> Area {
        return mutate(download: .init(name, context: .tainted(.html)))
    }
    
    public func download(_ localizedKey: LocalizedStringKey, tableName: String?) -> Area {
        return mutate(download: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func download(verbatim name: String) -> Area {
        return mutate(download: .init(name, context: .tainted(.html)))
    }
    
    public func ping(_ value: String) -> Area {
        return mutate(ping: .init(value, context: .tainted(.html)))
    }
    
    public func relationship(_ values: Values.Relation...) -> Area {
        return mutate(rel: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func relationship(_ values: [Values.Relation]) -> Area {
        return mutate(rel: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func referrerPolicy(_ value: Values.Policy) -> Area {
        return mutate(referrerpolicy: .init(value.rawValue, context: .trusted))
    }
    
    public func popover(_ value: Values.Popover.State) -> Area {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Area {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Area {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Area {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Area {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Area {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Area {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func accessibilityAtomic(_ value: Bool = true) -> Area {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func accessibilityBusy(_ value: Bool = true) -> Area {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func accessibilityControls(_ ids: [String]) -> Area {
        return mutate(ariacontrols: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityControls(_ ids: String...) -> Area {
        return mutate(ariacontrols: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityCurrent(_ value: Values.Accessibility.Current) -> Area {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityCurrent(_ value: Bool = true) -> Area {
        return mutate(ariacurrent: .init(value, context: .trusted))
    }
    
    public func accessibilityDescriptions(_ ids: [String]) -> Area {
        return mutate(ariadescribedby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityDescriptions(_ ids: String...) -> Area {
        return mutate(ariadescribedby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityDetail(_ id: String) -> Area {
        return mutate(ariadetails: .init(id, context: .tainted(.html)))
    }
    
    @available(*, unavailable)
    public func accessibilityDisabled(_ value: Bool = true) -> Area {
        return mutate(key: "aria-disabled", value: .init(value, context: .trusted))
    }
    
    public func accessibilityFlow(_ ids: [String]) -> Area {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityFlow(_ ids: String...) -> Area {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    @available(*, unavailable)
    public func accessibilityPopup(_ value: Values.Accessibility.Popup) -> Area {
        return mutate(key: "aria-haspopup", value: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityHidden(_ value: Bool = true) -> Area {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    @available(*, unavailable)
    public func accessibilityInvalid(_ value: Values.Accessibility.Invalid) -> Area {
        return mutate(key: "aria-invalid", value: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, unavailable)
    public func accessibilityInvalid(_ value: Bool = true, message id: String? = nil) -> Area {

        if let id = id {
            return mutate(key: "aria-invalid", value: .init(value, context: .trusted)).mutate(key: "aria-errormessage", value: .init(id, context: .tainted(.html)))
        }
        
        return mutate(key: "aria-invalid", value: .init(value, context: .trusted))
    }
    
    public func accessibilityShortcuts(_ values: [KeyboardShortcut]) -> Area {
        return mutate(ariakeyshortcuts: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func accessibilityShortcuts(_ values: KeyboardShortcut...) -> Area {
        return mutate(ariakeyshortcuts: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }

    @_disfavoredOverload
    public func accessibilityLabel(_ value: String) -> Area {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Area {
        return mutate(arialabel: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityLabel(verbatim value: String) -> Area {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }

    public func accessibilityLabels(_ ids: [String]) -> Area {
        return mutate(arialabeledby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityLabels(_ ids: String...) -> Area {
        return mutate(arialabeledby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityLive(_ value: Values.Accessibility.Live) -> Area {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityOwns(_ ids: [String]) -> Area {
        return mutate(ariaowns: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityOwns(_ ids: String...) -> Area {
        return mutate(ariaowns: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityRelevant(_ values: [Values.Accessibility.Relevant]) -> Area {
        return mutate(ariarelevant: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    public func accessibilityRelevant(_ values: Values.Accessibility.Relevant...) -> Area {
        return mutate(ariarelevant: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
    }
    
    @_disfavoredOverload
    public func accessibilityRoleDescription(_ value: String) -> Area {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityRoleDescription(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Area {
        return mutate(ariaroledescription: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityRoleDescription(verbatim value: String) -> Area {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}
