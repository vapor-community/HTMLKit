/*
 Abstract:
 The file tests performance of the rendering.
 */

import HTMLKit
import XCTest

final class PerformanceTests: XCTestCase {
    
    func testPerformanceWithoutAutoEscaping() throws {
        
        let context = SampleContext(id: 0, title: "TestPage", excerpt: "Testpage", modified: Date(), posted: Date())
        
        let security = Security()
        security.autoEscaping = false
        
        let renderer = Renderer(security: security)
        
        measure {
            
            for _ in 0...1000 {
                _ = try! renderer.render(view: SampleView(context: context))
            }
        }
    }
    
    func testPerformanceWithAutoEscaping() throws {
        
        let context = SampleContext(id: 0, title: "TestPage", excerpt: "Testpage", modified: Date(), posted: Date())
        
        let security = Security()
        security.autoEscaping = true
        
        let renderer = Renderer(security: security)
        
        measure {
            
            for _ in 0...1000 {
                _ = try! renderer.render(view: SampleView(context: context))
            }
        }
    }
    
    func testPerformanceWithMarkdown() throws {
        
        let context = SampleContext(id: 0, title: "TestPage", excerpt: "Testpage", modified: Date(), posted: Date())
        
        let security = Security()
        security.autoEscaping = true
        
        let renderer = Renderer(security: security, features: [.markdown])
        
        measure {
            
            for _ in 0...1000 {
                _ = try! renderer.render(view: MarkdownView(context: context))
            }
        }
    }
    
    /// Measures the performance of the localization rendering
    ///
    /// The test runs up to 1000 iterations and utilizes string interpolation and table lookup
    func testPerformanceWithLocalization() throws {
        
        guard let sourcePath = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return
        }
        
        let renderer = Renderer(localization: .init(source: sourcePath, locale: .init(tag: "en-GB")))
        
        struct TestView: View {
            
            var body: Content {
                Paragraph("Hello \("John Doe")")
            }
        }
        
        measure {
            
            for _ in 0...1000 {
                _ = try! renderer.render(view: TestView())
            }
        }
    }
}
