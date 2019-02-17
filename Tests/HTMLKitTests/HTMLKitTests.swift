import XCTest
@testable import HTMLKit

final class HTMLKitTests: XCTestCase {

    func testExample() throws {

        var renderer = HTML.Renderer()
        try renderer.brewFormula(for: SomeView.self)
        try renderer.brewFormula(for: ForEachView.self)


        let someViewRender = try renderer.render(SomeView.self, with: .contentWith(name: "Mats", title: "Welcome"))
        let forEachRender = try renderer.render(ForEachView.self, with: .content(from: ["1", "2", "3"]))

        XCTAssertEqual(someViewRender, "<html><head><title>Welcome</title></head><body><p>Hello Mats!</p></body></html>")
        XCTAssertEqual(forEachRender, "<div id='array'><p>1</p><p>2</p><p>3</p></div>")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
