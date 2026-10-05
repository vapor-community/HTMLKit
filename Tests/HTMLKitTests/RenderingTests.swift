import HTMLKit
import Testing
import Foundation

@Suite
struct RenderingTests {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer: Renderer?
    
    init() {
        self.renderer = makeRenderer()
    }
    
    @Test
    func testRenderingDocumentTag() throws {
        
        let view = TestView {
            Document(.html5)
            Html {
                Body {
                    Paragraph {
                        "text"
                    }
                }
            }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <!DOCTYPE html>\
                       <html>\
                       <body>\
                       <p>text</p>\
                       </body>\
                       </html>
                       """
        )
    }
    
    @Test
    func testRenderingContentTag() throws {
        
        let view = TestView {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    @Test
    func testRenderingEmptyTag() throws {
        
        let view = TestView {
            Input()
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <input>
                       """
        )
    }
    
    @Test
    func testRenderingCommentTag() throws {
        
        let view = TestView {
            Comment("text")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <!--text-->
                       """
        )
        
    }
    
    @Test
    func testRenderingAttributes() throws {
        
        let view = TestView {
            Paragraph {
                "text"
            }
            .class("class")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <p class="class">text</p>
                       """
        )
    }
    
    @Test
    func testRenderingAttributesWithUnterscore() throws {
        
        let view = TestView {
            Paragraph {
                "text"
            }
            .class("cl_ass")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <p class="cl_ass">text</p>
                       """
        )
    }
    
    @Test
    func testRenderingAttributesWithHyphens() throws {
        
        let view = TestView {
            Paragraph {
                "text"
            }
            .class("cl-ass")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <p class="cl-ass">text</p>
                       """
        )
    }
    
    @Test
    func testNesting() throws {
        
        let view = TestView {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    @Test
    func testModified() throws {
        
        let isModified: Bool = true
        
        let view = TestView {
            Division {
            }
            .class("unmodified")
            .modify(if: isModified) {
                $0.class("modified")
            }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <div class="modified"></div>
                       """
        )
    }
    
    @Test
    func testAttributeConcatenation() throws {
        
        let isModified: Bool = true
        
        let view = TestView {
            Division {
            }
            .class("lorem")
            .modify(if: isModified, use: .combining) {
                $0.class("ipsum")
            }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <div class="lorem ipsum"></div>
                       """
        )
    }
    
    @Test
    func testUnmodified() throws {
        
        let isModified: Bool = false
        
        let view = TestView {
            Division {
            }
            .class("unmodified")
            .modify(if: isModified) {
                $0.class("modified")
            }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <div class="unmodified"></div>
                       """
        )
    }
    
    @Test
    func testModifiedAndUnwrapped() throws {
        
        let passcode: String? = "test"
        
        let view = TestView {
            Input()
                .modify(unwrap: passcode) {
                    $0.placeholder($1)
                }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <input placeholder="test">
                       """
        )
    }
    
    @Test
    func testUnwrappedAttributeConcatenation() throws {
        
        let passcode: String? = "ipsum"
        
        let view = TestView {
            Division {
            }
            .class("lorem")
            .modify(unwrap: passcode, use: .combining) {
                $0.class($1)
            }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <div class="lorem ipsum"></div>
                       """
        )
    }
    
    @Test
    func testUnwrappedAttributeAttachment() throws {
        
        let passcode: String? = "ipsum"
        
        let view = TestView {
            Input()
                .class("lorem")
                .modify(unwrap: passcode, use: .combining) {
                    $0.placeholder($1)
                }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <input class="lorem" placeholder="ipsum">
                       """
        )
    }
    
    @Test
    func testModifiedAndContextChange() throws {
        
        let view = TestView {
            Input()
                .class("<h1>lorem</h1>")
                .modify(if: false, use: .combining) {
                    $0.custom(key: "class", value: "<h1>ipsum</h1>", context: .trusted)
                }
            
            Input()
                .class("<h1>lorem</h1>")
                .modify(if: true, use: .combining) {
                    $0.custom(key: "class", value: "<h1>ipsum</h1>", context: .trusted)
                }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <input class="&lt;h1>lorem&lt;/h1>">\
                       <input class="<h1>ipsum</h1>">
                       """
        )
    }
    
    @Test
    func testRenderingCustomProperty() throws {
        
        let view = TestView {
            Division {
                Paragraph {
                    "text"
                }
            }
            .custom(key: "key", value: "value")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <div key="value">\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    /// Tests the Markdown rendering for italic emphasis
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent
    @Test
    func testRenderingItalicMarkdown() throws {
        
        let view = TestView {
            MarkdownString("*italic*")
            MarkdownString("_italic_")
            MarkdownString("\(italic: "italic")")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <em>italic</em>\
                       <em>italic</em>\
                       <em>italic</em>
                       """
        )
    }
    
    /// Tests the Markdown rendering for bold emphasis
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent
    @Test
    func testRenderingBoldMarkdown() throws {
        
        let view = TestView {
            MarkdownString("**bold**")
            MarkdownString("__bold__")
            MarkdownString("\(bold: "bold")")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <strong>bold</strong>\
                       <strong>bold</strong>\
                       <strong>bold</strong>
                       """
        )
    }
    
    /// Tests the Markdown rendering for bold and italic emphasis
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent
    @Test
    func testRenderingBoldItalicMarkdown() throws {
        
        let view = TestView {
            MarkdownString("***bold and italic***")
            MarkdownString("___bold and italic___")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <em><strong>bold and italic</strong></em>\
                       <em><strong>bold and italic</strong></em>
                       """
        )
    }
    
    /// Tests the Markdown rendering for inline code emphasis
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent
    @Test
    func testRenderingCodeMarkdown() throws {
        
        let view = TestView {
            MarkdownString("`<div>test</div>`")
            MarkdownString("\(code: "**test**")")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <code>&lt;div&gt;test&lt;/div&gt;</code>\
                       <code>**test**</code>
                       """
        )
    }
    
    /// Tests the Markdown rendering for strikethrough emphasis
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent
    @Test
    func testRenderingStrikeThroughMarkdown() throws {
        
        let view = TestView {
            MarkdownString("~strikethrough~")
            MarkdownString("~~strikethrough~~")
            MarkdownString("\(strike: "strikethrough")")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <del>strikethrough</del>\
                       <del>strikethrough</del>\
                       <del>strikethrough</del>
                       """
        )
    }
    
    /// Tests the Markdown rendering for links
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent
    @Test
    func testRenderingLinkMarkdown() throws {
        
        let view = TestView {
            MarkdownString("[Link](https://www.vapor.codes)")
            MarkdownString("\(link: "https://www.vapor.codes")")
            MarkdownString("\(email: "alone@home.com")")
            MarkdownString("[Vapor](https://www.vapor.codes) and [Swift](https://www.swift.org)")
            MarkdownString("\(link: "https://www.vapor.codes") and \(link: "https://www.swift.org")")
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <a href="https://www.vapor.codes" target="_blank">Link</a>\
                       <a href="https://www.vapor.codes" target="_blank">https://www.vapor.codes</a>\
                       <a href="mailto:alone@home.com" target="_blank">alone@home.com</a>\
                       <a href="https://www.vapor.codes" target="_blank">Vapor</a> and <a href="https://www.swift.org" target="_blank">Swift</a>\
                       <a href="https://www.vapor.codes" target="_blank">https://www.vapor.codes</a> and <a href="https://www.swift.org" target="_blank">https://www.swift.org</a>
                       """
        )
    }
    
    /// Tests the Markdown rendering of a paragraph with multiple emphasis elements
    @Test
    func testRenderingMarkdownParagraph() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString("It consists of a list of features, like **declarative syntax**, **language localization**, **dynamic context**.")
            }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <p>It consists of a list of features, like <strong>declarative syntax</strong>, <strong>language localization</strong>, <strong>dynamic context</strong>.</p>
                       """
        )
    }
    
    /// Tests the Markdown rendering of nested emphasis elements
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent,
    /// while preserving the nesting.
    @Test
    func testRenderingNestedMarkdown() throws {
        
        let view = TestView {
            MarkdownString {
                """
                **This text is _extremely_ important.**
                """
            }
        }
        
        #expect(try renderer!.render(view: view) ==
                       """
                       <strong>This text is <em>extremely</em> important.</strong>
                       """
        )
    }
    
    /// Tests the localization of an element
    ///
    /// The test expects the key to exist in the default translation table and to be rendered correctly.
    @Test
    func testLocalization() throws {
        
        struct MainView: View {
            
            var body: Content {
                Heading1("hello.world")
            }
        }
        
        #expect(try renderer!.render(view: MainView()) ==
                       """
                       <h1>Hiya World</h1>
                       """
        )
    }
    
    /// Tests the localization of a attribute.
    ///
    /// The test expects the key to exist in the default translation table and to be rendered correctly.
    @Test
    func testLocalizationAttribute() throws {
        
        struct TestView: View {
            
            let placeholder = "hello.world"
            
            var body: Content {
                Input()
                    .placeholder("hello.world", tableName: nil)
                    .alternate(LocalizedStringKey("hello.world"))
                    .value(LocalizedStringKey("hello.world"), tableName: "desktop")
                    .title("hello", tableName: "mobile")
                Meta()
                    .content("hello.world")
                Input()
                    .placeholder(verbatim: "hello.world")
                    .alternate(verbatim: "hello.world")
                    .value(verbatim: placeholder)
                    .title(verbatim: "hello")
                TextArea {}
                    .placeholder(placeholder)
            }
        }
        
        #expect(try renderer!.render(view: TestView()) ==
                       """
                       <input placeholder="Hiya World" alt="Hiya World" value="Hiya World" title="Hiya">\
                       <meta content="Hiya World">\
                       <input placeholder="hello.world" alt="hello.world" value="hello.world" title="hello">\
                       <textarea placeholder="hello.world"></textarea>
                       """
        )
    }
    
    /// Tests the change of the locale by the environment modifier
    ///
    /// The test expects that the localization environment modifier correctly applies the locale
    /// down to nested views
    @Test
    func testEnvironmentLocalization() throws {
        
        struct MainView: View {
            
            var content: [Content]
            
            init(@ContentBuilder<Content> content: () -> [Content]) {
                self.content = content()
            }
            
            var body: Content {
                Division {
                    content
                }
                .environment(key: \.locale, value: Locale(tag: .french))
            }
        }
        
        struct ChildView: View {
            
            var body: Content {
                MainView {
                    Heading1("hello.world")
                        .environment(key: \.locale)
                }
            }
        }
        
        #expect(try renderer!.render(view: ChildView()) ==
                       """
                       <div>\
                       <h1>Bonjour le monde</h1>\
                       </div>
                       """
        )
    }
    
    /// Tests the recovery from a missing key
    ///
    /// The renderer should attempt a secondary lookup in the translation tables of the default locale.
    @Test
    func testRecoveryFromMissingKey() throws {
        
        struct MainView: View {
            
            var content: [Content]
            
            init(@ContentBuilder<Content> content: () -> [Content]) {
                self.content = content()
            }
            
            var body: Content {
                Division {
                    content
                }
                .environment(key: \.locale, value: Locale(tag: .french))
            }
        }
        
        struct ChildView: View {
            
            var body: Content {
                MainView {
                    Heading1("Hello \("John Doe")")
                        .environment(key: \.locale)
                }
            }
        }
        
        #expect(try renderer!.render(view: ChildView()) ==
                       """
                       <div>\
                       <h1>Hello John Doe</h1>\
                       </div>
                       """
        )
    }
    
    /// Tests the recovery from a missing table
    ///
    /// The renderer should fallback to the default locale.
    @Test
    func testRecoveryFromMissingTable() throws {
        
        struct TestView: View {
            
            var body: Content {
                Division {
                    Heading1("hello.world")
                        .environment(key: \.locale)
                }
                .environment(key: \.locale, value: Locale(tag: "unknown.tag"))
            }
        }
        
        #expect(try renderer!.render(view: TestView()) ==
                       """
                       <div>\
                       <h1>Hiya World</h1>\
                       </div>
                       """
        )
    }
    
    /// Tests the recovery from a unknown table.
    ///
    /// The renderer should return the key instead.
    @Test
    func testRecoveryFromUnknownTable() throws {
        
        struct TestView: View {
            
            var body: Content {
                Division {
                    Heading1("hello.world", tableName: "unknown.table")
                }
            }
        }
        
        #expect(try renderer!.render(view: TestView()) ==
                       """
                       <div>\
                       <h1>hello.world</h1>\
                       </div>
                       """
        )
    }
    
    /// Tests a cascade of recovery attempts, each triggered by the failure of the last.
    ///
    /// The renderer should bail with the string literal if recovery gets stuck.
    @Test
    func testRecoveryCascade() throws {
        
        struct TestView: View {
            
            var body: Content {
                Division {
                    Heading1("unknown.key", tableName: "unknown.table")
                }
            }
        }
        
        #expect(try renderer!.render(view: TestView()) ==
                       """
                       <div>\
                       <h1>unknown.key</h1>\
                       </div>
                       """
        )
    }
}

extension RenderingTests {
    
    func makeRenderer() -> Renderer? {
        
        guard let sourcePath = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return nil
        }
        
        return Renderer(localization: .init(source: sourcePath, locale: .init(tag: "en-GB")),features: [.escaping, .markdown])
    }
}
