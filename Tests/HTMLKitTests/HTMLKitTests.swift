// swiftlint:disable:this force_try

import XCTest
//@testable import Vapor
@testable import HTMLKit
import Lingo

struct VariableTest: HTMLTemplate {
    typealias Context = String

    var body: HTML { context.escaping(.unsafeNone) }
}

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
//
//    func testVariable() {
//        let formula = HTMLRenderer.Formula()
//        try! VariableTest().prerender(formula)
//        let context = HTMLRenderer.ContextManager(rootContext: "Test")
//        measure {
//            for _ in 0...10_000 {
//                _ = try! formula.render(with: context)
//            }
//        }
//    }

//    func testVariableWithoutReflection() {
//        try! renderer.add(view: VariableTest(), with: "Test")
//        measure {
//            for _ in 0...10_000 {
//                _ = try! renderer.render(raw: "Test", with: "Test")
//            }
//        }
//    }
//
//    func testVariableRenderer() {
//        try! renderer.add(view: VariableTest())
//        measure {
//            for _ in 0...10_000 {
//                _ = try! renderer.render(raw: VariableTest.self, with: "Test")
//            }
//        }
//    }
//
//    func testIfPerformance() {
//        measure {
//            for _ in 0...10_000 {
//                _ = try! renderer.render(raw: IFView.self, with: .init(name: "Per", age: 21, nullable: "Some", bool: false))
//            }
//        }
//    }

//    func testIfPerformanceRuntime() {
//        measure {
//            for _ in 0...1000 {
//                _ = try! IFViewRuntime(context: .init(name: "Per", age: 21, nullable: "Some", bool: false)).render()
//            }
//        }
//    }
//
//    func testForPerformance() {
//        measure {
//            for _ in 0...1000 {
//                _ = try! renderer.render(raw: ForEachView.self, with: ["1", "2", "3", "four", "five"])
//            }
//        }
//    }

//    func testForPerformanceRuntime() {
//        measure {
//            for _ in 0...1000 {
//                _ = try! ForEachViewRuntime(context: ["1", "2", "3", "four", "five"]).render()
//            }
//        }
//    }
//
//    func testLoginPage() {
//        measure {
//            for _ in 0...10_000 {
//                _ = try! renderer.render(raw: LoginPageTest.self, with: "Some error message")
//            }
//        }
//    }

//    func testLoginPageRuntime() {
//        measure {
//            for _ in 0...1000 {
//                _ = try! LoginPageTestRuntime(errorMessage: "Some error message").render()
//            }
//        }
//    }
//
//    func testBigFor() {
//        let formula = HTMLRenderer.Formula()
//        try! BigForTest().prerender(formula)
//        let context = HTMLRenderer.ContextManager(rootContext: BigForTest.testData)
//        measure {
//            for _ in 0...10_000 {
//                _ = try! formula.render(with: context)
//            }
//        }
//    }

//    func testBigForRuntime() {
//        measure {
//            for _ in 0...1000 {
//                _ = try! BigForTestRuntime(sessions: BigForTest.testData).render()
//            }
//        }
//    }

//    func testDatePerformance() {
//        let testDate = Date()
//        measure {
//            for _ in 0...100 {
//                _ = try! renderer.render(raw: OptionalDateView.self, with: testDate)
//            }
//        }
//    }

//    func testView() {
//        let formula = HTMLRenderer.Formula()
//        try! Test().prerender(formula)
//        let context = Test.Context(
//            header: true,
//            links: [
//                MenuLink(name: "WELKOM", link: "index.html"),
//                MenuLink(name: "WIE WIJ ZIJN", link: "overons.html"),
//                MenuLink(name: "WAT WIJ DOEN", link: "watwijdoen.html"),
//                MenuLink(name: "CONTACT", link: "contact.html")
//            ],
//            text: """
//            asf;jadgkhjefaldskfdghfiehjsgdfkgh
//            fhsfhjksflhjfslkghjfslkgjsfklgjfslkgjsfgkljdfsgklsdj
//            """
//        )
//        var isFirst = true
//
//        measure {
//            for _ in 0...10_000 {
//                let output = try! formula.render(with: context, lingo: nil)
//                if isFirst {
//                    print(output)
//                    isFirst = false
//                }
//            }
//        }
//    }

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

        let staticEmbedRender   = try renderer.render(raw: StaticEmbedView.self,            with: .init(string: "Hello", int: 2))
        let someViewRender      = try renderer.render(raw: SomeView.self,                   with: .init(name: "Mats", title: "Welcome"))
        let someViewRenderTitle = try renderer.render(raw: SomeViewStaticTitle.self,        with: "Mats")
        let forEachRender       = try renderer.render(raw: ForEachView.self,                with: ["1", "2", "3"])
        let firstIfRender       = try renderer.render(raw: IFView.self,                     with: .init(name: "Per", age: 19, nullable: nil, bool: false))
        let secondIfRender      = try renderer.render(raw: IFView.self,                     with: .init(name: "Mats", age: 20, nullable: nil, bool: true))
        let thirdIfRender       = try renderer.render(raw: IFView.self,                     with: .init(name: "Per", age: 21, nullable: "Some", bool: false))
        let staticIfRender      = try renderer.render(raw: StaticIfPrerenderingTest.self,   with: false)
//        let varialbeRender      = try renderer.render(raw: VariableView.self, with: "<script>\"'&</script>")
        let selfLoop            = try renderer.render(raw: SelfLoopingView.self,            with: [.init(string: "Hello", int: 2), .init(string: "Morn", int: nil)])
        let selfPassing         = try renderer.render(raw: SelfContextPassing.self,         with: "Self")
        let multipleEmbedRender = try renderer.render(raw: MultipleContextualEmbed.self,    with: .init(title: "Welcome", string: "String"))
        let nonDynamic          = try renderer.render(raw: DynamicAttribute.self,           with: .init(isChecked: false, isActive: false, isOptional: nil))
        let oneDynamic          = try renderer.render(raw: DynamicAttribute.self,           with: .init(isChecked: false, isActive: true, isOptional: true))
        let twoDynamic          = try renderer.render(raw: DynamicAttribute.self,           with: .init(isChecked: true, isActive: true, isOptional: false))
//        let markdown            = try renderer.render(raw: MarkdownView.self, with: .init(title: "Hello", description: "World"))
        let english             = try renderer.render(raw: LocalizedView.self,              with: .init(locale: "en", description: .init(numberTest: 3), numberTest: 1))
        let norwegian           = try renderer.render(raw: LocalizedView.self,              with: .init(locale: "nb", description: .init(numberTest: 3), numberTest: 1))

        let date                = try renderer.render(raw: DateView.self,                   with: testDate)
        let optionalDateNil     = try renderer.render(raw: OptionalDateView.self,           with: nil)
        let optionalDate        = try renderer.render(raw: OptionalDateView.self,           with: testDate)
        let englishDate         = try renderer.render(raw: LocalizedDateView.self,          with: .init(date: testDate, locale: "en"))
        let norwegianDate       = try renderer.render(raw: LocalizedDateView.self,          with: .init(date: testDate, locale: "nb"))


        let simpleRender        = try renderer.render(raw: SimpleView.self)
        let chainedRender       = try renderer.render(raw: ChainedEqualAttributes.self)
        let chaindDataRender    = try renderer.render(raw: ChainedEqualAttributesDataNode.self)
////        let inputRender = try renderer.render(FormInput.self)

        XCTAssertEqual(multipleEmbedRender, "<!DOCTYPE html><html><head><title>Welcome</title><link href='some url' rel='stylesheet'><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><span>Some text</span><div><p>String</p><p>String</p></div><div><p>String</p><p>Welcome</p></div></body></html>")
//        XCTAssertEqual(varialbeRender, "<div><p>&lt;script&gt;&quot;&#39;&amp;&lt;/script&gt;</p><p><script>\"'&</script></p></div>")
        XCTAssertEqual(staticEmbedRender, "<div><div><p>Text</p></div><p>Hello</p><small>2</small></div>")
        XCTAssertEqual(someViewRender, "<!DOCTYPE html><html><head><title>Welcome</title><link href='some url' rel='stylesheet'><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><p>Hello Mats!</p></body></html>")
        XCTAssertEqual(someViewRenderTitle, "<!DOCTYPE html><html><head><title>Test</title><link href='some url' rel='stylesheet'><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><p>Hello Mats!</p></body></html>")
        XCTAssertEqual(forEachRender, "<div id='array'><p>1</p><p>2</p><p>3</p></div>")
        XCTAssertEqual(firstIfRender, "<div>I am a child</div>")
        XCTAssertEqual(secondIfRender, "<div><p dir='ltr'>My name is: Mats!</p>I am growing<p>Simple bool</p></div>")
        XCTAssertEqual(thirdIfRender, "<div>I am older<b>Some</b><div>And</div></div>")
        XCTAssertEqual(staticIfRender, "<div>This should be prerenderd<p>This as well</p><p>This should be prerenderd</p></div>")
        XCTAssertEqual(simpleRender, "<div><p>Text</p></div>")
        XCTAssertEqual(selfLoop, "<div class='list'><div><div><p>Text</p></div><p>Hello</p><small>2</small></div><div><div><p>Text</p></div><p>Morn</p></div></div>")
        XCTAssertEqual(selfPassing, "<div><div><p>Self</p><p>Self</p></div></div>")
        XCTAssertEqual(chainedRender, "<div class='foo bar' id='id'></div>")
        XCTAssertEqual(chaindDataRender, "<img class='foo bar' id='id'>")
        XCTAssertEqual(nonDynamic, "<div  selected class='foo'></div>")
        XCTAssertEqual(oneDynamic, "<div active  class='foo not-nil'></div>")
        XCTAssertEqual(twoDynamic, "<div active  class='foo checked not-nil'></div>")
//        XCTAssertEqual(markdown.replacingOccurrences(of: "\n", with: ""), "<div><h1>Title: Hello</h1><h2>Description here:</h2><p>World</p></div>")
        XCTAssertEqual(english, "<div><h1>Hello World!</h1><p>You have 3 unread messages.</p><p>You have 2 unread messages.</p><p>You have an unread message</p></div>")
        XCTAssertEqual(norwegian, "<div><h1>Hei Verden!</h1><p>Du har 3 uleste meldinger.</p><p>Du har 2 uleste meldinger.</p><p>Du har en ulest melding</p></div>")
        XCTAssertEqual(date, "<div><p>\(shortDateFormatter.string(from: testDate))</p><p>\(customDateFormatter.string(from: testDate))</p></div>")
        XCTAssertEqual(optionalDateNil, "<div><p></p><p></p></div>")
        XCTAssertEqual(optionalDate, "<div><p>\(shortDateFormatter.string(from: testDate))</p><p>\(customDateFormatter.string(from: testDate))</p></div>")

        shortDateFormatter.locale = .init(identifier: "en")
        customDateFormatter.locale = .init(identifier: "en")
        XCTAssertEqual(englishDate, "<div><p>\(shortDateFormatter.string(from: testDate))</p><p>\(customDateFormatter.string(from: testDate))</p></div>")

        shortDateFormatter.locale = .init(identifier: "nb")
        customDateFormatter.locale = .init(identifier: "nb")
        XCTAssertEqual(norwegianDate, "<div><p>\(shortDateFormatter.string(from: testDate))</p><p>\(customDateFormatter.string(from: testDate))</p></div>")
//        XCTAssertEqual(inputRender, "<div class='form-group'><label for='test'>test</label><input class='form-control' type='email' required name='test' id='test' placeholder=''/></div>")
    }

//    func testProvider() throws {
//
//        let expectedResult = try renderer.render(raw: SimpleView.self)
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

        let renderer = HTMLRenderer()

        renderer.lingo = try Lingo(rootPath: path, defaultLocale: "en")

        renderer.calendar = .current
        renderer.timeZone = .current

        try renderer.add(view: StaticEmbedView())
        try renderer.add(view: SomeView())
        try renderer.add(view: SomeViewStaticTitle())
        try renderer.add(view: ForEachView())
        try renderer.add(view: IFView())
//        try renderer.add(view: VariableView())
        try renderer.add(view: MultipleContextualEmbed())
        try renderer.add(view: DynamicAttribute())
        try renderer.add(view: SelfLoopingView())
        try renderer.add(view: SelfContextPassing())
//        try renderer.add(view: MarkdownView())
        try renderer.add(view: LocalizedView())
        try renderer.add(view: DateView())
        try renderer.add(view: OptionalDateView())
        try renderer.add(view: LocalizedDateView())
//
        try renderer.add(view: SimpleView())
//        try renderer.add(template: UsingComponent())
        try renderer.add(view: ChainedEqualAttributes())
        try renderer.add(view: ChainedEqualAttributesDataNode())
        try renderer.add(view: StaticIfPrerenderingTest())

//        try renderer.add(view: LoginPageTest())
//        try renderer.add(view: BigForTest())
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
