@testable import HTMLKit
import OrderedCollections
import XCTest

final class AttributesTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    typealias AllAttributes = AccessKeyAttribute & AcceptAttribute & ActionAttribute & AlternateAttribute & AsynchronouslyAttribute & AutocapitalizeAttribute & AutocompleteAttribute & AutofocusAttribute & AutoplayAttribute & CharsetAttribute & CheckedAttribute & CiteAttribute & ClassAttribute & ColumnsAttribute & ColumnSpanAttribute & ContentAttribute & EditAttribute  & ControlsAttribute & CoordinatesAttribute & DataAttribute & DateTimeAttribute & DefaultAttribute & DeferAttribute & DirectionAttribute & DisabledAttribute & DownloadAttribute & DragAttribute & EncodingAttribute & EnterKeyHintAttribute & ForAttribute & FormAttribute & FormActionAttribute & EquivalentAttribute & HeaderAttribute & HeightAttribute & HiddenAttribute & HighAttribute & ReferenceAttribute & ReferenceLanguageAttribute & IdentifierAttribute & IsMapAttribute & InputModeAttribute & IsAttribute & ItemIdAttribute & ItemPropertyAttribute & ItemReferenceAttribute & ItemScopeAttribute & ItemTypeAttribute & KindAttribute & LabelAttribute & LanguageAttribute & ListAttribute & LoopAttribute & LowAttribute & MaximumValueAttribute & MaximumLengthAttribute & MediaAttribute & MethodAttribute & MinimumValueAttribute & MinimumLengthAttribute & MultipleAttribute & MutedAttribute & NameAttribute & NonceAttribute & NoValidateAttribute & OpenAttribute & OptimumAttribute & PatternAttribute & PartAttribute & PingAttribute & PlaceholderAttribute & PosterAttribute & PreloadAttribute & ReadyOnlyAttribute & ReferrerPolicyAttribute & RelationshipAttribute & RequiredAttribute & ReversedAttribute & RoleAttribute & RowsAttribute & RowSpanAttribute & SandboxAttribute & ScopeAttribute & ShapeAttribute & SizeAttribute & SizesAttribute & SlotAttribute & SpanAttribute & SpellCheckAttribute & SourceAttribute & StartAttribute & StepAttribute & StyleAttribute & TabulatorAttribute & TargetAttribute & TitleAttribute & TranslateAttribute & TypeAttribute & ValueAttribute & WidthAttribute & WrapAttribute & PropertyAttribute & SelectedAttribute & WindowEventAttribute & FocusEventAttribute & PointerEventAttribute & MouseEventAttribute & WheelEventAttribute & InputEventAttribute & KeyboardEventAttribute & DragEventAttribute & ClipboardEventAttribute & SelectionEventAttribute & MediaEventAttribute & FormEventAttribute & DetailEventAttribute & AriaAtomicAttribute & AriaBusyAttribute & AriaControlsAttribute & AriaCurrentAttribute & AriaDescribedAttribute & AriaDetailsAttribute & AriaDisabledAttribute & AriaErrorMessageAttribute & AriaFlowToAttribute & AriaPopupAttribute & AriaHiddenAttribute & AriaInvalidAttribute & AriaShortcutsAttribute & AriaLabelAttribute & AriaLabeledAttribute & AriaLiveAttribute & AriaOwnsAttribute & AriaRelevantAttribute & AriaRoleDescriptionAttribute
    
    struct Tag: ContentNode, GlobalElement, AllAttributes {
        
        internal var name: String { "tag" }

        internal var attributes: OrderedDictionary<String, Any>?

        internal var content: [AnyContent]

        public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
            self.content = content()
        }
        
        internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
            self.attributes = attributes
            self.content = content
        }
        
        func accessKey(_ value: Character) -> Tag {
            return self.mutate(accesskey: value)
        }
        
        func autocapitalize(_ type: Capitalization) -> Tag {
            return self.mutate(autocapitalize: type.rawValue)
        }
        
        func autofocus() -> Tag {
            return self.mutate(autofocus: "autofocus")
        }
        
        func `class`(_ value: String) -> Tag {
            return self.mutate(class: value)
        }
        
        func direction(_ type: Direction) -> Tag {
            return self.mutate(dir: type.rawValue)
        }
        
        func isDraggable(_ condition: Bool) -> Tag {
            return self.mutate(draggable: condition)
        }
        
        func isEditable(_ condition: Bool) -> Tag {
            return self.mutate(contenteditable: condition)
        }
        
        func enterKeyHint(_ type: Hint) -> Tag {
            return self.mutate(enterkeyhint: type.rawValue)
        }
        
        func hidden() -> Tag {
            return self.mutate(hidden: "hidden")
        }
        
        func id(_ value: String) -> Tag {
            return self.mutate(id: value)
        }
        
        func id(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(id: value.rawValue)
        }
        
        func inputMode(_ value: String) -> Tag {
            return self.mutate(inputmode: value)
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
        
        func language(_ type: Language) -> Tag {
            return self.mutate(lang: type.rawValue)
        }
        
        func nonce(_ value: String) -> Tag {
            return self.mutate(nonce: value)
        }
        
        func role(_ value: Roles) -> Tag {
            return self.mutate(role: value.rawValue)
        }
        
        func hasSpellCheck(_ condition: Bool) -> Tag {
            return self.mutate(spellcheck: condition)
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
        
        func translate(_ type: Decision) -> Tag {
            return self.mutate(translate: type.rawValue)
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
        
        func hasCompletion(_ condition: Bool) -> Tag {
            return self.mutate(autocomplete: condition)
        }
        
        func autoplay() -> Tag {
            return self.mutate(autoplay: "autoplay")
        }
        
        func charset(_ value: Charset) -> Tag {
            return self.mutate(charset: value.rawValue)
        }
        
        func checked() -> Tag {
            return self.mutate(checked: "checked")
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
        
        func content(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(content: value.rawValue)
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
        
        func download() -> Tag {
            return self.mutate(download: "download")
        }
        
        func encoding(_ type: Encoding) -> Tag {
            return self.mutate(enctype: type.rawValue)
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
        
        func equivalent(_ value: Equivalent) -> Tag {
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
        
        func reference(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(href: value.rawValue)
        }
        
        func referenceLanguage(_ type: Language) -> Tag {
            return self.mutate(hreflang: type.rawValue)
        }
        
        func isMap() -> Tag {
            return self.mutate(ismap: "ismap")
        }
        
        func kind(_ type: Kinds) -> Tag {
            return self.mutate(kind: type.rawValue)
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
        
        func method(_ type: HTMLKit.Method) -> Tag {
            return self.mutate(method: type.rawValue)
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
        
        func name(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(name: value.rawValue)
        }
        
        func novalidate() -> Tag {
            return self.mutate(novalidate: "novalidate")
        }
        
        func isOpen(_ condition: Bool) -> Tag {
            return self.mutate(open: condition)
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
        
        func placeholder(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(placeholder: value.rawValue)
        }
        
        func poster(_ value: String) -> Tag {
            return self.mutate(poster: value)
        }
        
        func preload(_ type: Preload) -> Tag {
            return self.mutate(preload: type.rawValue)
        }
        
        func readonly() -> Tag {
            return self.mutate(readonly: "readonly")
        }
        
        func referrerPolicy(_ type: Policy) -> Tag {
            return self.mutate(referrerpolicy: type.rawValue)
        }
        
        func relationship(_ type: Relation) -> Tag {
            return self.mutate(rel: type.rawValue)
        }
        
        func required() -> Tag {
            return self.mutate(required: "required")
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
        
        func shape(_ type: Shape) -> Tag {
            return self.mutate(shape: type.rawValue)
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
        
        func start(_ size: Int) -> Tag {
            return self.mutate(start: size)
        }
        
        func step(_ size: Int) -> Tag {
            return self.mutate(step: size)
        }
        
        func target(_ type: Target) -> Tag {
            return self.mutate(target: type.rawValue)
        }
        
        func type(_ value: String) -> Tag {
            return self.mutate(type: value)
        }
        
        func value(_ value: String) -> Tag {
            return self.mutate(value: value)
        }
        
        func value(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(value: value.rawValue)
        }
        
        func width(_ size: Int) -> Tag {
            return self.mutate(width: size)
        }
        
        func wrap(_ type: Wrapping) -> Tag {
            return self.mutate(wrap: type.rawValue)
        }
        
        func property(_ type: Graphs) -> Tag {
            return self.mutate(property: type.rawValue)
        }
        
        func selected() -> Tag {
            return self.mutate(selected: "selected")
        }
        
        func custom(key: String, value: Any) -> Tag {
            return self.mutate(key: key, value: value)
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
        
        public func aria(current value: Accessibility.Current) -> Tag {
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
        
        public func aria(hasPopup value: Accessibility.Popup) -> Tag {
            return mutate(ariahaspopup: value.rawValue)
        }
        
        public func aria(hidden value: Bool) -> Tag {
            return mutate(ariahidden: value)
        }
        
        public func aria(invalid value: Accessibility.Invalid) -> Tag {
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
        
        public func aria(live value: Accessibility.Live) -> Tag {
            return mutate(arialive: value.rawValue)
        }
        
        public func aria(owns value: String) -> Tag {
            return mutate(ariaowns: value)
        }
        
        public func aria(relevant value: Accessibility.Relevant) -> Tag {
            return mutate(ariarelevant: value.rawValue)
        }
        
        public func aria(roleDescription value: String) -> Tag {
            return mutate(ariaroledescription: value)
        }
        
        func prerender(_ formula: Renderer.Formula) throws {
            try self.build(formula)
        }
        
        func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
            try self.build(with: manager)
        }
    }
    
    var renderer = Renderer()
    
    func testAccesskeyAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .accessKey("s")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag accesskey="s"></tag>
                       """
        )
    }
    
    func testAutocapitalizeAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .autocapitalize(.words)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag autocapitalize="words"></tag>
                       """
        )
    }
    
    func testAutofocusAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .autofocus()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag autofocus="autofocus"></tag>
                       """
        )
    }
    
    func testClassAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .class("container")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag class="container"></tag>
                       """
        )
    }
    
    func testDirectionAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .direction(.leftToRight)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag dir="ltr"></tag>
                       """
        )
    }
    
    func testDraggableAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .isDraggable(true)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag draggable="true"></tag>
                       """
        )
    }
    
    func testEditableAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .isEditable(true)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag contenteditable="true"></tag>
                       """
        )
    }
    
    func testEnterkeyhintAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .enterKeyHint(.enter)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag enterkeyhint="enter"></tag>
                       """
        )
    }
    
    func testHiddenAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .hidden()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag hidden="hidden"></tag>
                       """
        )
    }
    
    func testIdentifierAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .id("navigation")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag id="navigation"></tag>
                       """
        )
    }
    
    func testLanguageAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .language(.german)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag lang="de"></tag>
                       """
        )
    }
    
    func testNonceAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .nonce("84a97f593e589c45")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag nonce="84a97f593e589c45"></tag>
                       """
        )
    }
    
    func testRoleAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .role(.range)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag role="range"></tag>
                       """
        )
    }
    
    func testHasSpellCheckAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .hasSpellCheck(true)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag spellcheck="true"></tag>
                       """
        )
    }
    
    func testStyleAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .style("background-color:powderblue;")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag style="background-color:powderblue;"></tag>
                       """
        )
    }
    
    func testTabIndexAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .tabIndex(3)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag tabindex="3"></tag>
                       """
        )
    }
    
    func testTitleAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .title("homepage")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag title="homepage"></tag>
                       """
        )
    }
    
    func testTranslateAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .translate(.yes)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag translate="yes"></tag>
                       """
        )
    }
    
    func testAcceptAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .accept("accept")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag accept="accept"></tag>
                       """
        )
    }
    
    func testActionAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .action("action")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag action="action"></tag>
                       """
        )
    }
    
    func testAlternateAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .alternate("a tag and a attribute")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag alt="a tag and a attribute"></tag>
                       """
        )
    }
    
    func testAsynchronouslyAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .asynchronously()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag async="async"></tag>
                       """
        )
    }
    
    func testCompleteAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .hasCompletion(true)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag autocomplete="true"></tag>
                       """
        )
    }
    
    func testAutoplayAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .autoplay()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag autoplay="autoplay"></tag>
                       """
        )
    }
    
    func testCharsetAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .charset(.utf8)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag charset="utf-8"></tag>
                       """
        )
    }
    
    func testCheckedAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .checked()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag checked="checked"></tag>
                       """
        )
    }
    
    func testCiteAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .cite("cite")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag cite="cite"></tag>
                       """
        )
    }
    
    func testColumnsAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .columns(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag cols="2"></tag>
                       """
        )
    }
    
    func testColumnSpanAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .columnSpan(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag colspan="2"></tag>
                       """
        )
    }
    
    func testContentAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .content("content")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag content="content"></tag>
                       """
        )
    }
    
    func testControlsAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .controls()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag controls="controls"></tag>
                       """
        )
    }
    
    func testCoordinatesAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .coordinates("255,132,316,150")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag coords="255,132,316,150"></tag>
                       """
        )
    }
    
    func testDataAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .data("https://www.github.com")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag data="https://www.github.com"></tag>
                       """
        )
    }
    
    func testDateTimeAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .dateTime("YYYY-MM-DDThh:mm:ssTZD")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag datetime="YYYY-MM-DDThh:mm:ssTZD"></tag>
                       """
        )
    }
    
    func testDefaultAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .default()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag default="default"></tag>
                       """
        )
    }
    
    func testDeferAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .defer()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag defer="defer"></tag>
                       """
        )
    }
    
    func testDisabledAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .disabled()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag disabled="disabled"></tag>
                       """
        )
    }
    
    func testDownloadAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .download()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag download="download"></tag>
                       """
        )
    }
    
    func testEncodingAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .encoding(.plainText)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag enctype="text/plain"></tag>
                       """
        )
    }
    
    func testForAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .for("for")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag for="for"></tag>
                       """
        )
    }
    
    func testFormAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .form("/action.php")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag form="/action.php"></tag>
                       """
        )
    }
    
    func testFormActionAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .formAction("/action.php")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag formaction="/action.php"></tag>
                       """
        )
    }
    
    func testEquivalentAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .equivalent(.refresh)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag headers="refresh"></tag>
                       """
        )
    }
    
    func testHeadersAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .headers("name")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag headers="name"></tag>
                       """
        )
    }
    
    func testHeightAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .height(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag height="2"></tag>
                       """
        )
    }
    
    func testHighAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .high(2.0)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag high="2.0"></tag>
                       """
        )
    }
    
    func testReferenceAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .reference("/index.html")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag href="/index.html"></tag>
                       """
        )
    }
    
    func testReferenceLanguageAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .referenceLanguage(.german)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag hreflang="de"></tag>
                       """
        )
    }
    
    func testIsMapAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .isMap()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag ismap="ismap"></tag>
                       """
        )
    }
    
    func testKindAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .kind(.subtitles)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag kind="subtitles"></tag>
                       """
        )
    }
    
    func testLabelAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .label("Soccer")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag label="Soccer"></tag>
                       """
        )
    }
    
    func testListAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .list("browsers")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag list="browsers"></tag>
                       """
        )
    }
    
    func testLoopAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .loop()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag loop="loop"></tag>
                       """
        )
    }
    
    func testLowAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .low(2.0)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag low="2.0"></tag>
                       """
        )
    }
    
    func testMaximumAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .maximum("1948-01-01")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag max="1948-01-01"></tag>
                       """
        )
    }
    
    func testMaximumLengthAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .maximum(length: 2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag maxlength="2"></tag>
                       """
        )
    }

    func testMediaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .media("print and (resolution:300dpi)")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag media="print and (resolution:300dpi)"></tag>
                       """
        )
    }
    
    func testMethodAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .method(.get)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag method="get"></tag>
                       """
        )
    }
    
    func testMinimumAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .minimum(2.0)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag min="2.0"></tag>
                       """
        )
    }
    
    func testMinimumLengthAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .minimum(length: 2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag minlength="2"></tag>
                       """
        )
    }
    
    func testMultipleAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .multiple()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag multiple="multiple"></tag>
                       """
        )
    }
    
    func testMutedAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .muted()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag muted="muted"></tag>
                       """
        )
    }
    
    func testNameAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .name("name")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag name="name"></tag>
                       """
        )
    }
    
    func testNoValidateAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .novalidate()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag novalidate="novalidate"></tag>
                       """
        )
    }
    
    func testIsOpenAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .isOpen(true)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag open="true"></tag>
                       """
        )
    }
    
    func testOptimumAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .optimum(2.0)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag optimum="2.0"></tag>
                       """
        )
    }
    
    func testPatternAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .pattern("[A-Za-z]{3}")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag pattern="[A-Za-z]{3}"></tag>
                       """
        )
    }
    
    func testPartAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .part("part")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag part="part"></tag>
                       """
        )
    }
    
    func testPingAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .ping("https://www.github.com")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag ping="https://www.github.com"></tag>
                       """
        )
    }
    
    func testPlaceholderAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .placeholder("123-45-678")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag placeholder="123-45-678"></tag>
                       """
        )
    }
    
    func testPosterAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .poster("https://www.github.com")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag poster="https://www.github.com"></tag>
                       """
        )
    }
    
    func testPreloadAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .preload(.metadata)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag preload="metadata"></tag>
                       """
        )
    }
    
    func testReadonlyAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .readonly()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag readonly="readonly"></tag>
                       """
        )
    }
    
    func testReferrerPolicyAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .referrerPolicy(.origin)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag referrerpolicy="origin"></tag>
                       """
        )
    }
    
    func testRelationshipAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .relationship(.author)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag rel="author"></tag>
                       """
        )
    }
    
    func testRequiredAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .required()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag required="required"></tag>
                       """
        )
    }
    
    func testReversedAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .reversed()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag reversed="reversed"></tag>
                       """
        )
    }
    
    func testRowsAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .rows(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag rows="2"></tag>
                       """
        )
    }
    
    func testRowSpanAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .rowSpan(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag rowspan="2"></tag>
                       """
        )
    }
    
    func testSandboxAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .sandbox()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag sandbox="sandbox"></tag>
                       """
        )
    }
    
    func testScopeAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .scope("scope")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag scope="scope"></tag>
                       """
        )
    }
    
    func testShapeAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .shape(.circle)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag shape="circle"></tag>
                       """
        )
    }
    
    func testSizeAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .size(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag size="2"></tag>
                       """
        )
    }
    
    func testSizesAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .sizes(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag sizes="2"></tag>
                       """
        )
    }
    
    func testSlotAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .slot("slot")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag slot="slot"></tag>
                       """
        )
    }
    
    func testSpanAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .span(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag span="2"></tag>
                       """
        )
    }
    
    func testSourceAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .source("source")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag src="source"></tag>
                       """
        )
    }
    
    func testStartAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .start(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag start="2"></tag>
                       """
        )
    }
    
    func testStepAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .step(2)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag step="2"></tag>
                       """
        )
    }
    
    func testTargetAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .target(.blank)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag target="_blank"></tag>
                       """
        )
    }
    
    func testTypeAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .type("type")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag type="type"></tag>
                       """
        )
    }
    
    func testSelectedAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .selected()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag selected="selected"></tag>
                       """
        )
    }
    
    func testCustomAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .custom(key: "data-animal-type", value: "bird")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag data-animal-type="bird"></tag>
                       """
        )
    }
    
    func testWindowEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .afterprint, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onafterprint="script"></tag>
                       """
        )
    }
    
    func testFocusEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .focus, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onfocus="script"></tag>
                       """
        )
    }
    
    func testPointerEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .pointerup, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onpointerup="script"></tag>
                       """
        )
    }
    
    func testMouseEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .mouseup, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onmouseup="script"></tag>
                       """
        )
    }
    
    func testWheelEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .wheel, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onwheel="script"></tag>
                       """
        )
    }
    
    func testInputEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .input, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag oninput="script"></tag>
                       """
        )
    }
    
    func testKeyboardEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .keyup, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onkeyup="script"></tag>
                       """
        )
    }
    
    func testDragEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .drag, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag ondrag="script"></tag>
                       """
        )
    }
    
    func testClipboardEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .paste, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onpaste="script"></tag>
                       """
        )
    }
    
    func testSelectionEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .selectstart, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onselectstart="script"></tag>
                       """
        )
    }
    
    func testMediaEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .play, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onplay="script"></tag>
                       """
        )
    }
    
    func testFormEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .submit, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag onsubmit="script"></tag>
                       """
        )
    }
    
    func testDetailEventAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .on(event: .toggle, "script")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag ontoggle="script"></tag>
                       """
        )
    }
    
    func testAtomicAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(atomic: true)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-atomic="true"></tag>
                       """
        )
    }
    
    func testBusyAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(busy: true)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-busy="true"></tag>
                       """
        )
    }
    
    func testControlsAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(controls: "name")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-controls="name"></tag>
                       """
        )
    }
    
    func testCurrentAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(current: .page)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-current="page"></tag>
                       """
        )
    }
    
    func testDescribedByAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(describedBy: "description")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-describedby="description"></tag>
                       """
        )
    }
    
    func testDetailsAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(details: "details")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-details="details"></tag>
                       """
        )
    }
    
    func testDisabledAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(disabled: true)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-disabled="true"></tag>
                       """
        )
    }
    
    func testErrorMessageAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(errorMessage: "error")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-errormessage="error"></tag>
                       """
        )
    }
    
    func testFlowToAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(flowTo: "flow")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-flowto="flow"></tag>
                       """
        )
    }
    
    func testHasPopupAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(hasPopup: .grid)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-haspopup="grid"></tag>
                       """
        )
    }
    
    func testHiddenAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(hidden: true)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-hidden="true"></tag>
                       """
        )
    }
    
    func testInvalidAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(invalid: .grammar)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-invalid="grammar"></tag>
                       """
        )
    }
    
    func testKeyShortcutsAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(keyShortcuts: "shortcut")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-keyshortcuts="shortcut"></tag>
                       """
        )
    }
    
    func testLabelAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(label: "label")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-label="label"></tag>
                       """
        )
    }
    
    func testLabeledByAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(labeledBy: "label")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-labeledby="label"></tag>
                       """
        )
    }
    
    func testLiveAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(live: .polite)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-live="polite"></tag>
                       """
        )
    }
    
    func testOwnsAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(owns: "live")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-owns="live"></tag>
                       """
        )
    }
    
    func testRelevantAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(relevant: .additions)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-relevant="additions"></tag>
                       """
        )
    }
    
    func testRoleDescriptionAriaAttribute() throws {
        
        let view = TestPage {
            Tag {
            }
            .aria(roleDescription: "description")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tag aria-roledescription="description"></tag>
                       """
        )
    }
}

extension AttributesTests {
    
    static var allTests = [
        ("testAccesskeyAttribute", testAccesskeyAttribute),
        ("testAutocapitalizeAttribute", testAutocapitalizeAttribute),
        ("testAutofocusAttribute", testAutofocusAttribute),
        ("testClassAttribute", testClassAttribute),
        ("testDirectionAttribute", testDirectionAttribute),
        ("testDraggableAttribute", testDraggableAttribute),
        ("testEditableAttribute", testEditableAttribute),
        ("testEnterkeyhintAttribute", testEnterkeyhintAttribute),
        ("testHiddenAttribute", testHiddenAttribute),
        ("testIdentifierAttribute", testIdentifierAttribute),
        ("testLanguageAttribute", testLanguageAttribute),
        ("testNonceAttribute", testNonceAttribute),
        ("testRoleAttribute", testRoleAttribute),
        ("testHasSpellCheckAttribute", testHasSpellCheckAttribute),
        ("testStyleAttribute", testStyleAttribute),
        ("testTabIndexAttribute", testTabIndexAttribute),
        ("testTitleAttribute", testTitleAttribute),
        ("testTranslateAttribute", testTranslateAttribute),
        ("testAcceptAttribute", testAcceptAttribute),
        ("testActionAttribute", testActionAttribute),
        ("testAlternateAttribute", testAlternateAttribute),
        ("testAsynchronouslyAttribute", testAsynchronouslyAttribute),
        ("testCompleteAttribute", testCompleteAttribute),
        ("testAutoplayAttribute", testAutoplayAttribute),
        ("testCharsetAttribute", testCharsetAttribute),
        ("testCheckedAttribute", testCheckedAttribute),
        ("testCiteAttribute", testCiteAttribute),
        ("testColumnsAttribute", testColumnsAttribute),
        ("testColumnSpanAttribute", testColumnSpanAttribute),
        ("testContentAttribute", testContentAttribute),
        ("testControlsAttribute", testControlsAttribute),
        ("testCoordinatesAttribute", testCoordinatesAttribute),
        ("testDataAttribute", testDataAttribute),
        ("testDateTimeAttribute", testDateTimeAttribute),
        ("testDefaultAttribute", testDefaultAttribute),
        ("testDeferAttribute", testDeferAttribute),
        ("testDisabledAttribute", testDisabledAttribute),
        ("testDownloadAttribute", testDownloadAttribute),
        ("testEncodingAttribute", testEncodingAttribute),
        ("testForAttribute", testForAttribute),
        ("testFormAttribute", testFormAttribute),
        ("testFormActionAttribute", testFormActionAttribute),
        ("testEquivalentAttribute", testEquivalentAttribute),
        ("testHeadersAttribute", testHeadersAttribute),
        ("testHeightAttribute", testHeightAttribute),
        ("testHighAttribute", testHighAttribute),
        ("testReferenceAttribute", testReferenceAttribute),
        ("testReferenceLanguageAttribute", testReferenceLanguageAttribute),
        ("testIsMapAttribute", testIsMapAttribute),
        ("testKindAttribute", testKindAttribute),
        ("testLabelAttribute", testLabelAttribute),
        ("testListAttribute", testListAttribute),
        ("testLoopAttribute", testLoopAttribute),
        ("testLowAttribute", testLowAttribute),
        ("testMaximumAttribute", testMaximumAttribute),
        ("testMaximumLengthAttribute", testMaximumLengthAttribute),
        ("testMediaAttribute", testMediaAttribute),
        ("testMethodAttribute", testMethodAttribute),
        ("testMinimumAttribute", testMinimumAttribute),
        ("testMinimumLengthAttribute", testMinimumLengthAttribute),
        ("testMultipleAttribute", testMultipleAttribute),
        ("testMutedAttribute", testMutedAttribute),
        ("testNameAttribute", testNameAttribute),
        ("testNoValidateAttribute", testNoValidateAttribute),
        ("testIsOpenAttribute", testIsOpenAttribute),
        ("testOptimumAttribute", testOptimumAttribute),
        ("testPatternAttribute", testPatternAttribute),
        ("testPartAttribute", testPartAttribute),
        ("testPingAttribute", testPingAttribute),
        ("testPlaceholderAttribute", testPlaceholderAttribute),
        ("testPosterAttribute", testPosterAttribute),
        ("testPreloadAttribute", testPreloadAttribute),
        ("testReadonlyAttribute", testReadonlyAttribute),
        ("testReferrerPolicyAttribute", testReferrerPolicyAttribute),
        ("testRelationshipAttribute", testRelationshipAttribute),
        ("testRequiredAttribute", testRequiredAttribute),
        ("testReversedAttribute", testReversedAttribute),
        ("testRowsAttribute", testRowsAttribute),
        ("testRowSpanAttribute", testRowSpanAttribute),
        ("testSandboxAttribute", testSandboxAttribute),
        ("testScopeAttribute", testScopeAttribute),
        ("testShapeAttribute", testShapeAttribute),
        ("testSizeAttribute", testSizeAttribute),
        ("testSizesAttribute", testSizesAttribute),
        ("testSlotAttribute", testSlotAttribute),
        ("testSpanAttribute", testSpanAttribute),
        ("testSourceAttribute", testSourceAttribute),
        ("testStartAttribute", testStartAttribute),
        ("testStepAttribute", testStepAttribute),
        ("testTargetAttribute", testTargetAttribute),
        ("testTypeAttribute", testTypeAttribute),
        ("testSelectedAttribute", testSelectedAttribute),
        ("testCustomAttribute", testCustomAttribute),
        ("testWindowEventAttribute", testWindowEventAttribute),
        ("testFocusEventAttribute", testFocusEventAttribute),
        ("testPointerEventAttribute", testPointerEventAttribute),
        ("testMouseEventAttribute", testMouseEventAttribute),
        ("testWheelEventAttribute", testWheelEventAttribute),
        ("testInputEventAttribute", testInputEventAttribute),
        ("testKeyboardEventAttribute", testKeyboardEventAttribute),
        ("testDragEventAttribute", testDragEventAttribute),
        ("testClipboardEventAttribute", testClipboardEventAttribute),
        ("testSelectionEventAttribute", testSelectionEventAttribute),
        ("testMediaEventAttribute", testMediaEventAttribute),
        ("testFormEventAttribute", testFormEventAttribute),
        ("testDetailEventAttribute", testDetailEventAttribute),
        ("testRoleDescriptionAriaAttribute", testRoleDescriptionAriaAttribute),
        ("testRelevantAriaAttribute", testRelevantAriaAttribute),
        ("testOwnsAriaAttribute", testOwnsAriaAttribute),
        ("testLiveAriaAttribute", testLiveAriaAttribute),
        ("testLabeledByAriaAttribute", testLabeledByAriaAttribute),
        ("testLabelAriaAttribute", testLabelAriaAttribute),
        ("testKeyShortcutsAriaAttribute", testKeyShortcutsAriaAttribute),
        ("testInvalidAriaAttribute", testInvalidAriaAttribute),
        ("testHiddenAriaAttribute", testHiddenAriaAttribute),
        ("testHasPopupAriaAttribute", testHasPopupAriaAttribute),
        ("testFlowToAriaAttribute", testFlowToAriaAttribute),
        ("testErrorMessageAriaAttribute", testErrorMessageAriaAttribute),
        ("testDisabledAriaAttribute", testDetailsAriaAttribute),
        ("testDescribedByAriaAttribute", testDescribedByAriaAttribute),
        ("testCurrentAriaAttribute", testCurrentAriaAttribute),
        ("testControlsAriaAttribute", testControlsAriaAttribute),
        ("testBusyAriaAttribute", testBusyAriaAttribute),
        ("testAtomicAriaAttribute", testAtomicAriaAttribute)
    ]
}
