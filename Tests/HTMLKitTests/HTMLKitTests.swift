import XCTest
@testable import HTMLKit

final class HTMLKitTests: XCTestCase {

    func testExample() throws {
        var renderer = HTMLRenderer()
        try renderer.add(SomeView.self)

        let context = SomeView.Context(name: "Mats", baseContext: .init(title: "This is my name"))
        renderer.render(SomeView.self, with: context)

        try print("\n\n", renderer.render(SomeView.self, with: context), "\n\n")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
