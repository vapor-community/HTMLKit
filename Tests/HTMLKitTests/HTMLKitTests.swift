// swiftlint:disable:this force_try

import XCTest
//@testable import Vapor
import HTMLKit
import NIO

final class HTMLKitTests: XCTestCase {
    func testPerf() throws {
        let template = TemplateCompiler.compile(page)
        var output = ByteBufferAllocator().buffer(capacity: 10_000)
        let properties = Properties(
            links: [
                MenuLink(name: "WELKOM", link: "index.html"),
                MenuLink(name: "WIE WIJ ZIJN", link: "overons.html"),
                MenuLink(name: "WAT WIJ DOEN", link: "watwijdoen.html"),
                MenuLink(name: "CONTACT", link: "contact.html")
            ]
        )
        
        measure {
            try! CompiledTemplate.render(
                template: template,
                output: &output,
                context: properties
            )
        }
    }
}
