/*
 Abstract:
 The file tests the rendering of the tag helpers.
 */

import HTMLKit
import XCTest

final class ComponentTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer()

    func testMetaTitleComponent() throws {
        
        let view = TestView {
            MetaTitle(title: "text")
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <title>text</title>\
                       <meta property="og:title" content="text">\
                       <meta name="twitter:title" content="text">
                       """
        )
    }
    
    func testMetaDescriptionComponent() throws {
        
        let view = TestView {
            MetaDescription(description: "text")
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <meta name="description" content="text">\
                       <meta property="og:description" content="text">\
                       <meta name="twitter:description" content="text">
                       """
        )
    }
    
    func testFaviconComponent() throws {
        
        let view = TestView {
            Favicon(url: "url")
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <link rel="shortcut icon" href="url">
                       """
        )
    }
    
    func testAuthorComponent() throws {
        
        let view = TestView {
            Author(author: "text", handle: .constant("@handle"))
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <meta name="author" content="text">\
                       <meta name="twitter:creator" content="@handle">
                       """
        )
    }
    
    func testStylesheetComponent() throws {
        
        let view = TestView {
            Stylesheet(url: "url")
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <link rel="stylesheet" href="url" type="text/css">
                       """
        )
    }
    
    func testViewportComponent() throws {
        
        let view = TestView {
            Viewport(.accordingToDevice)
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <meta name="viewport" content="width=device-width, initial-scale=1.0">
                       """
        )
    }
}
