// MARK: aliases

/// The alias points
///
///
public typealias CoreAttributes = AccessKeyAttribute & AutocapitalizeAttribute & AutofocusAttribute & ClassAttribute & EditAttribute & DirectionAttribute & DragAttribute & EnterKeyHintAttribute & HiddenAttribute & InputModeAttribute & IsAttribute & ItemIdAttribute & ItemPropertyAttribute & ItemReferenceAttribute & ItemScopeAttribute & ItemTypeAttribute & IdentifierAttribute & LanguageAttribute & NonceAttribute & RoleAttribute & SpellCheckAttribute & StyleAttribute & TabulatorAttribute & TitleAttribute & TranslateAttribute

// MARK: attributes

/// The protocol provides
///
///
public protocol AccessKeyAttribute {
    
    /// The func adds
    ///
    ///
    func accessKey(_ value: String) -> Self
}

extension AccessKeyAttribute {
    
    private var key: String { "accesskey" }
    
    internal func set(accesskey value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(accesskey value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol AcceptAttribute {
    
    /// The func adds
    ///
    ///
    func accept(_ value: String) -> Self
}

extension AcceptAttribute {
    
    private var key: String { "accept" }
    
    internal func set(accept value: String) -> [String: Any] {
        return [key: value]
    }

    internal func update(accept value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ActionAttribute {
    
    /// The func adds
    ///
    ///
    func action(_ value: String) -> Self
}

extension ActionAttribute {
    
    private var key: String { "action" }
    
    internal func set(action value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(action value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol AlternateAttribute {
    
    /// The func adds
    ///
    ///
    func alternate(_ value: String) -> Self
}

extension AlternateAttribute {
    
    private var key: String { "alternate" }
    
    internal func set(alt value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(alt value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol AsynchronouslyAttribute {
    
    /// The func adds
    ///
    ///
    func asynchronously() -> Self
}

extension AsynchronouslyAttribute {
    
    private var key: String { "async" }
    
    internal func set(async value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(async value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol AutocapitalizeAttribute {
    
    /// The func adds
    ///
    ///
    func autocapitalize(_ type: Capitalization) -> Self
}

extension AutocapitalizeAttribute {
    
    private var key: String { "autocapitalize" }
    
    internal func set(autocapitalize value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(autocapitalize value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol AutocompleteAttribute {
    
    /// The func adds
    ///
    ///
    func hasCompletion(_ condition: Bool) -> Self
}

extension AutocompleteAttribute {
    
    private var key: String { "autocomplete" }

    internal func set(autocomplete value: Bool) -> [String: Any] {
        return [key: value]
    }

    internal func update(autocomplete value: Bool, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol AutofocusAttribute {
    
    /// The func adds
    ///
    ///
    func autofocus() -> Self
}

extension AutofocusAttribute {
    
    private var key: String { "autofocus" }
    
    internal func set(autofocus value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(autofocus value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol AutoplayAttribute {
    
    /// The func adds
    ///
    ///
    func autoplay() -> Self
}

extension AutoplayAttribute {
    
    private var key: String { "autoplay" }
    
    internal func set(autoplay value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(autoplay value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol CheckedAttribute {
    
    /// The func adds
    ///
    ///
    func checked() -> Self
}

extension CheckedAttribute {
    
    private var key: String { "checked" }
    
    internal func set(checked value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(checked value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol CiteAttribute {
    
    /// The func adds
    ///
    ///
    func cite(_ value: String) -> Self
}

extension CiteAttribute {
    
    private var key: String { "cite" }
    
    internal func set(cite value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(cite value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol provides
///
///
public protocol ClassAttribute {
    
    /// The func adds
    ///
    ///
    func `class`(_ value: String) -> Self
}

extension ClassAttribute {
    
    private var key: String { "class" }
    
    internal func set(`class` value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(`class` value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ColumnsAttribute {
    
    /// The func adds
    ///
    ///
    func columns(_ size: Int) -> Self
}

extension ColumnsAttribute {
    
    private var key: String { "cols" }
    
    internal func set(columns value: Int) -> [String: Any] {
        return [key: value]
    }

    internal func update(columns value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ColumnSpanAttribute {
    
    /// The func adds
    ///
    ///
    func columnSpan(_ size: Int) -> Self
}

extension ColumnSpanAttribute {
    
    private var key: String { "colspan" }
    
    internal func set(columnspan value: Int) -> [String: Any] {
        return [key: value]
    }

    internal func update(columnspan value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ContentAttribute {
    
    /// The func adds
    ///
    ///
    func content(_ value: String) -> Self
}

extension ContentAttribute {
    
    private var key: String { "content" }

    internal func set(content value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(content value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol EditAttribute {
    
    /// The func adds
    ///
    ///
    func isEditable(_ value: Bool) -> Self
}

extension EditAttribute {
    
    private var key: String { "contenteditable" }
    
    internal func set(contenteditable value: Bool) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(contenteditable value: Bool, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ControlsAttribute {
    
    /// The func adds
    ///
    ///
    func controls() -> Self
}

extension ControlsAttribute {
    
    private var key: String { "controls" }
    
    internal func set(controls value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(controls value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol CoordinatesAttribute {
    
    /// The func adds
    ///
    ///
    func coordinates(_ value: String) -> Self
}

extension CoordinatesAttribute {
    
    private var key: String { "coords" }
    
    internal func set(coords value: String) -> [String: Any] {
        return [key: value]
    }

    internal func update(coords value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DataAttribute {
    
    /// The func adds
    ///
    ///
    func data(_ value: String) -> Self
}

extension DataAttribute {
    
    private var key: String { "data" }
    
    internal func set(data value: String) -> [String: Any] {
        return [key: value]
    }

    internal func update(data value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DateTimeAttribute {
    
    /// The func adds
    ///
    ///
    func dateTime(_ value: Content) -> Self
}

extension DateTimeAttribute {
    
    private var key: String { "datetime" }
    
    internal func set(time value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(time value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DefaultAttribute {
    
    /// The func adds
    ///
    ///
    func `default`() -> Self
}

extension DefaultAttribute {
    
    private var key: String { "default" }
    
    internal func set(`default` value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(`default` value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DeferAttribute {
    
    /// The func adds
    ///
    ///
    func `defer`() -> Self
}

extension DeferAttribute {
    
    private var key: String { "defer" }
    
    internal func set(`defer` value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(`defer` value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol DirectionAttribute {

    /// The func adds
    ///
    ///
    func direction(_ type: Direction) -> Self
}

extension DirectionAttribute {

    private var key: String { "dir" }

    internal func set(direction value: String) -> [String: Any] {
        return [key: value]
    }

    internal func update(direction value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DisabledAttribute {
    
    /// The func adds
    ///
    ///
    func disabled() -> Self
}

extension DisabledAttribute {
    
    private var key: String { "disabled" }
    
    internal func set(disabled value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(disabled value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DownloadAttribute {
    
    /// The func adds
    ///
    ///
    func download() -> Self
}

extension DownloadAttribute {
    
    private var key: String { "download" }
    
    internal func set(download value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(download value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol DragAttribute {
 
    /// The func adds
    ///
    ///
    func isDraggable(_ value: Bool) -> Self
}

extension DragAttribute {
    
    private var key: String { "draggable" }
    
    internal func set(draggable value: Bool) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(draggable value: Bool, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol EncodingAttribute {
    
    /// The func adds
    ///
    ///
    func encoding(_ type: Encoding) -> Self
}

extension EncodingAttribute {
    
    private var key: String { "enctype" }
    
    internal func set(enctype value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(enctype value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol provides
///
///
public protocol EnterKeyHintAttribute {
    
    /// The func adds
    ///
    ///
    func enterKeyHint(_ type: Hint) -> Self
}

extension EnterKeyHintAttribute {
    
    private var key: String { "enterkeyhint" }
    
    internal func set(hint value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(hint value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ForAttribute {
    
    /// The func adds
    ///
    ///
    func `for`(_ value: String) -> Self
}

extension ForAttribute {
    
    private var key: String { "for" }
    
    internal func set(`for` value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(`for` value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol FormAttribute {
    
    /// The func adds
    ///
    ///
    func form(_ value: String) -> Self
}

extension FormAttribute {
    
    private var key: String { "form" }
    
    internal func set(form value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(form value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol FormActionAttribute {
    
    /// The func adds
    ///
    ///
    func formAction(_ value: String) -> Self
}

extension FormActionAttribute {
    
    private var key: String { "formaction" }
    
    internal func set(formaction value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(formaction value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol HeaderAttribute {
    
    /// The func adds
    ///
    ///
    func headers(_ value: String) -> Self
}

extension HeaderAttribute {
    
    private var key: String { "headers" }
    
    internal func set(headers value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(headers value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol HeightAttribute {
    
    /// The func adds
    ///
    ///
    func height(_ size: Int) -> Self
}

extension HeightAttribute {
    
    private var key: String { "height" }
    
    internal func set(height value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(height value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol HiddenAttribute {
 
    /// The func adds
    ///
    ///
    func hidden() -> Self
}

extension HiddenAttribute {

    private var key: String { "hidden" }

    internal func set(hidden value: String) -> [String: Any] {
        return [key: value]
    }

    internal func update(hidden value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol HighAttribute {
    
    /// The func adds
    ///
    ///
    func high(_ size: Int) -> Self
}

extension HighAttribute {
    
    private var key: String { "high" }
    
    internal func set(high value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(high value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ReferenceAttribute {
    
    /// The func adds
    ///
    ///
    func reference(_ value: String) -> Self
}

extension ReferenceAttribute {
    
    private var key: String { "href" }
    
    internal func set(ref value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(ref value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ReferenceLanguageAttribute {
    
    /// The func adds
    ///
    ///
    func referenceLanguage(_ type: Language) -> Self
}

extension ReferenceLanguageAttribute {

    private var key: String { "hreflang" }
    
    internal func set(reflang value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(reflang value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol IdentifierAttribute {
 
    /// The func adds
    ///
    ///
    func id(_ value: String) -> Self
}

extension IdentifierAttribute {
    
    private var key: String { "id" }
    
    internal func set(id value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(id value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol IsMapAttribute {
 
    /// The func adds
    ///
    ///
    func isMap() -> Self
}

extension IsMapAttribute {
    
    private var key: String { "ismap" }
    
    internal func set(ismap value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(ismap value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol InputModeAttribute {
 
    /// The func adds
    ///
    ///
    func inputMode(_ value: String) -> Self
}

extension InputModeAttribute {
    
    private var key: String { "inputmode" }
    
    internal func set(inputmode value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(inputmode value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol IsAttribute {
 
    /// The func adds
    ///
    ///
    func `is`(_ value: String) -> Self
}

extension IsAttribute {
    
    private var key: String { "is" }
    
    internal func set(`is` value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(`is` value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol ItemIdAttribute {
 
    /// The func adds
    ///
    ///
    func itemId(_ value: String) -> Self
}

extension ItemIdAttribute {
    
    private var key: String { "itemid" }
    
    internal func set(itemid value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(itemid value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol ItemPropertyAttribute {
 
    /// The func adds
    ///
    ///
    func itemProperty(_ value: String) -> Self
}

extension ItemPropertyAttribute {
    
    private var key: String { "itemprop" }
    
    internal func set(itemprop value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(itemprop value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol ItemReferenceAttribute {
 
    /// The func adds
    ///
    ///
    func itemReference(_ value: String) -> Self
}

extension ItemReferenceAttribute {
    
    private var key: String { "itemref" }
    
    internal func set(itemref value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(itemref value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol ItemScopeAttribute {
 
    /// The func adds
    ///
    ///
    func itemScope(_ value: String) -> Self
}

extension ItemScopeAttribute {
    
    private var key: String { "itemscope" }
    
    internal func set(itemscope value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(itemscope value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol ItemTypeAttribute {
 
    /// The func adds
    ///
    ///
    func id(_ value: String) -> Self
}

extension ItemTypeAttribute {
    
    private var key: String { "itemtype" }
    
    internal func set(itemtype value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(itemtype value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol KindAttribute {
    
    /// The func adds
    ///
    ///
    func kind(_ value: Content) -> Self
}

extension KindAttribute {
    
    private var key: String { "kind" }
    
    internal func set(kind value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(kind value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol LabelAttribute {
    
    /// The func adds
    ///
    ///
    func label(_ value: Content) -> Self
}

extension LabelAttribute {
    
    private var key: String { "label" }
    
    internal func set(label value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(label value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol LanguageAttribute {
    
    /// The func adds
    ///
    ///
    func language(_ type: Language) -> Self
}

extension LanguageAttribute {
    
    private var key: String { "lang" }
    
    internal func set(lang value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(lang value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ListAttribute {
    
    /// The func adds
    ///
    ///
    func list(_ value: Content) -> Self
}

extension ListAttribute {
    
    private var key: String { "list" }
    
    internal func set(list value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(list value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol LoopAttribute {
    
    /// The func adds
    ///
    ///
    func loop() -> Self
}

extension LoopAttribute {
    
    private var key: String { "loop" }
    
    internal func set(loop value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(loop value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol LowAttribute {
    
    /// The func adds
    ///
    ///
    func low(_ size: Int) -> Self
}

extension LowAttribute {
    
    private var key: String { "low" }
    
    internal func set(loop value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(loop value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MaximumValueAttribute {
    
    /// The func adds
    ///
    ///
    func maximum(_ value: Content) -> Self
}

extension MaximumValueAttribute {

    private var key: String { "max" }
    
    internal func set(max value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(max value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MaximumLengthAttribute {
    
    /// The func adds
    ///
    ///
    func maximum(length value: Content) -> Self
}

extension MaximumLengthAttribute {

    private var key: String { "maxlength" }
    
    internal func set(maxlength value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(maxlength value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MediaAttribute {
    
    /// The func adds
    ///
    ///
    func media(_ value: Content) -> Self
}

extension MediaAttribute {

    private var key: String { "media" }
    
    internal func set(media value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(media value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MethodAttribute {
    
    /// The func adds
    ///
    ///
    func method(_ type: Method) -> Self
}

extension MethodAttribute {

    private var key: String { "method" }
    
    internal func set(method value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(method value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MinimumValueAttribute {
    
    /// The func adds
    ///
    ///
    func minimum(_ value: Content) -> Self
}

extension MinimumValueAttribute {

    private var key: String { "min" }
    
    internal func set(min value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(min value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MinimumLengthAttribute {
    
    /// The func adds
    ///
    ///
    func minimum(length value: Content) -> Self
}

extension MinimumLengthAttribute {

    private var key: String { "minlength" }
    
    internal func set(minlength value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(minlength value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MultipleAttribute {
    
    /// The func adds
    ///
    ///
    func multiple() -> Self
}

extension MultipleAttribute {
    
    private var key: String { "multiple" }
    
    internal func set(multiple value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(multiple value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MutedAttribute {
    
    /// The func adds
    ///
    ///
    func muted() -> Self
}

extension MutedAttribute {
    
    private var key: String { "muted" }
    
    internal func set(muted value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(muted value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol NameAttribute {

    /// The func adds
    ///
    ///
    func name(_ type: NameType) -> Self
}

extension NameAttribute {
    
    private var key: String { "name" }
    
    internal func set(name value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(name value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol NonceAttribute {
    
    /// The func adds
    ///
    ///
    func nonce(_ value: String) -> Self
}

extension NonceAttribute {
    
    private var key: String { "nonce" }
    
    internal func set(nonce value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(nonce value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol NoValidateAttribute {

    /// The func adds
    ///
    ///
    func novalidate() -> Self
}

extension NoValidateAttribute {
    
    private var key: String { "novalidate" }
    
    internal func set(name value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(name value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol OpenAttribute {
    
    /// The func adds
    ///
    ///
    func isOpen(_ condition: Bool) -> Self
}

extension OpenAttribute {
    
    private var key: String { "open" }
    
    internal func set(open value: Bool) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(open value: Bool, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol OptimumAttribute {
    
    /// The func adds
    ///
    ///
    func optimum(_ value: Float) -> Self
}

extension OptimumAttribute {
    
    private var key: String { "optimum" }
    
    internal func set(optimum value: Float) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(optimum value: Float, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PatternAttribute {
    
    /// The func adds
    ///
    ///
    func pattern(_ regex: String) -> Self
}

extension PatternAttribute {
    
    private var key: String { "pattern" }
    
    internal func set(pattern value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(pattern value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol PartAttribute {
    
    /// The func adds
    ///
    ///
    func part(_ value: String) -> Self
}

extension PartAttribute {
    
    private var key: String { "part" }
    
    internal func set(part value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(part value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PingAttribute {
    
    /// The func adds
    ///
    ///
    func ping(_ value: String) -> Self
}

extension PingAttribute {

    private var key: String { "ping" }
    
    internal func set(ping value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(ping value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PlaceholderAttribute {
    
    /// The func adds
    ///
    ///
    func placeholder(_ value: String) -> Self
}

extension PlaceholderAttribute {
    
    private var key: String { "placeholder" }
    
    internal func set(placeholder value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(placeholer value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PosterAttribute {
    
    /// The func adds
    ///
    ///
    func poster(_ value: String) -> Self
}

extension PosterAttribute {

    private var key: String { "poster" }
    
    internal func set(poster value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(poster value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PreloadAttribute {
    
    /// The func adds
    ///
    ///
    func preload(_ value: String) -> Self
}

extension PreloadAttribute {
    
    private var key: String { "preload" }
    
    internal func set(preload value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(preload value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ReadyOnlyAttribute {
    
    /// The func adds
    ///
    ///
    func readonly() -> Self
}

extension ReadyOnlyAttribute {
    
    private var key: String { "readonly" }
    
    
    internal func set(readonly value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(readonly value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ReferrerPolicyAttribute {
    
    /// The func adds
    ///
    ///
    func referrerPolicy(_ type: Policy) -> Self
}

extension ReferrerPolicyAttribute {

    private var key: String { "referrerpolicy" }
    
    internal func set(policy value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(policy value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol RelationshipAttribute {
    
    /// The func adds
    ///
    ///
    func relationship(_ type: Relation) -> Self
}

extension RelationshipAttribute {
    
    private var key: String { "rel" }
    
    internal func set(rel value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(rel value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol RequiredAttribute {
    
    /// The func adds
    ///
    ///
    func required() -> Self
}

extension RequiredAttribute {
    
    private var key: String { "required" }
    
    internal func set(required value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(required value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ReversedAttribute {
    
    /// The func adds
    ///
    ///
    func reversed() -> Self
}

extension ReversedAttribute {
    
    private var key: String { "reversed" }
    
    internal func set(reversed value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(reversed value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol RoleAttribute {
    
    /// The func adds
    ///
    ///
    func role(_ value: String) -> Self
}

extension RoleAttribute {
    
    private var key: String { "role" }
    
    internal func set(role value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(role value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol RowsAttribute {
    
    func rows(_ size: Int) -> Self
}

extension RowsAttribute {

    private var key: String { "rows" }
    
    internal func set(rows value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(rows value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol RowSpanAttribute {
    
    /// The func adds
    ///
    ///
    func rowSpan(_ size: Int) -> Self
}

extension RowSpanAttribute {

    private var key: String { "rowspan" }
    
    internal func set(rowspan value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(rowspan value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SandboxAttribute {
    
    /// The func adds
    ///
    ///
    func sandbox() -> Self
}

extension SandboxAttribute {
    
    private var key: String { "sandbox" }
    
    internal func set(sandbox value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(sandbox value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ScopeAttribute {
    
    /// The func adds
    ///
    ///
    func scope(_ value: String) -> Self
}

extension ScopeAttribute {

    private var key: String { "scope" }
    
    internal func set(scope value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(scope value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ShapeAttribute {
    
    /// The func adds
    ///
    ///
    func shape(_ type: Shape) -> Self
}

extension ShapeAttribute {

    private var key: String { "shape" }
    
    internal func set(shape value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(shape value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SizeAttribute {
    
    /// The func adds
    ///
    ///
    func size(_ size: Int) -> Self
}

extension SizeAttribute {

    private var key: String { "size" }
    
    internal func set(size value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(size value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SizesAttribute {
    
    /// The func adds
    ///
    ///
    func sizes(_ size: Int) -> Self
}

extension SizesAttribute {

    private var key: String { "sizes" }
    
    internal func set(sizes value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(sizes value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol SlotAttribute {
    
    /// The func adds
    ///
    ///
    func slot(_ value: String) -> Self
}

extension SlotAttribute {
    
    private var key: String { "slot" }
    
    internal func set(lang value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(lang value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SpanAttribute {
    
    /// The func adds
    ///
    ///
    func span(_ size: Int) -> Self
}

extension SpanAttribute {

    private var key: String { "span" }
    
    internal func set(span value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(span value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol SpellCheckAttribute {
 
    /// The func adds
    ///
    ///
    func hasSpellCheck(_ value: Bool) -> Self
}

extension SpellCheckAttribute {
    
    private var key: String { "spellcheck" }
    
    internal func set(spellcheck value: Bool) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(spellcheck value: Bool, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SourceAttribute {
    
    /// The func adds
    ///
    ///
    func source(_ value: String) -> Self
}

extension SourceAttribute {
    
    private var key: String { "source" }
    
    internal func set(source value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(source value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol StartAttribute {
    
    /// The func adds
    ///
    ///
    func start(_ size: Int) -> Self
}

extension StartAttribute {
    
    private var key: String { "start" }
    
    internal func set(start value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(start value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol StepAttribute {
    
    /// The func adds
    ///
    ///
    func step(_ size: Int) -> Self
}

extension StepAttribute {

    private var key: String { "step" }
    
    internal func set(step value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(step value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol StyleAttribute {
    
    /// The func adds
    ///
    ///
    func style(_ value: String) -> Self
}

extension StyleAttribute {
    
    private var key: String { "style" }

    internal func set(style value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(style value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol TabulatorAttribute {
 
    /// The func adds
    ///
    ///
    func tabIndex(_ value: String) -> Self
}

extension TabulatorAttribute {
    
    private var key: String { "tabindex" }
    
    internal func set(index value: Content) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(index value: Content, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol TargetAttribute {
    
    /// The func adds
    ///
    ///
    func target(_ type: Target) -> Self
}

extension TargetAttribute {
    
    private var key: String { "target" }
    
    internal func set(target value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(target value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol TitleAttribute {
 
    /// The func adds
    ///
    ///
    func title(_ value: String) -> Self
}

extension TitleAttribute {
    
    private var key: String { "title" }
    
    internal func set(title value: String) -> [String: Any] {
        return [key: value]
    }

    internal func update(title value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protcol privides
///
///
public protocol TranslateAttribute {
 
    /// The func adds
    ///
    ///
    func translate(_ value: String) -> Self
}

extension TranslateAttribute {
    
    private var key: String { "translate" }
    
    internal func set(translate value: String) -> [String: Any] {
        return [key: value]
    }

    internal func update(translate value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol TypeAttribute {

    /// The func adds
    ///
    ///
    func type(_ value: String) -> Self
}

extension TypeAttribute {
    
    private var key: String { "type" }
    
    internal func set(type value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(type value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = type
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ValueAttribute {
    
    /// The func adds
    ///
    ///
    func value(_ value: String) -> Self
}

extension ValueAttribute {

    private var key: String { "value" }
    
    internal func set(value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol WidthAttribute {
    
    /// The func adds
    ///
    ///
    func width(_ size: Int) -> Self
}

extension WidthAttribute {

    private var key: String { "width" }
    
    internal func set(width value: Int) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(width value: Int, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol WrapAttribute {
    
    /// The func adds
    ///
    ///
    func wrap(_ type: Wrapping) -> Self
}

extension WrapAttribute {

    private var key: String { "wrap" }
    
    internal func set(wrap value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(wrap value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PropertyAttribute {
    
    /// The func adds
    ///
    ///
    func property(_ type: Graphs) -> Self
}

extension PropertyAttribute {
    
    private var key: String { "property" }
    
    internal func set(property value: String) -> [String: Any] {
        return [key: value]
    }
    
    internal func update(property value: String, on attributes: inout [String: Any]) -> [String: Any] {
        attributes[key] = value
        return attributes
    }
}
