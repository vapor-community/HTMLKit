
@testable import HTMLKit

protocol HTMLTestable: HTMLView {
    static var expextedOutput: String { get }
}


struct SimpleView: HTMLView, HTMLTestable {

    static var expextedOutput: String = "<div><p>Text</p></div>"

    func build() throws -> HTMLRepresentable {
        return
            div(children:
                p(children: "Text")
            )
    }
}

struct BaseView: HTMLViewTemplate {

    struct Context {
        let title: String
    }

    struct ViewContext {
        let body: HTMLRepresentable
    }

    static func build(with context: BaseView.ViewContext) -> HTMLRepresentable {
        return
            html(children:
                head(children: title(children: variable(at: \.title))),
                body(children: context.body)
        )
    }
}

struct SomeView: HTMLTemplate {

    struct Context {
        let name: String
        let baseContext: BaseView.Context
    }

    static func build(with context: EmptyContext) -> HTMLRepresentable {
        return
            embed(
                BaseView.self,
                with: .init(
                    body: p(children: "Hello ", variable(at: \.name), "!")
                ),
                contextPath: \.baseContext
            )
    }
}
