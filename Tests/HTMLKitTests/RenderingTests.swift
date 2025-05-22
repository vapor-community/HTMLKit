/*
 Abstract:
 The file tests the rendering.
 */

import HTMLKit
import XCTest

final class RenderingTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer: Renderer?
    
    override func setUp() {
        super.setUp()
        
        try! setupRendering()
    }
    
    
    func testRenderingDocument() throws {
        
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
        
        XCTAssertEqual(try renderer!.render(view: view),
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
    
    func testRenderingContentTag() throws {
        
        let view = TestView {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    func testRenderingEmptyTag() throws {
        
        let view = TestView {
            Input()
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <input>
                       """
        )
    }
    
    func testRenderingCommentTag() throws {
        
        let view = TestView {
            Comment("text")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <!--text-->
                       """
        )
        
    }
    
    func testRenderingAttributes() throws {
        
        let view = TestView {
            Paragraph {
                "text"
            }
            .class("class")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <p class="class">text</p>
                       """
        )
    }
    
    
    func testRenderingAttributesWithUnterscore() throws {
        
        let view = TestView {
            Paragraph {
                "text"
            }
            .class("cl_ass")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <p class="cl_ass">text</p>
                       """
        )
    }
    
    func testRenderingAttributesWithHyphens() throws {
        
        let view = TestView {
            Paragraph {
                "text"
            }
            .class("cl-ass")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <p class="cl-ass">text</p>
                       """
        )
    }
    
    func testNesting() throws {
        
        let view = TestView {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
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
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <div class="modified"></div>
                       """
        )
    }
    
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
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <div class="unmodified"></div>
                       """
        )
    }
    
    func testModifiedAndUnwrapped() throws {
        
        let passcode: String? = "test"
        
        let view = TestView {
            Input()
                .modify(unwrap: passcode) {
                    $0.placeholder($1)
                }
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <input placeholder="test">
                       """
        )
    }
    
    func testRenderingCustomProperty() throws {
        
        let view = TestView {
            Division {
                Paragraph {
                    "text"
                }
            }
            .custom(key: "key", value: "value")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
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
    func testRenderingItalicMarkdown() throws {
        
        let view = TestView {
            MarkdownString("*italic*")
            MarkdownString("_italic_")
            MarkdownString("\(italic: "italic")")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
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
    func testRenderingBoldMarkdown() throws {
        
        let view = TestView {
            MarkdownString("**bold**")
            MarkdownString("__bold__")
            MarkdownString("\(bold: "bold")")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
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
    func testRenderingBoldItalicMarkdown() throws {
        
        let view = TestView {
            MarkdownString("***bold and italic***")
            MarkdownString("___bold and italic___")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <em><strong>bold and italic</strong></em>\
                       <em><strong>bold and italic</strong></em>
                       """
        )
    }
    
    /// Tests the Markdown rendering for inline code emphasis
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent
    func testRenderingMonospaceMarkdown() throws {
        
        let view = TestView {
            MarkdownString("`code`")
            MarkdownString("\(code: "code")")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <code>code</code>\
                       <code>code</code>
                       """
        )
    }
    
    /// Tests the Markdown rendering for strikethrough emphasis
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent
    func testRenderingStrikeThroughMarkdown() throws {
        
        let view = TestView {
            MarkdownString("~strikethrough~")
            MarkdownString("~~strikethrough~~")
            MarkdownString("\(strike: "strikethrough")")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
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
    func testRenderingLinkMarkdown() throws {
        
        let view = TestView {
            MarkdownString("[Link](https://www.vapor.codes)")
            MarkdownString("\(link: "https://www.vapor.codes")")
            MarkdownString("\(email: "alone@home.com")")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <a href="https://www.vapor.codes" target="_blank">Link</a>\
                       <a href="https://www.vapor.codes" target="_blank">https://www.vapor.codes</a>\
                       <a href="mailto:alone@home.com" target="_blank">alone@home.com</a>
                       """
        )
    }
    
    /// Tests the Markdown rendering of a paragraph with multiple emphasis elements
    func testRenderingMarkdownParagraph() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString("It consists of a list of features, like **declarative syntax**, **language localization**, **dynamic context**.")
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <p>It consists of a list of features, like <strong>declarative syntax</strong>, <strong>language localization</strong>, <strong>dynamic context</strong>.</p>
                       """
        )
    }
    
    /// Tests the Markdown rendering of nested emphasis elements
    ///
    /// The renderer is expected to convert the Markdown syntax into the HTML equivalent,
    /// while preserving the nesting.
    func testRenderingNestedMarkdown() throws {
        
        let view = TestView {
            MarkdownString {
                """
                **This text is _extremely_ important.**
                """
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <strong>This text is <em>extremely</em> important.</strong>
                       """
        )
    }
    
    /// Tests the localization of an element
    ///
    /// The test expects the key to exist in the default translation table and to be rendered correctly.
    func testLocalization() throws {
        
        struct MainView: View {
            
            var body: Content {
                Heading1("hello.world")
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: MainView()),
                       """
                       <h1>Hello World</h1>
                       """
        )
    }
    
    /// Tests the localization of a attribute
    ///
    /// The test expects the key to exist in the default translation table and to be rendered correctly.
    func testLocalizationAttribute() throws {
        
        struct TestView: View {
            
            let placeholder = "hello.world"
            
            var body: Content {
                Input()
                    .placeholder("hello.world", tableName: nil)
                    .alternate(LocalizedStringKey("hello.world"))
                    .value(LocalizedStringKey("hello.world"), tableName: "web")
                    .title("hello.world", tableName: "mobile")
                Meta()
                    .content("hello.world")
                Input()
                    .placeholder(verbatim: "hello.world")
                    .alternate(verbatim: "hello.world")
                    .value(verbatim: placeholder)
                    .title(verbatim: "hello.world")
                TextArea {}
                    .placeholder(placeholder)
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <input placeholder="Hello World" alt="Hello World" value="Hello World" title="Hello World">\
                       <meta content="Hello World">\
                       <input placeholder="hello.world" alt="hello.world" value="hello.world" title="hello.world">\
                       <textarea placeholder="hello.world"></textarea>
                       """
        )
    }
    
    /// Tests the change of the locale by the environment modifier
    ///
    /// The test expects that the localization environment modifier correctly applies the locale
    /// down to nested views
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
        
        XCTAssertEqual(try renderer!.render(view: ChildView()),
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
        
        XCTAssertEqual(try renderer!.render(view: ChildView()),
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
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <div>\
                       <h1>Hello World</h1>\
                       </div>
                       """
        )
    }
    
    /// Tests the recovery from a unknown table.
    ///
    /// The renderer should return the key instead.
    func testRecoveryFromUnknownTable() throws {
        
        struct TestView: View {
            
            var body: Content {
                Division {
                    Heading1("hello.world", tableName: "unknown.table")
                }
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
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
    func testRecoveryCascade() throws {
        
        struct TestView: View {
            
            var body: Content {
                Division {
                    Heading1("unknown.key", tableName: "unknown.table")
                }
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <div>\
                       <h1>unknown.key</h1>\
                       </div>
                       """
        )
    }
}

extension RenderingTests {
    
    func setupRendering() throws {
        
        guard let sourcePath = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return
        }
        
        self.renderer = Renderer(localization: .init(source: sourcePath, locale: .init(tag: "en-GB")),features: [.escaping, .markdown])
    }
}
