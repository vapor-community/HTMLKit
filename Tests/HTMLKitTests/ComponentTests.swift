/*
 Abstract:
 The file tests the rendering of the tag helpers.
 */

import HTMLKit
import XCTest

final class ComponentTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    var renderer = Renderer()

    func testMetaTitleComponent() throws {
        
        let page = TestPage {
            MetaTitle(title: "text")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <title>text</title>\
                       <meta property="og:title" content="text">\
                       <meta name="twitter:title" content="text">
                       """
        )
    }
    
    func testMetaDescriptionComponent() throws {
        
        let page = TestPage {
            MetaDescription(description: "text")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <meta name="description" content="text">\
                       <meta property="og:description" content="text">\
                       <meta name="twitter:description" content="text">
                       """
        )
    }
    
    func testFaviconComponent() throws {
        
        let page = TestPage {
            Favicon(url: "url")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <link rel="shortcut icon" href="url">
                       """
        )
    }
    
    func testAuthorComponent() throws {
        
        let page = TestPage {
            Author(author: "text", handle: .constant("@handle"))
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <meta name="author" content="text">\
                       <meta name="twitter:creator" content="@handle">
                       """
        )
    }
    
    func testStylesheetComponent() throws {
        
        let page = TestPage {
            Stylesheet(url: "url")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <link rel="stylesheet" href="url" type="text/css">
                       """
        )
    }
    
    func testViewportComponent() throws {
        
        let page = TestPage {
            Viewport(.accordingToDevice)
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <meta name="viewport" content="width=device-width, initial-scale=1.0">
                       """
        )
    }
}
