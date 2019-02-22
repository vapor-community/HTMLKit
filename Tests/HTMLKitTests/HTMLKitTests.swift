import XCTest
@testable import HTMLKit

final class HTMLKitTests: XCTestCase {

    func testExample() throws {

        var renderer = HTML.Renderer()
        try renderer.brewFormula(for: StaticEmbedView.self)
        try renderer.brewFormula(for: SomeView.self)
        try renderer.brewFormula(for: ForEachView.self)
        try renderer.brewFormula(for: IFView.self)
        try renderer.brewFormula(for: SimpleView.self)
        try renderer.brewFormula(for: BuildTest.self)
//        try renderer.brewFormula(for: FormInput.self)

        let staticEmbedRender = try renderer.render(StaticEmbedView.self, with: .init(string: "Hello", int: 2))
        let someViewRender = try renderer.render(SomeView.self, with: .contentWith(name: "Mats", title: "Welcome"))
        let forEachRender = try renderer.render(ForEachView.self, with: .content(from: ["1", "2", "3"]))
        let firstIfRender = try renderer.render(IFView.self, with: .init(name: "Per", age: 19, nullable: nil, bool: false))
        let secondIfRender = try renderer.render(IFView.self, with: .init(name: "Mats", age: 20, nullable: nil, bool: true))
        let thirdIfRender = try renderer.render(IFView.self, with: .init(name: "", age: 21, nullable: "Some", bool: false))

        let simpleRender = try renderer.render(SimpleView.self)
//        let inputRender = try renderer.render(FormInput.self)


        XCTAssertEqual(staticEmbedRender, "<div><div><p>Text</p></div><p>Hello</p><small>2</small></div>")
        XCTAssertEqual(someViewRender, "<html><head><title>Welcome</title><link href='some url' rel='stylesheet'/><meta name='viewport' content='width=device-width, initial-scale=1.0'/></head><body><p>Hello Mats!</p></body></html>")
        XCTAssertEqual(forEachRender, "<div id='array'><p>1</p><p>2</p><p>3</p></div>")
        XCTAssertEqual(firstIfRender, "<div>I am a child</div>")
        XCTAssertEqual(secondIfRender, "<div><p>My name is: Mats!</p>I am growing<p>Simple bool</p></div>")
        XCTAssertEqual(thirdIfRender, "<div>I am older<b>Some</b></div>")
        XCTAssertEqual(simpleRender, "<div><p>Text</p></div>")
//        XCTAssertEqual(inputRender, "<div class='form-group'><label for='test'>test</label><input class='form-control' type='email' required name='test' id='test' placeholder=''/></div>")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
