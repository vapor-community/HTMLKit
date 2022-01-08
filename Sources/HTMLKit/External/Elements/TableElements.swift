/// ## Description
/// The file contains the table elements. The html element Table only allows these elements to be its
/// descendants.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

import OrderedCollections

/// ## Description
/// The alias points to ColumnGroup.
///
public typealias Colgroup = ColumnGroup

/// ## Description
/// The alias points to Column.
///
public typealias Col = Column

/// ## Description
/// The alias points to TableBody.
///
public typealias Tbody = TableBody

/// ## Description
/// The alias points to TableHead.
///
public typealias Thead = TableHead

/// ## Description
/// The alias points to TableFoot.
///
public typealias Tfoot = TableFoot

/// ## Description
/// The alias points to TableRow.
///
public typealias Tr = TableRow

/// ## Description
/// The alias points to DataCell.
///
public typealias Td = DataCell

/// ## Description
/// The alias points to HeaderCell.
///
public typealias Th = HeaderCell

/// ## Description
/// The element represents the title of the table.
///
/// ## References
/// https://html.spec.whatwg.org/#the-caption-element
///
public struct Caption: ContentNode, TableElement {

    internal var name: String { "caption" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Caption: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Caption {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Caption {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Caption {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Caption {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Caption {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Caption {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Caption {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Caption {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Caption {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Caption {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Caption {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Caption {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Caption {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Caption {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Caption {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Caption {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Caption {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Caption {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Caption {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Caption {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Caption {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Caption {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Caption {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Caption {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Caption {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Caption {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Caption {
        return mutate(translate: value)
    }
    
    public func custom(key: String, value: Any) -> Caption {
        return mutate(key: key, value: value)
    }
}

extension Caption: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Caption: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element specifies a group of one or more columns.
///
/// ## References
/// https://html.spec.whatwg.org/#the-colgroup-element
///
public struct ColumnGroup: ContentNode, TableElement {

    internal var name: String { "colgroup" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension ColumnGroup: GlobalAttributes, SpanAttribute {
    
    public func accessKey(_ value: String) -> ColumnGroup {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> ColumnGroup {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> ColumnGroup {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> ColumnGroup {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> ColumnGroup {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> ColumnGroup {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> ColumnGroup {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> ColumnGroup {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> ColumnGroup {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> ColumnGroup {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> ColumnGroup {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> ColumnGroup {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> ColumnGroup {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> ColumnGroup {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> ColumnGroup {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> ColumnGroup {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> ColumnGroup {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> ColumnGroup {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> ColumnGroup {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> ColumnGroup {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> ColumnGroup {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> ColumnGroup {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> ColumnGroup {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> ColumnGroup {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> ColumnGroup {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> ColumnGroup {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> ColumnGroup {
        return mutate(translate: value)
    }

    public func span(_ size: Int) -> ColumnGroup {
        return mutate(span: size)
    }
    
    public func custom(key: String, value: Any) -> ColumnGroup {
        return mutate(key: key, value: value)
    }
}

extension ColumnGroup: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension ColumnGroup: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element represents a column in a table.
///
/// ## References
/// https://html.spec.whatwg.org/#the-col-element
///
public struct Column: ContentNode, TableElement {

    internal var name: String { "col" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Column: GlobalAttributes, SpanAttribute {
    
    public func accessKey(_ value: String) -> Column {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Column {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Column {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Column {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Column {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Column {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Column {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Column {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Column {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Column {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Column {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Column {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Column {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Column {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Column {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Column {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Column {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Column {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Column {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Column {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Column {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Column {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Column {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Column {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Column {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Column {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Column {
        return mutate(translate: value)
    }
    
    public func span(_ size: Int) -> Column {
        return mutate(span: size)
    }
    
    public func custom(key: String, value: Any) -> Column {
        return mutate(key: key, value: value)
    }
}

extension Column: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Column: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element represents a block of rows in a table.
///
/// ## References
/// https://html.spec.whatwg.org/#the-tbody-element
///
public struct TableBody: ContentNode, TableElement {

    internal var name: String { "tbody" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension TableBody: GlobalAttributes, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: String) -> TableBody {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> TableBody {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> TableBody {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TableBody {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> TableBody {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> TableBody {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> TableBody {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> TableBody {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> TableBody {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> TableBody {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> TableBody {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TableBody {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TableBody {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TableBody {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TableBody {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> TableBody {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TableBody {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> TableBody {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> TableBody {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> TableBody {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> TableBody {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> TableBody {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> TableBody {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> TableBody {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> TableBody {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> TableBody {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> TableBody {
        return mutate(translate: value)
    }
    
    public func width(_ size: Int) -> TableBody {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableBody {
        return mutate(height: size)
    }
    
    public func custom(key: String, value: Any) -> TableBody {
        return mutate(key: key, value: value)
    }
}

extension TableBody: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension TableBody: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element represents the block of rows that consist of the column labels.
///
/// ## References
/// https://html.spec.whatwg.org/#the-thead-element
///
public struct TableHead: ContentNode, TableElement {

    internal var name: String { "thead" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension TableHead: GlobalAttributes, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: String) -> TableHead {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> TableHead {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> TableHead {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TableHead {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> TableHead {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> TableHead {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> TableHead {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> TableHead {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> TableHead {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> TableHead {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> TableHead {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TableHead {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TableHead {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TableHead {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TableHead {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> TableHead {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TableHead {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> TableHead {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> TableHead {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> TableHead {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> TableHead {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> TableHead {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> TableHead {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> TableHead {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> TableHead {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> TableHead {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> TableHead {
        return mutate(translate: value)
    }

    public func width(_ size: Int) -> TableHead {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableHead {
        return mutate(height: size)
    }
    
    public func custom(key: String, value: Any) -> TableHead {
        return mutate(key: key, value: value)
    }
}

extension TableHead: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension TableHead: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element represents the block of rows that consist of the column summaries.
///
/// ## References
/// https://html.spec.whatwg.org/#the-tfoot-element
///
public struct TableFoot: ContentNode, TableElement {

    internal var name: String { "tfoot" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension TableFoot: GlobalAttributes {
    
    public func accessKey(_ value: String) -> TableFoot {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> TableFoot {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> TableFoot {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TableFoot {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> TableFoot {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> TableFoot {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> TableFoot {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> TableFoot {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> TableFoot {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> TableFoot {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> TableFoot {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TableFoot {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TableFoot {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TableFoot {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TableFoot {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> TableFoot {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TableFoot {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> TableFoot {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> TableFoot {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> TableFoot {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> TableFoot {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> TableFoot {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> TableFoot {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> TableFoot {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> TableFoot {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> TableFoot {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> TableFoot {
        return mutate(translate: value)
    }
    
    public func custom(key: String, value: Any) -> TableFoot {
        return mutate(key: key, value: value)
    }
}

extension TableFoot: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension TableFoot: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element represents a row of cells in a table.
///
/// ## References
/// https://html.spec.whatwg.org/#the-tr-element
///
public struct TableRow: ContentNode, TableElement {

    internal var name: String { "tr" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension TableRow: GlobalAttributes, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: String) -> TableRow {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> TableRow {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> TableRow {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TableRow {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> TableRow {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> TableRow {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> TableRow {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> TableRow {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> TableRow {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> TableRow {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> TableRow {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TableRow {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TableRow {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TableRow {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TableRow {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> TableRow {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TableRow {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> TableRow {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> TableRow {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> TableRow {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> TableRow {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> TableRow {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> TableRow {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> TableRow {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> TableRow {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> TableRow {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> TableRow {
        return mutate(translate: value)
    }

    public func width(_ size: Int) -> TableRow {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableRow {
        return mutate(height: size)
    }
    
    public func custom(key: String, value: Any) -> TableRow {
        return mutate(key: key, value: value)
    }
}

extension TableRow: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension TableRow: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element represents a data cell in a table.
///
/// ## References
/// https://html.spec.whatwg.org/#the-td-element
///
public struct DataCell: ContentNode, TableElement {

    internal var name: String { "td" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension DataCell: GlobalAttributes, ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute {

    public func accessKey(_ value: String) -> DataCell {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> DataCell {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> DataCell {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> DataCell {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> DataCell {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> DataCell {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> DataCell {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> DataCell {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> DataCell {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> DataCell {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> DataCell {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> DataCell {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> DataCell {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> DataCell {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> DataCell {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> DataCell {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> DataCell {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> DataCell {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> DataCell {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> DataCell {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> DataCell {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> DataCell {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> DataCell {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> DataCell {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> DataCell {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> DataCell {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> DataCell {
        return mutate(translate: value)
    }

    public func columnSpan(_ size: Int) -> DataCell {
        return mutate(colspan: size)
    }
    
    public func rowSpan(_ size: Int) -> DataCell {
        return mutate(rowspan: size)
    }
    
    public func headers(_ value: String) -> DataCell {
        return mutate(headers: value)
    }
    
    public func custom(key: String, value: Any) -> DataCell {
        return mutate(key: key, value: value)
    }
}

extension DataCell: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension DataCell: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element represents a header cell in a table.
///
/// ## References
/// https://html.spec.whatwg.org/#the-th-element
///
public struct HeaderCell: ContentNode, TableElement {

    internal var name: String { "th" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension HeaderCell: GlobalAttributes, ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute, ScopeAttribute {
    
    public func accessKey(_ value: String) -> HeaderCell {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> HeaderCell {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> HeaderCell {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> HeaderCell {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> HeaderCell {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> HeaderCell {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> HeaderCell {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> HeaderCell {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> HeaderCell {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> HeaderCell {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> HeaderCell {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> HeaderCell {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> HeaderCell {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> HeaderCell {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> HeaderCell {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> HeaderCell {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> HeaderCell {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> HeaderCell {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> HeaderCell {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> HeaderCell {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> HeaderCell {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> HeaderCell {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> HeaderCell {
        return  mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> HeaderCell {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> HeaderCell {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> HeaderCell {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> HeaderCell {
        return mutate(translate: value)
    }

    public func columnSpan(_ size: Int) -> HeaderCell {
        return mutate(colspan: size)
    }
    
    public func rowSpan(_ size: Int) -> HeaderCell {
        return mutate(rowspan: size)
    }
    
    public func headers(_ value: String) -> HeaderCell {
        return mutate(headers: value)
    }
    
    public func scope(_ value: String) -> HeaderCell {
        return mutate(scope: value)
    }
    
    public func custom(key: String, value: Any) -> HeaderCell {
        return mutate(key: key, value: value)
    }
}

extension HeaderCell: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension HeaderCell: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension HeaderCell: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}
