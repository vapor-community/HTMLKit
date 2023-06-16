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
        
        
        let commentinsideinside = """
        @media (rule) {
            /* comment */
        
            :selector {
                /* comment */
            }
        }
        """
        
        XCTAssertEqual(minifier.minify(css: commentinsideinside), "@media(rule){:selector{}}")
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
        XCTAssertEqual(minifier.minify(css: "[attribute] {}"), "[attribute]{}")
        
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
    
    // Tests minifing
    func testMinifyAtrules() throws {
        
        // a layer rule
        
        let layerrule = """
        @layer module {
        
            .selector {
                property: value;
            }
        }
        """
        
        XCTAssertEqual(minifier.minify(css: layerrule), "@layer module{.selector{property:value;}}")
        
        // a media rule
        
        let mediarule = """
        @media (condition) {
        
            .selector {
                property: value;
            }
        }
        """
        
        XCTAssertEqual(minifier.minify(css: mediarule), "@media(condition){.selector{property:value;}}")
        
        // a import rule
        
        let importrule = """
        @import "file" {
        
            .selector {
                property: value;
            }
        }
        """
        
        XCTAssertEqual(minifier.minify(css: importrule), "@import \"file\"{.selector{property:value;}}")
    }
    
    // Tests minifing
    func testMinifyPseudos() throws {
        
        // ...a pseudo class
        
        let pseudoclass = """
        .selector:pseudo-class {
            property: value;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: pseudoclass), ".selector:pseudo-class{property:value;}")
        
        // ...a pseudo selector
        
        let pseudoselector = """
        .selector:has(rule) {
            property: value;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: pseudoselector), ".selector:has(rule){property:value;}")
        
        // ...a pseudo element
        
        let pseudoelement = """
        .selector::pseudo-element {
            property: value;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: pseudoelement), ".selector::pseudo-element{property:value;}")
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
    
    // Tests the destinction between a property, a type selector, and type selector with a pseudeo-element
    func testElementDestinction() throws {
        
        let destinction = """
        .selector {
        
            property: value;
        
            selector {
            }
        
            selector::pseudo-element {
            }
        
            selector:pseudo-selector {
            }
        }
        
        selector::pseudo-element {
        
        }
        """
        
        XCTAssertEqual(minifier.minify(css: destinction), ".selector{property:value;selector{}selector::pseudo-element{}selector:pseudo-selector{}}selector::pseudo-element{}")
    }
    
    
    // Tests minifing a
    func testMinfiyValues() throws {
        
        // ...dimension value
        
        let dimensionvalue = """
        .selector {
        
            property: 0px;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: dimensionvalue), ".selector{property:0px;}")
        
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
        
        // ...shorthand value
        
        let shorthandvalue = """
        .selector {
        
            property: 0px 0px 0px 0px;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: shorthandvalue), ".selector{property:0px 0px 0px 0px;}")
        
        // ...multiple values seperated by commas
        
        let multiplevalues = """
        .selector {
            property: value, value, "string string", value;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: multiplevalues), ".selector{property:value,value,\"string string\",value;}")
        
        // ...function value
        
        let functionvalue = """
        .selector {
            property: function();
        }
        """
        
        XCTAssertEqual(minifier.minify(css: functionvalue), ".selector{property:function();}")
        
        // ...rule mark
        
        let rulemark = """
        .selector {
            property: function() !important;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: rulemark), ".selector{property:function()!important;}")
        
        // ...negative margin
        
        let negativevalue = """
        .selector {
            property: -0.0px;
        }
        """
        
        XCTAssertEqual(minifier.minify(css: negativevalue), ".selector{property:-0.0px;}")
    }
    
    // Tests minifing a funtion
    func testMinfiyFunctions() throws {
        
        // ...with a string value
        
        let stringargument = """
        .selector {
        
            property: function("argument");
        }
        """
        
        XCTAssertEqual(minifier.minify(css: stringargument), ".selector{property:function(\"argument\");}")
        
        
        // ...with a custom property
        
        let propertyargument = """
        .selector {
        
            property: function(--customProperty);
        }
        """
        
        XCTAssertEqual(minifier.minify(css: propertyargument), ".selector{property:function(--customProperty);}")
        
        // ...with arimethical operation
        
        let arimethicargument = """
        .selector {
        
            property: function(0px + 0px);
        }
        """
        
        XCTAssertEqual(minifier.minify(css: arimethicargument), ".selector{property:function(0px + 0px);}")
        
        // ...with a numeric value
        
        let numericargument = """
        .selector {
        
            property: function(25deg);
        }
        """
        
        XCTAssertEqual(minifier.minify(css: numericargument), ".selector{property:function(25deg);}")
        
        
        // ...with a function within
        
        let functionargument = """
        .selector {
        
            property: function(function(argument), argument);
        }
        """
        
        XCTAssertEqual(minifier.minify(css: functionargument), ".selector{property:function(function(argument), argument);}")
    }
}
