import HTMLKit
import XCTest

final class ElementTests: XCTestCase {
    
    struct TestPage: HTMLPage {
        
        var content: HTMLContent
        
        var body: HTMLContent {
            content
        }
        
        init(@HTMLBuilder content: () -> HTMLContent) {
            self.content = content()
        }
    }
    
    var renderer = HTMLRenderer()
    
    func testHeadElement() throws {
        
        let view = TestPage {
            Head()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <head></head>
                       """
        )
    }
    
    func testTitleElement() throws {
        
        let view = TestPage {
            Title()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <title></title>
                       """
        )
    }
    
    func testBaseElement() throws {
        
        let view = TestPage {
            Base()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <base>
                       """
        )
    }
    
    func testLinkElement() throws {
        
        let view = TestPage {
            Link()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <link>
                       """
        )
    }
    
    func testMetaElement() throws {
        
        let view = TestPage {
            Meta()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <meta>
                       """
        )
    }
    
    func testStyleElement() throws {
        
        let view = TestPage {
            Style()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <style></style>
                       """
        )
    }
    
    func testHtmlElement() throws {
        
        let view = TestPage {
            Html()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <html></html>
                       """
        )
    }
    
    func testBodyElement() throws {
        
        let view = TestPage {
            Body()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <body></body>
                       """
        )
    }
    
    func testArticleElement() throws {
        
        let view = TestPage {
            Article()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <article></article>
                       """
        )
    }
    
    func testSectionElement() throws {
        
        let view = TestPage {
            Section()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <section></section>
                       """
        )
    }
    
    func testNavigationElement() throws {
        
        let view = TestPage {
            Navigation()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <nav></nav>
                       """
        )
    }
    
    func testAsideElement() throws {
        
        let view = TestPage {
            Aside()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <aside></aside>
                       """
        )
    }
    
    func testHeading1Element() throws {
        
        let view = TestPage {
            Heading1()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <h1></h1>
                       """
        )
    }
    
    func testHeading2Element() throws {
        
        let view = TestPage {
            Heading2()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <h2></h2>
                       """
        )
    }
    
    func testHeading3Element() throws {
        
        let view = TestPage {
            Heading3()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <h3></h3>
                       """
        )
    }
    
    func testHeading4Element() throws {
        
        let view = TestPage {
            Heading4()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <h4></h4>
                       """
        )
    }
    
    func testHeading5Element() throws {
        
        let view = TestPage {
            Heading5()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <h5></h5>
                       """
        )
    }
    
    func testHeading6Element() throws {
        
        let view = TestPage {
            Heading6()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <h6></h6>
                       """
        )
    }
    
    func testHeadingGroupElement() throws {
        
        let view = TestPage {
            HeadingGroup()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <hgroup></hgroup>
                       """
        )
    }
    
    func testHeaderElement() throws {
        
        let view = TestPage {
            Header()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <header></header>
                       """
        )
    }
    
    func testFooterElement() throws {
        
        let view = TestPage {
            Footer()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <footer></footer>
                       """
        )
    }
    
    func testAdressElement() throws {
        
        let view = TestPage {
            Address()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <address></address>
                       """
        )
    }
    
    func testParagraphElement() throws {
        
        let view = TestPage {
            Paragraph()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <p></p>
                       """
        )
    }
    
    func testHorizontalRuleElement() throws {
        
        let view = TestPage {
            HorizontalRule()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <hr>
                       """
        )
    }
    
    func testPreformattedTextElement() throws {
        
        let view = TestPage {
            PreformattedText()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <pre></pre>
                       """
        )
    }
    
    func testBlockquoteElement() throws {
        
        let view = TestPage {
            Blockquote()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <blockquote></blockquote>
                       """
        )
    }
    
    func testOrderedListElement() throws {
        
        let view = TestPage {
            OrderedList()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ol></ol>
                       """
        )
    }
    
    func testUnorderedListElement() throws {
        
        let view = TestPage {
            UnorderedList()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ul></ul>
                       """
        )
    }
    
    func testListItemElement() throws {
        
        let view = TestPage {
            ListItem()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <li></li>
                       """
        )
    }
    
    func testDescriptionListElement() throws {
        
        let view = TestPage {
            DescriptionList()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <dl></dl>
                       """
        )
    }
    
    func testTermNameElement() throws {
        
        let view = TestPage {
            TermName()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <dt></dt>
                       """
        )
    }
    
    func testTermDefinitionElement() throws {
        
        let view = TestPage {
            TermDefinition()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <dd></dd>
                       """
        )
    }
    
    func testFigureElement() throws {
        
        let view = TestPage {
            Figure()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <figure></figure>
                       """
        )
    }
    
    func testFigureCaptionElement() throws {
        
        let view = TestPage {
            FigureCaption()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <figcaption></figcaption>
                       """
        )
    }
    
    func testMainElement() throws {
        
        let view = TestPage {
            Main()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <main></main>
                       """
        )
    }
    
    func testDivisionElement() throws {
        
        let view = TestPage {
            Division()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div></div>
                       """
        )
    }
    
    func testAnchorElement() throws {
        
        let view = TestPage {
            Anchor()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <a></a>
                       """
        )
    }
    
    func testEmphasizeElement() throws {
        
        let view = TestPage {
            Emphasize()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <em></em>
                       """
        )
    }
    
    func testStrongElement() throws {
        
        let view = TestPage {
            Strong()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <strong></strong>
                       """
        )
    }
    
    func testSmallElement() throws {
        
        let view = TestPage {
            Small()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <small></small>
                       """
        )
    }
    
    func testStrikeThroughElement() throws {
        
        let view = TestPage {
            StrikeThrough()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <s></s>
                       """
        )
    }
    
    func testCiteElement() throws {
        
        let view = TestPage {
            Cite()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <cite></cite>
                       """
        )
    }
    
    func testShortQuoteElement() throws {
        
        let view = TestPage {
            ShortQuote()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <q></q>
                       """
        )
    }
    
    func testDefinitionElement() throws {
        
        let view = TestPage {
            Definition()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <dfn></dfn>
                       """
        )
    }
    
    func testAbbreviationElement() throws {
        
        let view = TestPage {
            Abbreviation()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <abbr></abbr>
                       """
        )
    }
    
    func testRubyElement() throws {
        
        let view = TestPage {
            Ruby()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ruby></ruby>
                       """
        )
    }
    
    func testRubyTextElement() throws {
        
        let view = TestPage {
            RubyText()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <rt></rt>
                       """
        )
    }
    
    func testRubyPronunciationElement() throws {
        
        let view = TestPage {
            RubyPronunciation()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <rp></rp>
                       """
        )
    }
    
    func testDataElement() throws {
        
        let view = TestPage {
            HTMLKit.Data()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <data></data>
                       """
        )
    }
    
    func testTimeElement() throws {
        
        let view = TestPage {
            Time()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <time></time>
                       """
        )
    }
    
    func testCodeElement() throws {
        
        let view = TestPage {
            Code()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <code></code>
                       """
        )
    }
    
    func testVariableElement() throws {
        
        let view = TestPage {
            Variable()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <v></v>
                       """
        )
    }
    
    func testSampleOutputElement() throws {
        
        let view = TestPage {
            SampleOutput()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <samp></samp>
                       """
        )
    }
    
    func testKeyboardInputElement() throws {
        
        let view = TestPage {
            KeyboardInput()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <kbd></kbd>
                       """
        )
    }
    
    func testSubscriptElement() throws {
        
        let view = TestPage {
            Subscript()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <sub></sub>
                       """
        )
    }
    
    func testSuperscriptElement() throws {
        
        let view = TestPage {
            Superscript()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <sup></sup>
                       """
        )
    }
    
    func testItalicElement() throws {
        
        let view = TestPage {
            Italic()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <i></i>
                       """
        )
    }
    
    func testBoldElement() throws {
        
        let view = TestPage {
            Bold()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <b></b>
                       """
        )
    }
    
    func testUnderlineElement() throws {
        
        let view = TestPage {
            Underline()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <u></u>
                       """
        )
    }
    
    func testMarkElement() throws {
        
        let view = TestPage {
            Mark()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <mark></mark>
                       """
        )
    }
    
    func testBdiElement() throws {
        
        let view = TestPage {
            Bdi()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <bdi></bdi>
                       """
        )
    }
    
    func testBdoElement() throws {
        
        let view = TestPage {
            Bdo()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <bdo>
                       """
        )
    }
    
    func testSpanElement() throws {
        
        let view = TestPage {
            Span()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <span></span>
                       """
        )
    }
    
    func testLineBreakElement() throws {
        
        let view = TestPage {
            LineBreak()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <br>
                       """
        )
    }
    
    func testWordBreakElement() throws {
        
        let view = TestPage {
            WordBreak()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <wbr>
                       """
        )
    }
    
    func testInsertedTextElement() throws {
        
        let view = TestPage {
            InsertedText()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ins></ins>
                       """
        )
    }
    
    func testDeletedTextElement() throws {
        
        let view = TestPage {
            DeletedText()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <del></del>
                       """
        )
    }
    
    func testPictureElement() throws {
        
        let view = TestPage {
            HTMLKit.Picture()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <picture></picture>
                       """
        )
    }
    
    func testSourceElement() throws {
        
        let view = TestPage {
            Source()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <source>
                       """
        )
    }
    
    func testImageElement() throws {
        
        let view = TestPage {
            Image()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <img>
                       """
        )
    }
    
    func testInlineFrameElement() throws {
        
        let view = TestPage {
            InlineFrame()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <iframe></iframe>
                       """
        )
    }
    
    func testEmbedElement() throws {
        
        let view = TestPage {
            Embed()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <embed>
                       """
        )
    }
    
    func testObjectElement() throws {
        
        let view = TestPage {
            Object()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <object></object>
                       """
        )
    }
    
    func testParameterElement() throws {
        
        let view = TestPage {
            Parameter()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <param>
                       """
        )
    }
    
    func testVideoElement() throws {
        
        let view = TestPage {
            Video()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <video></video>
                       """
        )
    }
    
    func testAudioElement() throws {
        
        let view = TestPage {
            Audio()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <audio></audio>
                       """
        )
    }
    
    func testTrackElement() throws {
        
        let view = TestPage {
            Track()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <track>
                       """
        )
    }
    
    func testMapElement() throws {
        
        let view = TestPage {
            Map()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <map></map>
                       """
        )
    }
    
    func testAreaElement() throws {
        
        let view = TestPage {
            Area()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <area></area>
                       """
        )
    }
    
    func testTableElement() throws {
        
        let view = TestPage {
            Table()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <table></table>
                       """
        )
    }
    
    func testCaptionElement() throws {
        
        let view = TestPage {
            Caption()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <caption></caption>
                       """
        )
    }
    
    func testColumnGroupElement() throws {
        
        let view = TestPage {
            ColumnGroup()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <colgroup></colgroup>
                       """
        )
    }
    
    func testColumnElement() throws {
        
        let view = TestPage {
            Column()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <col></col>
                       """
        )
    }
    
    func testTableBodyElement() throws {
        
        let view = TestPage {
            TableBody()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tbody></tbody>
                       """
        )
    }
    
    func testTableHeadElement() throws {
        
        let view = TestPage {
            TableHead()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <thead></thead>
                       """
        )
    }
    
    func testTableFootElement() throws {
        
        let view = TestPage {
            TableFoot()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tfoot></tfoot>
                       """
        )
    }
    
    func testTableRowElement() throws {
        
        let view = TestPage {
            TableRow()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <tr></tr>
                       """
        )
    }
    
    func testDataCellElement() throws {
        
        let view = TestPage {
            DataCell()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <td></td>
                       """
        )
    }
    
    func testHeaderCellElement() throws {
        
        let view = TestPage {
            HeaderCell()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <th></th>
                       """
        )
    }
    
    func testFormElement() throws {
        
        let view = TestPage {
            Form()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <form></form>
                       """
        )
    }
    
    func testLabelElement() throws {
        
        let view = TestPage {
            Label()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <label></label>
                       """
        )
    }
    
    func testInputElement() throws {
        
        let view = TestPage {
            Input()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <input>
                       """
        )
    }
    
    func testButtonElement() throws {
        
        let view = TestPage {
            Button()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <button></button>
                       """
        )
    }
    
    func testSelectElement() throws {
        
        let view = TestPage {
            Select {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <select></select>
                       """
        )
    }
    
    func testDataListElement() throws {
        
        let view = TestPage {
            DataList()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <datalist></datalist>
                       """
        )
    }
    
    func testOptionGroupElement() throws {
        
        let view = TestPage {
            OptionGroup()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <optgroup></optgroup>
                       """
        )
    }
    
    func testOptionElement() throws {
        
        let view = TestPage {
            Option()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <option></option>
                       """
        )
    }
    
    func testTextAreaElement() throws {
        
        let view = TestPage {
            TextArea()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <textarea></textarea>
                       """
        )
    }
    
    func testOutputElement() throws {
        
        let view = TestPage {
            Output()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <output></output>
                       """
        )
    }
    
    func testProgressElement() throws {
        
        let view = TestPage {
            HTMLKit.Progress()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <progress></progress>
                       """
        )
    }
    
    func testMeterElement() throws {
        
        let view = TestPage {
            Meter()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <meter></meter>
                       """
        )
    }
    
    func testFieldsetElement() throws {
        
        let view = TestPage {
            Fieldset()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <fieldset></fieldset>
                       """
        )
    }
    
    func testLegendElement() throws {
        
        let view = TestPage {
            Legend()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <legend></legend>
                       """
        )
    }
    
    func testDetailsElement() throws {
        
        let view = TestPage {
            Details()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <details></details>
                       """
        )
    }
    
    func testSummaryElement() throws {
        
        let view = TestPage {
            Summary()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <summary></summary>
                       """
        )
    }
    
    func testDialogElement() throws {
        
        let view = TestPage {
            Dialog()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <dialog></dialog>
                       """
        )
    }
    
    func testScriptElement() throws {
        
        let view = TestPage {
            Script()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <script></script>
                       """
        )
    }
    
    func testNoScriptElement() throws {
        
        let view = TestPage {
            NoScript()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <noscript></noscript>
                       """
        )
    }
    
    func testTemplateElement() throws {
        
        let view = TestPage {
            Template()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <template></template>
                       """
        )
    }
    
    func testCanvasElement() throws {
        
        let view = TestPage {
            Canvas()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <canvas></canvas>
                       """
        )
    }
}
