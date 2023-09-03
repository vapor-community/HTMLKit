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
}
