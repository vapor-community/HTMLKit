/*
 Abstract:
 The file tests the rendering of the elements.
 */

import HTMLKit
import XCTest

final class ElementTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer()
    
    func testHeadElement() throws {
        
        let view = TestView {
            Head {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <head></head>
                       """
        )
    }
    
    func testTitleElement() throws {
        
        let view = TestView {
            Title {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <title></title>
                       """
        )
    }
    
    func testBaseElement() throws {
        
        let view = TestView {
            Base()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <base>
                       """
        )
    }
    
    func testLinkElement() throws {
        
        let view = TestView {
            Link()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <link>
                       """
        )
    }
    
    func testMetaElement() throws {
        
        let view = TestView {
            Meta()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <meta>
                       """
        )
    }
    
    func testStyleElement() throws {
        
        let view = TestView {
            Style {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <style></style>
                       """
        )
    }
    
    func testHtmlElement() throws {
        
        let view = TestView {
            Html {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <html></html>
                       """
        )
    }
    
    func testBodyElement() throws {
        
        let view = TestView {
            Body {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <body></body>
                       """
        )
    }
    
    func testArticleElement() throws {
        
        let view = TestView {
            Article {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <article></article>
                       """
        )
    }
    
    func testSectionElement() throws {
        
        let view = TestView {
            Section {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <section></section>
                       """
        )
    }
    
    func testNavigationElement() throws {
        
        let view = TestView {
            Navigation {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <nav></nav>
                       """
        )
    }
    
    func testAsideElement() throws {
        
        let view = TestView {
            Aside {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <aside></aside>
                       """
        )
    }
    
    func testHeading1Element() throws {
        
        let view = TestView {
            Heading1 {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h1></h1>
                       """
        )
    }
    
    func testHeading2Element() throws {
        
        let view = TestView {
            Heading2 {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h2></h2>
                       """
        )
    }
    
    func testHeading3Element() throws {
        
        let view = TestView {
            Heading3 {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h3></h3>
                       """
        )
    }
    
    func testHeading4Element() throws {
        
        let view = TestView {
            Heading4 {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h4></h4>
                       """
        )
    }
    
    func testHeading5Element() throws {
        
        let view = TestView {
            Heading5 {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h5></h5>
                       """
        )
    }
    
    func testHeading6Element() throws {
        
        let view = TestView {
            Heading6 {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h6></h6>
                       """
        )
    }
    
    func testHeadingGroupElement() throws {
        
        let view = TestView {
            HeadingGroup {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <hgroup></hgroup>
                       """
        )
    }
    
    func testHeaderElement() throws {
        
        let view = TestView {
            Header {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <header></header>
                       """
        )
    }
    
    func testFooterElement() throws {
        
        let view = TestView {
            Footer {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <footer></footer>
                       """
        )
    }
    
    func testAdressElement() throws {
        
        let view = TestView {
            Address {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <address></address>
                       """
        )
    }
    
    func testParagraphElement() throws {
        
        let view = TestView {
            Paragraph {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p></p>
                       """
        )
    }
    
    func testHorizontalRuleElement() throws {
        
        let view = TestView {
            HorizontalRule()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <hr>
                       """
        )
    }
    
    func testPreformattedTextElement() throws {
        
        let view = TestView {
            PreformattedText {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <pre></pre>
                       """
        )
    }
    
    func testBlockquoteElement() throws {
        
        let view = TestView {
            Blockquote {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <blockquote></blockquote>
                       """
        )
    }
    
    func testOrderedListElement() throws {
        
        let view = TestView {
            OrderedList {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ol></ol>
                       """
        )
    }
    
    func testUnorderedListElement() throws {
        
        let view = TestView {
            UnorderedList {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ul></ul>
                       """
        )
    }
    
    func testListItemElement() throws {
        
        let view = TestView {
            ListItem {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <li></li>
                       """
        )
    }
    
    func testDescriptionListElement() throws {
        
        let view = TestView {
            DescriptionList {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dl></dl>
                       """
        )
    }
    
    func testTermNameElement() throws {
        
        let view = TestView {
            TermName {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dt></dt>
                       """
        )
    }
    
    func testTermDefinitionElement() throws {
        
        let view = TestView {
            TermDefinition {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dd></dd>
                       """
        )
    }
    
    func testFigureElement() throws {
        
        let view = TestView {
            Figure {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <figure></figure>
                       """
        )
    }
    
    func testFigureCaptionElement() throws {
        
        let view = TestView {
            FigureCaption {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <figcaption></figcaption>
                       """
        )
    }
    
    func testMainElement() throws {
        
        let view = TestView {
            Main {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <main></main>
                       """
        )
    }
    
    func testDivisionElement() throws {
        
        let view = TestView {
            Division {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div></div>
                       """
        )
    }
    
    func testAnchorElement() throws {
        
        let view = TestView {
            Anchor {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <a></a>
                       """
        )
    }
    
    func testEmphasizeElement() throws {
        
        let view = TestView {
            Emphasize{
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <em></em>
                       """
        )
    }
    
    func testStrongElement() throws {
        
        let view = TestView {
            Strong {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <strong></strong>
                       """
        )
    }
    
    func testSmallElement() throws {
        
        let view = TestView {
            Small {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <small></small>
                       """
        )
    }
    
    func testStrikeThroughElement() throws {
        
        let view = TestView {
            StrikeThrough {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <s></s>
                       """
        )
    }
    
    func testCiteElement() throws {
        
        let view = TestView {
            Cite {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <cite></cite>
                       """
        )
    }
    
    func testShortQuoteElement() throws {
        
        let view = TestView {
            ShortQuote {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <q></q>
                       """
        )
    }
    
    func testDefinitionElement() throws {
        
        let view = TestView {
            Definition {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dfn></dfn>
                       """
        )
    }
    
    func testAbbreviationElement() throws {
        
        let view = TestView {
            Abbreviation {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <abbr></abbr>
                       """
        )
    }
    
    func testRubyElement() throws {
        
        let view = TestView {
            Ruby {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ruby></ruby>
                       """
        )
    }
    
    func testRubyTextElement() throws {
        
        let view = TestView {
            RubyText {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <rt></rt>
                       """
        )
    }
    
    func testRubyPronunciationElement() throws {
        
        let view = TestView {
            RubyPronunciation {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <rp></rp>
                       """
        )
    }
    
    func testDataElement() throws {
        
        let view = TestView {
            HTMLKit.Data {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <data></data>
                       """
        )
    }
    
    func testTimeElement() throws {
        
        let view = TestView {
            Time {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <time></time>
                       """
        )
    }
    
    func testCodeElement() throws {
        
        let view = TestView {
            Code {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <code></code>
                       """
        )
    }
    
    func testVariableElement() throws {
        
        let view = TestView {
            Variable {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <v></v>
                       """
        )
    }
    
    func testSampleOutputElement() throws {
        
        let view = TestView {
            SampleOutput {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <samp></samp>
                       """
        )
    }
    
    func testKeyboardInputElement() throws {
        
        let view = TestView {
            KeyboardInput {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <kbd></kbd>
                       """
        )
    }
    
    func testSubscriptElement() throws {
        
        let view = TestView {
            Subscript {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <sub></sub>
                       """
        )
    }
    
    func testSuperscriptElement() throws {
        
        let view = TestView {
            Superscript {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <sup></sup>
                       """
        )
    }
    
    func testItalicElement() throws {
        
        let view = TestView {
            Italic {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <i></i>
                       """
        )
    }
    
    func testBoldElement() throws {
        
        let view = TestView {
            Bold {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <b></b>
                       """
        )
    }
    
    func testUnderlineElement() throws {
        
        let view = TestView {
            Underline {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <u></u>
                       """
        )
    }
    
    func testMarkElement() throws {
        
        let view = TestView {
            Mark {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <mark></mark>
                       """
        )
    }
    
    func testBdiElement() throws {
        
        let view = TestView {
            Bdi {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <bdi></bdi>
                       """
        )
    }
    
    func testBdoElement() throws {
        
        let view = TestView {
            Bdo()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <bdo>
                       """
        )
    }
    
    func testSpanElement() throws {
        
        let view = TestView {
            Span {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <span></span>
                       """
        )
    }
    
    func testLineBreakElement() throws {
        
        let view = TestView {
            LineBreak()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <br>
                       """
        )
    }
    
    func testWordBreakElement() throws {
        
        let view = TestView {
            WordBreak()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <wbr>
                       """
        )
    }
    
    func testInsertedTextElement() throws {
        
        let view = TestView {
            InsertedText {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ins></ins>
                       """
        )
    }
    
    func testDeletedTextElement() throws {
        
        let view = TestView {
            DeletedText {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <del></del>
                       """
        )
    }
    
    func testPictureElement() throws {
        
        let view = TestView {
            HTMLKit.Picture{
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <picture></picture>
                       """
        )
    }
    
    func testSourceElement() throws {
        
        let view = TestView {
            Source()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <source>
                       """
        )
    }
    
    func testImageElement() throws {
        
        let view = TestView {
            Image()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <img>
                       """
        )
    }
    
    func testInlineFrameElement() throws {
        
        let view = TestView {
            InlineFrame {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <iframe></iframe>
                       """
        )
    }
    
    func testEmbedElement() throws {
        
        let view = TestView {
            Embed()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <embed>
                       """
        )
    }
    
    func testObjectElement() throws {
        
        let view = TestView {
            Object {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <object></object>
                       """
        )
    }
    
    func testParameterElement() throws {
        
        let view = TestView {
            Parameter()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <param>
                       """
        )
    }
    
    func testVideoElement() throws {
        
        let view = TestView {
            Video {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <video></video>
                       """
        )
    }
    
    func testAudioElement() throws {
        
        let view = TestView {
            Audio {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <audio></audio>
                       """
        )
    }
    
    func testTrackElement() throws {
        
        let view = TestView {
            Track()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <track>
                       """
        )
    }
    
    func testMapElement() throws {
        
        let view = TestView {
            Map {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <map></map>
                       """
        )
    }
    
    func testAreaElement() throws {
        
        let view = TestView {
            Area {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <area></area>
                       """
        )
    }
    
    func testTableElement() throws {
        
        let view = TestView {
            Table {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <table></table>
                       """
        )
    }
    
    func testCaptionElement() throws {
        
        let view = TestView {
            Caption {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <caption></caption>
                       """
        )
    }
    
    func testColumnGroupElement() throws {
        
        let view = TestView {
            ColumnGroup {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <colgroup></colgroup>
                       """
        )
    }
    
    func testColumnElement() throws {
        
        let view = TestView {
            Column {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <col></col>
                       """
        )
    }
    
    func testTableBodyElement() throws {
        
        let view = TestView {
            TableBody {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tbody></tbody>
                       """
        )
    }
    
    func testTableHeadElement() throws {
        
        let view = TestView {
            TableHead {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <thead></thead>
                       """
        )
    }
    
    func testTableFootElement() throws {
        
        let view = TestView {
            TableFoot {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tfoot></tfoot>
                       """
        )
    }
    
    func testTableRowElement() throws {
        
        let view = TestView {
            TableRow {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tr></tr>
                       """
        )
    }
    
    func testDataCellElement() throws {
        
        let view = TestView {
            DataCell {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <td></td>
                       """
        )
    }
    
    func testHeaderCellElement() throws {
        
        let view = TestView {
            HeaderCell {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <th></th>
                       """
        )
    }
    
    func testFormElement() throws {
        
        let view = TestView {
            Form {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <form></form>
                       """
        )
    }
    
    func testLabelElement() throws {
        
        let view = TestView {
            Label{
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <label></label>
                       """
        )
    }
    
    func testInputElement() throws {
        
        let view = TestView {
            Input()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input>
                       """
        )
    }
    
    func testButtonElement() throws {
        
        let view = TestView {
            Button {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <button></button>
                       """
        )
    }
    
    func testDataListElement() throws {
        
        let view = TestView {
            DataList {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <datalist></datalist>
                       """
        )
    }
    
    func testOptionGroupElement() throws {
        
        let view = TestView {
            OptionGroup {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <optgroup></optgroup>
                       """
        )
    }
    
    func testOptionElement() throws {
        
        let view = TestView {
            Option {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <option></option>
                       """
        )
    }
    
    func testTextAreaElement() throws {
        
        let view = TestView {
            TextArea {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <textarea></textarea>
                       """
        )
    }
    
    func testOutputElement() throws {
        
        let view = TestView {
            Output {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <output></output>
                       """
        )
    }
    
    func testProgressElement() throws {
        
        let view = TestView {
            HTMLKit.Progress {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <progress></progress>
                       """
        )
    }
    
    func testMeterElement() throws {
        
        let view = TestView {
            Meter {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <meter></meter>
                       """
        )
    }
    
    func testFieldsetElement() throws {
        
        let view = TestView {
            Fieldset {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <fieldset></fieldset>
                       """
        )
    }
    
    func testLegendElement() throws {
        
        let view = TestView {
            Legend {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <legend></legend>
                       """
        )
    }
    
    func testDetailsElement() throws {
        
        let view = TestView {
            Details {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <details></details>
                       """
        )
    }
    
    func testSummaryElement() throws {
        
        let view = TestView {
            Summary {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <summary></summary>
                       """
        )
    }
    
    func testDialogElement() throws {
        
        let view = TestView {
            Dialog {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dialog></dialog>
                       """
        )
    }
    
    func testScriptElement() throws {
        
        let view = TestView {
            Script {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <script></script>
                       """
        )
    }
    
    func testNoScriptElement() throws {
        
        let view = TestView {
            NoScript {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <noscript></noscript>
                       """
        )
    }
    
    func testTemplateElement() throws {
        
        let view = TestView {
            Template {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <template></template>
                       """
        )
    }
    
    func testCanvasElement() throws {
        
        let view = TestView {
            Canvas {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <canvas></canvas>
                       """
        )
    }
    
    func testVectorElement() throws {
        
        let view = TestView {
            Vector {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <svg></svg>
                       """
        )
    }
    
    func testCircleElement() throws {
        
        let view = TestView {
            Circle {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <circle></circle>
                       """
        )
    }
    
    func testRectangleElement() throws {
        
        let view = TestView {
            Rectangle {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <rect></rect>
                       """
        )
    }
    
    func testEllipseElement() throws {
        
        let view = TestView {
            Ellipse {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ellipse></ellipse>
                       """
        )
    }
    
    func testLineElement() throws {
        
        let view = TestView {
            Line {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <line></line>
                       """
        )
    }
    
    func testPolygonElement() throws {
        
        let view = TestView {
            Polygon {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <polygon></polygon>
                       """
        )
    }
    
    func testPolylineElement() throws {
        
        let view = TestView {
            Polyline {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <polyline></polyline>
                       """
        )
    }
    
    func testPathElement() throws {
        
        let view = TestView {
            Path {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <path></path>
                       """
        )
    }
    
    func testUseElement() throws {
        
        let view = TestView {
            Use {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <use></use>
                       """
        )
    }
}
