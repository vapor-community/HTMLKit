/*
 Abstract:
 The file tests the rendering of the elements.
 */

import HTMLKit
import XCTest

final class ElementTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    var renderer = Renderer()
    
    func testHeadElement() throws {
        
        let page = TestPage {
            Head {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <head></head>
                       """
        )
    }
    
    func testTitleElement() throws {
        
        let page = TestPage {
            Title {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <title></title>
                       """
        )
    }
    
    func testBaseElement() throws {
        
        let page = TestPage {
            Base()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <base>
                       """
        )
    }
    
    func testLinkElement() throws {
        
        let page = TestPage {
            Link()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <link>
                       """
        )
    }
    
    func testMetaElement() throws {
        
        let page = TestPage {
            Meta()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <meta>
                       """
        )
    }
    
    func testStyleElement() throws {
        
        let page = TestPage {
            Style {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <style></style>
                       """
        )
    }
    
    func testHtmlElement() throws {
        
        let page = TestPage {
            Html {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <html></html>
                       """
        )
    }
    
    func testBodyElement() throws {
        
        let page = TestPage {
            Body {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <body></body>
                       """
        )
    }
    
    func testArticleElement() throws {
        
        let page = TestPage {
            Article {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <article></article>
                       """
        )
    }
    
    func testSectionElement() throws {
        
        let page = TestPage {
            Section {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <section></section>
                       """
        )
    }
    
    func testNavigationElement() throws {
        
        let page = TestPage {
            Navigation {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <nav></nav>
                       """
        )
    }
    
    func testAsideElement() throws {
        
        let page = TestPage {
            Aside {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <aside></aside>
                       """
        )
    }
    
    func testHeading1Element() throws {
        
        let page = TestPage {
            Heading1 {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <h1></h1>
                       """
        )
    }
    
    func testHeading2Element() throws {
        
        let page = TestPage {
            Heading2 {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <h2></h2>
                       """
        )
    }
    
    func testHeading3Element() throws {
        
        let page = TestPage {
            Heading3 {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <h3></h3>
                       """
        )
    }
    
    func testHeading4Element() throws {
        
        let page = TestPage {
            Heading4 {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <h4></h4>
                       """
        )
    }
    
    func testHeading5Element() throws {
        
        let page = TestPage {
            Heading5 {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <h5></h5>
                       """
        )
    }
    
    func testHeading6Element() throws {
        
        let page = TestPage {
            Heading6 {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <h6></h6>
                       """
        )
    }
    
    func testHeadingGroupElement() throws {
        
        let page = TestPage {
            HeadingGroup {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <hgroup></hgroup>
                       """
        )
    }
    
    func testHeaderElement() throws {
        
        let page = TestPage {
            Header {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <header></header>
                       """
        )
    }
    
    func testFooterElement() throws {
        
        let page = TestPage {
            Footer {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <footer></footer>
                       """
        )
    }
    
    func testAdressElement() throws {
        
        let page = TestPage {
            Address {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <address></address>
                       """
        )
    }
    
    func testParagraphElement() throws {
        
        let page = TestPage {
            Paragraph {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p></p>
                       """
        )
    }
    
    func testHorizontalRuleElement() throws {
        
        let page = TestPage {
            HorizontalRule()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <hr>
                       """
        )
    }
    
    func testPreformattedTextElement() throws {
        
        let page = TestPage {
            PreformattedText {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <pre></pre>
                       """
        )
    }
    
    func testBlockquoteElement() throws {
        
        let page = TestPage {
            Blockquote {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <blockquote></blockquote>
                       """
        )
    }
    
    func testOrderedListElement() throws {
        
        let page = TestPage {
            OrderedList {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <ol></ol>
                       """
        )
    }
    
    func testUnorderedListElement() throws {
        
        let page = TestPage {
            UnorderedList {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <ul></ul>
                       """
        )
    }
    
    func testListItemElement() throws {
        
        let page = TestPage {
            ListItem {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <li></li>
                       """
        )
    }
    
    func testDescriptionListElement() throws {
        
        let page = TestPage {
            DescriptionList {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <dl></dl>
                       """
        )
    }
    
    func testTermNameElement() throws {
        
        let page = TestPage {
            TermName {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <dt></dt>
                       """
        )
    }
    
    func testTermDefinitionElement() throws {
        
        let page = TestPage {
            TermDefinition {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <dd></dd>
                       """
        )
    }
    
    func testFigureElement() throws {
        
        let page = TestPage {
            Figure {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <figure></figure>
                       """
        )
    }
    
    func testFigureCaptionElement() throws {
        
        let page = TestPage {
            FigureCaption {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <figcaption></figcaption>
                       """
        )
    }
    
    func testMainElement() throws {
        
        let page = TestPage {
            Main {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <main></main>
                       """
        )
    }
    
    func testDivisionElement() throws {
        
        let page = TestPage {
            Division {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div></div>
                       """
        )
    }
    
    func testAnchorElement() throws {
        
        let page = TestPage {
            Anchor {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <a></a>
                       """
        )
    }
    
    func testEmphasizeElement() throws {
        
        let page = TestPage {
            Emphasize{
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <em></em>
                       """
        )
    }
    
    func testStrongElement() throws {
        
        let page = TestPage {
            Strong {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <strong></strong>
                       """
        )
    }
    
    func testSmallElement() throws {
        
        let page = TestPage {
            Small {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <small></small>
                       """
        )
    }
    
    func testStrikeThroughElement() throws {
        
        let page = TestPage {
            StrikeThrough {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <s></s>
                       """
        )
    }
    
    func testCiteElement() throws {
        
        let page = TestPage {
            Cite {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <cite></cite>
                       """
        )
    }
    
    func testShortQuoteElement() throws {
        
        let page = TestPage {
            ShortQuote {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <q></q>
                       """
        )
    }
    
    func testDefinitionElement() throws {
        
        let page = TestPage {
            Definition {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <dfn></dfn>
                       """
        )
    }
    
    func testAbbreviationElement() throws {
        
        let page = TestPage {
            Abbreviation {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <abbr></abbr>
                       """
        )
    }
    
    func testRubyElement() throws {
        
        let page = TestPage {
            Ruby {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <ruby></ruby>
                       """
        )
    }
    
    func testRubyTextElement() throws {
        
        let page = TestPage {
            RubyText {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <rt></rt>
                       """
        )
    }
    
    func testRubyPronunciationElement() throws {
        
        let page = TestPage {
            RubyPronunciation {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <rp></rp>
                       """
        )
    }
    
    func testDataElement() throws {
        
        let page = TestPage {
            HTMLKit.Data {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <data></data>
                       """
        )
    }
    
    func testTimeElement() throws {
        
        let page = TestPage {
            Time {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <time></time>
                       """
        )
    }
    
    func testCodeElement() throws {
        
        let page = TestPage {
            Code {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <code></code>
                       """
        )
    }
    
    func testVariableElement() throws {
        
        let page = TestPage {
            Variable {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <v></v>
                       """
        )
    }
    
    func testSampleOutputElement() throws {
        
        let page = TestPage {
            SampleOutput {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <samp></samp>
                       """
        )
    }
    
    func testKeyboardInputElement() throws {
        
        let page = TestPage {
            KeyboardInput {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <kbd></kbd>
                       """
        )
    }
    
    func testSubscriptElement() throws {
        
        let page = TestPage {
            Subscript {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <sub></sub>
                       """
        )
    }
    
    func testSuperscriptElement() throws {
        
        let page = TestPage {
            Superscript {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <sup></sup>
                       """
        )
    }
    
    func testItalicElement() throws {
        
        let page = TestPage {
            Italic {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <i></i>
                       """
        )
    }
    
    func testBoldElement() throws {
        
        let page = TestPage {
            Bold {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <b></b>
                       """
        )
    }
    
    func testUnderlineElement() throws {
        
        let page = TestPage {
            Underline {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <u></u>
                       """
        )
    }
    
    func testMarkElement() throws {
        
        let page = TestPage {
            Mark {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <mark></mark>
                       """
        )
    }
    
    func testBdiElement() throws {
        
        let page = TestPage {
            Bdi {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <bdi></bdi>
                       """
        )
    }
    
    func testBdoElement() throws {
        
        let page = TestPage {
            Bdo()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <bdo>
                       """
        )
    }
    
    func testSpanElement() throws {
        
        let page = TestPage {
            Span {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <span></span>
                       """
        )
    }
    
    func testLineBreakElement() throws {
        
        let page = TestPage {
            LineBreak()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <br>
                       """
        )
    }
    
    func testWordBreakElement() throws {
        
        let page = TestPage {
            WordBreak()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <wbr>
                       """
        )
    }
    
    func testInsertedTextElement() throws {
        
        let page = TestPage {
            InsertedText {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <ins></ins>
                       """
        )
    }
    
    func testDeletedTextElement() throws {
        
        let page = TestPage {
            DeletedText {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <del></del>
                       """
        )
    }
    
    func testPictureElement() throws {
        
        let page = TestPage {
            HTMLKit.Picture{
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <picture></picture>
                       """
        )
    }
    
    func testSourceElement() throws {
        
        let page = TestPage {
            Source()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <source>
                       """
        )
    }
    
    func testImageElement() throws {
        
        let page = TestPage {
            Image()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <img>
                       """
        )
    }
    
    func testInlineFrameElement() throws {
        
        let page = TestPage {
            InlineFrame {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <iframe></iframe>
                       """
        )
    }
    
    func testEmbedElement() throws {
        
        let page = TestPage {
            Embed()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <embed>
                       """
        )
    }
    
    func testObjectElement() throws {
        
        let page = TestPage {
            Object {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <object></object>
                       """
        )
    }
    
    func testParameterElement() throws {
        
        let page = TestPage {
            Parameter()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <param>
                       """
        )
    }
    
    func testVideoElement() throws {
        
        let page = TestPage {
            Video {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <video></video>
                       """
        )
    }
    
    func testAudioElement() throws {
        
        let page = TestPage {
            Audio {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <audio></audio>
                       """
        )
    }
    
    func testTrackElement() throws {
        
        let page = TestPage {
            Track()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <track>
                       """
        )
    }
    
    func testMapElement() throws {
        
        let page = TestPage {
            Map {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <map></map>
                       """
        )
    }
    
    func testAreaElement() throws {
        
        let page = TestPage {
            Area {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <area></area>
                       """
        )
    }
    
    func testTableElement() throws {
        
        let page = TestPage {
            Table {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <table></table>
                       """
        )
    }
    
    func testCaptionElement() throws {
        
        let page = TestPage {
            Caption {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <caption></caption>
                       """
        )
    }
    
    func testColumnGroupElement() throws {
        
        let page = TestPage {
            ColumnGroup {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <colgroup></colgroup>
                       """
        )
    }
    
    func testColumnElement() throws {
        
        let page = TestPage {
            Column {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <col></col>
                       """
        )
    }
    
    func testTableBodyElement() throws {
        
        let page = TestPage {
            TableBody {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <tbody></tbody>
                       """
        )
    }
    
    func testTableHeadElement() throws {
        
        let page = TestPage {
            TableHead {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <thead></thead>
                       """
        )
    }
    
    func testTableFootElement() throws {
        
        let page = TestPage {
            TableFoot {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <tfoot></tfoot>
                       """
        )
    }
    
    func testTableRowElement() throws {
        
        let page = TestPage {
            TableRow {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <tr></tr>
                       """
        )
    }
    
    func testDataCellElement() throws {
        
        let page = TestPage {
            DataCell {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <td></td>
                       """
        )
    }
    
    func testHeaderCellElement() throws {
        
        let page = TestPage {
            HeaderCell {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <th></th>
                       """
        )
    }
    
    func testFormElement() throws {
        
        let page = TestPage {
            Form {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <form></form>
                       """
        )
    }
    
    func testLabelElement() throws {
        
        let page = TestPage {
            Label{
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <label></label>
                       """
        )
    }
    
    func testInputElement() throws {
        
        let page = TestPage {
            Input()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <input>
                       """
        )
    }
    
    func testButtonElement() throws {
        
        let page = TestPage {
            Button {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <button></button>
                       """
        )
    }
    
    func testDataListElement() throws {
        
        let page = TestPage {
            DataList {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <datalist></datalist>
                       """
        )
    }
    
    func testOptionGroupElement() throws {
        
        let page = TestPage {
            OptionGroup {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <optgroup></optgroup>
                       """
        )
    }
    
    func testOptionElement() throws {
        
        let page = TestPage {
            Option {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <option></option>
                       """
        )
    }
    
    func testTextAreaElement() throws {
        
        let page = TestPage {
            TextArea {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <textarea></textarea>
                       """
        )
    }
    
    func testOutputElement() throws {
        
        let page = TestPage {
            Output {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <output></output>
                       """
        )
    }
    
    func testProgressElement() throws {
        
        let page = TestPage {
            HTMLKit.Progress {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <progress></progress>
                       """
        )
    }
    
    func testMeterElement() throws {
        
        let page = TestPage {
            Meter {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <meter></meter>
                       """
        )
    }
    
    func testFieldsetElement() throws {
        
        let page = TestPage {
            Fieldset {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <fieldset></fieldset>
                       """
        )
    }
    
    func testLegendElement() throws {
        
        let page = TestPage {
            Legend {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <legend></legend>
                       """
        )
    }
    
    func testDetailsElement() throws {
        
        let page = TestPage {
            Details {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <details></details>
                       """
        )
    }
    
    func testSummaryElement() throws {
        
        let page = TestPage {
            Summary {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <summary></summary>
                       """
        )
    }
    
    func testDialogElement() throws {
        
        let page = TestPage {
            Dialog {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <dialog></dialog>
                       """
        )
    }
    
    func testScriptElement() throws {
        
        let page = TestPage {
            Script {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <script></script>
                       """
        )
    }
    
    func testNoScriptElement() throws {
        
        let page = TestPage {
            NoScript {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <noscript></noscript>
                       """
        )
    }
    
    func testTemplateElement() throws {
        
        let page = TestPage {
            Template {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <template></template>
                       """
        )
    }
    
    func testCanvasElement() throws {
        
        let page = TestPage {
            Canvas {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <canvas></canvas>
                       """
        )
    }
    
    func testVectorElement() throws {
        
        let page = TestPage {
            Vector {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <svg></svg>
                       """
        )
    }
    
    func testCircleElement() throws {
        
        let page = TestPage {
            Circle {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <circle></circle>
                       """
        )
    }
    
    func testRectangleElement() throws {
        
        let page = TestPage {
            Rectangle {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <rect></rect>
                       """
        )
    }
    
    func testEllipseElement() throws {
        
        let page = TestPage {
            Ellipse {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <ellipse></ellipse>
                       """
        )
    }
    
    func testLineElement() throws {
        
        let page = TestPage {
            Line {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <line></line>
                       """
        )
    }
    
    func testPolygonElement() throws {
        
        let page = TestPage {
            Polygon {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <polygon></polygon>
                       """
        )
    }
    
    func testPolylineElement() throws {
        
        let page = TestPage {
            Polyline {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <polyline></polyline>
                       """
        )
    }
    
    func testPathElement() throws {
        
        let page = TestPage {
            Path {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <path></path>
                       """
        )
    }
    
    func testUseElement() throws {
        
        let page = TestPage {
            Use {
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <use></use>
                       """
        )
    }
}
