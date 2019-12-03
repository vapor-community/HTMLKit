// swiftlint:disable:this force_try

import XCTest
//@testable import Vapor
import HTMLKit
import NIO

@available(OSX 10.15.0, *)
struct ForView: Template {
    @HTMLContext([String].self) var context

    var html: some HTML {
        Nav {
            context.forEach { item in
                P { item }
            }
        }
        .id("array")
    }
}

@available(OSX 10.15.0, *)
final class HTMLKitTests: XCTestCase {
    func testPerf() throws {
        let template = try TemplateCompiler<Properties>.compile(page)
        var output = ByteBufferAllocator().buffer(capacity: 10_000)
        let properties = Properties(
            header: true,
            links: [
                MenuLink(name: "WELKOM", link: "index.html"),
                MenuLink(name: "WIE WIJ ZIJN", link: "overons.html"),
                MenuLink(name: "WAT WIJ DOEN", link: "watwijdoen.html"),
                MenuLink(name: "CONTACT", link: "contact.html")
            ],
            text: """
            asf;jadgkhjefaldskfdghfiehjsgdfkgh
            fhsfhjksflhjfslkghjfslkgjsfklgjfslkgjsfgkljdfsgklsdj
            """
        )
        var isFirst = true

        measure {
            for _ in 0..<10_000 {
                try! template.render(output: &output, properties: properties)
                if isFirst {
                    print(output.getString(at: 0, length: output.readableBytes) ?? "")
                    isFirst = false
                }
            }
        }

//        output.clear()
//        measure {
//            for _ in 0..<10_000 {
//                try! CompiledTemplate.render(
//                    template: template,
//                    output: &output,
//                    properties: document
//                )
//            }
//        }
    }
}
