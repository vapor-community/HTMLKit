/*
 Abstract:
 The file tests performance of the rendering.
 */

import HTMLKit
import XCTest

final class PerformanceTests: XCTestCase {

    var renderer = Renderer()
    
    func testPerformance() throws {
        
        let context = SampleContext(id: 0, title: "TestPage", excerpt: "Testpage", modified: Date(), posted: Date())
        
        try renderer.add(layout: SampleView())
        
        measure {
            
            for _ in 0...1000 {
                _ = try! renderer.render(layout: SampleView.self, with: context)
            }
        }
    }
}
