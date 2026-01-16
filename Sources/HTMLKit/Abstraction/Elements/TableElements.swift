import Foundation
import OrderedCollections

/// The alias for the element ``ColumnGroup``.
@_documentation(visibility: internal)
public typealias Colgroup = ColumnGroup

/// The alias for the element ``Column``.
@_documentation(visibility: internal)
public typealias Col = Column

/// The alias for the element ``TableBody``.
@_documentation(visibility: internal)
public typealias Tbody = TableBody

/// The alias for the element ``TableHead``.
@_documentation(visibility: internal)
public typealias Thead = TableHead

/// The alias for the element ``TableFoot``.
@_documentation(visibility: internal)
public typealias Tfoot = TableFoot

/// The alias for the element ``TableRow``.
@_documentation(visibility: internal)
public typealias Tr = TableRow

/// The alias for the element ``DataCell``.
@_documentation(visibility: internal)
public typealias Td = DataCell

/// The alias for the element ``HeaderCell``.
@_documentation(visibility: internal)
public typealias Th = HeaderCell

/// An element that represents a table caption.
///
/// Use `Caption` to give the ``Table`` an accessible description.
///
/// ```swift
/// Table {
///     Caption {
///         "Lorem ipsum..."
///     }
/// }
/// ```
public struct Caption: ContentNode, TableElement {

    internal var name: String { "caption" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    internal var context: EscapeContext
    
    /// Create a caption.
    ///
    /// - Parameter content: The caption's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Caption) -> Caption) -> Caption {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Caption, T) -> Caption) -> Caption {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Caption: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> Caption {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Caption {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Caption {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Caption {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Caption {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Caption {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Caption {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Caption {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Caption {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Caption {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> Caption {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Caption {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Caption {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Caption {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Caption {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Caption {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Caption {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Caption {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Caption {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Caption {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Caption {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Caption {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Caption {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Caption {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Caption {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Caption {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Caption {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Caption {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Caption {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Caption {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Caption {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Caption {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Caption {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Caption {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Caption {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Caption {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Caption {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Caption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Caption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Caption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Caption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Caption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> Caption {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Caption {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Caption {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Caption {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Caption {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Caption {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Caption {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Caption {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Caption {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Caption {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Caption {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Caption {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Caption {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Caption {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Caption {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Caption {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Caption {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Caption {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Caption {
        return mutate(ariaroledescription: value)
    }
}

/// An element that represents af column group.
///
/// Use `ColumnGroup` to specify a group of one or more ``Column``.
///
/// ```swift
/// Table {
///     ColumnGroup {
///         Column()
///             .span(2)
///             .style("...")
///     }
/// }
/// ```
public struct ColumnGroup: ContentNode, TableElement {

    internal var name: String { "colgroup" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    internal var context: EscapeContext
    
    /// Create a column group.
    ///
    /// - Parameter content: The group's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (ColumnGroup) -> ColumnGroup) -> ColumnGroup {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (ColumnGroup, T) -> ColumnGroup) -> ColumnGroup {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension ColumnGroup: GlobalAttributes, GlobalEventAttributes, SpanAttribute {
    
    public func accessKey(_ value: Character) -> ColumnGroup {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> ColumnGroup {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> ColumnGroup {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> ColumnGroup {
        return mutate(class: value)
    }
    
    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> ColumnGroup {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> ColumnGroup {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> ColumnGroup {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> ColumnGroup {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> ColumnGroup {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> ColumnGroup {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> ColumnGroup {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> ColumnGroup {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> ColumnGroup {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> ColumnGroup {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> ColumnGroup {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> ColumnGroup {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> ColumnGroup {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> ColumnGroup {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> ColumnGroup {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> ColumnGroup {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> ColumnGroup {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> ColumnGroup {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> ColumnGroup {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> ColumnGroup {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> ColumnGroup {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> ColumnGroup {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> ColumnGroup {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> ColumnGroup {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> ColumnGroup {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> ColumnGroup {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> ColumnGroup {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> ColumnGroup {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> ColumnGroup {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> ColumnGroup {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> ColumnGroup {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func span(_ size: Int) -> ColumnGroup {
        return mutate(span: size)
    }
    
    public func popover(_ value: Values.Popover.State) -> ColumnGroup {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> ColumnGroup {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> ColumnGroup {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> ColumnGroup {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> ColumnGroup {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> ColumnGroup {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> ColumnGroup {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
}

/// A element that represents a table column.
///
/// Use `Column` for applying styles to entire columns, instead of repeating the styles for each ``DataCell`` or ``TableRow``.
///
/// ```swift
/// Table {
///     ColumnGroup {
///         Column()
///             .span(2)
///         Column()
///             .style("...")
///     }
/// }
/// ```
public struct Column: EmptyNode, TableElement {
    
    internal var name: String { "col" }

    internal var attributes: OrderedDictionary<String, Any>?

    /// Create a column.
    public init() {}
    
    @available(*, deprecated, message: "The column element is actually an empty element. Use Column() instead.")
     public init(@ContentBuilder<Content> content: () -> [Content]) {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Column) -> Column) -> Column {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Column, T) -> Column) -> Column {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Column: GlobalAttributes, GlobalEventAttributes, SpanAttribute {
    
    public func accessKey(_ value: Character) -> Column {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Column {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Column {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Column {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Column {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Column {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Column {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Column {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Column {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Column {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> Column {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Column {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: Values.Mode) -> Column {
        return mutate(inputmode: value.rawValue)
    }
    
    public func `is`(_ value: String) -> Column {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Column {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Column {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Column {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Column {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Column {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Column {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Column {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Column {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Column {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Column {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Column {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Column {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Column {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Column {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Column {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Column {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Column {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Column {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Column {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Column {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Column {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func span(_ size: Int) -> Column {
        return mutate(span: size)
    }
    
    public func popover(_ value: Values.Popover.State) -> Column {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Column {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Column {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Column {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Column {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Column {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Column {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
}

/// An element that represents a block of rows in a table.
///
/// Use `TableBody` to group rows of a ``Table``.
///
/// ```swift
/// Table {
///     TableBody {
///         TableRow {
///         }
///         TableRow {
///         }
///     }
/// }
/// ```
public struct TableBody: ContentNode, TableElement {

    internal var name: String { "tbody" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    internal var context: EscapeContext
    
    /// Create a table body.
    ///
    /// - Parameter content: The body's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TableBody) -> TableBody) -> TableBody {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TableBody, T) -> TableBody) -> TableBody {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TableBody: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: Character) -> TableBody {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TableBody {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> TableBody {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TableBody {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> TableBody {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> TableBody {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> TableBody {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> TableBody {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> TableBody {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> TableBody {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> TableBody {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> TableBody {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> TableBody {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> TableBody {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> TableBody {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> TableBody {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> TableBody {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TableBody {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> TableBody {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> TableBody {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> TableBody {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TableBody {
        return mutate(id: value)
    }
    
    public func language(_ value: Values.Language) -> TableBody {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TableBody {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> TableBody {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> TableBody {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> TableBody {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> TableBody {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> TableBody {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> TableBody {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TableBody {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> TableBody {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> TableBody {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> TableBody {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> TableBody {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func width(_ size: Int) -> TableBody {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableBody {
        return mutate(height: size)
    }
    
    public func popover(_ value: Values.Popover.State) -> TableBody {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> TableBody {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> TableBody {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TableBody {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> TableBody {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TableBody {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TableBody {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> TableBody {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TableBody {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TableBody {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TableBody {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TableBody {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TableBody {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TableBody {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TableBody {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TableBody {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TableBody {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TableBody {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TableBody {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TableBody {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TableBody {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TableBody {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TableBody {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TableBody {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TableBody {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TableBody {
        return mutate(ariaroledescription: value)
    }
}

/// An element that represents a table description.
///
/// Use `TableHead` to label the columns at the beginning of the ``Table``.
///
/// ```swift
/// Table {
///     TableHead {
///         TableRow {
///             DataCell {
///                 "Lorem ipsum"
///             }
///         }
///     }
///     TableBody {
///         TableRow {
///             DataCell {
///                 "Lorem ipsum"
///             }
///         }
///     }
/// }
/// ```
public struct TableHead: ContentNode, TableElement {

    internal var name: String { "thead" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a table head.
    ///
    /// - Parameter content: The head's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TableHead) -> TableHead) -> TableHead {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TableHead, T) -> TableHead) -> TableHead {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TableHead: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: Character) -> TableHead {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TableHead {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> TableHead {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TableHead {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> TableHead {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> TableHead {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> TableHead {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> TableHead {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> TableHead {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> TableHead {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> TableHead {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> TableHead {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> TableHead {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> TableHead {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> TableHead {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> TableHead {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> TableHead {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TableHead {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> TableHead {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> TableHead {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> TableHead {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TableHead {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> TableHead {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TableHead {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> TableHead {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> TableHead {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> TableHead {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> TableHead {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> TableHead {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> TableHead {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TableHead {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> TableHead {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> TableHead {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> TableHead {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> TableHead {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func width(_ size: Int) -> TableHead {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableHead {
        return mutate(height: size)
    }
    
    public func popover(_ value: Values.Popover.State) -> TableHead {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> TableHead {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> TableHead {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TableHead {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TableHead {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TableHead {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> TableHead {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> TableHead {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TableHead {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TableHead {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TableHead {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TableHead {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TableHead {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TableHead {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TableHead {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TableHead {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TableHead {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TableHead {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TableHead {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TableHead {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TableHead {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TableHead {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TableHead {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TableHead {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TableHead {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TableHead {
        return mutate(ariaroledescription: value)
    }
}

/// An element that represents a table summary.
///
/// Use `TableFoot` to summarize the columns at the end of the ``Table``.
///
/// ```swift
/// Table {
///     TableBody {
///         TableRow {
///             DataCell {
///                 "Lorem ipsum"
///             }
///         }
///     }
///     TableFoot {
///         TableRow {
///             DataCell {
///                 "Lorem ipsum"
///             }
///         }
///     }
/// }
/// ```
public struct TableFoot: ContentNode, TableElement {

    internal var name: String { "tfoot" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a table foot.
    ///
    /// - Parameter content: The foot's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TableFoot) -> TableFoot) -> TableFoot {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TableFoot, T) -> TableFoot) -> TableFoot {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TableFoot: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> TableFoot {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TableFoot {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> TableFoot {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TableFoot {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> TableFoot {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> TableFoot {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> TableFoot {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> TableFoot {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> TableFoot {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> TableFoot {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> TableFoot {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> TableFoot {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> TableFoot {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> TableFoot {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> TableFoot {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> TableFoot {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> TableFoot {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TableFoot {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> TableFoot {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> TableFoot {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> TableFoot {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TableFoot {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> TableFoot {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TableFoot {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> TableFoot {
        return mutate(role: value.rawValue)
    }
    
    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> TableFoot {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> TableFoot {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> TableFoot {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> TableFoot {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> TableFoot {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TableFoot {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> TableFoot {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> TableFoot {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> TableFoot {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> TableFoot {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> TableFoot {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> TableFoot {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> TableFoot {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TableFoot {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TableFoot {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TableFoot {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> TableFoot {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> TableFoot {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TableFoot {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TableFoot {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TableFoot {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TableFoot {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TableFoot {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TableFoot {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TableFoot {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TableFoot {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TableFoot {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TableFoot {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TableFoot {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TableFoot {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TableFoot {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TableFoot {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TableFoot {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TableFoot {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TableFoot {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TableFoot {
        return mutate(ariaroledescription: value)
    }
}

/// An element that represents a table row.
///
/// Use `TableRow` to group multiple cells in a ``Table``.
///
/// ```swift
/// Table {
///     TableRow {
///         DataCell {
///             "Lorem ipsum"
///         }
///         DataCell {
///             "Lorem ipsum"
///         }
///     }
/// }
/// ```
public struct TableRow: ContentNode, TableElement {

    internal var name: String { "tr" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a table row.
    ///
    /// - Parameter content: The row's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TableRow) -> TableRow) -> TableRow {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TableRow, T) -> TableRow) -> TableRow {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TableRow: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: Character) -> TableRow {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TableRow {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> TableRow {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TableRow {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> TableRow {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> TableRow {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> TableRow {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> TableRow {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> TableRow {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> TableRow {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> TableRow {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> TableRow {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> TableRow {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> TableRow {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> TableRow {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> TableRow {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> TableRow {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TableRow {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> TableRow {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> TableRow {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> TableRow {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TableRow {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> TableRow {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TableRow {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> TableRow {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> TableRow {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> TableRow {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> TableRow {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> TableRow {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> TableRow {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TableRow {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> TableRow {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> TableRow {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> TableRow {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> TableRow {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func width(_ size: Int) -> TableRow {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableRow {
        return mutate(height: size)
    }
    
    public func popover(_ value: Values.Popover.State) -> TableRow {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> TableRow {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> TableRow {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TableRow {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TableRow {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TableRow {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> TableRow {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> TableRow {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TableRow {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TableRow {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TableRow {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TableRow {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TableRow {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TableRow {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TableRow {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TableRow {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TableRow {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TableRow {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TableRow {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TableRow {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TableRow {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TableRow {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TableRow {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TableRow {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TableRow {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TableRow {
        return mutate(ariaroledescription: value)
    }
}

/// An element that represents a table cell.
///
/// Use `DataCell` to display tabular data.
///
/// ```swift
/// Table {
///     TableRow {
///         DataCell {
///             "Lorem ipsum"
///         }
///     }
/// }
/// ```
public struct DataCell: ContentNode, TableElement {

    internal var name: String { "td" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a data cell.
    ///
    /// - Parameter content: The cell's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (DataCell) -> DataCell) -> DataCell {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (DataCell, T) -> DataCell) -> DataCell {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension DataCell: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, ColumnSpanAttribute, RowSpanAttribute, HeadersAttribute {

    public func accessKey(_ value: Character) -> DataCell {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> DataCell {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> DataCell {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> DataCell {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> DataCell {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> DataCell {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> DataCell {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> DataCell {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> DataCell {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> DataCell {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> DataCell {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> DataCell {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> DataCell {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> DataCell {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> DataCell {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> DataCell {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> DataCell {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> DataCell {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> DataCell {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> DataCell {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> DataCell {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> DataCell {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> DataCell {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> DataCell {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> DataCell {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> DataCell {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> DataCell {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> DataCell {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> DataCell {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> DataCell {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> DataCell {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> DataCell {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> DataCell {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> DataCell {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> DataCell {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func columnSpan(_ size: Int) -> DataCell {
        return mutate(colspan: size)
    }
    
    public func rowSpan(_ size: Int) -> DataCell {
        return mutate(rowspan: size)
    }
    
    public func headers(_ ids: [String]) -> DataCell {
        return mutate(headers: ids.joined(separator: " "))
    }
    
    public func headers(_ ids: String...) -> DataCell {
        return mutate(headers: ids.joined(separator: " "))
    }
    
    public func popover(_ value: Values.Popover.State) -> DataCell {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> DataCell {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> DataCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> DataCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> DataCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> DataCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> DataCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> DataCell {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> DataCell {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> DataCell {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> DataCell {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> DataCell {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> DataCell {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> DataCell {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> DataCell {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> DataCell {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> DataCell {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> DataCell {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> DataCell {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> DataCell {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> DataCell {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> DataCell {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> DataCell {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> DataCell {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> DataCell {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> DataCell {
        return mutate(ariaroledescription: value)
    }
}

/// An element that represents a table cell.
///
/// Use `HeaderCell` to display tabular data.
///
/// ```swift
/// Table {
///     TableRow {
///         HeaderCell {
///             "Lorem ipsum"
///         }
///     }
/// }
/// ```
public struct HeaderCell: ContentNode, TableElement {

    internal var name: String { "th" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a header cell.
    ///
    /// - Parameter content: The cell's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (HeaderCell) -> HeaderCell) -> HeaderCell {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (HeaderCell, T) -> HeaderCell) -> HeaderCell {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension HeaderCell: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, ColumnSpanAttribute, RowSpanAttribute, HeadersAttribute, ScopeAttribute {
    
    public func accessKey(_ value: Character) -> HeaderCell {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> HeaderCell {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> HeaderCell {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> HeaderCell {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> HeaderCell {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> HeaderCell {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> HeaderCell {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> HeaderCell {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> HeaderCell {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> HeaderCell {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> HeaderCell {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> HeaderCell {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> HeaderCell {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> HeaderCell {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> HeaderCell {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> HeaderCell {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> HeaderCell {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> HeaderCell {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> HeaderCell {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> HeaderCell {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> HeaderCell {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> HeaderCell {
        return mutate(id: value)
    }
    
    public func language(_ value: Values.Language) -> HeaderCell {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> HeaderCell {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> HeaderCell {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> HeaderCell {
        return  mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> HeaderCell {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> HeaderCell {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> HeaderCell {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> HeaderCell {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> HeaderCell {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> HeaderCell {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> HeaderCell {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> HeaderCell {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> HeaderCell {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func columnSpan(_ size: Int) -> HeaderCell {
        return mutate(colspan: size)
    }
    
    public func rowSpan(_ size: Int) -> HeaderCell {
        return mutate(rowspan: size)
    }
    
    public func headers(_ ids: [String]) -> HeaderCell {
        return mutate(headers: ids.joined(separator: " "))
    }
    
    public func headers(_ ids: String...) -> HeaderCell {
        return mutate(headers: ids.joined(separator: " "))
    }
    
    public func scope(_ value: Values.Scope) -> HeaderCell {
        return mutate(scope: value.rawValue)
    }
    
    public func popover(_ value: Values.Popover.State) -> HeaderCell {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> HeaderCell {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> HeaderCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> HeaderCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> HeaderCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> HeaderCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> HeaderCell {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> HeaderCell {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> HeaderCell {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> HeaderCell {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> HeaderCell {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> HeaderCell {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> HeaderCell {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> HeaderCell {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> HeaderCell {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> HeaderCell {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> HeaderCell {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> HeaderCell {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> HeaderCell {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> HeaderCell {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> HeaderCell {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> HeaderCell {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> HeaderCell {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> HeaderCell {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> HeaderCell {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> HeaderCell {
        return mutate(ariaroledescription: value)
    }
}

extension HeaderCell: Localizable {   
    
    public init(_ localizedKey: LocalizedStringKey, tableName: String? = nil) {
        
        self.context = .tainted(.html)
        self.content = [LocalizedString(key: localizedKey, table: tableName)]
    }
}
