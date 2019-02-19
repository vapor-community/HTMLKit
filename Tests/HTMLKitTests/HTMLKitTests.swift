import XCTest
@testable import HTMLKit

final class HTMLKitTests: XCTestCase {

    func testExample() throws {

        var renderer = HTML.Renderer()
        try renderer.brewFormula(for: SomeView.self)
        try renderer.brewFormula(for: ForEachView.self)
        try renderer.brewFormula(for: IFView.self)


        let someViewRender = try renderer.render(SomeView.self, with: .contentWith(name: "Mats", title: "Welcome"))
        let forEachRender = try renderer.render(ForEachView.self, with: .content(from: ["1", "2", "3"]))
        let firstIfRender = try renderer.render(IFView.self, with: .init(name: "Not Mats", age: 19, nullable: nil, bool: false))
        let secondIfRender = try renderer.render(IFView.self, with: .init(name: "Mats", age: 20, nullable: nil, bool: true))
        let thirdIfRender = try renderer.render(IFView.self, with: .init(name: "", age: 21, nullable: "Some", bool: false))

        XCTAssertEqual(someViewRender, "<html><head><title>Welcome</title></head><body><p>Hello Mats!</p></body></html>")
        XCTAssertEqual(forEachRender, "<div id='array'><p>1</p><p>2</p><p>3</p></div>")
        XCTAssertEqual(firstIfRender, "<div>I am a child</div>")
        XCTAssertEqual(secondIfRender, "<div><p>My name is: Mats!</p>I am growing<p>Simple bool</p></div>")
        XCTAssertEqual(thirdIfRender, "<div>I am older<b>Some</b></div>")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
