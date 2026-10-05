@testable import HTMLKit
import Foundation
import OrderedCollections
import Testing

@Suite
struct AttributesTests {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    typealias AllAttributes = AccessKeyAttribute & AcceptAttribute & ActionAttribute & AlternateAttribute & AsynchronouslyAttribute & AutocapitalizeAttribute & AutocompleteAttribute & AutofocusAttribute & AutoplayAttribute & CharsetAttribute & CheckedAttribute & CiteAttribute & ClassAttribute & ColumnsAttribute & ColumnSpanAttribute & ContentAttribute & EditAttribute  & ControlsAttribute & DataAttribute & DateTimeAttribute & DefaultAttribute & DeferAttribute & DirectionAttribute & DisabledAttribute & DownloadAttribute & DragAttribute & EncodingAttribute & EnterKeyAttribute & ForAttribute & FormAttribute & FormActionAttribute & EquivalentAttribute & HeadersAttribute & HeightAttribute & HiddenAttribute & HighAttribute & ReferenceAttribute & ReferenceLanguageAttribute & IdentifierAttribute & IsMapAttribute & InputModeAttribute & IsAttribute & ItemAttribute & ItemPropertyAttribute & KindAttribute & LabelAttribute & LanguageAttribute & ListAttribute & LoopAttribute & LowAttribute & MaximumValueAttribute & MaximumLengthAttribute & MediaAttribute & MethodAttribute & MinimumValueAttribute & MinimumLengthAttribute & MultipleAttribute & MutedAttribute & NameAttribute & NonceAttribute & NoValidateAttribute & OpenAttribute & OptimumAttribute & PatternAttribute & PartAttribute & PingAttribute & PlaceholderAttribute & PosterAttribute & PreloadAttribute & ReadOnlyAttribute & ReferrerPolicyAttribute & RelationshipAttribute & RequiredAttribute & ReversedAttribute & RoleAttribute & RowsAttribute & RowSpanAttribute & SandboxAttribute & ScopeAttribute & ShapeAttribute & SizeAttribute & SizesAttribute & SlotAttribute & SpanAttribute & SpellCheckAttribute & SourceAttribute & StartAttribute & StepAttribute & StyleAttribute & TabulatorAttribute & TargetAttribute & TitleAttribute & TranslateAttribute & TypeAttribute & ValueAttribute & WidthAttribute & WrapAttribute & PropertyAttribute & SelectedAttribute & WindowEventAttribute & FocusEventAttribute & PointerEventAttribute & MouseEventAttribute & WheelEventAttribute & InputEventAttribute & KeyboardEventAttribute & DragEventAttribute & ClipboardEventAttribute & SelectionEventAttribute & MediaEventAttribute & FormEventAttribute & DetailEventAttribute & AtomicAccessibilityAttribute & BusyAccessibilityAttribute & ControlsAccessibilityAttribute & CurrentAccessibilityAttribute & DescriptionsAccessibilityAttribute & DetailAccessibilityAttribute & DisabledAccessibilityAttribute & FlowAccessibilityAttribute & PopupAccessibilityAttribute & HiddenAccessibilityAttribute & InvalidAccessibilityAttribute & ShortcutsAccessibilityAttribute & LabelAccessibilityAttribute & LabelsAccessibilityAttribute & LiveAccessibilityAttribute & OwnsAccessibilityAttribute & MultilineAccessibilityAttribute & RowIndexAccessibilityAttribute & RelevantAccessibilityAttribute & RoleDescriptionAccessibilityAttribute & SortAccessibilityAttribute & OrientationAccessibilityAttribute & RequiredAccessibilityAttribute & ReadOnlyAccessibilityAttribute & ModalAccessibilityAttribute & LevelAccessibilityAttribute & HintAccessibilityAttribute & PositionAccessibilityAttribute & MultiselectAccessibilityAttribute & RowCountAccessibilityAttribute & ColumnIndexAccessibilityAttribute & ColumnCountAccessibilityAttribute & RowSpanAccessibilityAttribute & ColumnSpanAccessibilityAttribute & MaximumValueAccessibilityAttribute & MinimumValueAccessibilityAttribute & ValueAccessibilityAttribute & PressedAccessibilityAttribute & SelectedAccessibilityAttribute & CheckedAccessibilityAttribute & ExpandedAccessibilityAttribute & FocusedAccessibilityAttribute & CompletionAccessibilityAttribute & DrawAttribute & FillAttribute & StrokeAttribute & RadiusAttribute & PositionPointAttribute & RadiusPointAttribute & CenterPointAttribute & ViewBoxAttribute & NamespaceAttribute & PointsAttribute & ShadowRootModeAttribute & InertAttribute & FetchPriorityAttribute & LoadingAttribute & SourcesAttribute & DecodingAttribute & BlockingAttribute & PopoverAttribute & PopoverTargetAttribute & UseMapAttribute & PlaysInlineAttribute & IntegrityAttribute & AsAttribute & CrossOriginAttribute & SourceLanguageAttribute & SourceDocumentAttribute & AbbreviatedAttribute & ImageSourcesAttribute & ImageSizesAttribute & CommandAttribute
    
    struct Tag: ContentNode, GlobalElement, AllAttributes {        

        var name: String { "tag" }

        var attributes: OrderedDictionary<String, AttributeData>?

        var content: [Content]
        
        var context: EscapeContext

        init(@ContentBuilder<Content> content: () -> [Content]) {
            
            self.context = .tainted(.html)
            self.content = content()
        }
        
        init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
            
            self.attributes = attributes
            self.context = context
            self.content = content
        }
        
        func accessKey(_ value: Character) -> Tag {
            return self.mutate(accesskey: .init("\(value)", context: .trusted))
        }
        
        func `as`(_ value: HTMLKit.Values.Resource) -> Tag {
            return self.mutate(as: .init(value.rawValue, context: .trusted))
        }
        
        func autocapitalize(_ value: Values.Capitalization) -> Tag {
            return self.mutate(autocapitalize: .init(value.rawValue, context: .trusted))
        }
        
        func autofocus() -> Tag {
            return self.mutate(autofocus: .init("autofocus", context: .trusted))
        }
        
        func `class`(_ names: [String]) -> Tag {
            return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
        }
        
        func `class`(_ names: String...) -> Tag {
            return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
        }
        
        func direction(_ value: Values.Direction) -> Tag {
            return self.mutate(dir: .init(value.rawValue, context: .trusted))
        }

        func draggable(_ value: Bool = true) -> Tag {
            return self.mutate(draggable: .init(value, context: .trusted))
        }
        
        func editable(_ value: Bool = true) -> Tag {
            return self.mutate(contenteditable: .init(value, context: .trusted))
        }
        
        func enterKey(_ value: Values.Hint) -> Tag {
            return self.mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
        }
        
        func hidden(_ condition: Bool = true) -> Tag {
            
            if condition {
                return mutate(hidden: .init("hidden", context: .trusted))
            }
            
            return self
        }
    
        func hidden(_ value: Values.Condition) -> Tag {
            return mutate(hidden: .init(value.rawValue, context: .trusted))
        }
        
        func id(_ value: String) -> Tag {
            return self.mutate(id: .init(value, context: .tainted(.html)))
        }
        
        func inputMode(_ value: Values.Mode) -> Tag {
            return mutate(inputmode: .init(value.rawValue, context: .trusted))
        }
        
        func `is`(_ value: String) -> Tag {
            return self.mutate(is: .init(value, context: .tainted(.html)))
        }
        
        func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Tag {

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
        
        func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Tag {

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
        
        func itemProperty(_ value: String) -> Tag {
            return self.mutate(itemprop: .init(value, context: .tainted(.html)))
        }
        
        func language(_ value: Values.Language) -> Tag {
            return self.mutate(lang: .init(value.rawValue, context: .trusted))
        }
        
        func nonce(_ value: String) -> Tag {
            return self.mutate(nonce: .init(value, context: .tainted(.html)))
        }
        
        func role(_ values: [Values.Role]) -> Tag {
            return mutate(role: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func role(_ values:  Values.Role...) -> Tag {
            return mutate(role: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func spellcheck(_ value: Bool = true) -> Tag {
            return self.mutate(spellcheck: .init(value, context: .trusted))
        }
        
        func style(_ value: String) -> Tag {
            return self.mutate(style: .init(value, context: .tainted(.css)))
        }
        
        func tabIndex(_ value: Int) -> Tag {
            return self.mutate(tabindex: .init(value, context: .trusted))
        }
        
        @_disfavoredOverload
        func title(_ value: String) -> Tag {
            return self.mutate(title: .init(value, context: .tainted(.html)))
        }
        
        func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return self.mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func title(verbatim value: String) -> Tag {
            return self.mutate(title: .init(value, context: .tainted(.html)))
        }
        
        func translate(_ value: Bool = true) -> Tag {
            
            if value {
                return self.mutate(translate: .init("yes", context: .trusted))
            }
            
            return self.mutate(translate: .init("no", context: .trusted))
        }
        
        func accept(_ specifiers: [String]) -> Tag {
            return self.mutate(accept: .init(EnumeratedList(values: specifiers, separator: ", "), context: .tainted(.html)))
        }
        
        func accept(_ specifiers: String...) -> Tag {
            return self.mutate(accept: .init(EnumeratedList(values: specifiers, separator: ", "), context: .tainted(.html)))
        }
        
        func accept(_ specifiers: [Values.Media]) -> Tag {
            return self.mutate(accept: .init(EnumeratedList(values: specifiers, separator: ", "), context: .trusted))
        }
        
        func accept(_ specifiers: Values.Media...) -> Tag {
            return self.mutate(accept: .init(EnumeratedList(values: specifiers, separator: ", "), context: .trusted))
        }
        
        func action(_ value: String) -> Tag {
            return self.mutate(action: .init(value, context: .tainted(.html)))
        }
        
        @_disfavoredOverload
        func alternate(_ value: String) -> Tag {
            return self.mutate(alternate: .init(value, context: .tainted(.html)))
        }
        
        func alternate(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return mutate(alternate: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func alternate(verbatim value: String) -> Tag {
            return self.mutate(alternate: .init(value, context: .tainted(.html)))
        }
        
        func asynchronously() -> Tag {
            return self.mutate(async: .init("async", context: .trusted))
        }
        
        public func autocomplete(_ value: Bool) -> Tag {

            if value {
                return mutate(autocomplete: .init("on", context: .trusted))
            }
            
            return mutate(autocomplete: .init("off", context: .trusted))
        }
        
        func autocomplete(_ values: [Values.Completion]) -> Tag {
            return mutate(autocomplete: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func autocomplete(_ values: Values.Completion...) -> Tag {
            return mutate(autocomplete: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func autoplay(_ condition: Bool = true) -> Tag {
            
            if condition {
                return mutate(autoplay: .init("autoplay", context: .trusted))
            }
            
            return self
        }
        
        func charset(_ value: Values.Charset) -> Tag {
            return self.mutate(charset: .init(value.rawValue, context: .trusted))
        }
        
        func checked(_ condition: Bool = true) -> Tag {
            
            if condition {
                return mutate(checked: .init("checked", context: .trusted))
            }
            
            return self
        }
        
        func cite(_ value: String) -> Tag {
            return self.mutate(cite: .init(value, context: .tainted(.html)))
        }
        
        func columns(_ size: Int) -> Tag {
            return self.mutate(cols: .init(size, context: .trusted))
        }
        
        func columnSpan(_ size: Int) -> Tag {
            return self.mutate(colspan: .init(size, context: .trusted))
        }
        
        func content(_ value: String) -> Tag {
            return mutate(content: .init(value, context: .tainted(.html)))
        }
        
        func content(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return mutate(content: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func content(verbatim value: String) -> Tag {
            return mutate(content: .init(value, context: .tainted(.html)))
        }
        
        func controls() -> Tag {
            return self.mutate(controls: .init("controls", context: .trusted))
        }
        
        func data(_ value: String) -> Tag {
            return self.mutate(data: .init(value, context: .tainted(.html)))
        }
        
        func dateTime(_ value: String) -> Tag {
            return self.mutate(datetime: .init(value, context: .tainted(.html)))
        }
        
        func `default`() -> Tag {
            return self.mutate(default: .init("default", context: .trusted))
        }
        
        func `defer`() -> Tag {
            return self.mutate(defer: .init("defer", context: .trusted))
        }
        
        func disabled(_ condition: Bool = true) -> Tag {
            
            if condition {
                return mutate(disabled: .init("disabled", context: .trusted))
            }
            
            return self
        }
        
        func download(_ condition: Bool = true) -> Tag {
            
            if condition {
                return self.mutate(download: .init("download", context: .trusted))
            }
            
            return self
        }
        
        @_disfavoredOverload
        func download(_ name: String) -> Tag {
            return self.mutate(download: .init(name, context: .tainted(.html)))
        }
        
        func download(_ localizedKey: LocalizedStringKey, tableName: String?) -> Tag {
            return self.mutate(download: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func download(verbatim name: String) -> Tag {
            return self.mutate(download: .init(name, context: .tainted(.html)))
        }
        
        func encoding(_ value: Values.Encoding) -> Tag {
            return self.mutate(enctype: .init(value.rawValue, context: .trusted))
        }
        
        func `for`(_ value: String) -> Tag {
            return self.mutate(for: .init(value, context: .tainted(.html)))
        }
        
        func form(_ value: String) -> Tag {
            return self.mutate(form: .init(value, context: .tainted(.html)))
        }
        
        func formAction(_ value: String) -> Tag {
            return self.mutate(formaction: .init(value, context: .tainted(.html)))
        }
        
        func equivalent(_ value: Values.Equivalent) -> Tag {
            return self.mutate(httpequiv: .init(value.rawValue, context: .trusted))
        }
        
        func headers(_ ids: [String]) -> Tag {
            return self.mutate(headers: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func headers(_ ids: String...) -> Tag {
            return self.mutate(headers: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func height(_ size: Int) -> Tag {
            return self.mutate(height: .init(size, context: .trusted))
        }
        
        func high(_ size: Float) -> Tag {
            return self.mutate(high: .init(size, context: .trusted))
        }
        
        func reference(_ value: String) -> Tag {
            return self.mutate(href: .init(value, context: .tainted(.url)))
        }
        
        func referenceLanguage(_ value: Values.Language) -> Tag {
            return self.mutate(hreflang: .init(value.rawValue, context: .trusted))
        }
        
        func isMap() -> Tag {
            return self.mutate(ismap: .init("ismap", context: .trusted))
        }
        
        func kind(_ value: Values.Kind) -> Tag {
            return self.mutate(kind: .init(value.rawValue, context: .trusted))
        }
        
        @_disfavoredOverload
        func label(_ value: String) -> Tag {
            return self.mutate(label: .init(value, context: .tainted(.html)))
        }
        
        func label(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return self.mutate(label: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func label(verbatim value: String) -> Tag {
            return self.mutate(label: .init(value, context: .tainted(.html)))
        }
        
        func list(_ value: String) -> Tag {
            return self.mutate(list: .init(value, context: .tainted(.html)))
        }
        
        func loop(_ condition: Bool = true) -> Tag {
            
            if condition {
                return self.mutate(loop: .init("loop", context: .trusted))
            }
            
            return self
        }
        
        func low(_ size: Float) -> Tag {
            return self.mutate(low: .init(size, context: .trusted))
        }
        
        func maximum(_ value: String) -> Tag {
            return self.mutate(max: .init(value, context: .tainted(.html)))
        }
        
        func maximum(length value: Int) -> Tag {
            return self.mutate(maxlength: .init(value, context: .trusted))
        }
        
        func media(_ value: String) -> Tag {
            return self.mutate(media: .init(value, context: .tainted(.html)))
        }
        
        func media(_ queries: [MediaQuery]) -> Tag {
            return self.mutate(media: .init(EnumeratedList(values: queries, separator: ", "), context: .tainted(.html)))
        }
        
        func media(_ queries: MediaQuery...) -> Tag {
            return self.mutate(media: .init(EnumeratedList(values: queries, separator: ", "), context: .tainted(.html)))
        }
        
        func method(_ value: HTMLKit.Values.Method) -> Tag {
            return self.mutate(method: .init(value.rawValue, context: .trusted))
        }
        
        func minimum(_ value: Float) -> Tag {
            return self.mutate(min: .init(value, context: .trusted))
        }
        
        func minimum(length value: Int) -> Tag {
            return self.mutate(minlength: .init(value, context: .trusted))
        }
        
        func multiple() -> Tag {
            return self.mutate(multiple: .init("multiple", context: .trusted))
        }
        
        func muted() -> Tag {
            return self.mutate(muted: .init( "muted", context: .trusted))
        }
        
        func name(_ value: String) -> Tag {
            return self.mutate(name: .init(value, context: .tainted(.html)))
        }
        
        func novalidate() -> Tag {
            return self.mutate(novalidate: .init("novalidate", context: .trusted))
        }
        
        func open(_ condition: Bool = true) -> Tag {

            if condition {
                return self.mutate(open: .init("open", context: .trusted))
            }
            
            return self
        }
        
        func optimum(_ value: Float) -> Tag {
            return self.mutate(optimum: .init(value, context: .trusted))
        }
        
        func pattern(_ regex: String) -> Tag {
            return self.mutate(pattern: .init(regex, context: .tainted(.html)))
        }
        
        func part(_ value: String) -> Tag {
            return self.mutate(part: .init(value, context: .tainted(.html)))
        }
        
        func ping(_ value: String) -> Tag {
            return self.mutate(ping: .init(value, context: .tainted(.html)))
        }
        
        @_disfavoredOverload
        func placeholder(_ value: String) -> Tag {
            return self.mutate(placeholder: .init(value, context: .tainted(.html)))
        }
        
        func placeholder(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return self.mutate(placeholder: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func placeholder(verbatim value: String) -> Tag {
            return self.mutate(placeholder: .init(value, context: .tainted(.html)))
        }
        
        func playInline(_ condition: Bool = true) -> Tag {
            
            if condition {
                return mutate(playsinline: .init("playsinline", context: .trusted))
            }
            
            return self
        }
        
        func poster(_ value: String) -> Tag {
            return self.mutate(poster: .init(value, context: .tainted(.html)))
        }
        
        func preload(_ value: Values.Preload) -> Tag {
            return self.mutate(preload: .init(value.rawValue, context: .trusted))
        }
        
        func readonly(_ condition: Bool = true) -> Tag {
            
            if condition {
                return mutate(readonly: .init("readonly", context: .trusted))
            }
            
            return self
        }
        
        func referrerPolicy(_ value: Values.Policy) -> Tag {
            return self.mutate(referrerpolicy: .init(value.rawValue, context: .trusted))
        }
        
        public func relationship(_ values: Values.Relation...) -> Tag {
            return mutate(rel: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        public func relationship(_ values: [Values.Relation]) -> Tag {
            return mutate(rel: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func required(_ condition: Bool = true) -> Tag {
            
            if condition {
                return mutate(required: .init("required", context: .trusted))
            }
            
            return self
        }
        
        func reversed() -> Tag {
            return self.mutate(reversed: .init("reversed", context: .trusted))
        }
        
        func rows(_ size: Int) -> Tag {
            return self.mutate(rows: .init(size, context: .trusted))
        }
        
        func rowSpan(_ size: Int) -> Tag {
            return self.mutate(rowspan: .init(size, context: .trusted))
        }
        
        func sandbox() -> Tag {
            return self.mutate(sandbox: .init("sandbox", context: .trusted))
        }
        
        func sandbox(_ values: [Values.Permission]) -> Tag {
            return self.mutate(sandbox: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func sandbox(_ values: Values.Permission...) -> Tag {
            return self.mutate(sandbox: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func scope(_ value: Values.Scope) -> Tag {
            return self.mutate(scope: .init(value.rawValue, context: .trusted))
        }
        
        func shape() -> Tag {
            return self.mutate(shape: .init("default", context: .trusted))
        }
        
        func shape(_ value: Values.Shape, coordinates: String) -> Tag {
            return self.mutate(shape: .init(value.rawValue, context: .trusted)).mutate(coords: .init(coordinates, context: .tainted(.html)))
        }
        
        func size(_ size: Int) -> Tag {
            return self.mutate(size: .init(size, context: .trusted))
        }
        
        func sizes(_ candidates: [SizeCandidate]) -> Tag {
            return self.mutate(sizes: .init(EnumeratedList(values: candidates, separator: ", "), context: .tainted(.html)))
        }
        
        func sizes(_ candidates: SizeCandidate...) -> Tag {
            return self.mutate(sizes: .init(EnumeratedList(values: candidates, separator: ", "), context: .tainted(.html)))
        }
        
        func slot(_ value: String) -> Tag {
            return self.mutate(slot: .init(value, context: .tainted(.html)))
        }
        
        func span(_ size: Int) -> Tag {
            return self.mutate(span: .init(size, context: .trusted))
        }
        
        func source(_ value: String) -> Tag {
            return self.mutate(source: .init(value, context: .tainted(.html)))
        }
        
        func source(_ value: EnvironmentValue) -> Tag {
            return mutate(source: .init(value, context: .tainted(.html)))
        }
        
        func sourceDocument(_ value: String) -> Tag {
            return mutate(sourcedocument: .init(value, context: .tainted(.html)))
        }
        
        func sourceLanguage(_ value: Values.Language) -> Tag {
            return mutate(sourcelanguage: .init(value.rawValue, context: .trusted))
        }
        
        func sources(_ candidates: [SourceCandidate]) -> Tag {
            return mutate(sourceset: .init(EnumeratedList(values: candidates, separator: ", "), context: .tainted(.html)))
        }
        
        func sources(_ candidates: SourceCandidate...) -> Tag {
            return mutate(sourceset: .init(EnumeratedList(values: candidates, separator: ", "), context: .tainted(.html)))
        }
        
        func start(_ size: Int) -> Tag {
            return self.mutate(start: .init(size, context: .trusted))
        }
        
        func step(_ size: Int) -> Tag {
            return self.mutate(step: .init(size, context: .trusted))
        }
        
        func target(_ value: Values.Target) -> Tag {
            return self.mutate(target: .init(value.rawValue, context: .trusted))
        }
        
        func type(_ value: String) -> Tag {
            return self.mutate(type: .init(value, context: .tainted(.html)))
        }
        
        @_disfavoredOverload
        func value(_ value: String) -> Tag {
            return mutate(value: .init(value, context: .tainted(.html)))
        }
        
        func value(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return mutate(value: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func value(verbatim value: String) -> Tag {
            return mutate(value: .init(value, context: .tainted(.html)))
        }
        
        func width(_ size: Int) -> Tag {
            return self.mutate(width: .init(size, context: .trusted))
        }
        
        func wrap(_ value: Values.Wrapping) -> Tag {
            return self.mutate(wrap: .init(value.rawValue, context: .trusted))
        }
        
        func property(_ value: Values.Graph) -> Tag {
            return self.mutate(property: .init(value.rawValue, context: .trusted))
        }
        
        func selected(_ condition: Bool = true) -> Tag {
            
            if condition {
                return self.mutate(selected: .init("selected", context: .trusted))
            }
            
            return self
        }
        
        func draw(_ value: String) -> Tag {
            return self.mutate(draw: .init(value, context: .tainted(.html)))
        }
        
        func fill(_ color: String, opacity: Double? = nil) -> Tag {

            var copy = self
            
            copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
            
            if let opacity = opacity {
                copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
            }
            
            return copy
        }
        
        public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Tag {

            var copy = self
            
            copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
            
            if let width = width {
                copy = copy.mutate(strokewidth: .init(width, context: .trusted))
            }
            
            if let opacity = opacity {
                copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
            }
            
            if let cap = cap {
                copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
            }
            
            if let join = join {
                copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
            }
            
            return copy
        }
        
        func radius(_ size: Int) -> Tag {
            return self.mutate(radius: .init(size, context: .trusted))
        }
        
        func position(x: Int, y: Int) -> Tag {
            return self.mutate(x: .init(x, context: .trusted)).mutate(y: .init(x, context: .trusted))
        }
    
        func position(x: Double, y: Double) -> Tag {
            return self.mutate(x: .init(x, context: .trusted)).mutate(y: .init(y, context: .trusted))
        }
        
        func position(_ point: UnitPoint) -> Tag {
            return self.mutate(x: .init(point.x, context: .trusted)).mutate(y: .init(point.y, context: .trusted))
        }
        
        func radius(x: Int, y: Int) -> Tag {
            return self.mutate(rx: .init(x, context: .trusted)).mutate(ry: .init(y, context: .trusted))
        }
        
        func radius(x: Double, y: Double) -> Tag {
            return self.mutate(rx: .init(x, context: .trusted)).mutate(ry: .init(y, context: .trusted))
        }
        
        func radius(_ point: HTMLKit.UnitPoint) -> Tag {
            return self.mutate(rx: .init(point.x, context: .trusted)).mutate(ry: .init(point.y, context: .trusted))
        }
        
        func center(x: Int, y: Int) -> Tag {
            return self.mutate(cx: .init(x, context: .trusted)).mutate(cy: .init(y, context: .trusted))
        }
        
        func center(x: Double, y: Double) -> Tag {
            return self.mutate(cx: .init(x, context: .trusted)).mutate(cy: .init(y, context: .trusted))
        }
        
        func center(_ point: UnitPoint) -> Tag {
            return self.mutate(cx: .init(point.x, context: .trusted)).mutate(cy: .init(point.y, context: .trusted))
        }
        
        func viewBox(_ value: String) -> Tag {
            return self.mutate(viewbox: .init(value, context: .tainted(.html)))
        }
        
        func viewBox(x: Int, y: Int, width: Int, height: Int) -> Tag {
            return self.mutate(viewbox: .init("\(x) \(y) \(width) \(height)", context: .trusted))
        }
        
        func viewBox(x: Double, y: Double, width: Double, height: Double) -> Tag {
            return self.mutate(viewbox: .init("\(x) \(y) \(width) \(height)", context: .trusted))
        }
        
        func namespace(_ value: String) -> Tag {
            return self.mutate(namespace: .init(value, context: .tainted(.html)))
        }
        
        func points(_ value: String) -> Tag {
            return self.mutate(points: .init(value, context: .tainted(.html)))
        }
        
        func fetchPriority(_ value: Values.Priority) -> Tag {
            return self.mutate(fetchpriority: .init(value.rawValue, context: .trusted))
        }
        
        func loading(_ value: Values.Loading) -> Tag {
            return self.mutate(loading: .init(value.rawValue, context: .trusted))
        }
        
        func decoding(_ value: Values.Decoding) -> Tag {
            return self.mutate(decoding: .init(value.rawValue, context: .trusted))
        }
        
        func popover(_ value: Values.Popover.State) -> Tag {
            return self.mutate(popover: .init(value.rawValue, context: .trusted))
        }
        
        func popoverTarget(_ id: String, action: Values.Popover.Action? = nil) -> Tag {

            var copy = self
            
            copy = copy.mutate(popovertarget: .init(id, context: .tainted(.html)))
            
            if let action = action {
                copy = copy.mutate(popoveraction: .init(action.rawValue, context: .trusted))
            }
            
            return copy
        }
        
        func useMap(_ id: String) -> Tag {
            return mutate(usemap: .init("#\(id)", context: .tainted(.html)))
        }
        
        func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Tag {
            return mutate(key: key, value: .init(value, context: context))
        }
        
        func custom(key: String, value: Int) -> Tag {
            return mutate(key: key, value: .init(value, context: .trusted))
        }
        
        func custom(key: String, value: Double) -> Tag {
            return mutate(key: key, value: .init(value, context: .trusted))
        }
        
        func custom(key: String, value: Bool) -> Tag {
            return mutate(key: key, value: .init(value, context: .trusted))
        }
        
        func custom(key: String, value: Float) -> Tag {
            return mutate(key: key, value: .init(value, context: .trusted))
        }
        
        func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Tag {
            return mutate(key: key, value: .init(value, context: context))
        }
        
        func blocking(_ value: Values.Blocking) -> Tag {
            return self.mutate(blocking: .init(value.rawValue, context: .trusted))
        }
        
        func integrity(_ hashes: String...) -> Tag {
            return self.mutate(integrity: .init(EnumeratedList(values: hashes, separator: " "), context: .tainted(.html)))
        }
        
        func integrity(_ hashes: [String]) -> Tag {
            return self.mutate(integrity: .init(EnumeratedList(values: hashes, separator: " "), context: .tainted(.html)))
        }
        
        func crossOrigin(_ value: Credential.Mode) -> Tag {
            return self.mutate(crossorigin: .init(value.rawValue, context: .trusted))
        }
        
        func on(event: Events.Window, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Focus, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Pointer, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Mouse, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Wheel, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Input, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Keyboard, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Drag, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Clipboard, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Selection, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Media, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Form, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func on(event: Events.Detail, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
        }
        
        func accessibilityAtomic(_ value: Bool = true) -> Tag {
            return mutate(ariaatomic: .init(value, context: .trusted))
        }
        
        func accessibilityBusy(_ value: Bool = true) -> Tag {
            return mutate(ariabusy: .init(value, context: .trusted))
        }
        
        func accessibilityControls(_ ids: [String]) -> Tag {
            return mutate(ariacontrols: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func accessibilityControls(_ ids: String...) -> Tag {
            return mutate(ariacontrols: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func accessibilityCurrent(_ value: Bool = true) -> Tag {
            return mutate(ariacurrent: .init(value, context: .trusted))
        }
        
        func accessibilityCurrent(_ value: Values.Accessibility.Current) -> Tag {
            return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
        }
        
        public func accessibilityDescriptions(_ ids: [String]) -> Tag {
            return mutate(ariadescribedby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        public func accessibilityDescriptions(_ ids: String...) -> Tag {
            return mutate(ariadescribedby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func aria(details value: String) -> Tag {
            return mutate(ariadetails: .init(value, context: .tainted(.html)))
        }
        
        func accessibilityDetail(_ id: String) -> Tag {
            return mutate(ariadetails: .init(id, context: .tainted(.html)))
        }
        
        func accessibilityDisabled(_ value: Bool = true) -> Tag {
            return mutate(ariadisabled: .init(value, context: .trusted))
        }
        
        func accessibilityFlow(_ ids: [String]) -> Tag {
            return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func accessibilityFlow(_ ids: String...) -> Tag {
            return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func accessibilityPopup(_ value: Values.Accessibility.Popup) -> Tag {
            return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
        }
        
        func accessibilityHidden(_ value: Bool = true) -> Tag {
            return mutate(ariahidden: .init(value, context: .trusted))
        }
        
        func accessibilityInvalid(_ value: HTMLKit.Values.Accessibility.Invalid) -> Tag {
            return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
        }
        
        func accessibilityInvalid(_ value: Bool = true, message id: String? = nil) -> Tag {
            
            if let id = id {
                return mutate(ariainvalid: .init(value, context: .trusted)).mutate(ariaerrormessage: .init(id, context: .tainted(.html)))
            }
            
            return mutate(ariainvalid: .init(value, context: .trusted))
        }
        
        func accessibilityShortcuts(_ values: [KeyboardShortcut]) -> Tag {
            return mutate(ariakeyshortcuts: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func accessibilityShortcuts(_ values: KeyboardShortcut...) -> Tag {
            return mutate(ariakeyshortcuts: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }

        @_disfavoredOverload
        func accessibilityLabel(_ value: String) -> Tag {
            return mutate(arialabel: .init(value, context: .tainted(.html)))
        }
        
        func accessibilityLabel(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return mutate(arialabel: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func accessibilityLabel(verbatim value: String) -> Tag {
            return mutate(arialabel: .init(value, context: .tainted(.html)))
        }
        
        func accessibilityLabels(_ ids: [String]) -> Tag {
            return mutate(arialabeledby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func accessibilityLabels(_ ids: String...) -> Tag {
            return mutate(arialabeledby: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func accessibilityLive(_ value: Values.Accessibility.Live) -> Tag {
            return mutate(arialive: .init(value.rawValue, context: .trusted))
        }
        
        func accessibilityOwns(_ ids: [String]) -> Tag {
            return mutate(ariaowns: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func accessibilityOwns(_ ids: String...) -> Tag {
            return mutate(ariaowns: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func accessibilityRelevant(_ values: [Values.Accessibility.Relevant]) -> Tag {
            return mutate(ariarelevant: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func accessibilityRelevant(_ values: Values.Accessibility.Relevant...) -> Tag {
            return mutate(ariarelevant: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        @_disfavoredOverload
        func accessibilityRoleDescription(_ value: String) -> Tag {
            return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
        }
        
        func accessibilityRoleDescription(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return mutate(ariaroledescription: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func accessibilityRoleDescription(verbatim: String) -> Tag {
            return mutate(ariaroledescription: .init(verbatim, context: .tainted(.html)))
        }
        
        func accessibilitySort(_ value: Values.Accessibility.Sort) -> Tag {
            return mutate(ariasort: .init(value.rawValue, context: .trusted))
        }
        
        func accessibilityOrientation(_ value: Values.Accessibility.Orientation) -> Tag {
            return mutate(ariaorientation: .init(value.rawValue, context: .trusted))
        }
        
        func accessibilityRequired(_ value: Bool = true) -> Tag {
            return mutate(ariarequired: .init(value, context: .trusted))
        }
        
        func accessibilityReadonly(_ value: Bool = true) -> Tag {
            return mutate(ariareadonly: .init(value, context: .trusted))
        }
        
        func accessibilityModal(_ value: Bool = true) -> Tag {
            return mutate(ariamodal: .init(value, context: .trusted))
        }
        
        func accessibilityLevel(_ value: Int) -> Tag {
            return mutate(arialevel: .init(value, context: .trusted))
        }
        
        @_disfavoredOverload
        func accessibilityHint(_ value: String) -> Tag {
            return mutate(ariaplaceholder: .init(value, context: .tainted(.html)))
        }
        
        func accessibilityHint(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return mutate(ariaplaceholder: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func accessibilityHint(verbatim value: String) -> Tag {
            return mutate(ariaplaceholder: .init(value, context: .tainted(.html)))
        }
        
        func accessibilityPosition(_ index: Int, in size: Int) -> Tag {
            return mutate(ariaposinset: .init(index, context: .trusted)).mutate(ariasetsize: .init(size, context: .trusted))
        }
        
        func accessibilityMultiline(_ value: Bool = true) -> Tag {
            return mutate(ariamultiline: .init(value, context: .trusted))
        }
        
        func accessibilityMultiselect(_ value: Bool = true) -> Tag {
            return mutate(ariamultiselectable: .init(value, context: .trusted))
        }
        
        func accessibilityRowIndex(_ value: Int) -> Tag {
            return mutate(ariarowindex: .init(value, context: .trusted))
        }
        
        func accessibilityRowCount(_ value: Int) -> Tag {
            return mutate(ariarowcount: .init(value, context: .trusted))
        }
        
        func accessibilityColumnIndex(_ value: Int) -> Tag {
            return mutate(ariacolindex: .init(value, context: .trusted))
        }
        
        func accessibilityColumnCount(_ value: Int) -> Tag {
            return mutate(ariacolcount: .init(value, context: .trusted))
        }
        
        func accessibilityRowSpan(_ value: Int) -> Tag {
            return mutate(ariarowspan: .init(value, context: .trusted))
        }
        
        func accessibilityColumnSpan(_ value: Int) -> Tag {
            return mutate(ariacolspan: .init(value, context: .trusted))
        }
        
        func accessibilityMaximumValue(_ value: Float) -> Tag {
            return mutate(ariavaluemax: .init(value, context: .trusted))
        }
        
        func accessibilityMinimumValue(_ value: Float) -> Tag {
            return mutate(ariavaluemin: .init(value, context: .trusted))
        }
        
        @_disfavoredOverload
        func accessibilityValue(_ value: Float, description text: String? = nil) -> Tag {
            
            if let text = text {
                return mutate(ariavaluenow: .init(value, context: .trusted)).mutate(ariavaluetext: .init(text, context: .tainted(.html)))
            }
            
            return mutate(ariavaluenow: .init(value, context: .trusted))
        }
        
        func accessibilityValue(_ value: Float, description localizedKey: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return mutate(ariavaluenow: .init(value, context: .trusted)).mutate(ariavaluetext: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func accessibilityPressed(_ value: Bool = true) -> Tag {
            return mutate(ariapressed: .init(value, context: .trusted))
        }
        
        func accessibilitySelected(_ value: Bool = true) -> Tag {
            return mutate(ariaselected: .init(value, context: .trusted))
        }
        
        func accessibilityChecked(_ value: Bool = true) -> Tag {
            return mutate(ariachecked: .init(value, context: .trusted))
        }
        
        func accessibilityExpanded(_ value: Bool = true) -> Tag {
            return mutate(ariaexpanded: .init(value, context: .trusted))
        }
        
        func accessibilityFocused(_ id: String) -> Tag {
            return mutate(ariaactivedescendant: .init(id, context: .tainted(.html)))
        }
        
        func accessibilityCompletion(_ values: [Values.Accessibility.Complete]) -> Tag {

            if values == [.list, .inline] || values == [.inline, .list] {
                return mutate(ariaautocomplete: .init("both", context: .trusted))
            }
            
            return mutate(ariaautocomplete: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func accessibilityCompletion(_ values: Values.Accessibility.Complete...) -> Tag {
            
            if values == [.list, .inline] || values == [.inline, .list] {
                return mutate(ariaautocomplete: .init("both", context: .trusted))
            }
            
            return mutate(ariaautocomplete: .init(EnumeratedList(values: values, separator: " "), context: .trusted))
        }
        
        func shadowRootMode(_ value: Values.Shadow.Mode) -> Tag {
            return mutate(shadowrootmode: .init(value.rawValue, context: .trusted))
        }
        
        func inert(_ condition: Bool = true) -> Tag {
            
            if condition {
                return mutate(inert: .init("inert", context: .trusted))
            }
            
            return self
        }
        
        @_disfavoredOverload
        func abbreviated(_ value: String) -> Tag {
            return self.mutate(abbr: .init(value, context: .tainted(.html)))
        }
        
        func abbreviated(_ localizedKey: HTMLKit.LocalizedStringKey, tableName: String? = nil) -> Tag {
            return self.mutate(abbr: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
        }
        
        func abbreviated(verbatim value: String) -> Tag {
            return self.mutate(abbr: .init(value, context: .tainted(.html)))
        }
        
        func imageSources(_ candidates: [HTMLKit.SourceCandidate]) -> Tag {
            return mutate(imagesrcset: .init(EnumeratedList(values: candidates, separator: ", "), context: .tainted(.html)))
        }
        
        func imageSources(_ candidates: HTMLKit.SourceCandidate...) -> Tag {
            return mutate(imagesrcset: .init(EnumeratedList(values: candidates, separator: ", "), context: .tainted(.html)))
        }
        
        func imageSizes(_ candidates: [HTMLKit.SizeCandidate]) -> Tag {
            return mutate(imagesizes: .init(EnumeratedList(values: candidates, separator: ", "), context: .tainted(.html)))
        }
        
        func imageSizes(_ candidates: HTMLKit.SizeCandidate...) -> Tag {
            return mutate(imagesizes: .init(EnumeratedList(values: candidates, separator: ", "), context: .tainted(.html)))
        }
        
        func command(_ action: ActionCommand, for target: String) -> Tag {
            return mutate(command:.init(action.rawValue, context: .trusted)).mutate(commandfor: .init(target, context: .tainted(.html)))
        }
        
        func command(_ action: String, for target: String) -> Tag {
            return mutate(command:.init("--\(action)", context: .tainted(.html))).mutate(commandfor: .init(target, context: .tainted(.html)))
        }
    }
    
    var renderer = Renderer()
    
    @Test
    func testAccesskeyAttribute() throws {
        
        let view = TestView {
            Tag {}.accessKey("s")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag accesskey="s"></tag>
                       """
        )
    }
    
    @Test
    func testAutocapitalizeAttribute() throws {
        
        let view = TestView {
            Tag {}.autocapitalize(.words)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag autocapitalize="words"></tag>
                       """
        )
    }
    
    @Test
    func testAutofocusAttribute() throws {
        
        let view = TestView {
            Tag {}.autofocus()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag autofocus="autofocus"></tag>
                       """
        )
    }
    
    @Test
    func testClassAttribute() throws {
        
        let view = TestView {
            Tag {}.class("container")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag class="container"></tag>
                       """
        )
    }
    
    @Test
    func testDirectionAttribute() throws {
        
        let view = TestView {
            Tag {}.direction(.leftToRight)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag dir="ltr"></tag>
                       """
        )
    }
    
    @Test
    func testDraggableAttribute() throws {
        
        let view = TestView {
            Tag {}.draggable()
            Tag {}.draggable(false)
            Tag {}.draggable(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag draggable="true"></tag>\
                       <tag draggable="false"></tag>\
                       <tag draggable="true"></tag>
                       """
        )
    }
    
    @Test
    func testEditableAttribute() throws {
        
        let view = TestView {
            Tag {}.editable()
            Tag {}.editable(false)
            Tag {}.editable(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag contenteditable="true"></tag>\
                       <tag contenteditable="false"></tag>\
                       <tag contenteditable="true"></tag>
                       """
        )
    }
    
    @Test
    func testEnterkeyhintAttribute() throws {
        
        let view = TestView {
            Tag {}.enterKey(.enter)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag enterkeyhint="enter"></tag>
                       """
        )
    }
    
    @Test
    func testHiddenAttribute() throws {
        
        let view = TestView {
            Tag {}.hidden()
            Tag {}.hidden(false)
            Tag {}.hidden(true)
            Tag {}.hidden(.untilFound)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag hidden="hidden"></tag>\
                       <tag></tag>\
                       <tag hidden="hidden"></tag>\
                       <tag hidden="until-found"></tag>
                       """
        )
    }
    
    @Test
    func testIdentifierAttribute() throws {
        
        let view = TestView {
            Tag {}.id("navigation")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag id="navigation"></tag>
                       """
        )
    }
    
    @Test
    func testLanguageAttribute() throws {
        
        let view = TestView {
            Tag {}.language(.german)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag lang="de"></tag>
                       """
        )
    }
    
    @Test
    func testNonceAttribute() throws {
        
        let view = TestView {
            Tag {}.nonce("84a97f593e589c45")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag nonce="84a97f593e589c45"></tag>
                       """
        )
    }
    
    @Test
    func testRoleAttribute() throws {
        
        let view = TestView {
            Tag {}.role(.alert)
            Tag {}.role([.alertDialog, .alert])
            Tag {}.role(.alertDialog, .alert)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag role="alert"></tag>\
                       <tag role="alertdialog alert"></tag>\
                       <tag role="alertdialog alert"></tag>
                       """
        )
    }
    
    @Test
    func testHasSpellCheckAttribute() throws {
        
        let view = TestView {
            Tag {}.spellcheck()
            Tag {}.spellcheck(false)
            Tag {}.spellcheck(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag spellcheck="true"></tag>\
                       <tag spellcheck="false"></tag>\
                       <tag spellcheck="true"></tag>
                       """
        )
    }
    
    @Test
    func testStyleAttribute() throws {
        
        let view = TestView {
            Tag {}.style("background-color:powderblue;")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag style="background-color:powderblue;"></tag>
                       """
        )
    }
    
    @Test
    func testTabIndexAttribute() throws {
        
        let view = TestView {
            Tag {}.tabIndex(3)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag tabindex="3"></tag>
                       """
        )
    }
    
    @Test
    func testTitleAttribute() throws {
        
        let view = TestView {
            Tag {}.title("homeview")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag title="homeview"></tag>
                       """
        )
    }
    
    @Test
    func testTranslateAttribute() throws {
        
        let view = TestView {
            Tag {}.translate()
            Tag {}.translate(false)
            Tag {}.translate(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag translate="yes"></tag>\
                       <tag translate="no"></tag>\
                       <tag translate="yes"></tag>
                       """
        )
    }
    
    @Test
    func testAcceptAttribute() throws {
        
        let view = TestView {
            Tag {}.accept("image/*")
            Tag {}.accept([".jpg", ".png", ".svg"])
            Tag {}.accept(".jpg", ".png", ".svg")
            Tag {}.accept([.ogg, .mpeg])
            Tag {}.accept(.ogg, .mpeg)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag accept="image/*"></tag>\
                       <tag accept=".jpg, .png, .svg"></tag>\
                       <tag accept=".jpg, .png, .svg"></tag>\
                       <tag accept="video/ogg, audio/mpeg"></tag>\
                       <tag accept="video/ogg, audio/mpeg"></tag>
                       """
        )
    }
    
    @Test
    func testActionAttribute() throws {
        
        let view = TestView {
            Tag {}.action("action")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag action="action"></tag>
                       """
        )
    }
    
    @Test
    func testAlternateAttribute() throws {
        
        let view = TestView {
            Tag {}.alternate("a tag and a attribute")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag alt="a tag and a attribute"></tag>
                       """
        )
    }
    
    @Test
    func testAsynchronouslyAttribute() throws {
        
        let view = TestView {
            Tag {}.asynchronously()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag async="async"></tag>
                       """
        )
    }
    
    @Test
    func testCompleteAttribute() throws {
        
        let view = TestView {
            Tag {}.autocomplete(true)
            Tag {}.autocomplete(false)
            Tag {}.autocomplete([.organization, .organizationTitle])
            Tag {}.autocomplete(.organization, .organizationTitle)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag autocomplete="on"></tag>\
                       <tag autocomplete="off"></tag>\
                       <tag autocomplete="organization organization-title"></tag>\
                       <tag autocomplete="organization organization-title"></tag>
                       """
        )
    }
    
    @Test
    func testAutoplayAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.autoplay()
            // with false condition
            Tag {}.autoplay(false)
            // with true condition
            Tag {}.autoplay(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag autoplay="autoplay"></tag>\
                       <tag></tag>\
                       <tag autoplay="autoplay"></tag>
                       """
        )
    }
    
    @Test
    func testCharsetAttribute() throws {
        
        let view = TestView {
            Tag {}.charset(.utf8)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag charset="utf-8"></tag>
                       """
        )
    }
    
    @Test
    func testCheckedAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.checked()
            // with false condition
            Tag {}.checked(false)
            // with true condition
            Tag {}.checked(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag checked="checked"></tag>\
                       <tag></tag>\
                       <tag checked="checked"></tag>
                       """
        )
    }
    
    @Test
    func testCiteAttribute() throws {
        
        let view = TestView {
            Tag {}.cite("cite")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag cite="cite"></tag>
                       """
        )
    }
    
    @Test
    func testColumnsAttribute() throws {
        
        let view = TestView {
            Tag {}.columns(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag cols="2"></tag>
                       """
        )
    }
    
    @Test
    func testColumnSpanAttribute() throws {
        
        let view = TestView {
            Tag {}.columnSpan(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag colspan="2"></tag>
                       """
        )
    }
    
    @Test
    func testContentAttribute() throws {
        
        let view = TestView {
            Tag {}.content("content")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag content="content"></tag>
                       """
        )
    }
    
    @Test
    func testControlsAttribute() throws {
        
        let view = TestView {
            Tag {}.controls()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag controls="controls"></tag>
                       """
        )
    }
    
    @Test
    func testDataAttribute() throws {
        
        let view = TestView {
            Tag {}.data("https://www.github.com")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag data="https://www.github.com"></tag>
                       """
        )
    }
    
    @Test
    func testDateTimeAttribute() throws {
        
        let view = TestView {
            Tag {}.dateTime("YYYY-MM-DDThh:mm:ssTZD")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag datetime="YYYY-MM-DDThh:mm:ssTZD"></tag>
                       """
        )
    }
    
    @Test
    func testDefaultAttribute() throws {
        
        let view = TestView {
            Tag {}.default()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag default="default"></tag>
                       """
        )
    }
    
    @Test
    func testDeferAttribute() throws {
        
        let view = TestView {
            Tag {}.defer()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag defer="defer"></tag>
                       """
        )
    }
    
    @Test
    func testDisabledAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.disabled()
            // with false condition
            Tag {}.disabled(false)
            // with true condition
            Tag {}.disabled(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag disabled="disabled"></tag>\
                       <tag></tag>\
                       <tag disabled="disabled"></tag>
                       """
        )
    }
    
    @Test
    func testDownloadAttribute() throws {
        
        let view = TestView {
            Tag {}.download()
            Tag {}.download(false)
            Tag {}.download(true)
            Tag {}.download("filename")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag download="download"></tag>\
                       <tag></tag>\
                       <tag download="download"></tag>\
                       <tag download="filename"></tag>
                       """
        )
    }
    
    @Test
    func testEncodingAttribute() throws {
        
        let view = TestView {
            Tag {}.encoding(.plainText)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag enctype="text/plain"></tag>
                       """
        )
    }
    
    @Test
    func testForAttribute() throws {
        
        let view = TestView {
            Tag {}.for("for")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag for="for"></tag>
                       """
        )
    }
    
    @Test
    func testFormAttribute() throws {
        
        let view = TestView {
            Tag {}.form("/action.php")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag form="/action.php"></tag>
                       """
        )
    }
    
    @Test
    func testFormActionAttribute() throws {
        
        let view = TestView {
            Tag {}.formAction("/action.php")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag formaction="/action.php"></tag>
                       """
        )
    }
    
    @Test
    func testEquivalentAttribute() throws {
        
        let view = TestView {
            Tag {}.equivalent(.refresh)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag http-equiv="refresh"></tag>
                       """
        )
    }
    
    @Test
    func testHeadersAttribute() throws {
        
        let view = TestView {
            Tag {}.headers("id")
            Tag {}.headers("id", "id")
            Tag {}.headers(["id", "id"])
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag headers="id"></tag>\
                       <tag headers="id id"></tag>\
                       <tag headers="id id"></tag>
                       """
        )
    }
    
    @Test
    func testHeightAttribute() throws {
        
        let view = TestView {
            Tag {}.height(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag height="2"></tag>
                       """
        )
    }
    
    @Test
    func testHighAttribute() throws {
        
        let view = TestView {
            Tag {}.high(2.0)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag high="2.0"></tag>
                       """
        )
    }
    
    @Test
    func testItemAttribute() throws {
        
        let view = TestView {
            Tag {}.item()
            Tag {}.item(id: "id")
            Tag {}.item(as: "https://schema.org/Person")
            Tag {}.item(as: URL(string: "https://schema.org/Person"))
            Tag {}.item(for: "foo", "bar")
            Tag {}.item(for: ["foo", "bar"])
            
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag itemscope="itemscope"></tag>\
                       <tag itemscope="itemscope" itemid="id"></tag>\
                       <tag itemscope="itemscope" itemtype="https://schema.org/Person"></tag>\
                       <tag itemscope="itemscope" itemtype="https://schema.org/Person"></tag>\
                       <tag itemscope="itemscope" itemref="foo bar"></tag>\
                       <tag itemscope="itemscope" itemref="foo bar"></tag>
                       """
        )
    }
    
    @Test
    func testReferenceAttribute() throws {
        
        let view = TestView {
            Tag {}.reference("/index.html")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag href="/index.html"></tag>
                       """
        )
    }
    
    @Test
    func testReferenceLanguageAttribute() throws {
        
        let view = TestView {
            Tag {}.referenceLanguage(.german)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag hreflang="de"></tag>
                       """
        )
    }
    
    @Test
    func testIsMapAttribute() throws {
        
        let view = TestView {
            Tag {}.isMap()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag ismap="ismap"></tag>
                       """
        )
    }
    
    @Test
    func testKindAttribute() throws {
        
        let view = TestView {
            Tag {}.kind(.subtitles)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag kind="subtitles"></tag>
                       """
        )
    }
    
    @Test
    func testLabelAttribute() throws {
        
        let view = TestView {
            Tag {}.label("Soccer")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag label="Soccer"></tag>
                       """
        )
    }
    
    @Test
    func testListAttribute() throws {
        
        let view = TestView {
            Tag {}.list("browsers")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag list="browsers"></tag>
                       """
        )
    }
    
    @Test
    func testLoopAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.loop()
            // with a false condition
            Tag {}.loop(false)
            // with a true condition
            Tag {}.loop(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag loop="loop"></tag>\
                       <tag></tag>\
                       <tag loop="loop"></tag>
                       """
        )
    }
    
    @Test
    func testLowAttribute() throws {
        
        let view = TestView {
            Tag {}.low(2.0)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag low="2.0"></tag>
                       """
        )
    }
    
    @Test
    func testMaximumAttribute() throws {
        
        let view = TestView {
            Tag {}.maximum("1948-01-01")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag max="1948-01-01"></tag>
                       """
        )
    }
    
    @Test
    func testMaximumLengthAttribute() throws {
        
        let view = TestView {
            Tag {}.maximum(length: 2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag maxlength="2"></tag>
                       """
        )
    }

    @Test
    func testMediaAttribute() throws {
        
        let view = TestView {
            Tag {}.media(MediaQuery(.all, features: .orientation(.landscape), .resolution("300dpi")))
            Tag {}.media(MediaQuery(.all), MediaQuery(.print))
            Tag {}.media(MediaQuery(.all), MediaQuery(.print, features: [.maxHeight("20vh")]))
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag media="all and (orientation: landscape) and (resolution: 300dpi)"></tag>\
                       <tag media="all, print"></tag>\
                       <tag media="all, print and (max-height: 20vh)"></tag>
                       """
        )
    }
    
    @Test
    func testMethodAttribute() throws {
        
        let view = TestView {
            Tag {}.method(.get)
            Tag {}.method(.post)
            Tag {}.method(.dialog)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag method="get"></tag>\
                       <tag method="post"></tag>\
                       <tag method="dialog"></tag>
                       """
        )
    }
    
    @Test
    func testMinimumAttribute() throws {
        
        let view = TestView {
            Tag {}.minimum(2.0)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag min="2.0"></tag>
                       """
        )
    }
    
    @Test
    func testMinimumLengthAttribute() throws {
        
        let view = TestView {
            Tag {}.minimum(length: 2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag minlength="2"></tag>
                       """
        )
    }
    
    @Test
    func testMultipleAttribute() throws {
        
        let view = TestView {
            Tag {}.multiple()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag multiple="multiple"></tag>
                       """
        )
    }
    
    @Test
    func testMutedAttribute() throws {
        
        let view = TestView {
            Tag {}.muted()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag muted="muted"></tag>
                       """
        )
    }
    
    @Test
    func testNameAttribute() throws {
        
        let view = TestView {
            Tag {}.name("name")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag name="name"></tag>
                       """
        )
    }
    
    @Test
    func testNoValidateAttribute() throws {
        
        let view = TestView {
            Tag {}.novalidate()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag novalidate="novalidate"></tag>
                       """
        )
    }
    
    @Test
    func testIsOpenAttribute() throws {
        
        let view = TestView {
            Tag {}.open()
            Tag {}.open(false)
            Tag {}.open(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag open="open"></tag>\
                       <tag></tag>\
                       <tag open="open"></tag>
                       """
        )
    }
    
    @Test
    func testOptimumAttribute() throws {
        
        let view = TestView {
            Tag {}.optimum(2.0)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag optimum="2.0"></tag>
                       """
        )
    }
    
    @Test
    func testPatternAttribute() throws {
        
        let view = TestView {
            Tag {}.pattern("[A-Za-z]{3}")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag pattern="[A-Za-z]{3}"></tag>
                       """
        )
    }
    
    @Test
    func testPartAttribute() throws {
        
        let view = TestView {
            Tag {}.part("part")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag part="part"></tag>
                       """
        )
    }
    
    @Test
    func testPingAttribute() throws {
        
        let view = TestView {
            Tag {}.ping("https://www.github.com")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag ping="https://www.github.com"></tag>
                       """
        )
    }
    
    @Test
    func testPlaceholderAttribute() throws {
        
        let view = TestView {
            Tag {}.placeholder("123-45-678")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag placeholder="123-45-678"></tag>
                       """
        )
    }
    
    @Test
    func testPlaysInlineAttribute() throws {
        
        let view = TestView {
            Tag {}.playInline()
            Tag {}.playInline(false)
            Tag {}.playInline(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag playsinline="playsinline"></tag>\
                       <tag></tag>\
                       <tag playsinline="playsinline"></tag>
                       """
        )
    }
    
    @Test
    func testPosterAttribute() throws {
        
        let view = TestView {
            Tag {}.poster("https://www.github.com")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag poster="https://www.github.com"></tag>
                       """
        )
    }
    
    @Test
    func testPreloadAttribute() throws {
        
        let view = TestView {
            Tag {}.preload(.metadata)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag preload="metadata"></tag>
                       """
        )
    }
    
    @Test
    func testReadonlyAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.readonly()
            // with false condition
            Tag {}.readonly(false)
            // with true condition
            Tag {}.readonly(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag readonly="readonly"></tag>\
                       <tag></tag>\
                       <tag readonly="readonly"></tag>
                       """
        )
    }
    
    @Test
    func testReferrerPolicyAttribute() throws {
        
        let view = TestView {
            Tag {}.referrerPolicy(.origin)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag referrerpolicy="origin"></tag>
                       """
        )
    }
    
    @Test
    func testRelationshipAttribute() throws {
        
        let view = TestView {
            Tag {}.relationship(.author)
            Tag {}.relationship(.author, .external)
            Tag {}.relationship([.author, .external])
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag rel="author"></tag>\
                       <tag rel="author external"></tag>\
                       <tag rel="author external"></tag>
                       """
        )
    }
    
    @Test
    func testRequiredAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.required()
            // with false condition
            Tag {}.required(false)
            // with true condition
            Tag {}.required(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag required="required"></tag>\
                       <tag></tag>\
                       <tag required="required"></tag>
                       """
        )
    }
    
    @Test
    func testReversedAttribute() throws {
        
        let view = TestView {
            Tag {}.reversed()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag reversed="reversed"></tag>
                       """
        )
    }
    
    @Test
    func testRowsAttribute() throws {
        
        let view = TestView {
            Tag {}.rows(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag rows="2"></tag>
                       """
        )
    }
    
    @Test
    func testRowSpanAttribute() throws {
        
        let view = TestView {
            Tag {}.rowSpan(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag rowspan="2"></tag>
                       """
        )
    }
    
    @Test
    func testSandboxAttribute() throws {
        
        let view = TestView {
            Tag {}.sandbox()
            Tag {}.sandbox(.allowDownloads)
            Tag {}.sandbox([.allowDownloads, .allowForms])
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag sandbox="sandbox"></tag>\
                       <tag sandbox="allow-downloads"></tag>\
                       <tag sandbox="allow-downloads allow-forms"></tag>
                       """
        )
    }
    
    @Test
    func testScopeAttribute() throws {
        
        let view = TestView {
            Tag {}.scope(.column)
            Tag {}.scope(.row)
            Tag {}.scope(.columnGroup)
            Tag {}.scope(.rowGroup)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag scope="col"></tag>\
                       <tag scope="row"></tag>\
                       <tag scope="colgroup"></tag>\
                       <tag scope="rowgroup"></tag>
                       """
        )
    }
    
    @Test
    func testShapeAttribute() throws {
        
        let view = TestView {
            Tag {}.shape()
            Tag {}.shape(.circle, coordinates: "255,132,316,150")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag shape="default"></tag>\
                       <tag shape="circle" coords="255,132,316,150"></tag>
                       """
        )
    }
    
    @Test
    func testSizeAttribute() throws {
        
        let view = TestView {
            Tag {}.size(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag size="2"></tag>
                       """
        )
    }
    
    @Test
    func testSizesAttribute() throws {
        
        let view = TestView {
            Tag {}.sizes(SizeCandidate("auto"))
            Tag {}.sizes(SizeCandidate("100vw", conditions: .orientation(.landscape)))
            Tag {}.sizes(SizeCandidate("100vw", conditions: .orientation(.portrait)))
            Tag {}.sizes(SizeCandidate("100vw", conditions: .orientation(.landscape), .width("50em")))
            Tag {}.sizes(SizeCandidate("calc(100vw - 100px)", conditions: .minWidth("50em")))
            Tag {}.sizes(SizeCandidate("100vw", conditions: .maxWidth("50em")))
            Tag {}.sizes([SizeCandidate("100vw"), SizeCandidate("100vw", conditions: .maxWidth("50em"))])
            Tag {}.sizes(SizeCandidate("100vw"), SizeCandidate("100vw", conditions: .maxWidth("50em")))
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag sizes="auto"></tag>\
                       <tag sizes="(orientation: landscape) 100vw"></tag>\
                       <tag sizes="(orientation: portrait) 100vw"></tag>\
                       <tag sizes="(orientation: landscape) and (width: 50em) 100vw"></tag>\
                       <tag sizes="(min-width: 50em) calc(100vw - 100px)"></tag>\
                       <tag sizes="(max-width: 50em) 100vw"></tag>\
                       <tag sizes="100vw, (max-width: 50em) 100vw"></tag>\
                       <tag sizes="100vw, (max-width: 50em) 100vw"></tag>
                       """
        )
    }
    
    @Test
    func testSlotAttribute() throws {
        
        let view = TestView {
            Tag {}.slot("slot")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag slot="slot"></tag>
                       """
        )
    }
    
    @Test
    func testSpanAttribute() throws {
        
        let view = TestView {
            Tag {}.span(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag span="2"></tag>
                       """
        )
    }
    
    @Test
    func testSourceAttribute() throws {
        
        let view = TestView {
            Tag {}.source("source")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag src="source"></tag>
                       """
        )
    }
    
    @Test
    func testSourceDocumentAttribute() throws {
        
        let view = TestView {
            Tag {}.sourceDocument("<!doctype html><html lang=\"de\"></html>")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag srcdoc="&lt;!doctype html>&lt;html lang=&quot;de&quot;>&lt;/html>"></tag>
                       """
        )
    }
    
    @Test
    func testSourceLanguageAttribute() throws {
        
        let view = TestView {
            Tag {}.sourceLanguage(.english)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag srclang="en"></tag>
                       """
        )
    }
    
    @Test
    func testSourcesAttribute() throws {
        
        let view = TestView {
            Tag {}.sources(SourceCandidate("img.webp"))
            Tag {}.sources(SourceCandidate("img.png", density: 4))
            Tag {}.sources(SourceCandidate("img.png", density: .ultra))
            Tag {}.sources(SourceCandidate("img.png", width: 1024))
            Tag {}.sources(SourceCandidate("img.png", width: 1024), SourceCandidate("img.png", density: .ultra))
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag srcset="img.webp"></tag>\
                       <tag srcset="img.png 4x"></tag>\
                       <tag srcset="img.png 3x"></tag>\
                       <tag srcset="img.png 1024w"></tag>\
                       <tag srcset="img.png 1024w, img.png 3x"></tag>
                       """
        )
    }
    
    @Test
    func testStartAttribute() throws {
        
        let view = TestView {
            Tag {}.start(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag start="2"></tag>
                       """
        )
    }
    
    @Test
    func testStepAttribute() throws {
        
        let view = TestView {
            Tag {}.step(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag step="2"></tag>
                       """
        )
    }
    
    @Test
    func testTargetAttribute() throws {
        
        let view = TestView {
            Tag {}.target(.blank)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag target="_blank"></tag>
                       """
        )
    }
    
    @Test
    func testTypeAttribute() throws {
        
        let view = TestView {
            Tag {}.type("type")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag type="type"></tag>
                       """
        )
    }
    
    @Test
    func testUseMapAttribute() throws {
        
        let view = TestView {
            Tag {}.useMap("image_map")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag usemap="#image_map"></tag>
                       """
        )
    }
    
    @Test
    func testSelectedAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.selected()
            // with a false condition
            Tag {}.selected(false)
            // with a true condition
            Tag {}.selected(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag selected="selected"></tag>\
                       <tag></tag>\
                       <tag selected="selected"></tag>
                       """
        )
    }
    
    @Test
    func testFetchPriorityAttribute() throws {
        
        let view = TestView {
            Tag {}.fetchPriority(.high)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag fetchpriority="high"></tag>
                       """
        )
    }
    
    @Test
    func testLoadingAttribute() throws {
        
        let view = TestView {
            Tag {}.loading(.lazy)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag loading="lazy"></tag>
                       """
        )
    }
    
    @Test
    func testDecodingAttribute() throws {
        
        let view = TestView {
            Tag {}.decoding(.async)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag decoding="async"></tag>
                       """
        )
    }
    
    @Test
    func testValueAttribute() throws {
        
        let view = TestView {
            Tag {}.value("value")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag value="value"></tag>
                       """
        )
    }
    
    @Test
    func testBlockingAttribute() throws {
        
        let view = TestView {
            Tag {}.blocking(.render)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag blocking="render"></tag>
                       """
        )
    }
    
    @Test
    func testPopoverAttribute() throws {
        
        let view = TestView {
            Tag {}.popover(.auto)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag popover="auto"></tag>
                       """
        )
    }
    
    @Test
    func testPopoverTargetAttribute() throws {
        
        let view = TestView {
            Tag {}.popoverTarget("id")
            Tag {}.popoverTarget("id", action: .hide)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag popovertarget="id"></tag>\
                       <tag popovertarget="id" popovertargetaction="hide"></tag>
                       """
        )
    }
    
    @Test
    func testIntegrityAttribute() throws {
        
        let view = TestView {
            Tag {}.integrity("sha384...")
            Tag {}.integrity("sha384...", "sha384...")
            Tag {}.integrity(["sha384...", "sha384..."])
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag integrity="sha384..."></tag>\
                       <tag integrity="sha384... sha384..."></tag>\
                       <tag integrity="sha384... sha384..."></tag>
                       """
        )
    }
    
    @Test
    func testAsAttribute() throws {
        
        let view = TestView {
            Tag {}.as(.fetch)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag as="fetch"></tag>
                       """
        )
    }
    
    @Test
    func testCrossOriginAttribute() throws {
        
        let view = TestView {
            Tag {}.crossOrigin(.anonymous)
            Tag {}.crossOrigin(.useCredentials)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag crossorigin="anonymous"></tag>\
                       <tag crossorigin="use-credentials"></tag>
                       """
        )
    }
    
    @Test
    func testCustomAttribute() throws {
        
        let view = TestView {
            Tag {}.custom(key: "data-animal-type", value: "bird")
            Tag {}.custom(key: "data-row-index", value: 2)
            Tag {}.custom(key: "data-cart-total", value: 20.0)
            Tag {}.custom(key: "aria-hidden", value: false)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag data-animal-type="bird"></tag>\
                       <tag data-row-index="2"></tag>\
                       <tag data-cart-total="20.0"></tag>\
                       <tag aria-hidden="false"></tag>
                       """
        )
    }
    
    @Test
    func testWindowEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .afterprint, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onafterprint="script"></tag>
                       """
        )
    }
    
    @Test
    func testFocusEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .focus, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onfocus="script"></tag>
                       """
        )
    }
    
    @Test
    func testPointerEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .pointerup, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onpointerup="script"></tag>
                       """
        )
    }
    
    @Test
    func testMouseEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .mouseup, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onmouseup="script"></tag>
                       """
        )
    }
    
    @Test
    func testWheelEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .wheel, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onwheel="script"></tag>
                       """
        )
    }
    
    @Test
    func testInputEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .input, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag oninput="script"></tag>
                       """
        )
    }
    
    @Test
    func testKeyboardEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .keyup, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onkeyup="script"></tag>
                       """
        )
    }
    
    @Test
    func testDragEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .drag, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag ondrag="script"></tag>
                       """
        )
    }
    
    @Test
    func testClipboardEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .paste, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onpaste="script"></tag>
                       """
        )
    }
    
    @Test
    func testSelectionEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .selectstart, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onselectstart="script"></tag>
                       """
        )
    }
    
    @Test
    func testMediaEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .play, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onplay="script"></tag>
                       """
        )
    }
    
    @Test
    func testFormEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .submit, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag onsubmit="script"></tag>
                       """
        )
    }
    
    @Test
    func testDetailEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .toggle, "script")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag ontoggle="script"></tag>
                       """
        )
    }
    
    @Test
    func testAtomicAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityAtomic(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-atomic="true"></tag>
                       """
        )
    }
    
    @Test
    func testBusyAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityBusy()
            Tag {}.accessibilityBusy(false)
            Tag {}.accessibilityBusy(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-busy="true"></tag>\
                       <tag aria-busy="false"></tag>\
                       <tag aria-busy="true"></tag>
                       """
        )
    }
    
    @Test
    func testControlsAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityControls("id")
            Tag {}.accessibilityControls("id", "id")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-controls="id"></tag>\
                       <tag aria-controls="id id"></tag>
                       """
        )
    }
    
    @Test
    func testCurrentAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityCurrent()
            Tag {}.accessibilityCurrent(false)
            Tag {}.accessibilityCurrent(true)
            Tag {}.accessibilityCurrent(.page)
            Tag {}.accessibilityCurrent(.step)
            Tag {}.accessibilityCurrent(.time)
            Tag {}.accessibilityCurrent(.date)
            Tag {}.accessibilityCurrent(.location)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-current="true"></tag>\
                       <tag aria-current="false"></tag>\
                       <tag aria-current="true"></tag>\
                       <tag aria-current="page"></tag>\
                       <tag aria-current="step"></tag>\
                       <tag aria-current="time"></tag>\
                       <tag aria-current="date"></tag>\
                       <tag aria-current="location"></tag>
                       """
        )
    }
    
    @Test
    func testDescriptionsAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityDescriptions("id", "id")
            Tag {}.accessibilityDescriptions(["id", "id"])
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-describedby="id id"></tag>\
                       <tag aria-describedby="id id"></tag>
                       """
        )
    }
    
    @Test
    func testDetailAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityDetail("id")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-details="id"></tag>
                       """
        )
    }
    
    @Test
    func testDisabledAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityDisabled()
            Tag {}.accessibilityDisabled(false)
            Tag {}.accessibilityDisabled(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-disabled="true"></tag>\
                       <tag aria-disabled="false"></tag>\
                       <tag aria-disabled="true"></tag>
                       """
        )
    }
    
    @Test
    func testFlowAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityFlow("id")
            Tag {}.accessibilityFlow("id", "id")
            Tag {}.accessibilityFlow(["id", "id"])
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-flowto="id"></tag>\
                       <tag aria-flowto="id id"></tag>\
                       <tag aria-flowto="id id"></tag>
                       """
        )
    }
    
    @Test
    func testPopupAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityPopup(.grid)
            Tag {}.accessibilityPopup(.dialog)
            Tag {}.accessibilityPopup(.listbox)
            Tag {}.accessibilityPopup(.menu)
            Tag {}.accessibilityPopup(.tree)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-haspopup="grid"></tag>\
                       <tag aria-haspopup="dialog"></tag>\
                       <tag aria-haspopup="listbox"></tag>\
                       <tag aria-haspopup="menu"></tag>\
                       <tag aria-haspopup="tree"></tag>
                       """
        )
    }
    
    @Test
    func testHiddenAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityHidden()
            Tag {}.accessibilityHidden(false)
            Tag {}.accessibilityHidden(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-hidden="true"></tag>\
                       <tag aria-hidden="false"></tag>\
                       <tag aria-hidden="true"></tag>
                       """
        )
    }
    
    @Test
    func testInvalidAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityInvalid(.grammar)
            Tag {}.accessibilityInvalid(.spelling)
            Tag {}.accessibilityInvalid()
            Tag {}.accessibilityInvalid(false)
            Tag {}.accessibilityInvalid(message: "id")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-invalid="grammar"></tag>\
                       <tag aria-invalid="spelling"></tag>\
                       <tag aria-invalid="true"></tag>\
                       <tag aria-invalid="false"></tag>\
                       <tag aria-invalid="true" aria-errormessage="id"></tag>
                       """
        )
    }
    
    @Test
    func testKeyShortcutsAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityShortcuts(KeyboardShortcut("A"))
            Tag {}.accessibilityShortcuts([KeyboardShortcut("B"), KeyboardShortcut("C")])
            Tag {}.accessibilityShortcuts(KeyboardShortcut("D"), KeyboardShortcut("E"))
            Tag {}.accessibilityShortcuts(KeyboardShortcut(.enter, modifiers: .command))
            
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-keyshortcuts="A"></tag>\
                       <tag aria-keyshortcuts="B C"></tag>\
                       <tag aria-keyshortcuts="D E"></tag>\
                       <tag aria-keyshortcuts="Command+Enter"></tag>
                       """
        )
    }
    
    @Test
    func testLabelAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityLabel("label")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-label="label"></tag>
                       """
        )
    }
    
    @Test
    func testLabelsByAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityLabels("id")
            Tag {}.accessibilityLabels("id", "id")
            Tag {}.accessibilityLabels(["id", "id"])
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-labelledby="id"></tag>\
                       <tag aria-labelledby="id id"></tag>\
                       <tag aria-labelledby="id id"></tag>
                       """
        )
    }
    
    @Test
    func testLiveAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityLive(.polite)
            Tag {}.accessibilityLive(.assertive)
            Tag {}.accessibilityLive(.off)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-live="polite"></tag>\
                       <tag aria-live="assertive"></tag>\
                       <tag aria-live="off"></tag>
                       """
        )
    }
    
    @Test
    func testOwnsAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityOwns("id")
            Tag {}.accessibilityOwns("id", "id")
            Tag {}.accessibilityOwns(["id", "id"])
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-owns="id"></tag>\
                       <tag aria-owns="id id"></tag>\
                       <tag aria-owns="id id"></tag>
                       """
        )
    }
    
    @Test
    func testRelevantAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityRelevant(.additions)
            Tag {}.accessibilityRelevant(.additions, .text)
            Tag {}.accessibilityRelevant([.additions, .text])
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-relevant="additions"></tag>\
                       <tag aria-relevant="additions text"></tag>\
                       <tag aria-relevant="additions text"></tag>
                       """
        )
    }
    
    @Test
    func testRoleDescriptionAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityRoleDescription("description")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-roledescription="description"></tag>
                       """
        )
    }
    
    @Test
    func testSortAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilitySort(.ascending)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-sort="ascending"></tag>
                       """
        )
    }
    
    @Test
    func testOrientationAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityOrientation(.horizontal)
            Tag {}.accessibilityOrientation(.vertical)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-orientation="horizontal"></tag>\
                       <tag aria-orientation="vertical"></tag>
                       """
        )
    }
    
    @Test
    func testRequiredAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityRequired()
            Tag {}.accessibilityRequired(false)
            Tag {}.accessibilityRequired(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-required="true"></tag>\
                       <tag aria-required="false"></tag>\
                       <tag aria-required="true"></tag>
                       """
        )
    }
    
    @Test
    func testReadOnlyAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityReadonly()
            Tag {}.accessibilityReadonly(false)
            Tag {}.accessibilityReadonly(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-readonly="true"></tag>\
                       <tag aria-readonly="false"></tag>\
                       <tag aria-readonly="true"></tag>
                       """
        )
    }
    
    @Test
    func testModalAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityModal()
            Tag {}.accessibilityModal(false)
            Tag {}.accessibilityModal(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-modal="true"></tag>\
                       <tag aria-modal="false"></tag>\
                       <tag aria-modal="true"></tag>
                       """
        )
    }
    
    @Test
    func testLevelAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityLevel(2)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-level="2"></tag>
                       """
        )
    }
    
    @Test
    func testHintAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityHint("Lorem ipsum...")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-placeholder="Lorem ipsum..."></tag>
                       """
        )
    }
    
    @Test
    func testPositionAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityPosition(5, in: 10)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-posinset="5" aria-setsize="10"></tag>
                       """
        )
    }
    
    @Test
    func testMultilineAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityMultiline()
            Tag {}.accessibilityMultiline(false)
            Tag {}.accessibilityMultiline(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-multiline="true"></tag>\
                       <tag aria-multiline="false"></tag>\
                       <tag aria-multiline="true"></tag>
                       """
        )
    }
    
    @Test
    func testMultiselectAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityMultiselect()
            Tag {}.accessibilityMultiselect(false)
            Tag {}.accessibilityMultiselect(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-multiselectable="true"></tag>\
                       <tag aria-multiselectable="false"></tag>\
                       <tag aria-multiselectable="true"></tag>
                       """
        )
    }
    
    @Test
    func testRowIndexAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityRowIndex(10)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-rowindex="10"></tag>
                       """
        )
    }
    
    @Test
    func testRowCountAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityRowCount(10)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-rowcount="10"></tag>
                       """
        )
    }
    
    @Test
    func testColumnIndexAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityColumnIndex(10)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-colindex="10"></tag>
                       """
        )
    }
    
    @Test
    func testColumnCountAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityColumnCount(10)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-colcount="10"></tag>
                       """
        )
    }
    
    @Test
    func testRowSpanAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityRowSpan(10)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-rowspan="10"></tag>
                       """
        )
    }
    
    @Test
    func testColumnSpanAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityColumnSpan(10)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-colspan="10"></tag>
                       """
        )
    }
    
    @Test
    func testMaximumValueAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityMaximumValue(10.0)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-valuemax="10.0"></tag>
                       """
        )
    }
    
    @Test
    func testMinimumValueAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityMinimumValue(10.0)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-valuemin="10.0"></tag>
                       """
        )
    }
    
    @Test
    func testValueAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityValue(20.0)
            Tag {}.accessibilityValue(20.0, description: "Twenty point zero")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-valuenow="20.0"></tag>\
                       <tag aria-valuenow="20.0" aria-valuetext="Twenty point zero"></tag>
                       """
        )
    }
    
    @Test
    func testPressedAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityPressed()
            Tag {}.accessibilityPressed(false)
            Tag {}.accessibilityPressed(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-pressed="true"></tag>\
                       <tag aria-pressed="false"></tag>\
                       <tag aria-pressed="true"></tag>
                       """
        )
    }
    
    @Test
    func testSelectedAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilitySelected()
            Tag {}.accessibilitySelected(false)
            Tag {}.accessibilitySelected(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-selected="true"></tag>\
                       <tag aria-selected="false"></tag>\
                       <tag aria-selected="true"></tag>
                       """
        )
    }
    
    @Test
    func testCheckedAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityChecked()
            Tag {}.accessibilityChecked(false)
            Tag {}.accessibilityChecked(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-checked="true"></tag>\
                       <tag aria-checked="false"></tag>\
                       <tag aria-checked="true"></tag>
                       """
        )
    }
    
    @Test
    func testExpandedAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityExpanded()
            Tag {}.accessibilityExpanded(false)
            Tag {}.accessibilityExpanded(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-expanded="true"></tag>\
                       <tag aria-expanded="false"></tag>\
                       <tag aria-expanded="true"></tag>
                       """
        )
    }
    
    @Test
    func testFocusedAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityFocused("id")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-activedescendant="id"></tag>
                       """
        )
    }
    
    @Test
    func testCompletionAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityCompletion(.inline, .list)
            Tag {}.accessibilityCompletion(.list)
            Tag {}.accessibilityCompletion(.inline)
            Tag {}.accessibilityCompletion(.list, .inline)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag aria-autocomplete="both"></tag>\
                       <tag aria-autocomplete="list"></tag>\
                       <tag aria-autocomplete="inline"></tag>\
                       <tag aria-autocomplete="both"></tag>
                       """
        )
    }
    
    @Test
    func testDrawAttribute() throws {
        
        let view = TestView {
            Tag {}.draw("M 10,30 A 20,20 0,0,1 50,30 A 20,20 0,0,1 90,30 Q 90,60 50,90 Q 10,60 10,30 z")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag d="M 10,30 A 20,20 0,0,1 50,30 A 20,20 0,0,1 90,30 Q 90,60 50,90 Q 10,60 10,30 z"></tag>
                       """
        )
    }
    
    @Test
    func testFillAttribute() throws {
        
        let view = TestView {
            Tag {}.fill("black")
            Tag {}.fill("black", opacity: 0.5)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag fill="black"></tag>\
                       <tag fill="black" fill-opacity="0.5"></tag>
                       """
        )
    }
    
    @Test
    func testStrokeAttribute() throws {
        
        let view = TestView {
            Tag {}.stroke("black")
            Tag {}.stroke("black", width: 1)
            Tag {}.stroke("black", width: 1, opacity: 0.5)
            Tag {}.stroke("black", width: 1, opacity: 0.5, cap: .butt)
            Tag {}.stroke("black", width: 1, opacity: 0.5, cap: .butt, join: .round)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag stroke="black"></tag>\
                       <tag stroke="black" stroke-width="1"></tag>\
                       <tag stroke="black" stroke-width="1" stroke-opacity="0.5"></tag>\
                       <tag stroke="black" stroke-width="1" stroke-opacity="0.5" stroke-linecap="butt"></tag>\
                       <tag stroke="black" stroke-width="1" stroke-opacity="0.5" stroke-linecap="butt" stroke-linejoin="round"></tag>
                       """
        )
    }
    
    @Test
    func testRadiusAttribute() throws {
        
        let view = TestView {
            Tag {}.radius(25)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag r="25"></tag>
                       """
        )
    }
    
    @Test
    func testPositionAttribute() throws {
        
        let view = TestView {
            Tag {}.position(x: 50, y: 50)
            Tag {}.position(x: 50.0, y: 50.0)
            Tag {}.position(UnitPoint(x: 50.0, y: 50.0))
            Tag {}.position(UnitPoint(x: 50, y: 50, format: .relative))
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag x="50" y="50"></tag>\
                       <tag x="50.0" y="50.0"></tag>\
                       <tag x="50.0" y="50.0"></tag>\
                       <tag x="50%" y="50%"></tag>
                       """
        )
    }
    
    @Test
    func testRadiusPointAttribute() throws {
        
        let view = TestView {
            Tag {}.radius(x: 10, y: 10)
            Tag {}.radius(x: 10.0, y: 10.0)
            Tag {}.radius(UnitPoint(x: 10.0, y: 10.0))
            Tag {}.radius(UnitPoint(x: 10, y: 10, format: .relative))
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag rx="10" ry="10"></tag>\
                       <tag rx="10.0" ry="10.0"></tag>\
                       <tag rx="10.0" ry="10.0"></tag>\
                       <tag rx="10%" ry="10%"></tag>
                       """
        )
    }
    
    @Test
    func testCenterPointAttribute() throws {
        
        let view = TestView {
            Tag {}.center(x: 10, y: 10)
            Tag {}.center(x: 10.0, y: 10.0)
            Tag {}.center(UnitPoint(x: 10.0, y: 10.0))
            Tag {}.center(UnitPoint(x: 10, y: 10, format: .relative))
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag cx="10" cy="10"></tag>\
                       <tag cx="10.0" cy="10.0"></tag>\
                       <tag cx="10.0" cy="10.0"></tag>\
                       <tag cx="10%" cy="10%"></tag>
                       """
        )
    }
    
    @Test
    func testViewBoxAttribute() throws {
        
        let view = TestView {
            Tag {}.viewBox(x: 0, y: 0, width: 100, height: 100)
            Tag {}.viewBox(x: 0, y: 0, width: 100.0, height: 100.0)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag viewbox="0 0 100 100"></tag>\
                       <tag viewbox="0.0 0.0 100.0 100.0"></tag>
                       """
        )
    }
    
    @Test
    func testNamespaceAttribute() throws {
        
        let view = TestView {
            Tag {}.namespace("http://www.w3.org/2000/svg")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag xmlns="http://www.w3.org/2000/svg"></tag>
                       """
        )
    }
    
    @Test
    func testPointsAttribute() throws {
        
        let view = TestView {
            Tag {}.points("50,0 21,90 98,35 2,35 79,90")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag points="50,0 21,90 98,35 2,35 79,90"></tag>
                       """
        )
    }
    
    @Test
    func testShadowRootModeAttribute() throws {
        
        let view = TestView {
            Tag {}.shadowRootMode(.open)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag shadowrootmode="open"></tag>
                       """
        )
    }
    
    @Test
    func testInertAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.inert()
            // with a false condition
            Tag {}.inert(false)
            // with a true condition
            Tag {}.inert(true)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag inert="inert"></tag>\
                       <tag></tag>\
                       <tag inert="inert"></tag>
                       """
        )
    }
    
    @Test
    func testInputModeAttribute() throws {
        
        let view = TestView {
            Tag {}.inputMode(.decimal)
            Tag {}.inputMode(.email)
            Tag {}.inputMode(.none)
            Tag {}.inputMode(.numeric)
            Tag {}.inputMode(.phone)
            Tag {}.inputMode(.search)
            Tag {}.inputMode(.text)
            Tag {}.inputMode(.url)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag inputmode="decimal"></tag>\
                       <tag inputmode="email"></tag>\
                       <tag inputmode="none"></tag>\
                       <tag inputmode="numeric"></tag>\
                       <tag inputmode="tel"></tag>\
                       <tag inputmode="search"></tag>\
                       <tag inputmode="text"></tag>\
                       <tag inputmode="url"></tag>
                       """
        )
    }
    
    @Test
    func testAbbreviatedAttribute() throws {
        
        let view = TestView {
            Tag {}.abbreviated("HTML")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag abbr="HTML"></tag>
                       """
        )
    }
    
    @Test
    func testImageSourcesAttribute() throws {
        
        let view = TestView {
            Tag {}.imageSources(SourceCandidate("img.webp"))
            Tag {}.imageSources(SourceCandidate("img.png", density: 4))
            Tag {}.imageSources(SourceCandidate("img.png", density: .ultra))
            Tag {}.imageSources(SourceCandidate("img.png", width: 1024))
            Tag {}.imageSources(SourceCandidate("img.png", width: 1024), SourceCandidate("img.png", density: .ultra))
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag imagesrcset="img.webp"></tag>\
                       <tag imagesrcset="img.png 4x"></tag>\
                       <tag imagesrcset="img.png 3x"></tag>\
                       <tag imagesrcset="img.png 1024w"></tag>\
                       <tag imagesrcset="img.png 1024w, img.png 3x"></tag>
                       """
        )
    }
    
    @Test
    func testImageSizesAttribute() throws {
        
        let view = TestView {
            Tag {}.imageSizes(SizeCandidate("auto"))
            Tag {}.imageSizes(SizeCandidate("100vw", conditions: .orientation(.landscape)))
            Tag {}.imageSizes(SizeCandidate("100vw", conditions: .orientation(.portrait)))
            Tag {}.imageSizes(SizeCandidate("100vw", conditions: .orientation(.landscape), .width("50em")))
            Tag {}.imageSizes(SizeCandidate("calc(100vw - 100px)", conditions: .minWidth("50em")))
            Tag {}.imageSizes(SizeCandidate("100vw", conditions: .maxWidth("50em")))
            Tag {}.imageSizes([SizeCandidate("100vw"), SizeCandidate("100vw", conditions: .maxWidth("50em"))])
            Tag {}.imageSizes(SizeCandidate("100vw"), SizeCandidate("100vw", conditions: .maxWidth("50em")))
        }
        
        #expect(try renderer.render(view: view) ==
                     """
                     <tag imagesizes="auto"></tag>\
                     <tag imagesizes="(orientation: landscape) 100vw"></tag>\
                     <tag imagesizes="(orientation: portrait) 100vw"></tag>\
                     <tag imagesizes="(orientation: landscape) and (width: 50em) 100vw"></tag>\
                     <tag imagesizes="(min-width: 50em) calc(100vw - 100px)"></tag>\
                     <tag imagesizes="(max-width: 50em) 100vw"></tag>\
                     <tag imagesizes="100vw, (max-width: 50em) 100vw"></tag>\
                     <tag imagesizes="100vw, (max-width: 50em) 100vw"></tag>
                     """
        )
    }
    
    @Test
    func testCommandAttribute() throws {
        
        let view = TestView {
            Tag {}.command(.hidePopover, for: "id")
            Tag {}.command("show-text", for: "id")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <tag command="hide-popover" commandfor="id"></tag>\
                       <tag command="--show-text" commandfor="id"></tag>
                       """
        )
    }
}
