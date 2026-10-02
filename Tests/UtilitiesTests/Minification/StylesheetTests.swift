import Testing
import Minifier

@Suite
struct StylesheetTests {
    
    let minifier = Minifier(compression: [.stripComments, .removeWhitespaces])
    
    // Tests minifing a
    @Test
    func testStripComments() throws {
        
        // ...comment outside of a selector
        
        let commentoutside = """
        /* comment */
        
        .selector {
        }
        """
        
        #expect(minifier.minify(css: commentoutside) == ".selector{}")
        
        // ...comment inside of a selector
        
        let commentinside = """
        .selector {
            /* comment */
        
            .selector {
            }
        }
        """
        
        #expect(minifier.minify(css: commentinside) == ".selector{.selector{}}")
        
        
        let commentinsideinside = """
        @media (rule) {
            /* comment */
        
            :selector {
                /* comment */
            }
        }
        """
        
        #expect(minifier.minify(css: commentinsideinside) == "@media(rule){:selector{}}")
    }
    
    // Tests minifing a
    @Test
    func testMinifySelectors() throws {
        
        // ...class selector
        #expect(minifier.minify(css: ".selector {}") == ".selector{}")
        
        // ...id selector
        #expect(minifier.minify(css: "#selector {}") == "#selector{}")
        
        // ...type selector
        #expect(minifier.minify(css: "selector {}") == "selector{}")
        
        // ...root selector
        #expect(minifier.minify(css: ":selector {}") == ":selector{}")
        
        // ...attribute selector
        #expect(minifier.minify(css: "[attribute] {}") == "[attribute]{}")
        
        // ...universal selector
        #expect(minifier.minify(css: "* {}") == "*{}")
    }
    
    // Tests minifing a
    @Test
    func testMinifyCombinators() throws {
        
        // ...descendant combinator
        #expect(minifier.minify(css: ".selector .selector {}") == ".selector .selector{}")
        
        // ...adjacent sibling combinator
        #expect(minifier.minify(css: ".selector + .selector {}") == ".selector+.selector{}")
        
        // ...child combinator
        #expect(minifier.minify(css: ".selector > .selector {}") == ".selector>.selector{}")
        
        // ...general sibling combinator
        #expect(minifier.minify(css: ".selector ~ .selector {}") == ".selector~.selector{}")
        
        // ...parent combinator
        #expect(minifier.minify(css: "& .selector {}") == "& .selector{}")
        
        #expect(minifier.minify(css: "&.selector {}") == "&.selector{}")
        
        #expect(minifier.minify(css: ".selector & {}") == ".selector &{}")
    }
    
    // Tests minifing a
    @Test
    func testMinifyProperties() throws {
        
        // ...standard property
        
        let standard = """
        .selector {
            property: value;
        }
        """
        
        #expect(minifier.minify(css: standard) == ".selector{property:value;}")
        
        // ...browser property
        
        let browser = """
        .selector {
            -browser-property: value;
        }
        """
        
        #expect(minifier.minify(css: browser) == ".selector{-browser-property:value;}")
        
        // ...custom property
        
        let custom = """
        .selector {
            --custom-property: value;
        }
        """
    
        #expect(minifier.minify(css: custom) == ".selector{--custom-property:value;}")
    }
    
    // Tests minifing
    @Test
    func testMinifyAtrules() throws {
        
        // a layer rule
        
        let layerrule = """
        @layer module {
        
            .selector {
                property: value;
            }
        }
        """
        
        #expect(minifier.minify(css: layerrule) == "@layer module{.selector{property:value;}}")
        
        // a media rule
        
        let mediarule = """
        @media (condition) {
        
            .selector {
                property: value;
            }
        }
        """
        
        #expect(minifier.minify(css: mediarule) == "@media(condition){.selector{property:value;}}")
        
        // a import rule
        
        let importrule = """
        @import "file" {
        
            .selector {
                property: value;
            }
        }
        """
        
        #expect(minifier.minify(css: importrule) == "@import \"file\"{.selector{property:value;}}")
    }
    
    // Tests minifing
    @Test
    func testMinifyPseudos() throws {
        
        // ...a pseudo class
        
        let pseudoclass = """
        .selector:pseudo-class {
            property: value;
        }
        """
        
        #expect(minifier.minify(css: pseudoclass) == ".selector:pseudo-class{property:value;}")
        
        // ...a pseudo selector
        
        let pseudoselector = """
        .selector:has(rule) {
            property: value;
        }
        """
        
        #expect(minifier.minify(css: pseudoselector) == ".selector:has(rule){property:value;}")
        
        // ...a pseudo element
        
        let pseudoelement = """
        .selector::pseudo-element {
            property: value;
        }
        """
        
        #expect(minifier.minify(css: pseudoelement) == ".selector::pseudo-element{property:value;}")
    }
    
    // Tests minifing a whole document
    @Test
    func testMinifyDocument() throws {
        
        let document = """
        /* comment */
                        
        .selector {
            property: value;
        }
        """
        
        #expect(minifier.minify(css: document) == ".selector{property:value;}")
    }
    
    // Tests the destinction between a property, a type selector, and type selector with a pseudeo-element
    @Test
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
        
        #expect(minifier.minify(css: destinction) == ".selector{property:value;selector{}selector::pseudo-element{}selector:pseudo-selector{}}selector::pseudo-element{}")
    }
    
    
    // Tests minifing a
    @Test
    func testMinfiyValues() throws {
        
        // ...dimension value
        
        let dimensionvalue = """
        .selector {
        
            property: 0px;
        }
        """
        
        #expect(minifier.minify(css: dimensionvalue) == ".selector{property:0px;}")
        
        // ...numeric value
        
        let numbervalue = """
        .selector {
        
            property: 0.00em;
        }
        """
        
        #expect(minifier.minify(css: numbervalue) == ".selector{property:0.00em;}")
        
        // ...percentage value
        
        let percentagevalue = """
        .selector {
        
            property: 0%;
        }
        """
        
        #expect(minifier.minify(css: percentagevalue) == ".selector{property:0%;}")
        
        // ...string value
        
        let stringvalue = """
        .selector {
        
            property: "content";
        }
        """
        
        #expect(minifier.minify(css: stringvalue) == ".selector{property:\"content\";}")
        
        // ...shorthand value
        
        let shorthandvalue = """
        .selector {
        
            property: 0px 0px 0px 0px;
        }
        """
        
        #expect(minifier.minify(css: shorthandvalue) == ".selector{property:0px 0px 0px 0px;}")
        
        // ...multiple values seperated by commas
        
        let multiplevalues = """
        .selector {
            property: value, value, "string string", value;
        }
        """
        
        #expect(minifier.minify(css: multiplevalues) == ".selector{property:value,value,\"string string\",value;}")
        
        // ...function value
        
        let functionvalue = """
        .selector {
            property: function();
        }
        """
        
        #expect(minifier.minify(css: functionvalue) == ".selector{property:function();}")
        
        // ...rule mark
        
        let rulemark = """
        .selector {
            property: function() !important;
        }
        """
        
        #expect(minifier.minify(css: rulemark) == ".selector{property:function()!important;}")
        
        // ...negative margin
        
        let negativevalue = """
        .selector {
            property: -0.0px;
        }
        """
        
        #expect(minifier.minify(css: negativevalue) == ".selector{property:-0.0px;}")
        
        // ...multiple values seperated by solidus
        
        let multiplevaluesandsolidus = """
        .selector {
            property: 1 / 1;
        }
        """
        
        #expect(minifier.minify(css: multiplevaluesandsolidus) == ".selector{property:1/1;}")
    }
    
    // Tests minifing a funtion
    func testMinfiyFunctions() throws {
        
        // ...with a string value
        
        let stringargument = """
        .selector {
        
            property: function("argument");
        }
        """
        
        #expect(minifier.minify(css: stringargument) == ".selector{property:function(\"argument\");}")
        
        
        // ...with a custom property
        
        let propertyargument = """
        .selector {
        
            property: function(--customProperty);
        }
        """
        
        #expect(minifier.minify(css: propertyargument) == ".selector{property:function(--customProperty);}")
        
        // ...with arimethical operation
        
        let arimethicargument = """
        .selector {
        
            property: function(0px + 0px);
        }
        """
        
        #expect(minifier.minify(css: arimethicargument) == ".selector{property:function(0px + 0px);}")
        
        // ...with a numeric value
        
        let numericargument = """
        .selector {
        
            property: function(25deg);
        }
        """
        
        #expect(minifier.minify(css: numericargument) == ".selector{property:function(25deg);}")
        
        
        // ...with a function within
        
        let functionargument = """
        .selector {
        
            property: function(function(argument), argument);
        }
        """
        
        #expect(minifier.minify(css: functionargument) == ".selector{property:function(function(argument), argument);}")
    }
}
