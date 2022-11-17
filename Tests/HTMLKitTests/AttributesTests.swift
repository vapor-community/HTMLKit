/*
 Abstract:
 The file tests the rendering of the attributes.
 */

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
        
        func charset(_ value: Values.Charset) -> Tag {
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
        
        func reference(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(href: value.rawValue)
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
        
        func name(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(name: value.rawValue)
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
        
        func placeholder(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(placeholder: value.rawValue)
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
        
        func referrerPolicy(_ value: Values.Policy) -> Tag {
            return self.mutate(referrerpolicy: value.rawValue)
        }
        
        func relationship(_ value: Values.Relation) -> Tag {
            return self.mutate(rel: value.rawValue)
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
        
        func value(_ value: TemplateValue<String>) -> Tag {
            return self.mutate(value: value.rawValue)
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
    }
    
    var renderer = Renderer()
    
    func testAccesskeyAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .accessKey("s")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag accesskey="s"></tag>
                       """
        )
    }
    
    func testAutocapitalizeAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .autocapitalize(.words)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag autocapitalize="words"></tag>
                       """
        )
    }
    
    func testAutofocusAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .autofocus()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag autofocus="autofocus"></tag>
                       """
        )
    }
    
    func testClassAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .class("container")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag class="container"></tag>
                       """
        )
    }
    
    func testDirectionAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .direction(.leftToRight)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag dir="ltr"></tag>
                       """
        )
    }
    
    func testDraggableAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .isDraggable(true)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag draggable="true"></tag>
                       """
        )
    }
    
    func testEditableAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .isEditable(true)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag contenteditable="true"></tag>
                       """
        )
    }
    
    func testEnterkeyhintAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .enterKeyHint(.enter)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag enterkeyhint="enter"></tag>
                       """
        )
    }
    
    func testHiddenAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .hidden()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag hidden="hidden"></tag>
                       """
        )
    }
    
    func testIdentifierAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .id("navigation")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag id="navigation"></tag>
                       """
        )
    }
    
    func testLanguageAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .language(.german)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag lang="de"></tag>
                       """
        )
    }
    
    func testNonceAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .nonce("84a97f593e589c45")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag nonce="84a97f593e589c45"></tag>
                       """
        )
    }
    
    func testRoleAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .role(.range)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag role="range"></tag>
                       """
        )
    }
    
    func testHasSpellCheckAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .hasSpellCheck(true)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag spellcheck="true"></tag>
                       """
        )
    }
    
    func testStyleAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .style("background-color:powderblue;")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag style="background-color:powderblue;"></tag>
                       """
        )
    }
    
    func testTabIndexAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .tabIndex(3)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag tabindex="3"></tag>
                       """
        )
    }
    
    func testTitleAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .title("homepage")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag title="homepage"></tag>
                       """
        )
    }
    
    func testTranslateAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .translate(.yes)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag translate="yes"></tag>
                       """
        )
    }
    
    func testAcceptAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .accept("accept")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag accept="accept"></tag>
                       """
        )
    }
    
    func testActionAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .action("action")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag action="action"></tag>
                       """
        )
    }
    
    func testAlternateAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .alternate("a tag and a attribute")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag alt="a tag and a attribute"></tag>
                       """
        )
    }
    
    func testAsynchronouslyAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .asynchronously()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag async="async"></tag>
                       """
        )
    }
    
    func testCompleteAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .hasCompletion(true)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag autocomplete="true"></tag>
                       """
        )
    }
    
    func testAutoplayAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .autoplay()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag autoplay="autoplay"></tag>
                       """
        )
    }
    
    func testCharsetAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .charset(.utf8)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag charset="utf-8"></tag>
                       """
        )
    }
    
    func testCheckedAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .checked()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag checked="checked"></tag>
                       """
        )
    }
    
    func testCiteAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .cite("cite")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag cite="cite"></tag>
                       """
        )
    }
    
    func testColumnsAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .columns(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag cols="2"></tag>
                       """
        )
    }
    
    func testColumnSpanAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .columnSpan(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag colspan="2"></tag>
                       """
        )
    }
    
    func testContentAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .content("content")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag content="content"></tag>
                       """
        )
    }
    
    func testControlsAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .controls()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag controls="controls"></tag>
                       """
        )
    }
    
    func testCoordinatesAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .coordinates("255,132,316,150")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag coords="255,132,316,150"></tag>
                       """
        )
    }
    
    func testDataAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .data("https://www.github.com")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag data="https://www.github.com"></tag>
                       """
        )
    }
    
    func testDateTimeAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .dateTime("YYYY-MM-DDThh:mm:ssTZD")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag datetime="YYYY-MM-DDThh:mm:ssTZD"></tag>
                       """
        )
    }
    
    func testDefaultAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .default()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag default="default"></tag>
                       """
        )
    }
    
    func testDeferAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .defer()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag defer="defer"></tag>
                       """
        )
    }
    
    func testDisabledAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .disabled()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag disabled="disabled"></tag>
                       """
        )
    }
    
    func testDownloadAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .download()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag download="download"></tag>
                       """
        )
    }
    
    func testEncodingAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .encoding(.plainText)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag enctype="text/plain"></tag>
                       """
        )
    }
    
    func testForAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .for("for")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag for="for"></tag>
                       """
        )
    }
    
    func testFormAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .form("/action.php")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag form="/action.php"></tag>
                       """
        )
    }
    
    func testFormActionAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .formAction("/action.php")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag formaction="/action.php"></tag>
                       """
        )
    }
    
    func testEquivalentAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .equivalent(.refresh)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag headers="refresh"></tag>
                       """
        )
    }
    
    func testHeadersAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .headers("name")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag headers="name"></tag>
                       """
        )
    }
    
    func testHeightAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .height(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag height="2"></tag>
                       """
        )
    }
    
    func testHighAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .high(2.0)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag high="2.0"></tag>
                       """
        )
    }
    
    func testReferenceAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .reference("/index.html")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag href="/index.html"></tag>
                       """
        )
    }
    
    func testReferenceLanguageAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .referenceLanguage(.german)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag hreflang="de"></tag>
                       """
        )
    }
    
    func testIsMapAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .isMap()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag ismap="ismap"></tag>
                       """
        )
    }
    
    func testKindAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .kind(.subtitles)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag kind="subtitles"></tag>
                       """
        )
    }
    
    func testLabelAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .label("Soccer")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag label="Soccer"></tag>
                       """
        )
    }
    
    func testListAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .list("browsers")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag list="browsers"></tag>
                       """
        )
    }
    
    func testLoopAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .loop()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag loop="loop"></tag>
                       """
        )
    }
    
    func testLowAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .low(2.0)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag low="2.0"></tag>
                       """
        )
    }
    
    func testMaximumAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .maximum("1948-01-01")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag max="1948-01-01"></tag>
                       """
        )
    }
    
    func testMaximumLengthAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .maximum(length: 2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag maxlength="2"></tag>
                       """
        )
    }

    func testMediaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .media("print and (resolution:300dpi)")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag media="print and (resolution:300dpi)"></tag>
                       """
        )
    }
    
    func testMethodAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .method(.get)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag method="get"></tag>
                       """
        )
    }
    
    func testMinimumAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .minimum(2.0)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag min="2.0"></tag>
                       """
        )
    }
    
    func testMinimumLengthAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .minimum(length: 2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag minlength="2"></tag>
                       """
        )
    }
    
    func testMultipleAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .multiple()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag multiple="multiple"></tag>
                       """
        )
    }
    
    func testMutedAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .muted()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag muted="muted"></tag>
                       """
        )
    }
    
    func testNameAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .name("name")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag name="name"></tag>
                       """
        )
    }
    
    func testNoValidateAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .novalidate()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag novalidate="novalidate"></tag>
                       """
        )
    }
    
    func testIsOpenAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .isOpen(true)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag open="true"></tag>
                       """
        )
    }
    
    func testOptimumAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .optimum(2.0)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag optimum="2.0"></tag>
                       """
        )
    }
    
    func testPatternAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .pattern("[A-Za-z]{3}")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag pattern="[A-Za-z]{3}"></tag>
                       """
        )
    }
    
    func testPartAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .part("part")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag part="part"></tag>
                       """
        )
    }
    
    func testPingAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .ping("https://www.github.com")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag ping="https://www.github.com"></tag>
                       """
        )
    }
    
    func testPlaceholderAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .placeholder("123-45-678")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag placeholder="123-45-678"></tag>
                       """
        )
    }
    
    func testPosterAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .poster("https://www.github.com")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag poster="https://www.github.com"></tag>
                       """
        )
    }
    
    func testPreloadAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .preload(.metadata)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag preload="metadata"></tag>
                       """
        )
    }
    
    func testReadonlyAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .readonly()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag readonly="readonly"></tag>
                       """
        )
    }
    
    func testReferrerPolicyAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .referrerPolicy(.origin)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag referrerpolicy="origin"></tag>
                       """
        )
    }
    
    func testRelationshipAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .relationship(.author)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag rel="author"></tag>
                       """
        )
    }
    
    func testRequiredAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .required()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag required="required"></tag>
                       """
        )
    }
    
    func testReversedAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .reversed()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag reversed="reversed"></tag>
                       """
        )
    }
    
    func testRowsAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .rows(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag rows="2"></tag>
                       """
        )
    }
    
    func testRowSpanAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .rowSpan(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag rowspan="2"></tag>
                       """
        )
    }
    
    func testSandboxAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .sandbox()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag sandbox="sandbox"></tag>
                       """
        )
    }
    
    func testScopeAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .scope("scope")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag scope="scope"></tag>
                       """
        )
    }
    
    func testShapeAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .shape(.circle)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag shape="circle"></tag>
                       """
        )
    }
    
    func testSizeAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .size(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag size="2"></tag>
                       """
        )
    }
    
    func testSizesAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .sizes(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag sizes="2"></tag>
                       """
        )
    }
    
    func testSlotAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .slot("slot")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag slot="slot"></tag>
                       """
        )
    }
    
    func testSpanAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .span(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag span="2"></tag>
                       """
        )
    }
    
    func testSourceAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .source("source")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag src="source"></tag>
                       """
        )
    }
    
    func testStartAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .start(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag start="2"></tag>
                       """
        )
    }
    
    func testStepAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .step(2)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag step="2"></tag>
                       """
        )
    }
    
    func testTargetAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .target(.blank)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag target="_blank"></tag>
                       """
        )
    }
    
    func testTypeAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .type("type")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag type="type"></tag>
                       """
        )
    }
    
    func testSelectedAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .selected()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag selected="selected"></tag>
                       """
        )
    }
    
    func testCustomAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .custom(key: "data-animal-type", value: "bird")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag data-animal-type="bird"></tag>
                       """
        )
    }
    
    func testWindowEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .afterprint, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onafterprint="script"></tag>
                       """
        )
    }
    
    func testFocusEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .focus, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onfocus="script"></tag>
                       """
        )
    }
    
    func testPointerEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .pointerup, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onpointerup="script"></tag>
                       """
        )
    }
    
    func testMouseEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .mouseup, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onmouseup="script"></tag>
                       """
        )
    }
    
    func testWheelEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .wheel, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onwheel="script"></tag>
                       """
        )
    }
    
    func testInputEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .input, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag oninput="script"></tag>
                       """
        )
    }
    
    func testKeyboardEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .keyup, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onkeyup="script"></tag>
                       """
        )
    }
    
    func testDragEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .drag, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag ondrag="script"></tag>
                       """
        )
    }
    
    func testClipboardEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .paste, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onpaste="script"></tag>
                       """
        )
    }
    
    func testSelectionEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .selectstart, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onselectstart="script"></tag>
                       """
        )
    }
    
    func testMediaEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .play, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onplay="script"></tag>
                       """
        )
    }
    
    func testFormEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .submit, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag onsubmit="script"></tag>
                       """
        )
    }
    
    func testDetailEventAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .on(event: .toggle, "script")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag ontoggle="script"></tag>
                       """
        )
    }
    
    func testAtomicAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(atomic: true)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-atomic="true"></tag>
                       """
        )
    }
    
    func testBusyAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(busy: true)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-busy="true"></tag>
                       """
        )
    }
    
    func testControlsAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(controls: "name")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-controls="name"></tag>
                       """
        )
    }
    
    func testCurrentAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(current: .page)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-current="page"></tag>
                       """
        )
    }
    
    func testDescribedByAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(describedBy: "description")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-describedby="description"></tag>
                       """
        )
    }
    
    func testDetailsAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(details: "details")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-details="details"></tag>
                       """
        )
    }
    
    func testDisabledAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(disabled: true)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-disabled="true"></tag>
                       """
        )
    }
    
    func testErrorMessageAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(errorMessage: "error")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-errormessage="error"></tag>
                       """
        )
    }
    
    func testFlowToAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(flowTo: "flow")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-flowto="flow"></tag>
                       """
        )
    }
    
    func testHasPopupAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(hasPopup: .grid)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-haspopup="grid"></tag>
                       """
        )
    }
    
    func testHiddenAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(hidden: true)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-hidden="true"></tag>
                       """
        )
    }
    
    func testInvalidAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(invalid: .grammar)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-invalid="grammar"></tag>
                       """
        )
    }
    
    func testKeyShortcutsAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(keyShortcuts: "shortcut")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-keyshortcuts="shortcut"></tag>
                       """
        )
    }
    
    func testLabelAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(label: "label")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-label="label"></tag>
                       """
        )
    }
    
    func testLabeledByAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(labeledBy: "label")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-labeledby="label"></tag>
                       """
        )
    }
    
    func testLiveAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(live: .polite)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-live="polite"></tag>
                       """
        )
    }
    
    func testOwnsAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(owns: "live")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-owns="live"></tag>
                       """
        )
    }
    
    func testRelevantAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(relevant: .additions)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-relevant="additions"></tag>
                       """
        )
    }
    
    func testRoleDescriptionAriaAttribute() throws {
        
        let page = TestPage {
            Tag {
            }
            .aria(roleDescription: "description")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <tag aria-roledescription="description"></tag>
                       """
        )
    }
}
