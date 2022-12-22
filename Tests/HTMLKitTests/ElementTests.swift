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
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <use></use>
                       """
        )
    }
}
