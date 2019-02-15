
@testable import HTMLKit

protocol HTMLTestable: ViewBuildable {
    static var expextedOutput: String { get }
}


struct SimpleView: StaticTemplate, HTMLTestable {

    static var expextedOutput: String = "<div><p>Text</p></div>"

    static func build() -> Mappable {
        return
            div(children:
                p(children: "Text")
            )
    }
}

struct BaseView: ViewTemplate {

    struct Context {
        let title: String
    }

    struct ViewContext {
        let body: Mappable
    }

    static func build(with context: BaseView.ViewContext) -> Mappable {
        return
            html(children:
                head(children: title(children: variable(at: \.title))),
                body(children: context.body)
        )
    }
}

struct StringView: Template {

    struct Context {
        let string: String
    }

    static func build() -> Mappable {
        return
            p(children: variable(at: \.string))
    }

}

struct SomeView: Template {

    struct Context {
        let name: String
        let baseContext: BaseView.Context

        static func contentWith(name: String, title: String) -> Context {
            return .init(name: name, baseContext: .init(title: title))
        }
    }

    static func build() -> Mappable {

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

struct ForEachView: Template {

    struct Context {
        let array: [StringView.Context]

        static func content(from array: [String]) -> Context {
            return .init(array: array.map { .init(string: $0) })
        }
    }

    static func build() -> Mappable {
        return
            div(attributes: [.id("array")],
                children: forEach(in: \.array, render: StringView.self)
        )
    }
}
