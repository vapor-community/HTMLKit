import XCTest
import Minifier

final class StylesheetTests: XCTestCase {
    
    let minifier = Minifier(compression: [.stripComments, .removeWhitespaces])
    
    // Tests minifing a
    func testStripComments() throws {
        
        // ...comment outside of a selector
        
        let commentoutside = """
        /* comment */
        
        .selector {
        }
        """
        
        XCTAssertEqual(minifier.minify(css: commentoutside), ".selector{}")
        
        // ...comment inside of a selector
        
        let commentinside = """
        .selector {
            /* comment */
        
            .selector {
            }
        }
        """
        
        XCTAssertEqual(minifier.minify(css: commentinside), ".selector{.selector{}}")
    }
    
    // Tests minifing a
    func testMinifySelectors() throws {
        
        // ...class selector
        XCTAssertEqual(minifier.minify(css: ".selector {}"), ".selector{}")
        
        // ...id selector
        XCTAssertEqual(minifier.minify(css: "#selector {}"), "#selector{}")
        
        // ...type selector
        XCTAssertEqual(minifier.minify(css: "selector {}"), "selector{}")
        
        // ...root selector
        XCTAssertEqual(minifier.minify(css: ":selector {}"), ":selector{}")
        
        // ...attribute selector
        XCTAssertEqual(minifier.minify(css: "selector[attribute] {}"), "selector[attribute]{}")
        
        // ...universal selector
        XCTAssertEqual(minifier.minify(css: "* {}"), "*{}")
    }
    
    // Tests minifing a
    func testMinifyCombinators() throws {
        
        // ...descendant combinator
        XCTAssertEqual(minifier.minify(css: ".selector .selector {}"), ".selector .selector{}")
        
        // ...adjacent sibling combinator
        XCTAssertEqual(minifier.minify(css: ".selector + .selector {}"), ".selector+.selector{}")
        
        // ...child combinator
        XCTAssertEqual(minifier.minify(css: ".selector > .selector {}"), ".selector>.selector{}")
        
        // ...general sibling combinator
        XCTAssertEqual(minifier.minify(css: ".selector ~ .selector {}"), ".selector~.selector{}")
    }
    
    // Tests minifing a
    func testMinifyProperties() throws {
        
        // ...standard property
        
        let standard = """
        .selector {
            property: value;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: standard), ".selector{property:value;}")
        
        // ...browser property
        
        let browser = """
        .selector {
            -browser-property: value;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: browser), ".selector{-browser-property:value;}")
        
        // ...custom property
        
        let custom = """
        .selector {
            --custom-property: value;
        }
        """
    
        XCTAssertEqual(minifier.minify(css: custom), ".selector{--custom-property:value;}")
    }
    
    // Tests minifing a whole document
    func testMinifyAtrules() throws {
        
        let layerrule = """
        @layer module {
        
            .selector {
                property: value;
            }
        }
        """
        
        XCTAssertEqual(minifier.minify(css: layerrule), "@layer module{.selector{property:value;}}")
        
        let mediarule = """
        @media (condition) {
        
            .selector {
                property: value;
            }
        }
        """
        
        XCTAssertEqual(minifier.minify(css: mediarule), "@media(condition){.selector{property:value;}}")
        
        let importrule = """
        @import "file" {
        
            .selector {
                property: value;
            }
        }
        """
        
        XCTAssertEqual(minifier.minify(css: importrule), "@import \"file\"{.selector{property:value;}}")
    }
    
    // Tests minifing a whole document
    func testMinifyPseudoElements() throws {
        
        let pseudo = """
        .selector:pseudo-element {
            property: value;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: pseudo), ".selector:pseudo-element{property:value;}")
    }
    
    // Tests minifing a whole document
    func testMinifyDocument() throws {
        
        let document = """
        /* comment */
                        
        .selector {
            property: value;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: document), ".selector{property:value;}")
    }
    
    // Tests minifing a whole document
    func testMinifyDifferentiation() throws {
        
        let differentiation = """
        .selector {
        
            property: value;
        
            selector {
            }
        }
        """
        
        XCTAssertEqual(minifier.minify(css: differentiation), ".selector{property:value;selector{}}")
    }
    
    
    // Tests minifing a
    func testMinfiyValues() throws {
        
        // ...function value
        let functionvalue = """
        .selector {
        
            property: function();
        }
        """
        
        XCTAssertEqual(minifier.minify(css: functionvalue), ".selector{property:function();}")
        
        // ...dimension value
        
        let dimensionvalue = """
        .selector {
        
            property: 0px 0px 0px 0px;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: dimensionvalue), ".selector{property:0px 0px 0px 0px;}")
        
        // ...numeric value
        
        let numbervalue = """
        .selector {
        
            property: 0.00em;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: numbervalue), ".selector{property:0.00em;}")
        
        // ...percentage value
        
        let percentagevalue = """
        .selector {
        
            property: 0%;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: percentagevalue), ".selector{property:0%;}")
        
        // ...string value
        
        let stringvalue = """
        .selector {
        
            property: "content";
        }
        """
        
        XCTAssertEqual(minifier.minify(css: stringvalue), ".selector{property:\"content\";}")
    }
}
