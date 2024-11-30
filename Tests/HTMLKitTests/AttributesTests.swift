/*
 Abstract:
 The file tests the rendering of the attributes.
 */

@testable import HTMLKit
import OrderedCollections
import XCTest

final class AttributesTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    typealias AllAttributes = AccessKeyAttribute & AcceptAttribute & ActionAttribute & AlternateAttribute & AsynchronouslyAttribute & AutocapitalizeAttribute & AutocompleteAttribute & AutofocusAttribute & AutoplayAttribute & CharsetAttribute & CheckedAttribute & CiteAttribute & ClassAttribute & ColumnsAttribute & ColumnSpanAttribute & ContentAttribute & EditAttribute  & ControlsAttribute & CoordinatesAttribute & DataAttribute & DateTimeAttribute & DefaultAttribute & DeferAttribute & DirectionAttribute & DisabledAttribute & DownloadAttribute & DragAttribute & EncodingAttribute & EnterKeyHintAttribute & ForAttribute & FormAttribute & FormActionAttribute & EquivalentAttribute & HeaderAttribute & HeightAttribute & HiddenAttribute & HighAttribute & ReferenceAttribute & ReferenceLanguageAttribute & IdentifierAttribute & IsMapAttribute & InputModeAttribute & IsAttribute & ItemIdAttribute & ItemPropertyAttribute & ItemReferenceAttribute & ItemScopeAttribute & ItemTypeAttribute & KindAttribute & LabelAttribute & LanguageAttribute & ListAttribute & LoopAttribute & LowAttribute & MaximumValueAttribute & MaximumLengthAttribute & MediaAttribute & MethodAttribute & MinimumValueAttribute & MinimumLengthAttribute & MultipleAttribute & MutedAttribute & NameAttribute & NonceAttribute & NoValidateAttribute & OpenAttribute & OptimumAttribute & PatternAttribute & PartAttribute & PingAttribute & PlaceholderAttribute & PosterAttribute & PreloadAttribute & ReadyOnlyAttribute & ReferrerPolicyAttribute & RelationshipAttribute & RequiredAttribute & ReversedAttribute & RoleAttribute & RowsAttribute & RowSpanAttribute & SandboxAttribute & ScopeAttribute & ShapeAttribute & SizeAttribute & SizesAttribute & SlotAttribute & SpanAttribute & SpellCheckAttribute & SourceAttribute & StartAttribute & StepAttribute & StyleAttribute & TabulatorAttribute & TargetAttribute & TitleAttribute & TranslateAttribute & TypeAttribute & ValueAttribute & WidthAttribute & WrapAttribute & PropertyAttribute & SelectedAttribute & WindowEventAttribute & FocusEventAttribute & PointerEventAttribute & MouseEventAttribute & WheelEventAttribute & InputEventAttribute & KeyboardEventAttribute & DragEventAttribute & ClipboardEventAttribute & SelectionEventAttribute & MediaEventAttribute & FormEventAttribute & DetailEventAttribute & AriaAtomicAttribute & AriaBusyAttribute & AriaControlsAttribute & AriaCurrentAttribute & AriaDescribedAttribute & AriaDetailsAttribute & AriaDisabledAttribute & AriaErrorMessageAttribute & AriaFlowToAttribute & AriaPopupAttribute & AriaHiddenAttribute & AriaInvalidAttribute & AriaShortcutsAttribute & AriaLabelAttribute & AriaLabeledAttribute & AriaLiveAttribute & AriaOwnsAttribute & AriaRelevantAttribute & AriaRoleDescriptionAttribute & DrawAttribute & FillAttribute & FillOpacityAttribute & StrokeAttribute & StrokeWidthAttribute & StrokeOpacityAttribute & StrokeLineCapAttribute & StrokeLineJoinAttribute & RadiusAttribute & PositionPointAttribute & RadiusPointAttribute & CenterPointAttribute & ViewBoxAttribute & NamespaceAttribute & PointsAttribute & ShadowRootModeAttribute & InertAttribute & FetchPriorityAttribute & LoadingAttribute & SourceSetAttribute & DecodingAttribute & BlockingAttribute & PopoverAttribute & PopoverTargetAttribute & PopoverActionAttribute
    
    struct Tag: ContentNode, GlobalElement, AllAttributes {

        internal var name: String { "tag" }

        internal var attributes: OrderedDictionary<String, Any>?

        internal var content: [Content]

        public init(@ContentBuilder<Content> content: () -> [Content]) {
            self.content = content()
        }
        
        internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
            self.attributes = attributes
            self.content = content
        }
        
        func accessKey(_ value: Character) -> Tag {
            return self.mutate(accesskey: value)
        }
        
        func autocapitalize(_ value: Values.Capitalization) -> Tag {
            return self.mutate(autocapitalize: value.rawValue)
        }
        
        func autofocus() -> Tag {
            return self.mutate(autofocus: "autofocus")
        }
        
        func `class`(_ value: String) -> Tag {
            return self.mutate(class: value)
        }
        
        func direction(_ value: Values.Direction) -> Tag {
            return self.mutate(dir: value.rawValue)
        }
        
        func isDraggable(_ value: Bool) -> Tag {
            return self.mutate(draggable: value)
        }
        
        func isEditable(_ value: Bool) -> Tag {
            return self.mutate(contenteditable: value)
        }
        
        func enterKeyHint(_ value: Values.Hint) -> Tag {
            return self.mutate(enterkeyhint: value.rawValue)
        }
        
        func hidden() -> Tag {
            return self.mutate(hidden: "hidden")
        }
        
        public func hidden(_ condition: Bool) -> Tag {
            
            if condition {
                return mutate(hidden: "hidden")
            }
            
            return self
        }
        
        func id(_ value: String) -> Tag {
            return self.mutate(id: value)
        }
        
        func inputMode(_ value: Values.Mode) -> Tag {
            return mutate(inputmode: value.rawValue)
        }
        
        func `is`(_ value: String) -> Tag {
            return self.mutate(is: value)
        }
        
        func itemId(_ value: String) -> Tag {
            return self.mutate(itemid: value)
        }
        
        func itemProperty(_ value: String) -> Tag {
            return self.mutate(itemprop: value)
        }
        
        func itemReference(_ value: String) -> Tag {
            return self.mutate(itemref: value)
        }
        
        func itemScope(_ value: String) -> Tag {
            return self.mutate(itemscope: value)
        }
        
        func itemType(_ value: String) -> Tag {
            return self.mutate(itemtype: value)
        }
        
        func language(_ value: Values.Language) -> Tag {
            return self.mutate(lang: value.rawValue)
        }
        
        func nonce(_ value: String) -> Tag {
            return self.mutate(nonce: value)
        }
        
        func role(_ value: Values.Role) -> Tag {
            return self.mutate(role: value.rawValue)
        }
        
        func hasSpellCheck(_ value: Bool) -> Tag {
            return self.mutate(spellcheck: value)
        }
        
        func style(_ value: String) -> Tag {
            return self.mutate(style: value)
        }
        
        func tabIndex(_ value: Int) -> Tag {
            return self.mutate(tabindex: value)
        }
        
        func title(_ value: String) -> Tag {
            return self.mutate(title: value)
        }
        
        func translate(_ value: Values.Decision) -> Tag {
            return self.mutate(translate: value.rawValue)
        }
        
        func accept(_ value: String) -> Tag {
            return self.mutate(accept: value)
        }
        
        func action(_ value: String) -> Tag {
            return self.mutate(action: value)
        }
        
        func alternate(_ value: String) -> Tag {
            return self.mutate(alternate: value)
        }
        
        func asynchronously() -> Tag {
            return self.mutate(async: "async")
        }
        
        func hasCompletion(_ value: Bool) -> Tag {
            return self.mutate(autocomplete: value)
        }
        
        func autoplay() -> Tag {
            return self.mutate(autoplay: "autoplay")
        }
        
        public func autoplay(_ condition: Bool) -> Tag {
            
            if condition {
                return mutate(autoplay: "autoplay")
            }
            
            return self
        }
        
        func charset(_ value: Values.Charset) -> Tag {
            return self.mutate(charset: value.rawValue)
        }
        
        func checked() -> Tag {
            return self.mutate(checked: "checked")
        }
        
        public func checked(_ condition: Bool) -> Tag {
            
            if condition {
                return mutate(checked: "checked")
            }
            
            return self
        }
        
        func cite(_ value: String) -> Tag {
            return self.mutate(cite: value)
        }
        
        func columns(_ size: Int) -> Tag {
            return self.mutate(cols: size)
        }
        
        func columnSpan(_ size: Int) -> Tag {
            return self.mutate(colspan: size)
        }
        
        func content(_ value: String) -> Tag {
            return self.mutate(content: value)
        }
        
        func controls() -> Tag {
            return self.mutate(controls: "controls")
        }
        
        func coordinates(_ value: String) -> Tag {
            return self.mutate(coords: value)
        }
        
        func data(_ value: String) -> Tag {
            return self.mutate(data: value)
        }
        
        func dateTime(_ value: String) -> Tag {
            return self.mutate(datetime: value)
        }
        
        func `default`() -> Tag {
            return self.mutate(default: "default")
        }
        
        func `defer`() -> Tag {
            return self.mutate(defer: "defer")
        }
        
        func disabled() -> Tag {
            return self.mutate(disabled: "disabled")
        }
        
        public func disabled(_ condition: Bool) -> Tag {
            
            if condition {
                return mutate(disabled: "disabled")
            }
            
            return self
        }
        
        func download() -> Tag {
            return self.mutate(download: "download")
        }
        
        func encoding(_ value: Values.Encoding) -> Tag {
            return self.mutate(enctype: value.rawValue)
        }
        
        func `for`(_ value: String) -> Tag {
            return self.mutate(for: value)
        }
        
        func form(_ value: String) -> Tag {
            return self.mutate(form: value)
        }
        
        func formAction(_ value: String) -> Tag {
            return self.mutate(formaction: value)
        }
        
        func equivalent(_ value: Values.Equivalent) -> Tag {
            return self.mutate(httpequiv: value.rawValue)
        }
        
        func headers(_ value: String) -> Tag {
            return self.mutate(headers: value)
        }
        
        func height(_ size: Int) -> Tag {
            return self.mutate(height: size)
        }
        
        func high(_ size: Float) -> Tag {
            return self.mutate(high: size)
        }
        
        func reference(_ value: String) -> Tag {
            return self.mutate(href: value)
        }
        
        func referenceLanguage(_ value: Values.Language) -> Tag {
            return self.mutate(hreflang: value.rawValue)
        }
        
        func isMap() -> Tag {
            return self.mutate(ismap: "ismap")
        }
        
        func kind(_ value: Values.Kind) -> Tag {
            return self.mutate(kind: value.rawValue)
        }
        
        func label(_ value: String) -> Tag {
            return self.mutate(label: value)
        }
        
        func list(_ value: String) -> Tag {
            return self.mutate(list: value)
        }
        
        func loop() -> Tag {
            return self.mutate(loop: "loop")
        }
        
        func low(_ size: Float) -> Tag {
            return self.mutate(low: size)
        }
        
        func maximum(_ value: String) -> Tag {
            return self.mutate(max: value)
        }
        
        func maximum(length value: Int) -> Tag {
            return self.mutate(maxlength: value)
        }
        
        func media(_ value: String) -> Tag {
            return self.mutate(media: value)
        }
        
        func method(_ value: HTMLKit.Values.Method) -> Tag {
            return self.mutate(method: value.rawValue)
        }
        
        func minimum(_ value: Float) -> Tag {
            return self.mutate(min: value)
        }
        
        func minimum(length value: Int) -> Tag {
            return self.mutate(minlength: value)
        }
        
        func multiple() -> Tag {
            return self.mutate(multiple: "multiple")
        }
        
        func muted() -> Tag {
            return self.mutate(muted: "muted")
        }
        
        func name(_ value: String) -> Tag {
            return self.mutate(name: value)
        }
        
        func novalidate() -> Tag {
            return self.mutate(novalidate: "novalidate")
        }
        
        func isOpen(_ value: Bool) -> Tag {
            return self.mutate(open: value)
        }
        
        func optimum(_ value: Float) -> Tag {
            return self.mutate(optimum: value)
        }
        
        func pattern(_ regex: String) -> Tag {
            return self.mutate(pattern: regex)
        }
        
        func part(_ value: String) -> Tag {
            return self.mutate(part: value)
        }
        
        func ping(_ value: String) -> Tag {
            return self.mutate(ping: value)
        }
        
        func placeholder(_ value: String) -> Tag {
            return self.mutate(placeholder: value)
        }
        
        func poster(_ value: String) -> Tag {
            return self.mutate(poster: value)
        }
        
        func preload(_ value: Values.Preload) -> Tag {
            return self.mutate(preload: value.rawValue)
        }
        
        func readonly() -> Tag {
            return self.mutate(readonly: "readonly")
        }
        
        public func readonly(_ condition: Bool) -> Tag {
            
            if condition {
                return mutate(readonly: "readonly")
            }
            
            return self
        }
        
        func referrerPolicy(_ value: Values.Policy) -> Tag {
            return self.mutate(referrerpolicy: value.rawValue)
        }
        
        func relationship(_ value: Values.Relation) -> Tag {
            return self.mutate(rel: value.rawValue)
        }
        
        func required() -> Tag {
            return self.mutate(required: "required")
        }
        
        public func required(_ condition: Bool) -> Tag {
            
            if condition {
                return mutate(required: "required")
            }
            
            return self
        }
        
        func reversed() -> Tag {
            return self.mutate(reversed: "reversed")
        }
        
        func rows(_ size: Int) -> Tag {
            return self.mutate(rows: size)
        }
        
        func rowSpan(_ size: Int) -> Tag {
            return self.mutate(rowspan: size)
        }
        
        func sandbox() -> Tag {
            return self.mutate(sandbox: "sandbox")
        }
        
        func scope(_ value: String) -> Tag {
            return self.mutate(scope: value)
        }
        
        func shape(_ value: Values.Shape) -> Tag {
            return self.mutate(shape: value.rawValue)
        }
        
        func size(_ size: Int) -> Tag {
            return self.mutate(size: size)
        }
        
        func sizes(_ size: Int) -> Tag {
            return self.mutate(sizes: size)
        }
        
        func slot(_ value: String) -> Tag {
            return self.mutate(slot: value)
        }
        
        func span(_ size: Int) -> Tag {
            return self.mutate(span: size)
        }
        
        func source(_ value: String) -> Tag {
            return self.mutate(source: value)
        }
        
        public func source(_ value: EnvironmentValue) -> Tag {
            return mutate(source: value)
        }
        
        func sourceSet(_ value: String) -> Tag {
            return mutate(sourceset: value)
        }
        
        func start(_ size: Int) -> Tag {
            return self.mutate(start: size)
        }
        
        func step(_ size: Int) -> Tag {
            return self.mutate(step: size)
        }
        
        func target(_ value: Values.Target) -> Tag {
            return self.mutate(target: value.rawValue)
        }
        
        func type(_ value: String) -> Tag {
            return self.mutate(type: value)
        }
        
        func value(_ value: String) -> Tag {
            return self.mutate(value: value)
        }
        
        func width(_ size: Int) -> Tag {
            return self.mutate(width: size)
        }
        
        func wrap(_ value: Values.Wrapping) -> Tag {
            return self.mutate(wrap: value.rawValue)
        }
        
        func property(_ value: Values.Graph) -> Tag {
            return self.mutate(property: value.rawValue)
        }
        
        func selected() -> Tag {
            return self.mutate(selected: "selected")
        }
        
        func draw(_ value: String) -> Tag {
            return self.mutate(draw: value)
        }
        
        func fill(_ value: String) -> Tag {
            return self.mutate(fill: value)
        }
        
        func fillOpacity(_ value: Double) -> Tag {
            return self.mutate(fillopacity: value)
        }
        
        func stroke(_ value: String) -> Tag {
            return self.mutate(stroke: value)
        }
        
        func strokeWidth(_ size: Int) -> Tag {
            return self.mutate(strokewidth: size)
        }
        
        func strokeOpacity(_ value: Double) -> Tag {
            return self.mutate(strokeopacity: value)
        }
        
        func strokeLineCap(_ value: HTMLKit.Values.Linecap) -> Tag {
            return self.mutate(strokelinecap: value.rawValue)
        }
        
        func strokeLineJoin(_ value: HTMLKit.Values.Linejoin) -> Tag {
            return self.mutate(strokelinejoin: value.rawValue)
        }
        
        func radius(_ size: Int) -> Tag {
            return self.mutate(radius: size)
        }
        
        func positionPoint(_ point: (Int, Int)) -> Tag {
            return self.mutate(positionpoint: point)
        }
        
        func radiusPoint(_ point: (Int, Int)) -> Tag {
            return self.mutate(radiuspoint: point)
        }
        
        func centerPoint(_ point: (Int, Int)) -> Tag {
            return self.mutate(centerpoint: point)
        }
        
        func viewBox(_ value: String) -> Tag {
            return self.mutate(viewbox: value)
        }
        
        func namespace(_ value: String) -> Tag {
            return self.mutate(namespace: value)
        }
        
        func points(_ value: String) -> Tag {
            return self.mutate(points: value)
        }
        
        func fetchPriority(_ value: Values.Priority) -> Tag {
            return self.mutate(fetchpriority: value.rawValue)
        }
        
        func loading(_ value: Values.Loading) -> Tag {
            return self.mutate(loading: value.rawValue)
        }
        
        func decoding(_ value: Values.Decoding) -> Tag {
            return self.mutate(decoding: value.rawValue)
        }
        
        func popover(_ value: Values.Popover.State) -> Tag {
            return self.mutate(popover: value.rawValue)
        }
        
        func popoverTarget(_ value: String) -> Tag {
            return self.mutate(popovertarget: value)
        }
        
        func popoverAction(_ value: Values.Popover.Action) -> Tag {
            return self.mutate(popoveraction: value.rawValue)
        }
        
        func custom(key: String, value: Any) -> Tag {
            return self.mutate(key: key, value: value)
        }
        
        func blocking(_ value: Values.Blocking) -> Tag {
            return self.mutate(blocking: value.rawValue)
        }
        
        func on(event: Events.Window, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Focus, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Pointer, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Mouse, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Wheel, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Input, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Keyboard, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Drag, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Clipboard, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Selection, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Media, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Form, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        func on(event: Events.Detail, _ value: String) -> Tag {
            return self.mutate(key: event.rawValue, value: value)
        }
        
        public func aria(atomic value: Bool) -> Tag {
            return mutate(ariaatomic: value)
        }
        
        public func aria(busy value: Bool) -> Tag {
            return mutate(ariabusy: value)
        }
        
        public func aria(controls value: String) -> Tag {
            return mutate(ariacontrols: value)
        }
        
        public func aria(current value: Values.Accessibility.Current) -> Tag {
            return mutate(ariacurrent: value.rawValue)
        }
        
        public func aria(describedBy value: String) -> Tag {
            return mutate(ariadescribedby: value)
        }
        
        public func aria(details value: String) -> Tag {
            return mutate(ariadetails: value)
        }
        
        public func aria(disabled value: Bool) -> Tag {
            return mutate(ariadisabled: value)
        }
        
        public func aria(errorMessage value: String) -> Tag {
            return mutate(ariaerrormessage: value)
        }
        
        public func aria(flowTo value: String) -> Tag {
            return mutate(ariaflowto: value)
        }
        
        public func aria(hasPopup value: Values.Accessibility.Popup) -> Tag {
            return mutate(ariahaspopup: value.rawValue)
        }
        
        public func aria(hidden value: Bool) -> Tag {
            return mutate(ariahidden: value)
        }
        
        public func aria(invalid value: Values.Accessibility.Invalid) -> Tag {
            return mutate(ariainvalid: value.rawValue)
        }
        
        public func aria(keyShortcuts value: String) -> Tag {
            return mutate(ariakeyshortcuts: value)
        }
        
        public func aria(label value: String) -> Tag {
            return mutate(arialabel: value)
        }
        
        public func aria(labeledBy value: String) -> Tag {
            return mutate(arialabeledby: value)
        }
        
        public func aria(live value: Values.Accessibility.Live) -> Tag {
            return mutate(arialive: value.rawValue)
        }
        
        public func aria(owns value: String) -> Tag {
            return mutate(ariaowns: value)
        }
        
        public func aria(relevant value: Values.Accessibility.Relevant) -> Tag {
            return mutate(ariarelevant: value.rawValue)
        }
        
        public func aria(roleDescription value: String) -> Tag {
            return mutate(ariaroledescription: value)
        }
        
        func shadowRootMode(_ value: Values.Shadow.Mode) -> Tag {
            return mutate(shadowrootmode: value.rawValue)
        }
        
        func inert() -> Tag {
            return self.mutate(inert: "inert")
        }
        
        public func inert(_ condition: Bool) -> Tag {
            
            if condition {
                return mutate(inert: "inert")
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
            Tag {}.isDraggable(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag draggable="true"></tag>
                       """
        )
    }
    
    func testEditableAttribute() throws {
        
        let view = TestView {
            Tag {}.isEditable(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag contenteditable="true"></tag>
                       """
        )
    }
    
    func testEnterkeyhintAttribute() throws {
        
        let view = TestView {
            Tag {}.enterKeyHint(.enter)
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
            Tag {}.role(.range)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag role="range"></tag>
                       """
        )
    }
    
    func testHasSpellCheckAttribute() throws {
        
        let view = TestView {
            Tag {}.hasSpellCheck(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
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
            Tag {}.translate(.yes)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag translate="yes"></tag>
                       """
        )
    }
    
    func testAcceptAttribute() throws {
        
        let view = TestView {
            Tag {}.accept("accept")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag accept="accept"></tag>
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
            Tag {}.hasCompletion(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag autocomplete="true"></tag>
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
    
    func testCoordinatesAttribute() throws {
        
        let view = TestView {
            Tag {}.coordinates("255,132,316,150")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag coords="255,132,316,150"></tag>
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
            Tag {}.headers("name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag headers="name"></tag>
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
            Tag {}.loop()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
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
            Tag {}.media("print and (resolution:300dpi)")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag media="print and (resolution:300dpi)"></tag>
                       """
        )
    }
    
    func testMethodAttribute() throws {
        
        let view = TestView {
            Tag {}.method(.get)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag method="get"></tag>
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
            Tag {}.isOpen(true)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag open="true"></tag>
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
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag sandbox="sandbox"></tag>
                       """
        )
    }
    
    func testScopeAttribute() throws {
        
        let view = TestView {
            Tag {}.scope("scope")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag scope="scope"></tag>
                       """
        )
    }
    
    func testShapeAttribute() throws {
        
        let view = TestView {
            Tag {}.shape(.circle)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag shape="circle"></tag>
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
            Tag {}.sizes(2)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag sizes="2"></tag>
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
    
    func testSourceSetAttribute() throws {
        
        let view = TestView {
            Tag {}.sourceSet("img2.png 100w, img3.png 500w")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag srcset="img2.png 100w, img3.png 500w"></tag>
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
    
    func testSelectedAttribute() throws {
        
        let view = TestView {
            Tag {}.selected()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
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
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag popovertarget="id"></tag>
                       """
        )
    }
    
    func testPopoverActionAttribute() throws {
        
        let view = TestView {
            Tag {}.popoverAction(.toggle)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag popovertargetaction="toggle"></tag>
                       """
        )
    }
    
    func testCustomAttribute() throws {
        
        let view = TestView {
            Tag {}.custom(key: "data-animal-type", value: "bird")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag data-animal-type="bird"></tag>
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
    
    func testFlowToAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(flowTo: "flow")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag aria-flowto="flow"></tag>
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
    
    func testLabelAriaAttribute() throws {
        
        let view = TestView {
            Tag {}.aria(label: "label")
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
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag fill="black"></tag>
                       """
        )
    }
    
    func testFillOpacityAttribute() throws {
        
        let view = TestView {
            Tag {}.fillOpacity(0.5)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag fill-opacity="0.5"></tag>
                       """
        )
    }
    
    func testStrokeAttribute() throws {
        
        let view = TestView {
            Tag {}.stroke("black")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag stroke="black"></tag>
                       """
        )
    }
    
    func testStrokeWidthAttribute() throws {
        
        let view = TestView {
            Tag {}.strokeWidth(5)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag stroke-width="5"></tag>
                       """
        )
    }
    
    func testStrokeOpacityAttribute() throws {
        
        let view = TestView {
            Tag {}.strokeOpacity(1.0)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag stroke-opacity="1.0"></tag>
                       """
        )
    }
    
    func testStrokeLineCapAttribute() throws {
        
        let view = TestView {
            Tag {}.strokeLineCap(.round)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag stroke-linecap="round"></tag>
                       """
        )
    }
    
    func testStrokeLineJoinAttribute() throws {
        
        let view = TestView {
            Tag {}.strokeLineJoin(.miter)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag stroke-linejoin="miter"></tag>
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
    
    func testPositionPointAttribute() throws {
        
        let view = TestView {
            Tag {}.positionPoint((10,10))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag x="10" y="10"></tag>
                       """
        )
    }
    
    func testRadiusPointAttribute() throws {
        
        let view = TestView {
            Tag {}.radiusPoint((10,10))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag rx="10" ry="10"></tag>
                       """
        )
    }
    
    func testCenterPointAttribute() throws {
        
        let view = TestView {
            Tag {}.centerPoint((10,10))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag cx="10" cy="10"></tag>
                       """
        )
    }
    
    func testViewBoxAttribute() throws {
        
        let view = TestView {
            Tag {}.viewBox("0 0 100 100")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tag viewbox="0 0 100 100"></tag>
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
}
