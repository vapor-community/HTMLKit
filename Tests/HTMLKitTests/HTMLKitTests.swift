import XCTest
@testable import HTMLKit

final class HTMLKitTests: XCTestCase {

    func testExample() throws {

        var renderer = HTMLRenderer()
        try renderer.add(template: StaticEmbedView())
        try renderer.add(template: StaticEmbedView())
        try renderer.add(template: SomeView())
        try renderer.add(template: ForEachView())
        try renderer.add(template: IFView())
        try renderer.add(template: VariableView())
        try renderer.add(template: MultipleContextualEmbed())
        try renderer.add(template: DynamicAttribute())
        try renderer.add(template: SelfLoopingView())

        try renderer.add(view: SimpleView())
        try renderer.add(view: UsingComponent())
        try renderer.add(view: ChainedEqualAttributes())
        try renderer.add(view: ChainedEqualAttributesDataNode())

        let staticEmbedRender = try renderer.render(StaticEmbedView.self, with: .init(string: "Hello", int: 2))
        let someViewRender = try renderer.render(SomeView.self, with: .contentWith(name: "Mats", title: "Welcome"))
        let forEachRender = try renderer.render(ForEachView.self, with: .content(from: ["1", "2", "3"]))
        let firstIfRender = try renderer.render(IFView.self, with: .init(name: "Per", age: 19, nullable: nil, bool: false))
        let secondIfRender = try renderer.render(IFView.self, with: .init(name: "Mats", age: 20, nullable: nil, bool: true))
        let thirdIfRender = try renderer.render(IFView.self, with: .init(name: "Per", age: 21, nullable: "Some", bool: false))
        let varialbeRender = try renderer.render(VariableView.self, with: .init(string: "<script>\"'&</script>"))
        let multipleEmbedRender = try renderer.render(MultipleContextualEmbed.self, with: .init(title: "Welcome", string: "String"))
        let nonDynamic = try renderer.render(DynamicAttribute.self, with: .init(isChecked: false, isActive: false))
        let oneDynamic = try renderer.render(DynamicAttribute.self, with: .init(isChecked: false, isActive: true))
        let twoDynamic = try renderer.render(DynamicAttribute.self, with: .init(isChecked: true, isActive: true))

        let simpleRender = try renderer.render(SimpleView.self)
        let chainedRender = try renderer.render(ChainedEqualAttributes.self)
        let chaindDataRender = try renderer.render(ChainedEqualAttributesDataNode.self)
//        let inputRender = try renderer.render(FormInput.self)


        XCTAssertEqual(multipleEmbedRender, "<html><head><title>Welcome</title><link href='some url' rel='stylesheet'><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><span>Some text</span><div><p>String</p><p>String</p></div></body></html>")
        XCTAssertEqual(varialbeRender, "<div><p>&lt;script&gt;&quot;&#39;&amp;&lt;/script&gt;</p><p><script>\"'&</script></p></div>")
        XCTAssertEqual(staticEmbedRender, "<div><div><p>Text</p></div><p>Hello</p><small>2</small></div>")
        XCTAssertEqual(someViewRender, "<html><head><title>Welcome</title><link href='some url' rel='stylesheet'><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><p>Hello Mats!</p></body></html>")
        XCTAssertEqual(forEachRender, "<div id='array'><p>1</p><p>2</p><p>3</p></div>")
        XCTAssertEqual(firstIfRender, "<div>I am a child</div>")
        XCTAssertEqual(secondIfRender, "<div><p>My name is: Mats!</p>I am growing<p>Simple bool</p></div>")
        XCTAssertEqual(thirdIfRender, "<div>I am older<b>Some</b><div>And</div></div>")
        XCTAssertEqual(simpleRender, "<div><p>Text</p></div>")
        XCTAssertEqual(chainedRender, "<div class='foo bar' id='id'></div>")
        XCTAssertEqual(chaindDataRender, "<img class='foo bar' id='id'>")
        XCTAssertEqual(nonDynamic, "<div class='foo'></div>")
        XCTAssertEqual(oneDynamic, "<div class='foo' active></div>")
        XCTAssertEqual(twoDynamic, "<div class='foo checked' active></div>")
//        XCTAssertEqual(inputRender, "<div class='form-group'><label for='test'>test</label><input class='form-control' type='email' required name='test' id='test' placeholder=''/></div>")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
