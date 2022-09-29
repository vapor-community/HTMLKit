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
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
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
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
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
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <link rel="shortcut icon" href="url">
                       """
        )
    }
    
    func testAuthorComponent() throws {
        
        let page = TestPage {
            Author(author: "text", handle: .constant("@handle"))
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
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
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <link rel="stylesheet" href="url" type="text/css">
                       """
        )
    }
    
    func testViewportComponent() throws {
        
        let page = TestPage {
            Viewport(.accordingToDevice)
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <meta name="viewport" content="width=device-width, initial-scale=1.0">
                       """
        )
    }
}
