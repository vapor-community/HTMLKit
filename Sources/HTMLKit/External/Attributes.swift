// MARK: aliases

// MARK: attributes

/// The protocol provides
///
///
public protocol GlobalAttributes {

    func accessKey(_ value: HTMLContent) -> Self
    
    func `class`(_ value: HTMLContent) -> Self

    func data(for key: String, value: HTMLContent) -> Self

    func aria(for key: String, value: HTMLContent) -> Self

    func data(_ key: String, value: HTMLContent) -> Self

    func aria(_ key: String, value: HTMLContent) -> Self

    func style(css: HTMLContent) -> Self

    func isEditable(_ value: Conditionable) -> Self

    func direction(_ value: DirectionType) -> Self

    func direction(_ value: TemplateValue<DirectionType>) -> Self

    func isHidden(_ value: Conditionable) -> Self

    func id(_ value: HTMLContent) -> Self

    func lang(_ value: TemplateValue<String>) -> Self

    func isSpellchecked(_ value: Conditionable) -> Self

    func tabIndex(_ value: TemplateValue<Int>) -> Self

    func title(_ value: HTMLContent) -> Self

    func role(_ text: HTMLContent) -> Self

    func on(click: HTMLContent) -> Self
}

extension GlobalAttributes where Self: AttributeNode {

    public func aria(for key: String, value: HTMLContent) -> Self {
        add(.init(attribute: "aria-" + key, value: value))
    }

    public func aria(_ key: String, value: HTMLContent) -> Self {
        self.aria(for: key, value: value)
    }

    public func accessKey(_ value: HTMLContent) -> Self {
        add(.init(attribute: "accessKey", value: value))
    }

    public func `class`(_ value: HTMLContent) -> Self {
        add(.init(attribute: "class", value: value))
    }

    public func data(for key: String, value: HTMLContent) -> Self {
        add(.init(attribute: "data-" + key, value: value))
    }

    public func data(_ key: String, value: HTMLContent) -> Self {
        self.data(for: key, value: value)
    }

    public func isEditable(_ value: Conditionable) -> Self {
        add(.init(attribute: "contenteditable", value: value))
    }

    public func direction(_ value: TemplateValue<DirectionType>) -> Self {
        add(.init(attribute: "dir", value: value))
    }

    public func direction(_ value: DirectionType) -> Self {
        direction(.constant(value))
    }

    public func isHidden(_ value: Conditionable) -> Self {
        add(.init(attribute: "hidden", value: nil, isIncluded: value))
    }

    public func id(_ value: HTMLContent) -> Self {
        add(.init(attribute: "id", value: value))
    }

    public func lang(_ value: TemplateValue<String>) -> Self {
        add(.init(attribute: "lang", value: value))
    }

    public func isSpellchecked(_ value: Conditionable) -> Self {
        add(.init(attribute: "spellcheck", value: value))
    }

    public func tabIndex(_ value: TemplateValue<Int>) -> Self {
        add(.init(attribute: "tabindex", value: value))
    }

    public func title(_ value: HTMLContent) -> Self {
        add(.init(attribute: "title", value: value))
    }

    public func role(_ text: HTMLContent) -> Self {
        add(.init(attribute: "role", value: text))
    }

    public func style(css: HTMLContent) -> Self {
        add(.init(attribute: "style", value: css))
    }

    public func on(click: HTMLContent) -> Self {
        add(.init(attribute: "onclick", value: click))
    }
}

/// The protocol provides
///
///
public protocol AcceptAttribute {
    
    func accept(_ value: HTMLContent) -> Self
}

extension AcceptAttribute where Self: AttributeNode {
    
    public func accept(_ value: HTMLContent) -> Self {
        add(.init(attribute: "accept", value: value))
    }
}

/// The protocol provides
///
///
public protocol ActionAttribute {
    
    func action(_ value: HTMLContent) -> Self
}

extension ActionAttribute where Self: AttributeNode {
    
    public func action(_ value: HTMLContent) -> Self {
        add(.init(attribute: "action", value: value))
    }
}

/// The protocol provides
///
///
public protocol AlternativeAttribute {
    
    func alternative(_ value: HTMLContent) -> Self
}

extension AlternativeAttribute where Self: AttributeNode {
    
    public func alternative(_ value: HTMLContent) -> Self {
        add(.init(attribute: "alt", value: value))
    }
}

/// The protocol provides
///
///
public protocol AsyncAttribute {
    
    func async() -> Self
}

extension AsyncAttribute where Self: AttributeNode {
    
    public func async() -> Self {
        add(.init(attribute: "async", value: nil))
    }
}

/// The protocol provides
///
///
public protocol AutoCompleteAttribute {
    
    func autoComplete(_ condition: Conditionable) -> Self
}

extension AutoCompleteAttribute where Self: AttributeNode {
    
    public func autoComplete(_ condition: Conditionable) -> Self {
        add(.init(attribute: "autocomplete", value: nil, isIncluded: condition))
    }
}

/// The protocol provides
///
///
public protocol AutoFocusAttribute {
    
    func autoFocus() -> Self
}

extension AutoFocusAttribute where Self: AttributeNode {
    
    public func autoFocus() -> Self {
        add(.init(attribute: "autofocus", value: nil))
    }
}

/// The protocol provides
///
///
public protocol AutoPlayAttribute {
    
    func autoPlay() -> Self
}

extension AutoPlayAttribute where Self: AttributeNode {
    
    public func autoPlay() -> Self {
        add(.init(attribute: "autoplay", value: nil))
    }
}

/// The protocol provides
///
///
public protocol CheckedAttribute {
    
    func checked() -> Self
}

extension CheckedAttribute where Self: AttributeNode {
    
    public func checked() -> Self {
        add(.init(attribute: "checked", value: nil))
    }
}

/// The protocol provides
///
///
public protocol CiteAttribute {
    
    func cite(_ text: HTMLContent) -> Self
}

extension CiteAttribute where Self: AttributeNode {
    
    public func cite(_ text: HTMLContent) -> Self {
        add(.init(attribute: "cite", value: text))
    }
}

/// The protocol provides
///
///
public protocol ColumnsAttribute {
    
    func columns(_ size: Int) -> Self
}

extension ColumnsAttribute where Self: AttributeNode {
    
    public func columns(_ size: Int) -> Self {
        add(.init(attribute: "cols", value: size))
    }
}

/// The protocol provides
///
///
public protocol ColumnSpanAttribute {
    
    func columnSpan(_ size: Int) -> Self
}

extension ColumnSpanAttribute where Self: AttributeNode {
    
    public func columSpan(_ size: Int) -> Self {
        add(.init(attribute: "colspan", value: size))
    }
}

/// The protocol provides
///
///
public protocol ContentAttribute {
    
    func content(_ value: HTMLContent) -> Self
}

extension ContentAttribute where Self: AttributeNode {
    
    public func content(_ value: HTMLContent) -> Self {
        add(.init(attribute: "content", value: value))
    }
}

/// The protocol provides
///
///
public protocol ControlsAttribute {
    
    func controls() -> Self
}

extension ControlsAttribute where Self: AttributeNode {
    
    public func controls() -> Self {
        add(.init(attribute: "controls", value: nil))
    }
}

/// The protocol provides
///
///
public protocol CoordinatesAttribute {
    
    func coordinates(_ value: HTMLContent) -> Self
}

extension CoordinatesAttribute where Self: AttributeNode {
    
    public func coordinates(_ value: HTMLContent) -> Self {
        add(.init(attribute: "coords", value: value))
    }
}

/// The protocol provides
///
///
public protocol DataAttribute {
    
    func data(_ value: HTMLContent) -> Self
}

extension DataAttribute where Self: AttributeNode {
    
    public func data(_ value: HTMLContent) -> Self {
        add(.init(attribute: "data", value: value))
    }
}

/// The protocol provides
///
///
public protocol DateTimeAttribute {
    
    func dateTime(_ value: HTMLContent) -> Self
}

extension DateTimeAttribute where Self: AttributeNode {
    
    public func dateTime(_ value: HTMLContent) -> Self {
        add(.init(attribute: "datetime", value: value))
    }
}

/// The protocol provides
///
///
public protocol DefaultAttribute {
    
    func `default`() -> Self
}

extension DefaultAttribute where Self: AttributeNode {
    
    public func `default`() -> Self {
        add(.init(attribute: "default", value: nil))
    }
}

/// The protocol provides
///
///
public protocol DisabledAttribute {
    
    func disabled() -> Self
}

extension DisabledAttribute where Self: AttributeNode {
    
    public func disabled() -> Self {
        add(.init(attribute: "disabled", value: nil))
    }
}

/// The protocol provides
///
///
public protocol DownloadAttribute {
    
    func download() -> Self
}

extension DownloadAttribute where Self: AttributeNode {
    
    public func download() -> Self {
        add(.init(attribute: "download", value: nil))
    }
}

/// The protocol provides
///
///
public protocol EncodingAttribute {
    
    func encoding(_ type: EncodeType) -> Self
}

extension EncodingAttribute where Self: AttributeNode {

    public func encoding(_ type: EncodeType) -> Self {
        add(.init(attribute: "enctype", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol ForAttribute {
    
    func `for`(_ value: HTMLContent) -> Self
}

extension ForAttribute where Self: AttributeNode {
    
    public func `for`(_ value: HTMLContent) -> Self {
        add(.init(attribute: "for", value: value))
    }
}

/// The protocol provides
///
///
public protocol FormAttribute {
    
    func form(_ value: HTMLContent) -> Self
}

extension FormAttribute where Self: AttributeNode {
    
    public func form(_ value: HTMLContent) -> Self {
        add(.init(attribute: "form", value: value))
    }
}

/// The protocol provides
///
///
public protocol FormActionAttribute {
    
    func formAction(_ value: HTMLContent) -> Self
}

extension FormActionAttribute where Self: AttributeNode {
    
    public func formAction(_ value: HTMLContent) -> Self {
        add(.init(attribute: "formaction", value: value))
    }
}

/// The protocol provides
///
///
public protocol HeaderAttribute {
    
    func header(_ value: HTMLContent) -> Self
}

extension HeaderAttribute where Self: AttributeNode {
    
    public func header(_ value: HTMLContent) -> Self {
        add(.init(attribute: "header", value: value))
    }
}

/// The protocol provides
///
///
public protocol HeightAttribute {
    
    func height(_ height: Int) -> Self
}

extension HeightAttribute where Self: AttributeNode {
    
    public func height(_ height: Int) -> Self {
        add(.init(attribute: "height", value: height))
    }
}

/// The protocol provides
///
///
public protocol HighAttribute {
    
    func high(_ height: Int) -> Self
}

extension HighAttribute where Self: AttributeNode {
    
    public func high(_ height: Int) -> Self {
        add(.init(attribute: "high", value: height))
    }
}

/// The protocol provides
///
///
public protocol ReferenceAttribute {
    
    func reference(_ value: HTMLContent) -> Self
}

extension ReferenceAttribute where Self: AttributeNode {
    
    public func reference(_ value: HTMLContent) -> Self {
        add(.init(attribute: "href", value: value))
    }
}

/// The protocol provides
///
///
public protocol ReferenceLanguageAttribute {
    
    func referenceLanguage(_ type: LanguageType) -> Self
}

extension ReferenceLanguageAttribute where Self: AttributeNode {

    public func referenceLanguage(_ type: LanguageType) -> Self {
        add(.init(attribute: "hreflang", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol KindAttribute {
    
    func kind(_ text: HTMLContent) -> Self
}

extension KindAttribute where Self: AttributeNode {
    
    public func kind(_ text: HTMLContent) -> Self {
        add(.init(attribute: "kind", value: text))
    }
}

/// The protocol provides
///
///
public protocol LabelAttribute {
    
    func label(_ value: HTMLContent) -> Self
}

extension LabelAttribute where Self: AttributeNode {
    
    public func label(_ value: HTMLContent) -> Self {
        add(.init(attribute: "label", value: value))
    }
}

/// The protocol provides
///
///
public protocol ListAttribute {
    
    func list(_ value: HTMLContent) -> Self
}

extension ListAttribute where Self: AttributeNode {
    
    public func list(_ value: HTMLContent) -> Self {
        add(.init(attribute: "list", value: value))
    }
}

/// The protocol provides
///
///
public protocol LoopAttribute {
    
    func loop() -> Self
}

extension LoopAttribute where Self: AttributeNode {
    
    public func loop() -> Self {
        add(.init(attribute: "loop", value: nil))
    }
}

/// The protocol provides
///
///
public protocol MaximumValueAttribute {
    
    func maximumValue(value: HTMLContent) -> Self
}

extension MaximumValueAttribute where Self: AttributeNode {

    public func maximumValue(value: HTMLContent) -> Self {
        add(.init(attribute: "max", value: value))
    }
}

/// The protocol provides
///
///
public protocol MaximumLengthAttribute {
    
    func maximumLength(value: HTMLContent) -> Self
}

extension MaximumLengthAttribute where Self: AttributeNode {

    public func maximumLength(value: HTMLContent) -> Self {
        add(.init(attribute: "maxlength", value: value))
    }
}

/// The protocol provides
///
///
public protocol MediaAttribute {
    
    func media(value: HTMLContent) -> Self
}

extension MediaAttribute where Self: AttributeNode {

    public func media(value: HTMLContent) -> Self {
        add(.init(attribute: "media", value: value))
    }
}

/// The protocol provides
///
///
public protocol MethodAttribute {
    
    func method(_ method: MethodType) -> Self
}

extension MethodAttribute where Self: AttributeNode {

    public func method(_ method: MethodType) -> Self {
        add(.init(attribute: "method", value: method.rawValue))
    }
}

/// The protocol provides
///
///
public protocol MinimumValueAttribute {
    
    func minimumValue(value: HTMLContent) -> Self
}

extension MinimumValueAttribute where Self: AttributeNode {

    public func minimumValue(value: HTMLContent) -> Self {
        add(.init(attribute: "min", value: value))
    }
}

/// The protocol provides
///
///
public protocol MinimumLengthAttribute {
    
    func minimumLength(value: HTMLContent) -> Self
}

extension MinimumLengthAttribute where Self: AttributeNode {

    public func minimumLength(value: HTMLContent) -> Self {
        add(.init(attribute: "minlength", value: value))
    }
}

/// The protocol provides
///
///
public protocol MultipleAttribute {
    
    func multiple() -> Self
}

extension MultipleAttribute where Self: AttributeNode {
    
    public func multiple() -> Self {
        add(.init(attribute: "multiple", value: nil))
    }
}

/// The protocol provides
///
///
public protocol MutedAttribute {
    
    func muted() -> Self
}

extension MutedAttribute where Self: AttributeNode {
    
    public func muted() -> Self {
        add(.init(attribute: "muted", value: nil))
    }
}

/// The protocol provides
///
///
public protocol NameAttribute {

    associatedtype NameType: RawRepresentable where NameType.RawValue == String

    func name(_ value: NameType) -> Self

    func name(_ value: TemplateValue<String>) -> Self
}

extension NameAttribute where Self: AttributeNode {
    
    public func name(_ value: NameType) -> Self {
        add(.init(attribute: "name", value: value.rawValue))
    }

    public func name(_ value: TemplateValue<String>) -> Self {
        add(.init(attribute: "name", value: value))
    }
}

/// The protocol provides
///
///
public protocol OpenAttribute {
    
    func isOpen(_ condition: Conditionable) -> Self
}

extension OpenAttribute where Self: AttributeNode {
    
    public func isOpen(_ condition: Conditionable) -> Self {
        add(.init(attribute: "open", value: nil, isIncluded: condition))
    }
}

/// The protocol provides
///
///
public protocol OptimumAttribute {
    
    func optimum(_ value: HTMLContent) -> Self
}

extension OptimumAttribute where Self: AttributeNode {
    
    public func optimum(_ value: HTMLContent) -> Self {
        add(.init(attribute: "optimum", value: value))
    }
}

/// The protocol provides
///
///
public protocol PatternAttribute {
    
    func pattern(_ regex: String) -> Self
}

extension AttributeNode where Self: PatternAttribute {
    
    public func pattern(_ regex: String) -> Self {
        add(.init(attribute: "pattern", value: regex))
    }
}

/// The protocol provides
///
///
public protocol PingAttribute {
    
    func ping(_ value: HTMLContent) -> Self
}

extension PingAttribute where Self: AttributeNode {

    public func ping(_ value: HTMLContent) -> Self {
        add(.init(attribute: "ping", value: value))
    }
}

/// The protocol provides
///
///
public protocol PlaceholderAttribute {
    
    func placeholder(_ text: HTMLContent) -> Self
}

extension PlaceholderAttribute where Self: AttributeNode {
    
    public func placeholder(_ text: HTMLContent) -> Self {
        add(.init(attribute: "placeholder", value: text))
    }
}

extension PlaceholderAttribute {
    
    public func placeholder(localized key: String) -> Self {
        self.placeholder(Localized(key: key))
    }
}

/// The protocol provides
///
///
public protocol PosterAttribute {
    
    func poster(value: HTMLContent) -> Self
}

extension PosterAttribute where Self: AttributeNode {

    public func poster(value: HTMLContent) -> Self {
        add(.init(attribute: "poster", value: value))
    }
}

/// The protocol provides
///
///
public protocol ReadyOnlyAttribute {
    
    func readonly() -> Self
}

extension MutedAttribute where Self: AttributeNode {
    
    public func readonly() -> Self {
        add(.init(attribute: "readonly", value: nil))
    }
}

/// The protocol provides
///
///
public protocol ReferrerPolicyAttribute {
    
    func referrerPolicy(_ type: PolicyType) -> Self
}

extension ReferrerPolicyAttribute where Self: AttributeNode {

    public func referrerPolicy(_ type: PolicyType) -> Self {
        add(.init(attribute: "referrerpolicy", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol RelationshipAttribute {
    
    associatedtype RelationshipTypes: RawRepresentable where RelationshipTypes.RawValue == String
    
    func relationship(_ value: RelationshipTypes) -> Self
}

extension RelationshipAttribute where Self: AttributeNode {
    
    public func relationship(_ value: RelationshipTypes) -> Self {
        add(.init(attribute: "rel", value: value.rawValue))
    }
}

/// The protocol provides
///
///
public protocol RequiredAttribute {
    
    func required() -> Self
}

extension RequiredAttribute where Self: AttributeNode {
    
    public func required() -> Self {
        add(.init(attribute: "required", value: nil))
    }
}

/// The protocol provides
///
///
public protocol ReversedAttribute {
    
    func reversed() -> Self
}

extension ReversedAttribute where Self: AttributeNode {
    
    public func reversed() -> Self {
        add(.init(attribute: "reversed", value: nil))
    }
}

/// The protocol provides
///
///
public protocol RowsAttribute {
    
    func rows(_ size: Int) -> Self
}

extension RowsAttribute where Self: AttributeNode {

    public func rows(_ size: Int) -> Self {
        add(.init(attribute: "rows", value: size))
    }
}

/// The protocol provides
///
///
public protocol RowSpanAttribute {
    
    func rowSpan(_ size: Int) -> Self
}

extension RowSpanAttribute where Self: AttributeNode {

    public func rowSpan(_ size: Int) -> Self {
        add(.init(attribute: "rowspan", value: size))
    }
}

/// The protocol provides
///
///
public protocol SandboxAttribute {
    
    func sandbox() -> Self
}

extension SandboxAttribute where Self: AttributeNode {
    
    public func sandbox() -> Self {
        add(.init(attribute: "sandbox", value: nil))
    }
}

/// The protocol provides
///
///
public protocol ScopeAttribute {
    
    func scope(_ text: HTMLContent) -> Self
}

extension ScopeAttribute where Self: AttributeNode {

    public func scope(_ text: HTMLContent) -> Self {
        add(.init(attribute: "scope", value: text))
    }
}

/// The protocol provides
///
///
public protocol ShapeAttribute {
    
    func shape(_ type: ShapeType) -> Self
}

extension ShapeAttribute where Self: AttributeNode {

    public func shape(_ type: ShapeType) -> Self {
        add(.init(attribute: "shape", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol SizeAttribute {
    
    func size(_ size: Int) -> Self
}

extension SizeAttribute where Self: AttributeNode {

    public func size(_ size: Int) -> Self {
        add(.init(attribute: "size", value: size))
    }
}

/// The protocol provides
///
///
public protocol SizesAttribute {
    
    func sizes(_ size: Int) -> Self
}

extension SizesAttribute where Self: AttributeNode {

    public func sizes(_ size: Int) -> Self {
        add(.init(attribute: "sizes", value: size))
    }
}

/// The protocol provides
///
///
public protocol SpanAttribute {
    
    func span(_ size: Int) -> Self
}

extension SpanAttribute where Self: AttributeNode {

    public func span(_ size: Int) -> Self {
        add(.init(attribute: "span", value: size))
    }
}

/// The protocol provides
///
///
public protocol SourceAttribute {
    
    func source(_ link: HTMLContent) -> Self
}

extension SourceAttribute where Self: AttributeNode {
    
    public func source(_ link: HTMLContent) -> Self {
        add(.init(attribute: "src", value: link))
    }
}

/// The protocol provides
///
///
public protocol StartAttribute {
    
    func start(_ size: Int) -> Self
}

extension StartAttribute where Self: AttributeNode {

    public func start(_ size: Int) -> Self {
        add(.init(attribute: "start", value: size))
    }
}

/// The protocol provides
///
///
public protocol StepAttribute {
    
    func step(_ size: Int) -> Self
}

extension StepAttribute where Self: AttributeNode {

    public func step(_ size: Int) -> Self {
        add(.init(attribute: "step", value: size))
    }
}

/// The protocol provides
///
///
public protocol TargetAttribute {
    
    func target(_ type: TargetType) -> Self
}

extension TargetAttribute where Self: AttributeNode {
    
    public func target(_ type: TargetType) -> Self {
        add(.init(attribute: "target", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol TypeAttribute {

    func type(_ value: TemplateValue<String>) -> Self
}

extension TypeAttribute where Self: AttributeNode {
    
    public func type(_ value: TemplateValue<String>) -> Self {
        add(.init(attribute: "type", value: value))
    }
}

/// The protocol provides
///
///
public protocol ValueAttribute {
    
    func value(_ text: HTMLContent) -> Self
}

extension ValueAttribute where Self: AttributeNode {

    public func value(_ text: HTMLContent) -> Self {
        add(.init(attribute: "value", value: text))
    }
}

/// The protocol provides
///
///
public protocol WidthAttribute {
    
    func width(_ width: Int) -> Self
}

extension WidthAttribute where Self: AttributeNode {

    public func width(_ width: Int) -> Self {
        add(.init(attribute: "width", value: width))
    }
}

/// The protocol provides
///
///
public protocol WrapAttribute {
    
    func wrap(_ type: WrapType) -> Self
}

extension WrapAttribute where Self: AttributeNode {

    public func wrap(_ type: WrapType) -> Self {
        add(.init(attribute: "wrap", value: type.rawValue))
    }
}
