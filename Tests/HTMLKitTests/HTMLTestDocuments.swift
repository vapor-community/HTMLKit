
@testable import HTMLKit

protocol HTMLTestable: TemplateBuilder {
    static var expextedOutput: String { get }
}


struct SimpleView: TemplateBuilder, HTMLTestable {

    static var expextedOutput: String = "<div><p>Text</p></div>"

    func build() -> CompiledTemplate {
        return
            div.child(
                p.child("Text")
        )
    }
}

struct StaticEmbedView: ContextualTemplate {

    struct Context {
        let string: String
        let int: Int?
    }

    func build() -> CompiledTemplate {
        return
            div.child(
                SimpleView(),
                p.child(
                    variable(\.string)
                ),

                renderIf(\.int != nil,
                         small.child(
                            variable(\.int)
                    )
                )
        )
//            div(
//                SimpleView.build(),
//                p( variable(\.string)),
//                renderIf(\.int != nil,
//                         small( variable(\.int))
//                )
//        )
    }
}

struct BaseView: ContextualTemplate {

    struct Context {
        let title: String
    }

    let body: CompiledTemplate

    func build() -> CompiledTemplate {
        return
            html.child(
                head.child(
                    title.child( variable(\.title)),
                    link.href("some url").rel("stylesheet"),
                    meta.name("viewport").content("width=device-width, initial-scale=1.0")
                ),
                body.child(
                    body
                ),

                // Used to check for an error ocurring when embedding two different `ContextualTemplate`s and a `localFormula` is involved
                renderIf(\.title == "May Cause an error when embedding multiple views", div)
        )
//            html(
//                head(
//                    title(variable(\.title))
//                ),
//                body(context.body)
//        )
    }
}

struct StringView: ContextualTemplate {

    struct Context {
        let string: String
    }

    func build() -> CompiledTemplate {
        return p.child( variable(\.string))
    }
}

struct SomeView: ContextualTemplate {

    struct Context {
        let name: String
        let baseContext: BaseView.Context

        static func contentWith(name: String, title: String) -> Context {
            return .init(name: name, baseContext: .init(title: title))
        }
    }

    func build() -> CompiledTemplate {
        return
            BaseView(
                body: p.child("Hello ", variable(\.name), "!")
            )
                .embed(withPath: \Context.baseContext)
    }
}

struct ForEachView: ContextualTemplate {

    struct Context {
        let array: [StringView.Context]

        static func content(from array: [String]) -> Context {
            return .init(array: array.map { .init(string: $0) })
        }
    }

    func build() -> CompiledTemplate {
        return
            div.id("array").child(
                forEach(in: \.array, render: StringView())
        )
    }
}


struct IFView: ContextualTemplate {

    struct Context {
        let name: String
        let age: Int
        let nullable: String?
        let bool: Bool
    }

    func build() -> CompiledTemplate {
        return
            div.child(
                renderIf(\.name == "Mats",
                    p.child("My name is: ", variable(\.name), "!")
                ),

                renderIf(\.age < 20,
                    "I am a child"
                ).elseIf(\.age > 20,
                    "I am older"
                ).else(
                    "I am growing"
                ),

                renderIf(\.nullable != nil,
                    b.child( variable(\.nullable))
                ).elseIf(\.bool,
                    p.child("Simple bool")
                ),

                renderIf(\.nullable == "Some" && \.name == "Per",
                         div.child("And")
                )

        )
//            div(
//                renderIf(\.name == "Mats",
//                    p("My name is: ", variable(\.name), "!")
//                ),
//
//                renderIf(\.age < 20,
//                    "I am a child"
//                ).elseIf(\.age > 20,
//                    "I am older"
//                ).else(render:
//                    "I am growing"
//                ),
//
//                renderIf(\.nullable != nil,
//                    b( variable(\.nullable))
//                ).elseIf(\.bool,
//                    p("Simple bool")
//                )
//            )
    }
}

class FormInput: TemplateBuilder {

    enum FormType: String {
        case email
        case text
        case number
        case password
    }

    let id: String
    let type: FormType
    let isRequired: Bool
    let placeholder: String?
    let label: String

    init(label: String, type: FormType, id: String? = nil, isRequired: Bool = false, placeholder: String? = nil) {
        self.label = label
        if let id = id {
            self.id = id
        } else {
            self.id = label.replacingOccurrences(of: " ", with: "-").lowercased()
        }
        self.type = type
        self.isRequired = isRequired
        self.placeholder = placeholder
    }

    func build() -> CompiledTemplate {

        var inputTag = input.id(id).class("form-controll").type(type.rawValue).name(id).placeholder(placeholder)
        if isRequired {
            inputTag = inputTag.required
        }

        return
            div.class("form-group").child(
                label.for(id).child(label),
                inputTag
        )
    }
}

struct UsingComponent: TemplateBuilder {

    func build() -> CompiledTemplate {
        return
            div.id("Test").child(
                FormInput(label: "Email", type: .email)
        )
    }
}

struct ChainedEqualAttributes: TemplateBuilder {

    func build() -> CompiledTemplate {
        return div.class("foo").class("bar").id("id")
    }
}

struct ChainedEqualAttributesDataNode: TemplateBuilder {

    func build() -> CompiledTemplate {
        return img.class("foo").class("bar").id("id")
    }
}

struct VariableView: ContextualTemplate {

    struct Context {
        let string: String
    }

    func build() -> CompiledTemplate {
        return div.child(
            p.child(
                variable(\.string)
            ),
            p.child(
                variable(\.string, escaping: .unsafeNone)
            )
        )
    }
}

struct MultipleContextualEmbed: ContextualTemplate {

    struct Context {
        let base: BaseView.Context
        let variable: VariableView.Context

        init(title: String, string: String) {
            base = .init(title: title)
            variable = .init(string: string)
        }
    }

    func build() -> CompiledTemplate {
        return
            BaseView(body: [
                span.child("Some text"),
                VariableView().embed(withPath: \Context.variable)
                ]).embed(withPath: \Context.base)
    }
}

struct DynamicAttribute: ContextualTemplate {

    struct Context {
        let isChecked: Bool
        let isActive: Bool
    }

    func build() -> CompiledTemplate {
        return dynamic(div).class("foo")
            .if(\.isChecked, add: .class("checked"))
            .if(\.isActive, add: .init(attribute: "active", value: nil))
    }
}
