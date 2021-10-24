import XCTest
@testable import HTMLKitTests

XCTMain([
    testCase(ElementTests.allTests),
    testCase(LocalizationTests.allTests),
    testCase(PerformanceTests.allTests),
    testCase(RenderingTests.allTests)
])
