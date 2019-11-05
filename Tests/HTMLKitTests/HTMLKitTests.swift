// swiftlint:disable:this force_try

import XCTest
//@testable import Vapor
import HTMLKit
import NIO

@available(OSX 10.15.0, *)
final class HTMLKitTests: XCTestCase {
    func testPerf() throws {
        let template = try TemplateCompiler.compile(page)
        var output = ByteBufferAllocator().buffer(capacity: 10_000)
        let properties = Properties(
            links: [
                MenuLink(name: "WELKOM", link: "index.html"),
                MenuLink(name: "WIE WIJ ZIJN", link: "overons.html"),
                MenuLink(name: "WAT WIJ DOEN", link: "watwijdoen.html"),
                MenuLink(name: "CONTACT", link: "contact.html")
            ]
        )
        
        var first = true
        measure {
            try! CompiledTemplate.render(
                template: template,
                output: &output,
                properties: properties
            )
            
            if first {
                print(output.getString(at: 0, length: output.readableBytes))
                first = false
            }
        }
    }
}
