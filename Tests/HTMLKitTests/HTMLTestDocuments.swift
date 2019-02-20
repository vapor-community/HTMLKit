
@testable import HTMLKit

protocol HTMLTestable: StaticViewBuildable {
    static var expextedOutput: String { get }
}


struct SimpleView: Viewable, HTMLTestable {

    static var expextedOutput: String = "<div><p>Text</p></div>"

    func build() -> Mappable {
        return
            div( p("Text"))
    }
}

struct StaticEmbedView: Templating {

    struct Context {
        let string: String
        let int: Int?
    }

    static func build() -> Mappable {
        return
            div(
                SimpleView(),
                p( variable(at: \.string)),
                renderIf(\.int != nil,
                         small( variable(at: \.int))
                )
        )
    }
}

struct BaseView: ViewTemplating {

    struct Context {
        let title: String
    }

    struct ViewContext {
        let body: Mappable
    }

    static func build(with context: BaseView.ViewContext) -> Mappable {
        return
            html(
                head(
                    title(variable(at: \.title))
                ),
                body(context.body)
        )
    }
}

struct StringView: Templating {

    struct Context {
        let string: String
    }

    static func build() -> Mappable {
        return
            p(variable(at: \.string))
    }

}

struct SomeView: Templating {

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
                    body: p("Hello ", variable(at: \.name), "!")
                ),
                contextPath: \.baseContext
            )
    }
}

struct ForEachView: Templating {

    struct Context {
        let array: [StringView.Context]

        static func content(from array: [String]) -> Context {
            return .init(array: array.map { .init(string: $0) })
        }
    }

    static func build() -> Mappable {
        return
            div(attr: [.id("array")],
                forEach(in: \.array, render: StringView.self)
        )
    }
}


struct IFView: Templating {

    struct Context {
        let name: String
        let age: Int
        let nullable: String?
        let bool: Bool
    }

    static func build() -> Mappable {
        return
            div(
                renderIf(\.name == "Mats",
                    p("My name is: ", variable(at: \.name), "!")
                ),

                renderIf(\.age < 20,
                    "I am a child"
                ).elseIf(\.age > 20,
                    "I am older"
                ).else(render:
                    "I am growing"
                ),

                renderIf(\.nullable != nil,
                    b( variable(at: \.nullable))
                ).elseIf(\.bool,
                    p("Simple bool")
                )
            )
    }
}

class FormInput: Viewable {

    let id: String
    let type: String
    let required: Bool
    let placeholder: String
    let label: String

    init(label: String, type: String, required: Bool = true, placeholder: String = "", id: String? = nil) {
        self.label = label
        self.type = type
        self.required = required
        self.placeholder = placeholder
        self.id = id ?? label.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    func build() -> Mappable {
        return
            div(attr: [.class("form-group")],
                label(attr: [.for(id)], label),
                input(attr: .class("form-control"), .type(type), .required, .name(id), .id(id), .placeholder(placeholder))
        )
    }
}
