/*
 Abstract:
 The file tests performance of the rendering.
 */

import HTMLKit
import XCTest

final class PerformanceTests: XCTestCase {
    
    func testPerformanceWithoutSafeMode() throws {
        
        let context = SampleContext(id: 0, title: "TestPage", excerpt: "Testpage", modified: Date(), posted: Date())
        
        let renderer = Renderer(mode: false)
        
        measure {
            
            for _ in 0...1000 {
                _ = try! renderer.render(view: SampleView(context: context))
            }
        }
    }
    
    func testPerformanceWithSafeMode() throws {
        
        let context = SampleContext(id: 0, title: "TestPage", excerpt: "Testpage", modified: Date(), posted: Date())
        
        let renderer = Renderer(mode: true)
        
        measure {
            
            for _ in 0...1000 {
                _ = try! renderer.render(view: SampleView(context: context))
            }
        }
    }
}
