// swiftlint:disable:this force_try

import XCTest
//@testable import Vapor
@testable import HTMLKit
//import Lingo

final class HTMLKitTests: XCTestCase {

//    var app: Application!

    var renderer: HTMLRenderer!

    override func setUp() {
//        let config = Config.default()
//        var services = Services.default()

        try! setupRenderer()

//        services.register(renderer, as: HTMLRenderable.self)
//
//        func routes(_ router: Router) throws {
//
//            router.get("simpleView") { req in
//                return try req.renderer()
//                    .render(SimpleView.self)
//            }
//        }
//
//        let router = EngineRouter.default()
//        try! routes(router)
//        services.register(router, as: Router.self)
//
//        app = try! Application(config: config, services: services)
    }

    func testIfPerformance() {
        measure {
            for _ in 0...100 {
                _ = try! renderer.renderRaw(IFView.self, with: .init(name: "Per", age: 21, nullable: "Some", bool: false))
            }
        }
    }

    func testForPerformance() {
        measure {
            for _ in 0...100 {
                _ = try! renderer.renderRaw(ForEachView.self, with: .init(array: ["1", "2", "3", "four", "five"]))
            }
        }
    }

    func testDatePerformance() {
        let testDate = Date()
        measure {
            for _ in 0...100 {
                _ = try! renderer.renderRaw(OptionalDateView.self, with: testDate)
            }
        }
    }

    func testHtmlRenderingTests() throws {

        let testDate = Date()

        let shortDateFormatter = DateFormatter()
        let customDateFormatter = DateFormatter()
        shortDateFormatter.calendar = .current
        shortDateFormatter.timeZone = .current
        shortDateFormatter.dateStyle = .short
        shortDateFormatter.timeStyle = .short
        customDateFormatter.calendar = .current
        customDateFormatter.timeZone = .current
        customDateFormatter.dateFormat = "MM/dd/yyyy"

        let staticEmbedRender   = try renderer.renderRaw(StaticEmbedView.self, with: .init(string: "Hello", int: 2))
        let someViewRender      = try renderer.renderRaw(SomeView.self, with: .contentWith(name: "Mats", title: "Welcome"))
        let someViewRenderTitle = try renderer.renderRaw(SomeViewStaticTitle.self, with: "Mats")
        let forEachRender       = try renderer.renderRaw(ForEachView.self, with: .init(array: ["1", "2", "3"]))
        let firstIfRender       = try renderer.renderRaw(IFView.self, with: .init(name: "Per", age: 19, nullable: nil, bool: false))
        let secondIfRender      = try renderer.renderRaw(IFView.self, with: .init(name: "Mats", age: 20, nullable: nil, bool: true))
        let thirdIfRender       = try renderer.renderRaw(IFView.self, with: .init(name: "Per", age: 21, nullable: "Some", bool: false))
        let staticIfRender      = try renderer.renderRaw(StaticIfPrerenderingTest.self, with: false)
//        let varialbeRender      = try renderer.renderRaw(VariableView.self, with: "<script>\"'&</script>")
        let selfLoop            = try renderer.renderRaw(SelfLoopingView.self, with: [.init(string: "Hello", int: 2), .init(string: "Morn", int: nil)])
        let selfPassing         = try renderer.renderRaw(SelfContextPassing.self, with: "Self")
        let multipleEmbedRender = try renderer.renderRaw(MultipleContextualEmbed.self, with: .init(title: "Welcome", string: "String"))
//        let nonDynamic          = try renderer.renderRaw(DynamicAttribute.self, with: .init(isChecked: false, isActive: false, isOptional: nil))
//        let oneDynamic          = try renderer.renderRaw(DynamicAttribute.self, with: .init(isChecked: false, isActive: true, isOptional: true))
//        let twoDynamic          = try renderer.renderRaw(DynamicAttribute.self, with: .init(isChecked: true, isActive: true, isOptional: false))
//        let markdown            = try renderer.renderRaw(MarkdownView.self, with: .init(title: "Hello", description: "World"))
//        let english             = try renderer.renderRaw(LocalizedView.self, with: .init(locale: "en", description: .init(numberTest: 1), numberTest: 1))
//        let norwegian           = try renderer.renderRaw(LocalizedView.self, with: .init(locale: "nb", description: .init(numberTest: 2), numberTest: 2))
//
        let date                = try renderer.renderRaw(DateView.self, with: testDate)
        let optionalDateNil     = try renderer.renderRaw(OptionalDateView.self, with: nil)
        let optionalDate        = try renderer.renderRaw(OptionalDateView.self, with: testDate)
//        let englishDate         = try renderer.renderRaw(LocalizedDateView.self, with: .init(date: testDate, locale: "en"))
//        let norwegianDate       = try renderer.renderRaw(LocalizedDateView.self, with: .init(date: testDate, locale: "nb"))
//
//
        let simpleRender        = try renderer.renderRaw(SimpleView.self)
        let chainedRender       = try renderer.renderRaw(ChainedEqualAttributes.self)
        let chaindDataRender    = try renderer.renderRaw(ChainedEqualAttributesDataNode.self)
////        let inputRender = try renderer.render(FormInput.self)
//
        XCTAssertEqual(multipleEmbedRender, "<html><head><title>Welcome</title><link href='some url' rel='stylesheet'><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><span>Some text</span><div><p>String</p><p>String</p></div><div><p>String</p><p>Welcome</p></div></body></html>")
//        XCTAssertEqual(varialbeRender, "<div><p>&lt;script&gt;&quot;&#39;&amp;&lt;/script&gt;</p><p><script>\"'&</script></p></div>")
        XCTAssertEqual(staticEmbedRender, "<div><div><p>Text</p></div><p>Hello</p><small>2</small></div>")
        XCTAssertEqual(someViewRender, "<html><head><title>Welcome</title><link href='some url' rel='stylesheet'><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><p>Hello Mats!</p></body></html>")
        XCTAssertEqual(someViewRenderTitle, "<html><head><title>Test</title><link href='some url' rel='stylesheet'><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><p>Hello Mats!</p></body></html>")
        XCTAssertEqual(forEachRender, "<div id='array'><p>1</p><p>2</p><p>3</p></div>")
        XCTAssertEqual(firstIfRender, "<div>I am a child</div>")
        XCTAssertEqual(secondIfRender, "<div><p>My name is: Mats!</p>I am growing<p>Simple bool</p></div>")
        XCTAssertEqual(thirdIfRender, "<div>I am older<b>Some</b><div>And</div></div>")
        XCTAssertEqual(staticIfRender, "<div>This should be prerenderd<p>This as well</p><p>This should be prerenderd</p></div>")
        XCTAssertEqual(simpleRender, "<div><p>Text</p></div>")
        XCTAssertEqual(selfLoop, "<div class='list'><div><div><p>Text</p></div><p>Hello</p><small>2</small></div><div><div><p>Text</p></div><p>Morn</p></div></div>")
        XCTAssertEqual(selfPassing, "<div><div><p>Self</p><p>Self</p></div></div>")
        XCTAssertEqual(chainedRender, "<div class='foo bar' id='id'></div>")
        XCTAssertEqual(chaindDataRender, "<img class='foo bar' id='id'>")
//        XCTAssertEqual(nonDynamic, "<div class='foo' selected></div>")
//        XCTAssertEqual(oneDynamic, "<div class='foo not-nil' active></div>")
//        XCTAssertEqual(twoDynamic, "<div class='foo checked not-nil' active></div>")
//        XCTAssertEqual(markdown.replacingOccurrences(of: "\n", with: ""), "<div><h1>Title: Hello</h1><h2>Description here:</h2><p>World</p></div>")
//        XCTAssertEqual(english, "<div><h1>Hello World!</h1><p>You have an unread message</p><p>You have an unread message</p><p>You have an unread message</p></div>")
//        XCTAssertEqual(norwegian, "<div><h1>Hei Verden!</h1><p>Du har 2 uleste meldinger.</p><p>Du har en ulest melding</p><p>Du har 2 uleste meldinger.</p></div>")
        XCTAssertEqual(date, "<div><p>\(shortDateFormatter.string(from: testDate))</p><p>\(customDateFormatter.string(from: testDate))</p></div>")
        XCTAssertEqual(optionalDateNil, "<div><p></p><p></p></div>")
        XCTAssertEqual(optionalDate, "<div><p>\(shortDateFormatter.string(from: testDate))</p><p>\(customDateFormatter.string(from: testDate))</p></div>")
//
//        shortDateFormatter.locale = .init(identifier: "en")
//        customDateFormatter.locale = .init(identifier: "en")
//        XCTAssertEqual(englishDate, "<div><p>\(shortDateFormatter.string(from: testDate))</p><p>\(customDateFormatter.string(from: testDate))</p></div>")
//
//        shortDateFormatter.locale = .init(identifier: "nb")
//        customDateFormatter.locale = .init(identifier: "nb")
//        XCTAssertEqual(norwegianDate, "<div><p>\(shortDateFormatter.string(from: testDate))</p><p>\(customDateFormatter.string(from: testDate))</p></div>")
////        XCTAssertEqual(inputRender, "<div class='form-group'><label for='test'>test</label><input class='form-control' type='email' required name='test' id='test' placeholder=''/></div>")
    }

//    func testProvider() throws {
//
//        let expectedResult = try renderer.renderRaw(SimpleView.self)
//        let response = try app.getResponse(to: "/simpleView")
//
//        XCTAssertEqual(response.http.body.string, expectedResult)
//        XCTAssertEqual(response.http.status, .ok)
//        XCTAssertTrue(response.http.headers.contains(name: "content-type"))
//    }


    private func setupRenderer() throws {
        let path = NSTemporaryDirectory().appending("HTMLKitTests")
        try! FileManager().createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

        try! HTMLKitTests.enLocalizations.write(toFile: path + "/en.json", atomically: true, encoding: .utf8)
        try! HTMLKitTests.nbLocalizations.write(toFile: path + "/nb.json", atomically: true, encoding: .utf8)

        var renderer = HTMLRenderer()

//        renderer.lingo = try Lingo(rootPath: path, defaultLocale: "en")

        renderer.calendar = .current
        renderer.timeZone = .current

        try renderer.add(view: StaticEmbedView())
        try renderer.add(view: SomeView())
        try renderer.add(view: SomeViewStaticTitle())
        try renderer.add(view: ForEachView())
        try renderer.add(view: IFView())
//        try renderer.add(view: VariableView())
        try renderer.add(view: MultipleContextualEmbed())
//        try renderer.add(template: DynamicAttribute())
        try renderer.add(view: SelfLoopingView())
        try renderer.add(view: SelfContextPassing())
//        try renderer.add(view: MarkdownView())
//        try renderer.add(template: LocalizedView())
        try renderer.add(view: DateView())
        try renderer.add(view: OptionalDateView())
//        try renderer.add(template: LocalizedDateView())
//
        try renderer.add(view: SimpleView())
//        try renderer.add(template: UsingComponent())
        try renderer.add(view: ChainedEqualAttributes())
        try renderer.add(view: ChainedEqualAttributesDataNode())
        try renderer.add(view: StaticIfPrerenderingTest())
//
        self.renderer = renderer
    }


    private static var enLocalizations: String {
        return """
{
    "hello.world": "Hello World!",
    "unread.messages": {
        "one": "You have an unread message",
        "other": "You have %{numberTest} unread messages."
    },
    "input": "Some Value %{value}"
}
"""
    }

    private static var nbLocalizations: String {
        return """
{
    "hello.world": "Hei Verden!",
    "unread.messages": {
        "one": "Du har en ulest melding",
        "other": "Du har %{numberTest} uleste meldinger."
    },
    "input": "En verdi %{value}"
}
"""
    }

    static var allTests = [
        ("testHtmlRenderingTests", testHtmlRenderingTests),
//        ("testProvider", testProvider)
    ]
}


//extension HTTPBody {
//    var string: String {
//        return String(data: data!, encoding: .utf8)!
//    }
//}
//
//extension Application {
//    func getResponse(to path: String) throws -> Response {
//        let responder = try self.make(Responder.self)
//        let request = HTTPRequest(method: .GET, url: URL(string: path)!)
//        let wrappedRequest = Request(http: request, using: self)
//        return try responder.respond(to: wrappedRequest).wait()
//    }
//}
