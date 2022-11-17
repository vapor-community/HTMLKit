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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <title></title>
                       """
        )
    }
    
    func testBaseElement() throws {
        
        let page = TestPage {
            Base()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <base>
                       """
        )
    }
    
    func testLinkElement() throws {
        
        let page = TestPage {
            Link()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <link>
                       """
        )
    }
    
    func testMetaElement() throws {
        
        let page = TestPage {
            Meta()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <p></p>
                       """
        )
    }
    
    func testHorizontalRuleElement() throws {
        
        let page = TestPage {
            HorizontalRule()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <bdi></bdi>
                       """
        )
    }
    
    func testBdoElement() throws {
        
        let page = TestPage {
            Bdo()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <span></span>
                       """
        )
    }
    
    func testLineBreakElement() throws {
        
        let page = TestPage {
            LineBreak()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <br>
                       """
        )
    }
    
    func testWordBreakElement() throws {
        
        let page = TestPage {
            WordBreak()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <picture></picture>
                       """
        )
    }
    
    func testSourceElement() throws {
        
        let page = TestPage {
            Source()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <source>
                       """
        )
    }
    
    func testImageElement() throws {
        
        let page = TestPage {
            Image()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <iframe></iframe>
                       """
        )
    }
    
    func testEmbedElement() throws {
        
        let page = TestPage {
            Embed()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <object></object>
                       """
        )
    }
    
    func testParameterElement() throws {
        
        let page = TestPage {
            Parameter()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <audio></audio>
                       """
        )
    }
    
    func testTrackElement() throws {
        
        let page = TestPage {
            Track()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <label></label>
                       """
        )
    }
    
    func testInputElement() throws {
        
        let page = TestPage {
            Input()
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <use></use>
                       """
        )
    }
}
