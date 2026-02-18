/*
 Abstract:
 The file tests the rendering of the attributes.
 */

@testable import HTMLKit
import Foundation
import OrderedCollections
import XCTest

final class AttributesTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    typealias AllAttributes = AccessKeyAttribute & AcceptAttribute & ActionAttribute & AlternateAttribute & AsynchronouslyAttribute & AutocapitalizeAttribute & AutocompleteAttribute & AutofocusAttribute & AutoplayAttribute & CharsetAttribute & CheckedAttribute & CiteAttribute & ClassAttribute & ColumnsAttribute & ColumnSpanAttribute & ContentAttribute & EditAttribute  & ControlsAttribute & CoordinatesAttribute & DataAttribute & DateTimeAttribute & DefaultAttribute & DeferAttribute & DirectionAttribute & DisabledAttribute & DownloadAttribute & DragAttribute & EncodingAttribute & EnterKeyAttribute & ForAttribute & FormAttribute & FormActionAttribute & EquivalentAttribute & HeadersAttribute & HeightAttribute & HiddenAttribute & HighAttribute & ReferenceAttribute & ReferenceLanguageAttribute & IdentifierAttribute & IsMapAttribute & InputModeAttribute & IsAttribute & ItemAttribute & ItemPropertyAttribute & KindAttribute & LabelAttribute & LanguageAttribute & ListAttribute & LoopAttribute & LowAttribute & MaximumValueAttribute & MaximumLengthAttribute & MediaAttribute & MethodAttribute & MinimumValueAttribute & MinimumLengthAttribute & MultipleAttribute & MutedAttribute & NameAttribute & NonceAttribute & NoValidateAttribute & OpenAttribute & OptimumAttribute & PatternAttribute & PartAttribute & PingAttribute & PlaceholderAttribute & PosterAttribute & PreloadAttribute & ReadOnlyAttribute & ReferrerPolicyAttribute & RelationshipAttribute & RequiredAttribute & ReversedAttribute & RoleAttribute & RowsAttribute & RowSpanAttribute & SandboxAttribute & ScopeAttribute & ShapeAttribute & SizeAttribute & SizesAttribute & SlotAttribute & SpanAttribute & SpellCheckAttribute & SourceAttribute & StartAttribute & StepAttribute & StyleAttribute & TabulatorAttribute & TargetAttribute & TitleAttribute & TranslateAttribute & TypeAttribute & ValueAttribute & WidthAttribute & WrapAttribute & PropertyAttribute & SelectedAttribute & WindowEventAttribute & FocusEventAttribute & PointerEventAttribute & MouseEventAttribute & WheelEventAttribute & InputEventAttribute & KeyboardEventAttribute & DragEventAttribute & ClipboardEventAttribute & SelectionEventAttribute & MediaEventAttribute & FormEventAttribute & DetailEventAttribute & AriaAtomicAttribute & AriaBusyAttribute & AriaControlsAttribute & AriaCurrentAttribute & AriaDescribedAttribute & AriaDetailsAttribute & AriaDisabledAttribute & AriaErrorMessageAttribute & FlowAccessibilityAttribute & AriaPopupAttribute & AriaHiddenAttribute & AriaInvalidAttribute & AriaShortcutsAttribute & LabelAccessibilityAttribute & AriaLabeledAttribute & AriaLiveAttribute & AriaOwnsAttribute & AriaRelevantAttribute & AriaRoleDescriptionAttribute & SortAccessibilityAttribute & OrientationAccessibilityAttribute & DrawAttribute & FillAttribute & FillOpacityAttribute & StrokeAttribute & StrokeWidthAttribute & StrokeOpacityAttribute & StrokeLineCapAttribute & StrokeLineJoinAttribute & RadiusAttribute & PositionPointAttribute & RadiusPointAttribute & CenterPointAttribute & ViewBoxAttribute & NamespaceAttribute & PointsAttribute & ShadowRootModeAttribute & InertAttribute & FetchPriorityAttribute & LoadingAttribute & SourceSetAttribute & DecodingAttribute & BlockingAttribute & PopoverAttribute & PopoverTargetAttribute & PopoverActionAttribute & UseMapAttribute & PlaysInlineAttribute & IntegrityAttribute & AsAttribute & CrossOriginAttribute & SourceLanguageAttribute & SourceDocumentAttribute
    
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
        
        func role(_ value: Values.Role) -> Tag {
            return self.mutate(role: .init(value.rawValue, context: .trusted))
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
        
        func coordinates(_ value: String) -> Tag {
            return self.mutate(coords: .init(value, context: .tainted(.html)))
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
        
        func download() -> Tag {
            return self.mutate(download: .init("download", context: .trusted))
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
        
        func relationship(_ value: Values.Relation) -> Tag {
            return self.mutate(rel: .init(value.rawValue, context: .trusted))
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
        
        func sourceSet(_ candidates: [SourceCandidate]) -> Tag {
            return mutate(sourceset: .init(EnumeratedList(values: candidates, separator: ", "), context: .tainted(.html)))
        }
        
        func sourceSet(_ candidates: SourceCandidate...) -> Tag {
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
        
        func fillOpacity(_ value: Double) -> Tag {
            return self.mutate(fillopacity: .init(value, context: .trusted))
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
        
        func strokeWidth(_ size: Int) -> Tag {
            return self.mutate(strokewidth: .init(size, context: .trusted))
        }
        
        func strokeOpacity(_ value: Double) -> Tag {
            return self.mutate(strokeopacity: .init(value, context: .trusted))
        }
        
        func strokeLineCap(_ value: HTMLKit.Values.Linecap) -> Tag {
            return self.mutate(strokelinecap: .init(value.rawValue, context: .trusted))
        }
        
        func strokeLineJoin(_ value: HTMLKit.Values.Linejoin) -> Tag {
            return self.mutate(strokelinejoin: .init(value.rawValue, context: .trusted))
        }
        
        func radius(_ size: Int) -> Tag {
            return self.mutate(radius: .init(size, context: .trusted))
        }
        
        func positionPoint(_ point: (Int, Int)) -> Tag {
            return self.mutate(x:  .init(point.0, context: .trusted)).mutate(y: .init(point.1, context: .trusted))
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
        
        func radiusPoint(_ point: (Int, Int)) -> Tag {
            return self.mutate(rx: .init(point.0, context: .trusted)).mutate(ry: .init(point.1, context: .trusted))
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
        
        func centerPoint(_ point: (Int, Int)) -> Tag {
            return self.mutate(cx: .init(point.0, context: .trusted)).mutate(cy: .init(point.1, context: .trusted))
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
        
        func popoverAction(_ value: Values.Popover.Action) -> Tag {
            return self.mutate(popoveraction: .init(value.rawValue, context: .trusted))
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
        
        func aria(atomic value: Bool) -> Tag {
            return mutate(ariaatomic: .init(value, context: .trusted))
        }
        
        func aria(busy value: Bool) -> Tag {
            return mutate(ariabusy: .init(value, context: .trusted))
        }
        
        func aria(controls value: String) -> Tag {
            return mutate(ariacontrols: .init(value, context: .tainted(.html)))
        }
        
        func aria(current value: Values.Accessibility.Current) -> Tag {
            return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
        }
        
        func aria(describedBy value: String) -> Tag {
            return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
        }
        
        func aria(details value: String) -> Tag {
            return mutate(ariadetails: .init(value, context: .tainted(.html)))
        }
        
        func aria(disabled value: Bool) -> Tag {
            return mutate(ariadisabled: .init(value, context: .trusted))
        }
        
        func aria(errorMessage value: String) -> Tag {
            return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
        }
        
        func accessibilityFlowTo(_ ids: [String]) -> Tag {
            return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func accessibilityFlowTo(_ ids: String...) -> Tag {
            return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
        }
        
        func aria(hasPopup value: Values.Accessibility.Popup) -> Tag {
            return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
        }
        
        func aria(hidden value: Bool) -> Tag {
            return mutate(ariahidden: .init(value, context: .trusted))
        }
        
        func aria(invalid value: Values.Accessibility.Invalid) -> Tag {
            return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
        }
        
        func aria(keyShortcuts value: String) -> Tag {
            return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
        }

        func accessibilityLabel(_ value: String) -> Tag {
            return mutate(arialabel: .init(value, context: .tainted(.html)))
        }
        
        func accessibilityLabel(_ localized: LocalizedStringKey, tableName: String? = nil) -> Tag {
            return mutate(arialabel: .init(LocalizedString(key: localized, table: tableName), context: .tainted(.html)))
        }
        
        func accessibilityLabel(verbatim value: String) -> Tag {
            return mutate(arialabel: .init(value, context: .tainted(.html)))
        }
        
        func aria(labeledBy value: String) -> Tag {
            return mutate(arialabeledby: .init(value, context: .tainted(.html)))
        }
        
        func aria(live value: Values.Accessibility.Live) -> Tag {
            return mutate(arialive: .init(value.rawValue, context: .trusted))
        }
        
        func aria(owns value: String) -> Tag {
            return mutate(ariaowns: .init(value, context: .tainted(.html)))
        }
        
        func aria(relevant value: Values.Accessibility.Relevant) -> Tag {
            return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
        }
        
        func aria(roleDescription value: String) -> Tag {
            return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
        }
        
        func accessibilitySort(_ value: Values.Accessibility.Sort) -> Tag {
            return mutate(ariasort: .init(value.rawValue, context: .trusted))
        }
        
        func accessibilityOrientation(_ value: Values.Accessibility.Orientation) -> Tag {
            return mutate(ariaorientation: .init(value.rawValue, context: .trusted))
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
    }
    
    var renderer = Renderer()
    
    func testAccesskeyAttribute() throws {
        
        let view = TestView {
            Tag {}.accessKey("s")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag accesskey="s"></tag>
                       """
        )
    }
    
    func testAutocapitalizeAttribute() throws {
        
        let view = TestView {
            Tag {}.autocapitalize(.words)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag autocapitalize="words"></tag>
                       """
        )
    }
    
    func testAutofocusAttribute() throws {
        
        let view = TestView {
            Tag {}.autofocus()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag autofocus="autofocus"></tag>
                       """
        )
    }
    
    func testClassAttribute() throws {
        
        let view = TestView {
            Tag {}.class("container")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag class="container"></tag>
                       """
        )
    }
    
    func testDirectionAttribute() throws {
        
        let view = TestView {
            Tag {}.direction(.leftToRight)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag dir="ltr"></tag>
                       """
        )
    }
    
    func testDraggableAttribute() throws {
        
        let view = TestView {
            Tag {}.draggable()
            Tag {}.draggable(false)
            Tag {}.draggable(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag draggable="true"></tag>\
                       <tag draggable="false"></tag>\
                       <tag draggable="true"></tag>
                       """
        )
    }
    
    func testEditableAttribute() throws {
        
        let view = TestView {
            Tag {}.editable()
            Tag {}.editable(false)
            Tag {}.editable(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag contenteditable="true"></tag>\
                       <tag contenteditable="false"></tag>\
                       <tag contenteditable="true"></tag>
                       """
        )
    }
    
    func testEnterkeyhintAttribute() throws {
        
        let view = TestView {
            Tag {}.enterKey(.enter)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag enterkeyhint="enter"></tag>
                       """
        )
    }
    
    func testHiddenAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.hidden()
            // with a false condition
            Tag {}.hidden(false)
            // with a true condition
            Tag {}.hidden(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag hidden="hidden"></tag>\
                       <tag></tag>\
                       <tag hidden="hidden"></tag>
                       """
        )
    }
    
    func testIdentifierAttribute() throws {
        
        let view = TestView {
            Tag {}.id("navigation")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag id="navigation"></tag>
                       """
        )
    }
    
    func testLanguageAttribute() throws {
        
        let view = TestView {
            Tag {}.language(.german)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag lang="de"></tag>
                       """
        )
    }
    
    func testNonceAttribute() throws {
        
        let view = TestView {
            Tag {}.nonce("84a97f593e589c45")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag nonce="84a97f593e589c45"></tag>
                       """
        )
    }
    
    func testRoleAttribute() throws {
        
        let view = TestView {
            Tag {}.role(.alert)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag role="alert"></tag>
                       """
        )
    }
    
    func testHasSpellCheckAttribute() throws {
        
        let view = TestView {
            Tag {}.spellcheck()
            Tag {}.spellcheck(false)
            Tag {}.spellcheck(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag spellcheck="true"></tag>\
                       <tag spellcheck="false"></tag>\
                       <tag spellcheck="true"></tag>
                       """
        )
    }
    
    func testStyleAttribute() throws {
        
        let view = TestView {
            Tag {}.style("background-color:powderblue;")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag style="background-color:powderblue;"></tag>
                       """
        )
    }
    
    func testTabIndexAttribute() throws {
        
        let view = TestView {
            Tag {}.tabIndex(3)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag tabindex="3"></tag>
                       """
        )
    }
    
    func testTitleAttribute() throws {
        
        let view = TestView {
            Tag {}.title("homeview")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag title="homeview"></tag>
                       """
        )
    }
    
    func testTranslateAttribute() throws {
        
        let view = TestView {
            Tag {}.translate()
            Tag {}.translate(false)
            Tag {}.translate(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag translate="yes"></tag>\
                       <tag translate="no"></tag>\
                       <tag translate="yes"></tag>
                       """
        )
    }
    
    func testAcceptAttribute() throws {
        
        let view = TestView {
            Tag {}.accept("image/*")
            Tag {}.accept([".jpg", ".png", ".svg"])
            Tag {}.accept(".jpg", ".png", ".svg")
            Tag {}.accept([.ogg, .mpeg])
            Tag {}.accept(.ogg, .mpeg)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag accept="image/*"></tag>\
                       <tag accept=".jpg, .png, .svg"></tag>\
                       <tag accept=".jpg, .png, .svg"></tag>\
                       <tag accept="video/ogg, audio/mpeg"></tag>\
                       <tag accept="video/ogg, audio/mpeg"></tag>
                       """
        )
    }
    
    func testActionAttribute() throws {
        
        let view = TestView {
            Tag {}.action("action")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag action="action"></tag>
                       """
        )
    }
    
    func testAlternateAttribute() throws {
        
        let view = TestView {
            Tag {}.alternate("a tag and a attribute")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag alt="a tag and a attribute"></tag>
                       """
        )
    }
    
    func testAsynchronouslyAttribute() throws {
        
        let view = TestView {
            Tag {}.asynchronously()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag async="async"></tag>
                       """
        )
    }
    
    func testCompleteAttribute() throws {
        
        let view = TestView {
            Tag {}.autocomplete(true)
            Tag {}.autocomplete(false)
            Tag {}.autocomplete([.organization, .organizationTitle])
            Tag {}.autocomplete(.organization, .organizationTitle)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag autocomplete="on"></tag>\
                       <tag autocomplete="off"></tag>\
                       <tag autocomplete="organization organization-title"></tag>\
                       <tag autocomplete="organization organization-title"></tag>
                       """
        )
    }
    
    func testAutoplayAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.autoplay()
            // with false condition
            Tag {}.autoplay(false)
            // with true condition
            Tag {}.autoplay(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag autoplay="autoplay"></tag>\
                       <tag></tag>\
                       <tag autoplay="autoplay"></tag>
                       """
        )
    }
    
    func testCharsetAttribute() throws {
        
        let view = TestView {
            Tag {}.charset(.utf8)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag charset="utf-8"></tag>
                       """
        )
    }
    
    func testCheckedAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.checked()
            // with false condition
            Tag {}.checked(false)
            // with true condition
            Tag {}.checked(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag checked="checked"></tag>\
                       <tag></tag>\
                       <tag checked="checked"></tag>
                       """
        )
    }
    
    func testCiteAttribute() throws {
        
        let view = TestView {
            Tag {}.cite("cite")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag cite="cite"></tag>
                       """
        )
    }
    
    func testColumnsAttribute() throws {
        
        let view = TestView {
            Tag {}.columns(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag cols="2"></tag>
                       """
        )
    }
    
    func testColumnSpanAttribute() throws {
        
        let view = TestView {
            Tag {}.columnSpan(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag colspan="2"></tag>
                       """
        )
    }
    
    func testContentAttribute() throws {
        
        let view = TestView {
            Tag {}.content("content")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag content="content"></tag>
                       """
        )
    }
    
    func testControlsAttribute() throws {
        
        let view = TestView {
            Tag {}.controls()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag controls="controls"></tag>
                       """
        )
    }
    
    func testDataAttribute() throws {
        
        let view = TestView {
            Tag {}.data("https://www.github.com")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag data="https://www.github.com"></tag>
                       """
        )
    }
    
    func testDateTimeAttribute() throws {
        
        let view = TestView {
            Tag {}.dateTime("YYYY-MM-DDThh:mm:ssTZD")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag datetime="YYYY-MM-DDThh:mm:ssTZD"></tag>
                       """
        )
    }
    
    func testDefaultAttribute() throws {
        
        let view = TestView {
            Tag {}.default()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag default="default"></tag>
                       """
        )
    }
    
    func testDeferAttribute() throws {
        
        let view = TestView {
            Tag {}.defer()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag defer="defer"></tag>
                       """
        )
    }
    
    func testDisabledAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.disabled()
            // with false condition
            Tag {}.disabled(false)
            // with true condition
            Tag {}.disabled(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag disabled="disabled"></tag>\
                       <tag></tag>\
                       <tag disabled="disabled"></tag>
                       """
        )
    }
    
    func testDownloadAttribute() throws {
        
        let view = TestView {
            Tag {}.download()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag download="download"></tag>
                       """
        )
    }
    
    func testEncodingAttribute() throws {
        
        let view = TestView {
            Tag {}.encoding(.plainText)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag enctype="text/plain"></tag>
                       """
        )
    }
    
    func testForAttribute() throws {
        
        let view = TestView {
            Tag {}.for("for")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag for="for"></tag>
                       """
        )
    }
    
    func testFormAttribute() throws {
        
        let view = TestView {
            Tag {}.form("/action.php")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag form="/action.php"></tag>
                       """
        )
    }
    
    func testFormActionAttribute() throws {
        
        let view = TestView {
            Tag {}.formAction("/action.php")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag formaction="/action.php"></tag>
                       """
        )
    }
    
    func testEquivalentAttribute() throws {
        
        let view = TestView {
            Tag {}.equivalent(.refresh)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag http-equiv="refresh"></tag>
                       """
        )
    }
    
    func testHeadersAttribute() throws {
        
        let view = TestView {
            Tag {}.headers("id")
            Tag {}.headers("id", "id")
            Tag {}.headers(["id", "id"])
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag headers="id"></tag>\
                       <tag headers="id id"></tag>\
                       <tag headers="id id"></tag>
                       """
        )
    }
    
    func testHeightAttribute() throws {
        
        let view = TestView {
            Tag {}.height(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag height="2"></tag>
                       """
        )
    }
    
    func testHighAttribute() throws {
        
        let view = TestView {
            Tag {}.high(2.0)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag high="2.0"></tag>
                       """
        )
    }
    
    func testItemAttribute() throws {
        
        let view = TestView {
            Tag {}.item()
            Tag {}.item(id: "id")
            Tag {}.item(as: "https://schema.org/Person")
            Tag {}.item(as: URL(string: "https://schema.org/Person"))
            Tag {}.item(for: "foo", "bar")
            Tag {}.item(for: ["foo", "bar"])
            
        }
        
        XCTAssertEqual(try renderer.render(view: view),
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
    
    func testReferenceAttribute() throws {
        
        let view = TestView {
            Tag {}.reference("/index.html")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag href="/index.html"></tag>
                       """
        )
    }
    
    func testReferenceLanguageAttribute() throws {
        
        let view = TestView {
            Tag {}.referenceLanguage(.german)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag hreflang="de"></tag>
                       """
        )
    }
    
    func testIsMapAttribute() throws {
        
        let view = TestView {
            Tag {}.isMap()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag ismap="ismap"></tag>
                       """
        )
    }
    
    func testKindAttribute() throws {
        
        let view = TestView {
            Tag {}.kind(.subtitles)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag kind="subtitles"></tag>
                       """
        )
    }
    
    func testLabelAttribute() throws {
        
        let view = TestView {
            Tag {}.label("Soccer")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag label="Soccer"></tag>
                       """
        )
    }
    
    func testListAttribute() throws {
        
        let view = TestView {
            Tag {}.list("browsers")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag list="browsers"></tag>
                       """
        )
    }
    
    func testLoopAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.loop()
            // with a false condition
            Tag {}.loop(false)
            // with a true condition
            Tag {}.loop(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag loop="loop"></tag>\
                       <tag></tag>\
                       <tag loop="loop"></tag>
                       """
        )
    }
    
    func testLowAttribute() throws {
        
        let view = TestView {
            Tag {}.low(2.0)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag low="2.0"></tag>
                       """
        )
    }
    
    func testMaximumAttribute() throws {
        
        let view = TestView {
            Tag {}.maximum("1948-01-01")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag max="1948-01-01"></tag>
                       """
        )
    }
    
    func testMaximumLengthAttribute() throws {
        
        let view = TestView {
            Tag {}.maximum(length: 2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag maxlength="2"></tag>
                       """
        )
    }

    func testMediaAttribute() throws {
        
        let view = TestView {
            Tag {}.media(MediaQuery(.all, features: .orientation(.landscape), .resolution("300dpi")))
            Tag {}.media(MediaQuery(.all), MediaQuery(.print))
            Tag {}.media(MediaQuery(.all), MediaQuery(.print, features: [.maxHeight("20vh")]))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag media="all and (orientation: landscape) and (resolution: 300dpi)"></tag>\
                       <tag media="all, print"></tag>\
                       <tag media="all, print and (max-height: 20vh)"></tag>
                       """
        )
    }
    
    func testMethodAttribute() throws {
        
        let view = TestView {
            Tag {}.method(.get)
            Tag {}.method(.post)
            Tag {}.method(.dialog)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag method="get"></tag>\
                       <tag method="post"></tag>\
                       <tag method="dialog"></tag>
                       """
        )
    }
    
    func testMinimumAttribute() throws {
        
        let view = TestView {
            Tag {}.minimum(2.0)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag min="2.0"></tag>
                       """
        )
    }
    
    func testMinimumLengthAttribute() throws {
        
        let view = TestView {
            Tag {}.minimum(length: 2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag minlength="2"></tag>
                       """
        )
    }
    
    func testMultipleAttribute() throws {
        
        let view = TestView {
            Tag {}.multiple()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag multiple="multiple"></tag>
                       """
        )
    }
    
    func testMutedAttribute() throws {
        
        let view = TestView {
            Tag {}.muted()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag muted="muted"></tag>
                       """
        )
    }
    
    func testNameAttribute() throws {
        
        let view = TestView {
            Tag {}.name("name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag name="name"></tag>
                       """
        )
    }
    
    func testNoValidateAttribute() throws {
        
        let view = TestView {
            Tag {}.novalidate()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag novalidate="novalidate"></tag>
                       """
        )
    }
    
    func testIsOpenAttribute() throws {
        
        let view = TestView {
            Tag {}.open()
            Tag {}.open(false)
            Tag {}.open(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag open="open"></tag>\
                       <tag></tag>\
                       <tag open="open"></tag>
                       """
        )
    }
    
    func testOptimumAttribute() throws {
        
        let view = TestView {
            Tag {}.optimum(2.0)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag optimum="2.0"></tag>
                       """
        )
    }
    
    func testPatternAttribute() throws {
        
        let view = TestView {
            Tag {}.pattern("[A-Za-z]{3}")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag pattern="[A-Za-z]{3}"></tag>
                       """
        )
    }
    
    func testPartAttribute() throws {
        
        let view = TestView {
            Tag {}.part("part")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag part="part"></tag>
                       """
        )
    }
    
    func testPingAttribute() throws {
        
        let view = TestView {
            Tag {}.ping("https://www.github.com")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag ping="https://www.github.com"></tag>
                       """
        )
    }
    
    func testPlaceholderAttribute() throws {
        
        let view = TestView {
            Tag {}.placeholder("123-45-678")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag placeholder="123-45-678"></tag>
                       """
        )
    }
    
    func testPlaysInlineAttribute() throws {
        
        let view = TestView {
            Tag {}.playInline()
            Tag {}.playInline(false)
            Tag {}.playInline(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag playsinline="playsinline"></tag>\
                       <tag></tag>\
                       <tag playsinline="playsinline"></tag>
                       """
        )
    }
    
    func testPosterAttribute() throws {
        
        let view = TestView {
            Tag {}.poster("https://www.github.com")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag poster="https://www.github.com"></tag>
                       """
        )
    }
    
    func testPreloadAttribute() throws {
        
        let view = TestView {
            Tag {}.preload(.metadata)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag preload="metadata"></tag>
                       """
        )
    }
    
    func testReadonlyAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.readonly()
            // with false condition
            Tag {}.readonly(false)
            // with true condition
            Tag {}.readonly(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag readonly="readonly"></tag>\
                       <tag></tag>\
                       <tag readonly="readonly"></tag>
                       """
        )
    }
    
    func testReferrerPolicyAttribute() throws {
        
        let view = TestView {
            Tag {}.referrerPolicy(.origin)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag referrerpolicy="origin"></tag>
                       """
        )
    }
    
    func testRelationshipAttribute() throws {
        
        let view = TestView {
            Tag {}.relationship(.author)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag rel="author"></tag>
                       """
        )
    }
    
    func testRequiredAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.required()
            // with false condition
            Tag {}.required(false)
            // with true condition
            Tag {}.required(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag required="required"></tag>\
                       <tag></tag>\
                       <tag required="required"></tag>
                       """
        )
    }
    
    func testReversedAttribute() throws {
        
        let view = TestView {
            Tag {}.reversed()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag reversed="reversed"></tag>
                       """
        )
    }
    
    func testRowsAttribute() throws {
        
        let view = TestView {
            Tag {}.rows(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag rows="2"></tag>
                       """
        )
    }
    
    func testRowSpanAttribute() throws {
        
        let view = TestView {
            Tag {}.rowSpan(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag rowspan="2"></tag>
                       """
        )
    }
    
    func testSandboxAttribute() throws {
        
        let view = TestView {
            Tag {}.sandbox()
            Tag {}.sandbox(.allowDownloads)
            Tag {}.sandbox([.allowDownloads, .allowForms])
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag sandbox="sandbox"></tag>\
                       <tag sandbox="allow-downloads"></tag>\
                       <tag sandbox="allow-downloads allow-forms"></tag>
                       """
        )
    }
    
    func testScopeAttribute() throws {
        
        let view = TestView {
            Tag {}.scope(.column)
            Tag {}.scope(.row)
            Tag {}.scope(.columnGroup)
            Tag {}.scope(.rowGroup)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag scope="col"></tag>\
                       <tag scope="row"></tag>\
                       <tag scope="colgroup"></tag>\
                       <tag scope="rowgroup"></tag>
                       """
        )
    }
    
    func testShapeAttribute() throws {
        
        let view = TestView {
            Tag {}.shape()
            Tag {}.shape(.circle, coordinates: "255,132,316,150")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag shape="default"></tag>\
                       <tag shape="circle" coords="255,132,316,150"></tag>
                       """
        )
    }
    
    func testSizeAttribute() throws {
        
        let view = TestView {
            Tag {}.size(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag size="2"></tag>
                       """
        )
    }
    
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
        
        XCTAssertEqual(try renderer.render(view: view),
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
    
    func testSlotAttribute() throws {
        
        let view = TestView {
            Tag {}.slot("slot")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag slot="slot"></tag>
                       """
        )
    }
    
    func testSpanAttribute() throws {
        
        let view = TestView {
            Tag {}.span(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag span="2"></tag>
                       """
        )
    }
    
    func testSourceAttribute() throws {
        
        let view = TestView {
            Tag {}.source("source")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag src="source"></tag>
                       """
        )
    }
    
    func testSourceDocumentAttribute() throws {
        
        let view = TestView {
            Tag {}.sourceDocument("<!doctype html><html lang=\"de\"></html>")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag srcdoc="&lt;!doctype html>&lt;html lang=&quot;de&quot;>&lt;/html>"></tag>
                       """
        )
    }
    
    func testSourceLanguageAttribute() throws {
        
        let view = TestView {
            Tag {}.sourceLanguage(.english)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag srclang="en"></tag>
                       """
        )
    }
    
    func testSourceSetAttribute() throws {
        
        let view = TestView {
            Tag {}.sourceSet(SourceCandidate("img.webp"))
            Tag {}.sourceSet(SourceCandidate("img.png", density: 4))
            Tag {}.sourceSet(SourceCandidate("img.png", density: .ultra))
            Tag {}.sourceSet(SourceCandidate("img.png", width: 1024))
            Tag {}.sourceSet(SourceCandidate("img.png", width: 1024), SourceCandidate("img.png", density: .ultra))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag srcset="img.webp"></tag>\
                       <tag srcset="img.png 4x"></tag>\
                       <tag srcset="img.png 3x"></tag>\
                       <tag srcset="img.png 1024w"></tag>\
                       <tag srcset="img.png 1024w, img.png 3x"></tag>
                       """
        )
    }
    
    func testStartAttribute() throws {
        
        let view = TestView {
            Tag {}.start(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag start="2"></tag>
                       """
        )
    }
    
    func testStepAttribute() throws {
        
        let view = TestView {
            Tag {}.step(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag step="2"></tag>
                       """
        )
    }
    
    func testTargetAttribute() throws {
        
        let view = TestView {
            Tag {}.target(.blank)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag target="_blank"></tag>
                       """
        )
    }
    
    func testTypeAttribute() throws {
        
        let view = TestView {
            Tag {}.type("type")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag type="type"></tag>
                       """
        )
    }
    
    func testUseMapAttribute() throws {
        
        let view = TestView {
            Tag {}.useMap("image_map")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag usemap="#image_map"></tag>
                       """
        )
    }
    
    func testSelectedAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.selected()
            // with a false condition
            Tag {}.selected(false)
            // with a true condition
            Tag {}.selected(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag selected="selected"></tag>\
                       <tag></tag>\
                       <tag selected="selected"></tag>
                       """
        )
    }
    
    func testFetchPriorityAttribute() throws {
        
        let view = TestView {
            Tag {}.fetchPriority(.high)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag fetchpriority="high"></tag>
                       """
        )
    }
    
    func testLoadingAttribute() throws {
        
        let view = TestView {
            Tag {}.loading(.lazy)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag loading="lazy"></tag>
                       """
        )
    }
    
    func testDecodingAttribute() throws {
        
        let view = TestView {
            Tag {}.decoding(.async)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag decoding="async"></tag>
                       """
        )
    }
    
    func testValueAttribute() throws {
        
        let view = TestView {
            Tag {}.value("value")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag value="value"></tag>
                       """
        )
    }
    
    func testBlockingAttribute() throws {
        
        let view = TestView {
            Tag {}.blocking(.render)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag blocking="render"></tag>
                       """
        )
    }
    
    func testPopoverAttribute() throws {
        
        let view = TestView {
            Tag {}.popover(.auto)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag popover="auto"></tag>
                       """
        )
    }
    
    func testPopoverTargetAttribute() throws {
        
        let view = TestView {
            Tag {}.popoverTarget("id")
            Tag {}.popoverTarget("id", action: .hide)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag popovertarget="id"></tag>\
                       <tag popovertarget="id" popovertargetaction="hide"></tag>
                       """
        )
    }
    
    func testIntegrityAttribute() throws {
        
        let view = TestView {
            Tag {}.integrity("sha384...")
            Tag {}.integrity("sha384...", "sha384...")
            Tag {}.integrity(["sha384...", "sha384..."])
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag integrity="sha384..."></tag>\
                       <tag integrity="sha384... sha384..."></tag>\
                       <tag integrity="sha384... sha384..."></tag>
                       """
        )
    }
    
    func testAsAttribute() throws {
        
        let view = TestView {
            Tag {}.as(.fetch)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag as="fetch"></tag>
                       """
        )
    }
    
    func testCrossOriginAttribute() throws {
        
        let view = TestView {
            Tag {}.crossOrigin(.anonymous)
            Tag {}.crossOrigin(.useCredentials)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag crossorigin="anonymous"></tag>\
                       <tag crossorigin="use-credentials"></tag>
                       """
        )
    }
    
    func testCustomAttribute() throws {
        
        let view = TestView {
            Tag {}.custom(key: "data-animal-type", value: "bird")
            Tag {}.custom(key: "data-row-index", value: 2)
            Tag {}.custom(key: "data-cart-total", value: 20.0)
            Tag {}.custom(key: "aria-hidden", value: false)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag data-animal-type="bird"></tag>\
                       <tag data-row-index="2"></tag>\
                       <tag data-cart-total="20.0"></tag>\
                       <tag aria-hidden="false"></tag>
                       """
        )
    }
    
    func testWindowEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .afterprint, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onafterprint="script"></tag>
                       """
        )
    }
    
    func testFocusEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .focus, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onfocus="script"></tag>
                       """
        )
    }
    
    func testPointerEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .pointerup, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onpointerup="script"></tag>
                       """
        )
    }
    
    func testMouseEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .mouseup, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onmouseup="script"></tag>
                       """
        )
    }
    
    func testWheelEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .wheel, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onwheel="script"></tag>
                       """
        )
    }
    
    func testInputEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .input, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag oninput="script"></tag>
                       """
        )
    }
    
    func testKeyboardEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .keyup, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onkeyup="script"></tag>
                       """
        )
    }
    
    func testDragEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .drag, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag ondrag="script"></tag>
                       """
        )
    }
    
    func testClipboardEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .paste, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onpaste="script"></tag>
                       """
        )
    }
    
    func testSelectionEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .selectstart, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onselectstart="script"></tag>
                       """
        )
    }
    
    func testMediaEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .play, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onplay="script"></tag>
                       """
        )
    }
    
    func testFormEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .submit, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag onsubmit="script"></tag>
                       """
        )
    }
    
    func testDetailEventAttribute() throws {
        
        let view = TestView {
            Tag {}.on(event: .toggle, "script")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag ontoggle="script"></tag>
                       """
        )
    }
    
    func testAtomicAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(atomic: true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-atomic="true"></tag>
                       """
        )
    }
    
    func testBusyAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(busy: true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-busy="true"></tag>
                       """
        )
    }
    
    func testControlsAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(controls: "name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-controls="name"></tag>
                       """
        )
    }
    
    func testCurrentAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(current: .page)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-current="page"></tag>
                       """
        )
    }
    
    func testDescribedByAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(describedBy: "description")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-describedby="description"></tag>
                       """
        )
    }
    
    func testDetailsAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(details: "details")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-details="details"></tag>
                       """
        )
    }
    
    func testDisabledAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(disabled: true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-disabled="true"></tag>
                       """
        )
    }
    
    func testErrorMessageAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(errorMessage: "error")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-errormessage="error"></tag>
                       """
        )
    }
    
    func testFlowAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityFlowTo("id")
            Tag {}.accessibilityFlowTo("id", "id")
            Tag {}.accessibilityFlowTo(["id", "id"])
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-flowto="id"></tag>\
                       <tag aria-flowto="id id"></tag>\
                       <tag aria-flowto="id id"></tag>
                       """
        )
    }
    
    func testHasPopupAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(hasPopup: .grid)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-haspopup="grid"></tag>
                       """
        )
    }
    
    func testHiddenAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(hidden: true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-hidden="true"></tag>
                       """
        )
    }
    
    func testInvalidAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(invalid: .grammar)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-invalid="grammar"></tag>
                       """
        )
    }
    
    func testKeyShortcutsAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(keyShortcuts: "shortcut")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-keyshortcuts="shortcut"></tag>
                       """
        )
    }
    
    func testLabelAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityLabel("label")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-label="label"></tag>
                       """
        )
    }
    
    func testLabeledByAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(labeledBy: "label")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-labeledby="label"></tag>
                       """
        )
    }
    
    func testLiveAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(live: .polite)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-live="polite"></tag>
                       """
        )
    }
    
    func testOwnsAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(owns: "live")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-owns="live"></tag>
                       """
        )
    }
    
    func testRelevantAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(relevant: .additions)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-relevant="additions"></tag>
                       """
        )
    }
    
    func testRoleDescriptionAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(roleDescription: "description")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-roledescription="description"></tag>
                       """
        )
    }
    
    func testSortAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilitySort(.ascending)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-sort="ascending"></tag>
                       """
        )
    }
    
    func testOrientationAccessibilityAttribute() throws {
        
        let view = TestView {
            Tag {}.accessibilityOrientation(.horizontal)
            Tag {}.accessibilityOrientation(.vertical)
            Tag {}.accessibilityOrientation(.undefined)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-orientation="horizontal"></tag>\
                       <tag aria-orientation="vertical"></tag>\
                       <tag aria-orientation="undefined"></tag>
                       """
        )
    }
    
    func testDrawAttribute() throws {
        
        let view = TestView {
            Tag {}.draw("M 10,30 A 20,20 0,0,1 50,30 A 20,20 0,0,1 90,30 Q 90,60 50,90 Q 10,60 10,30 z")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag d="M 10,30 A 20,20 0,0,1 50,30 A 20,20 0,0,1 90,30 Q 90,60 50,90 Q 10,60 10,30 z"></tag>
                       """
        )
    }
    
    func testFillAttribute() throws {
        
        let view = TestView {
            Tag {}.fill("black")
            Tag {}.fill("black", opacity: 0.5)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag fill="black"></tag>\
                       <tag fill="black" fill-opacity="0.5"></tag>
                       """
        )
    }
    
    func testStrokeAttribute() throws {
        
        let view = TestView {
            Tag {}.stroke("black")
            Tag {}.stroke("black", width: 1)
            Tag {}.stroke("black", width: 1, opacity: 0.5)
            Tag {}.stroke("black", width: 1, opacity: 0.5, cap: .butt)
            Tag {}.stroke("black", width: 1, opacity: 0.5, cap: .butt, join: .round)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag stroke="black"></tag>\
                       <tag stroke="black" stroke-width="1"></tag>\
                       <tag stroke="black" stroke-width="1" stroke-opacity="0.5"></tag>\
                       <tag stroke="black" stroke-width="1" stroke-opacity="0.5" stroke-linecap="butt"></tag>\
                       <tag stroke="black" stroke-width="1" stroke-opacity="0.5" stroke-linecap="butt" stroke-linejoin="round"></tag>
                       """
        )
    }
    
    func testRadiusAttribute() throws {
        
        let view = TestView {
            Tag {}.radius(25)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag r="25"></tag>
                       """
        )
    }
    
    func testPositionAttribute() throws {
        
        let view = TestView {
            Tag {}.position(x: 50, y: 50)
            Tag {}.position(x: 50.0, y: 50.0)
            Tag {}.position(UnitPoint(x: 50.0, y: 50.0))
            Tag {}.position(UnitPoint(x: 50, y: 50, format: .relative))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag x="50" y="50"></tag>\
                       <tag x="50.0" y="50.0"></tag>\
                       <tag x="50.0" y="50.0"></tag>\
                       <tag x="50%" y="50%"></tag>
                       """
        )
    }
    
    func testRadiusPointAttribute() throws {
        
        let view = TestView {
            Tag {}.radius(x: 10, y: 10)
            Tag {}.radius(x: 10.0, y: 10.0)
            Tag {}.radius(UnitPoint(x: 10.0, y: 10.0))
            Tag {}.radius(UnitPoint(x: 10, y: 10, format: .relative))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag rx="10" ry="10"></tag>\
                       <tag rx="10.0" ry="10.0"></tag>\
                       <tag rx="10.0" ry="10.0"></tag>\
                       <tag rx="10%" ry="10%"></tag>
                       """
        )
    }
    
    func testCenterPointAttribute() throws {
        
        let view = TestView {
            Tag {}.center(x: 10, y: 10)
            Tag {}.center(x: 10.0, y: 10.0)
            Tag {}.center(UnitPoint(x: 10.0, y: 10.0))
            Tag {}.center(UnitPoint(x: 10, y: 10, format: .relative))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag cx="10" cy="10"></tag>\
                       <tag cx="10.0" cy="10.0"></tag>\
                       <tag cx="10.0" cy="10.0"></tag>\
                       <tag cx="10%" cy="10%"></tag>
                       """
        )
    }
    
    func testViewBoxAttribute() throws {
        
        let view = TestView {
            Tag {}.viewBox(x: 0, y: 0, width: 100, height: 100)
            Tag {}.viewBox(x: 0, y: 0, width: 100.0, height: 100.0)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag viewbox="0 0 100 100"></tag>\
                       <tag viewbox="0.0 0.0 100.0 100.0"></tag>
                       """
        )
    }
    
    func testNamespaceAttribute() throws {
        
        let view = TestView {
            Tag {}.namespace("http://www.w3.org/2000/svg")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag xmlns="http://www.w3.org/2000/svg"></tag>
                       """
        )
    }
    
    func testPointsAttribute() throws {
        
        let view = TestView {
            Tag {}.points("50,0 21,90 98,35 2,35 79,90")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag points="50,0 21,90 98,35 2,35 79,90"></tag>
                       """
        )
    }
    
    func testShadowRootModeAttribute() throws {
        
        let view = TestView {
            Tag {}.shadowRootMode(.open)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag shadowrootmode="open"></tag>
                       """
        )
    }
    
    func testInertAttribute() throws {
        
        let view = TestView {
            // unconditionally
            Tag {}.inert()
            // with a false condition
            Tag {}.inert(false)
            // with a true condition
            Tag {}.inert(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag inert="inert"></tag>\
                       <tag></tag>\
                       <tag inert="inert"></tag>
                       """
        )
    }
    
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
        
        XCTAssertEqual(try renderer.render(view: view),
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
}
