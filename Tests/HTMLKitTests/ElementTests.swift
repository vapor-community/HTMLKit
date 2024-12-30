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
            Head {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <head></head>
                       """
        )
    }
    
    func testTitleElement() throws {
        
        let view = TestView {
            Title {}
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
            Style {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <style></style>
                       """
        )
    }
    
    func testHtmlElement() throws {
        
        let view = TestView {
            Html {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <html></html>
                       """
        )
    }
    
    func testBodyElement() throws {
        
        let view = TestView {
            Body {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <body></body>
                       """
        )
    }
    
    func testArticleElement() throws {
        
        let view = TestView {
            Article {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <article></article>
                       """
        )
    }
    
    func testSectionElement() throws {
        
        let view = TestView {
            Section {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <section></section>
                       """
        )
    }
    
    func testNavigationElement() throws {
        
        let view = TestView {
            Navigation {}
            Nav {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <nav></nav>\
                       <nav></nav>
                       """
        )
    }
    
    func testAsideElement() throws {
        
        let view = TestView {
            Aside {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <aside></aside>
                       """
        )
    }
    
    func testHeading1Element() throws {
        
        let view = TestView {
            Heading1 {}
            H1 {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h1></h1>\
                       <h1></h1>
                       """
        )
    }
    
    func testHeading2Element() throws {
        
        let view = TestView {
            Heading2 {}
            H2 {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h2></h2>\
                       <h2></h2>
                       """
        )
    }
    
    func testHeading3Element() throws {
        
        let view = TestView {
            Heading3 {}
            H3 {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h3></h3>\
                       <h3></h3>
                       """
        )
    }
    
    func testHeading4Element() throws {
        
        let view = TestView {
            Heading4 {}
            H4 {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h4></h4>\
                       <h4></h4>
                       """
        )
    }
    
    func testHeading5Element() throws {
        
        let view = TestView {
            Heading5 {}
            H5 {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h5></h5>\
                       <h5></h5>
                       """
        )
    }
    
    func testHeading6Element() throws {
        
        let view = TestView {
            Heading6 {}
            H6 {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <h6></h6>\
                       <h6></h6>
                       """
        )
    }
    
    func testHeadingGroupElement() throws {
        
        let view = TestView {
            HeadingGroup {}
            Hgroup {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <hgroup></hgroup>\
                       <hgroup></hgroup>
                       """
        )
    }
    
    func testHeaderElement() throws {
        
        let view = TestView {
            Header {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <header></header>
                       """
        )
    }
    
    func testFooterElement() throws {
        
        let view = TestView {
            Footer {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <footer></footer>
                       """
        )
    }
    
    func testAdressElement() throws {
        
        let view = TestView {
            Address {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <address></address>
                       """
        )
    }
    
    func testParagraphElement() throws {
        
        let view = TestView {
            Paragraph {}
            P {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p></p>\
                       <p></p>
                       """
        )
    }
    
    func testHorizontalRuleElement() throws {
        
        let view = TestView {
            HorizontalRule()
            Hr()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <hr>\
                       <hr>
                       """
        )
    }
    
    func testPreformattedTextElement() throws {
        
        let view = TestView {
            PreformattedText {}
            Pre {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <pre></pre>\
                       <pre></pre>
                       """
        )
    }
    
    func testBlockquoteElement() throws {
        
        let view = TestView {
            Blockquote {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <blockquote></blockquote>
                       """
        )
    }
    
    func testOrderedListElement() throws {
        
        let view = TestView {
            OrderedList {}
            Ol {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ol></ol>\
                       <ol></ol>
                       """
        )
    }
    
    func testUnorderedListElement() throws {
        
        let view = TestView {
            UnorderedList {}
            Ul {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ul></ul>\
                       <ul></ul>
                       """
        )
    }
    
    func testMenuElement() throws {
        
        let view = TestView {
            Menu {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <menu></menu>
                       """
        )
    }
    
    func testListItemElement() throws {
        
        let view = TestView {
            ListItem {}
            Li {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <li></li>\
                       <li></li>
                       """
        )
    }
    
    func testDescriptionListElement() throws {
        
        let view = TestView {
            DescriptionList {}
            Dl {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dl></dl>\
                       <dl></dl>
                       """
        )
    }
    
    func testTermNameElement() throws {
        
        let view = TestView {
            TermName {}
            Dt {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dt></dt>\
                       <dt></dt>
                       """
        )
    }
    
    func testTermDefinitionElement() throws {
        
        let view = TestView {
            TermDefinition {}
            Dd {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dd></dd>\
                       <dd></dd>
                       """
        )
    }
    
    func testFigureElement() throws {
        
        let view = TestView {
            Figure {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <figure></figure>
                       """
        )
    }
    
    func testFigureCaptionElement() throws {
        
        let view = TestView {
            FigureCaption {}
            Figcaption {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <figcaption></figcaption>\
                       <figcaption></figcaption>
                       """
        )
    }
    
    func testMainElement() throws {
        
        let view = TestView {
            Main {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <main></main>
                       """
        )
    }
    
    func testSearchElement() throws {
        
        let view = TestView {
            Search {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <search></search>
                       """
        )
    }
    
    func testDivisionElement() throws {
        
        let view = TestView {
            Division {}
            Div {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div></div>\
                       <div></div>
                       """
        )
    }
    
    func testAnchorElement() throws {
        
        let view = TestView {
            Anchor {}
            A {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <a></a>\
                       <a></a>
                       """
        )
    }
    
    func testEmphasizeElement() throws {
        
        let view = TestView {
            Emphasize{}
            Em {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <em></em>\
                       <em></em>
                       """
        )
    }
    
    func testStrongElement() throws {
        
        let view = TestView {
            Strong {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <strong></strong>
                       """
        )
    }
    
    func testSmallElement() throws {
        
        let view = TestView {
            Small {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <small></small>
                       """
        )
    }
    
    func testStrikeThroughElement() throws {
        
        let view = TestView {
            StrikeThrough {}
            S {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <s></s>\
                       <s></s>
                       """
        )
    }
    
    func testCiteElement() throws {
        
        let view = TestView {
            Cite {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <cite></cite>
                       """
        )
    }
    
    func testShortQuoteElement() throws {
        
        let view = TestView {
            ShortQuote {}
            Q {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <q></q>\
                       <q></q>
                       """
        )
    }
    
    func testDefinitionElement() throws {
        
        let view = TestView {
            Definition {}
            Dfn {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dfn></dfn>\
                       <dfn></dfn>
                       """
        )
    }
    
    func testAbbreviationElement() throws {
        
        let view = TestView {
            Abbreviation {}
            Abbr {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <abbr></abbr>\
                       <abbr></abbr>
                       """
        )
    }
    
    func testRubyElement() throws {
        
        let view = TestView {
            Ruby {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ruby></ruby>
                       """
        )
    }
    
    func testRubyTextElement() throws {
        
        let view = TestView {
            RubyText {}
            Rt {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <rt></rt>\
                       <rt></rt>
                       """
        )
    }
    
    func testRubyPronunciationElement() throws {
        
        let view = TestView {
            RubyPronunciation {}
            Rp {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <rp></rp>\
                       <rp></rp>
                       """
        )
    }
    
    func testDataElement() throws {
        
        let view = TestView {
            HTMLKit.Data {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <data></data>
                       """
        )
    }
    
    func testTimeElement() throws {
        
        let view = TestView {
            Time {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <time></time>
                       """
        )
    }
    
    func testCodeElement() throws {
        
        let view = TestView {
            Code {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <code></code>
                       """
        )
    }
    
    func testVariableElement() throws {
        
        let view = TestView {
            Variable {}
            V {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <var></var>\
                       <var></var>
                       """
        )
    }
    
    func testSampleOutputElement() throws {
        
        let view = TestView {
            SampleOutput {}
            Samp {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <samp></samp>\
                       <samp></samp>
                       """
        )
    }
    
    func testKeyboardInputElement() throws {
        
        let view = TestView {
            KeyboardInput {}
            Kbd {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <kbd></kbd>\
                       <kbd></kbd>
                       """
        )
    }
    
    func testSubscriptElement() throws {
        
        let view = TestView {
            Subscript {}
            Sub {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <sub></sub>\
                       <sub></sub>
                       """
        )
    }
    
    func testSuperscriptElement() throws {
        
        let view = TestView {
            Superscript {}
            Sup {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <sup></sup>\
                       <sup></sup>
                       """
        )
    }
    
    func testItalicElement() throws {
        
        let view = TestView {
            Italic {}
            I {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <i></i>\
                       <i></i>
                       """
        )
    }
    
    func testBoldElement() throws {
        
        let view = TestView {
            Bold {}
            B {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <b></b>\
                       <b></b>
                       """
        )
    }
    
    func testUnderlineElement() throws {
        
        let view = TestView {
            Underline {}
            U {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <u></u>\
                       <u></u>
                       """
        )
    }
    
    func testMarkElement() throws {
        
        let view = TestView {
            Mark {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <mark></mark>
                       """
        )
    }
    
    func testBdiElement() throws {
        
        let view = TestView {
            Bdi {}
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
            Span {}
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
            Br()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <br>\
                       <br>
                       """
        )
    }
    
    func testWordBreakElement() throws {
        
        let view = TestView {
            WordBreak()
            Wbr()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <wbr>\
                       <wbr>
                       """
        )
    }
    
    func testInsertedTextElement() throws {
        
        let view = TestView {
            InsertedText {}
            Ins {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ins></ins>\
                       <ins></ins>
                       """
        )
    }
    
    func testDeletedTextElement() throws {
        
        let view = TestView {
            DeletedText {}
            Del {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <del></del>\
                       <del></del>
                       """
        )
    }
    
    func testPictureElement() throws {
        
        let view = TestView {
            HTMLKit.Picture{}
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
            Img()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <img>\
                       <img>
                       """
        )
    }
    
    func testInlineFrameElement() throws {
        
        let view = TestView {
            InlineFrame {}
            Iframe {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <iframe></iframe>\
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
            Object {}
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
            Param()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <param>\
                       <param>
                       """
        )
    }
    
    func testVideoElement() throws {
        
        let view = TestView {
            Video {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <video></video>
                       """
        )
    }
    
    func testAudioElement() throws {
        
        let view = TestView {
            Audio {}
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
            Map {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <map></map>
                       """
        )
    }
    
    func testAreaElement() throws {
        
        let view = TestView {
            Area()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <area>
                       """
        )
    }
    
    func testTableElement() throws {
        
        let view = TestView {
            Table {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <table></table>
                       """
        )
    }
    
    func testCaptionElement() throws {
        
        let view = TestView {
            Caption {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <caption></caption>
                       """
        )
    }
    
    func testColumnGroupElement() throws {
        
        let view = TestView {
            ColumnGroup {}
            Colgroup {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <colgroup></colgroup>\
                       <colgroup></colgroup>
                       """
        )
    }
    
    func testColumnElement() throws {
        
        let view = TestView {
            Column {}
            Col {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <col></col>\
                       <col></col>
                       """
        )
    }
    
    func testTableBodyElement() throws {
        
        let view = TestView {
            TableBody {}
            Tbody {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tbody></tbody>\
                       <tbody></tbody>
                       """
        )
    }
    
    func testTableHeadElement() throws {
        
        let view = TestView {
            TableHead {}
            Thead {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <thead></thead>\
                       <thead></thead>
                       """
        )
    }
    
    func testTableFootElement() throws {
        
        let view = TestView {
            TableFoot {}
            Tfoot {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tfoot></tfoot>\
                       <tfoot></tfoot>
                       """
        )
    }
    
    func testTableRowElement() throws {
        
        let view = TestView {
            TableRow {}
            Tr {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <tr></tr>\
                       <tr></tr>
                       """
        )
    }
    
    func testDataCellElement() throws {
        
        let view = TestView {
            DataCell {}
            Td {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <td></td>\
                       <td></td>
                       """
        )
    }
    
    func testHeaderCellElement() throws {
        
        let view = TestView {
            HeaderCell {}
            Th {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <th></th>\
                       <th></th>
                       """
        )
    }
    
    func testFormElement() throws {
        
        let view = TestView {
            Form {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <form></form>
                       """
        )
    }
    
    func testLabelElement() throws {
        
        let view = TestView {
            Label{}
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
            Button {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <button></button>
                       """
        )
    }
    
    func testDataListElement() throws {
        
        let view = TestView {
            DataList {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <datalist></datalist>
                       """
        )
    }
    
    func testOptionGroupElement() throws {
        
        let view = TestView {
            OptionGroup {}
            Optgroup {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <optgroup></optgroup>\
                       <optgroup></optgroup>
                       """
        )
    }
    
    func testOptionElement() throws {
        
        let view = TestView {
            Option {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <option></option>
                       """
        )
    }
    
    func testTextAreaElement() throws {
        
        let view = TestView {
            TextArea {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <textarea></textarea>
                       """
        )
    }
    
    func testOutputElement() throws {
        
        let view = TestView {
            Output {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <output></output>
                       """
        )
    }
    
    func testProgressElement() throws {
        
        let view = TestView {
            HTMLKit.Progress {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <progress></progress>
                       """
        )
    }
    
    func testMeterElement() throws {
        
        let view = TestView {
            Meter {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <meter></meter>
                       """
        )
    }
    
    func testFieldsetElement() throws {
        
        let view = TestView {
            Fieldset {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <fieldset></fieldset>
                       """
        )
    }
    
    func testLegendElement() throws {
        
        let view = TestView {
            Legend {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <legend></legend>
                       """
        )
    }
    
    func testDetailsElement() throws {
        
        let view = TestView {
            Details {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <details></details>
                       """
        )
    }
    
    func testSummaryElement() throws {
        
        let view = TestView {
            Summary {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <summary></summary>
                       """
        )
    }
    
    func testDialogElement() throws {
        
        let view = TestView {
            Dialog {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dialog></dialog>
                       """
        )
    }
    
    func testScriptElement() throws {
        
        let view = TestView {
            Script {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <script></script>
                       """
        )
    }
    
    func testNoScriptElement() throws {
        
        let view = TestView {
            NoScript {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <noscript></noscript>
                       """
        )
    }
    
    func testTemplateElement() throws {
        
        let view = TestView {
            Template {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <template></template>
                       """
        )
    }
    
    func testCanvasElement() throws {
        
        let view = TestView {
            Canvas {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <canvas></canvas>
                       """
        )
    }
    
    func testVectorElement() throws {
        
        let view = TestView {
            Vector {}
            Svg {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <svg></svg>\
                       <svg></svg>
                       """
        )
    }
    
    func testCircleElement() throws {
        
        let view = TestView {
            Circle {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <circle></circle>
                       """
        )
    }
    
    func testRectangleElement() throws {
        
        let view = TestView {
            Rectangle {}
            Rect {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <rect></rect>\
                       <rect></rect>
                       """
        )
    }
    
    func testEllipseElement() throws {
        
        let view = TestView {
            Ellipse {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ellipse></ellipse>
                       """
        )
    }
    
    func testLineElement() throws {
        
        let view = TestView {
            Line {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <line></line>
                       """
        )
    }
    
    func testPolygonElement() throws {
        
        let view = TestView {
            Polygon {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <polygon></polygon>
                       """
        )
    }
    
    func testPolylineElement() throws {
        
        let view = TestView {
            Polyline {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <polyline></polyline>
                       """
        )
    }
    
    func testPathElement() throws {
        
        let view = TestView {
            Path {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <path></path>
                       """
        )
    }
    
    func testUseElement() throws {
        
        let view = TestView {
            Use {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <use></use>
                       """
        )
    }
    
    func testSlotElement() throws {
        
        let view = TestView {
            Slot {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <slot></slot>
                       """
        )
    }
    
    func testCustomElement() throws {
        
        let view = TestView {
            Custom(name: "custom") {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <custom></custom>
                       """
        )
    }
}
