import HTMLKit
import XCTest

final class ComponentTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder var body: Content
    }
    
    var renderer = Renderer()

    func testMetaTitleComponent() throws {
        
        let view = TestPage {
            MetaTitle(title: "text")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <title>text</title>\
                       <meta property="og:title" content="text">\
                       <meta name="twitter:title" content="text">
                       """
        )
    }
    
    func testMetaDescriptionComponent() throws {
        
        let view = TestPage {
            MetaDescription(description: "text")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <meta name="description" content="text">\
                       <meta property="og:description" content="text">\
                       <meta name="twitter:description" content="text">
                       """
        )
    }
    
    func testFaviconComponent() throws {
        
        let view = TestPage {
            Favicon(url: "url")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <link rel="shortcut icon" href="url">
                       """
        )
    }
    
    func testAuthorComponent() throws {
        
        let view = TestPage {
            Author(author: "text", handle: .constant("@handle"))
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <meta name="author" content="text">\
                       <meta name="twitter:creator" content="@handle">
                       """
        )
    }
    
    func testStylesheetComponent() throws {
        
        let view = TestPage {
            Stylesheet(url: "url")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <link rel="stylesheet" href="url" type="text/css">
                       """
        )
    }
    
    func testViewportComponent() throws {
        
        let view = TestPage {
            Viewport(.accordingToDevice)
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <meta name="viewport" content="width=device-width, initial-scale=1.0">
                       """
        )
    }
}

extension ComponentTests {
    
    static var allTests = [
        ("testMetaTitleComponent", testMetaTitleComponent),
        ("testMetaDescriptionComponent", testMetaDescriptionComponent),
        ("testFaviconComponent", testFaviconComponent),
        ("testAuthorComponent", testAuthorComponent),
        ("testStylesheetComponent", testStylesheetComponent),
        ("testViewportComponent", testViewportComponent)
    ]
}
