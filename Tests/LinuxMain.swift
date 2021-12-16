import XCTest
@testable import HTMLKitTests

XCTMain([
    testCase(TemplatingTests.allTests),
    testCase(ComponentTests.allTests),
    testCase(ContextTests.allTests),
    testCase(ElementTests.allTests),
    testCase(LocalizationTests.allTests),
    testCase(PerformanceTests.allTests),
    testCase(RenderingTests.allTests)
])
