
import HTMLKit
import Foundation

protocol HTMLTestable {
    static var expextedOutput: String { get }
}

typealias RootContext<Root> = ContextVariable<Root, Root>
typealias EmbedContext<Root, Value> = ContextVariable<Root, Value>


struct SimpleData {
    let string: String
    let int: Int?
}

struct SimpleView: StaticView, HTMLTestable {

    static var expextedOutput: String = "<div><p>Text</p></div>"

    var body: View {
        Div {
            P { "Text" }
        }
    }
}

struct StaticEmbedView: TemplateView {

    var context: RootContext<SimpleData> = .root(SimpleData.self)

    var body: View {
        Div {
            SimpleView()
            P {
                context.string
            }
            IF(context.int != nil) {
                Small {
                    context.int
                }
            }
        }
    }
}

struct BaseView<Root>: TemplateView {

    struct Context {
        let title: String
    }

    let context: EmbedContext<Root, Context>
    let content: View

    init(context: EmbedContext<Root, Context>, @HTMLBuilder content: () -> View) {
        self.context = context
        self.content = content()
    }

    var body: View {
        HTMLNode {
            Head {
                Title { context.title }
                Link()
                    .href("some url")
                    .rel("stylesheet")
                Meta()
                    .name("viewport")
                    .content("width=device-width, initial-scale=1.0")
            }
            Body {
                content
            }
        }
    }
}

struct SomeView: TemplateView {

    struct Context {
        let name: String
        let baseContext: BaseView<Context>.Context

        static func contentWith(name: String, title: String) -> Context {
            return .init(name: name, baseContext: .init(title: title))
        }
    }

    var context: RootContext<Context> = .root(Context.self)

    var body: View {
        BaseView(context: context.baseContext) {
            P { "Hello " + context.name + "!" }
        }
    }

//    func build() -> View {
//        return
//            embed(
//                BaseView(
//                    body: p.child("Hello ", variable(\.name), "!")
//                ),
//                withPath: \.baseContext)
//    }
}


//
//struct BaseView: ContextualTemplate {
//
//    struct Context {
//        let title: String
//    }
//
//    let body: View
//
//    func build() -> View {
//        return
//            html.child(
//                head.child(
//                    title.child( variable(\.title)),
//                    link.href("some url").rel("stylesheet"),
//                    meta.name("viewport").content("width=device-width, initial-scale=1.0")
//                ),
//                body.child(
//                    body
//                ),
//
//                // Used to check for an error ocurring when embedding two different `ContextualTemplate`s and a `localFormula` is involved
//                renderIf(\.title == "May Cause an error when embedding multiple views", div)
//        )
//    }
//}
//
//struct StringView: ContextualTemplate {
//
//    struct Context {
//        let string: String
//    }
//
//    func build() -> View {
//        return p.child( variable(\.string))
//    }
//}
//
//struct SomeView: ContextualTemplate {
//
//    struct Context {
//        let name: String
//        let baseContext: BaseView.Context
//
//        static func contentWith(name: String, title: String) -> Context {
//            return .init(name: name, baseContext: .init(title: title))
//        }
//    }
//
//    func build() -> View {
//        return
//            embed(
//                BaseView(
//                    body: p.child("Hello ", variable(\.name), "!")
//                ),
//                withPath: \.baseContext)
//    }
//}
//

struct ForEachView: TemplateView {

    struct Context {
        let array: [String]
    }

    let context: ContextVariable<Context, Context> = .root(Context.self)

    var body: View {
        Div {
            ForEach(context: context.array) { text in
                P { text }
            }
        }.id("array")
    }
}

//struct IFView: ContextualTemplate {
//
//    struct Context {
//        let name: String
//        let age: Int
//        let nullable: String?
//        let bool: Bool
//    }
//
//    func build() -> View {
//        return
//            div.child(
//                renderIf(
//                    \.name == "Mats",
//
//                    p.child(
//                        "My name is: " + variable(\.name) + "!"
//                    )
//                ),
//
//                renderIf(\.age < 20,
//                    "I am a child"
//                ).elseIf(\.age > 20,
//                    "I am older"
//                ).else(
//                    "I am growing"
//                ),
//
//                renderIf(\.nullable != nil,
//                    b.child( variable(\.nullable))
//                ).elseIf(\.bool,
//                    p.child("Simple bool")
//                ),
//
//                renderIf(
//                    \.nullable == "Some" && \.name == "Per",
//
//                    div.child("And")
//                )
//
//        )
//    }
//}
//
//class FormInput: StaticView {
//
//    enum FormType: String {
//        case email
//        case text
//        case number
//        case password
//    }
//
//    let id: String
//    let type: FormType
//    let isRequired: Bool
//    let placeholder: String?
//    let label: String
//
//    init(label: String, type: FormType, id: String? = nil, isRequired: Bool = false, placeholder: String? = nil) {
//        self.label = label
//        if let id = id {
//            self.id = id
//        } else {
//            self.id = label.replacingOccurrences(of: " ", with: "-").lowercased()
//        }
//        self.type = type
//        self.isRequired = isRequired
//        self.placeholder = placeholder
//    }
//
//    func build() -> View {
//
//        var inputTag = input.id(id).class("form-controll").type(type.rawValue).name(id).placeholder(placeholder)
//        if isRequired {
//            inputTag = inputTag.required
//        }
//
//        return
//            div.class("form-group").child(
//                label.for(id).child(label),
//                inputTag
//        )
//    }
//}
//
//struct UsingComponent: StaticView {
//
//    func build() -> View {
//        return
//            div.id("Test").child(
//                FormInput(label: "Email", type: .email)
//        )
//    }
//}
//
//struct ChainedEqualAttributes: StaticView {
//
//    func build() -> View {
//        return div.class("foo").class("bar").id("id")
//    }
//}
//
//struct ChainedEqualAttributesDataNode: StaticView {
//
//    func build() -> View {
//        return img.class("foo").class("bar").id("id")
//    }
//}
//
struct VariableView: TemplateView {

    let context: RootContext<String> = .root(String.self)

    var body: View {
        Div {
            P { context }
            P { context.escaping(.unsafeNone) }
        }
    }
}

//struct MultipleContextualEmbed: ContextualTemplate {
//
//    struct Context {
//        let base: BaseView.Context
//        let variable: VariableView.Context
//
//        init(title: String, string: String) {
//            base = .init(title: title)
//            variable = .init(string: string)
//        }
//    }
//
//    func build() -> View {
//        return
//            embed(
//                BaseView(
//                    body: [
//                        span.child("Some text"),
//                        embed(VariableView(),   withPath: \.variable),
//                        embed(UnsafeVariable(), withPath: \.variable)
//                    ]),
//                withPath: \.base)
//
//    }
//}
//
//struct DynamicAttribute: ContextualTemplate {
//
//    struct Context {
//        let isChecked: Bool
//        let isActive: Bool
//        let isOptional: Bool?
//    }
//
//    func build() -> View {
//        return div.class("foo")
//            .if(\.isChecked, add: .class("checked"))
//            .if(\.isActive, add: .init(attribute: "active", value: nil))
//            .if(isNil: \.isOptional, add: .selected)
//            .if(isNotNil: \.isOptional, add: .class("not-nil"))
//    }
//}
//
//struct SelfContextPassing: ContextualTemplate {
//
//    typealias Context = VariableView.Context
//
//    func build() -> View {
//        return div.child(
//            embed(
//                VariableView()
//            )
//        )
//    }
//}
//
//
//struct SelfLoopingView: ContextualTemplate {
//
//    typealias Context = [SimpleData]
//
//    func build() -> View {
//        return div.class("list").child(
//            forEach(render: StaticEmbedView())
//        )
//    }
//}
//
//struct UnsafeVariable: ContextualTemplate {
//
//    typealias Context = VariableView.Context
//
//    func build() -> View {
//        return div.child(
//            p.child(
//                variable(\.string)
//            ),
//            p.child(
//               unsafeVariable(in: MultipleContextualEmbed.self, for: \.base.title)
//            )
//        )
//    }
//}
//

struct MarkdownView: TemplateView {

    struct Context {
        let title: String
        let description: String
    }

    let context: RootContext<Context> = .root(Context.self)

    var body: View {
        Div {
            Markdown {
                "# Title: " + context.title
                "\n## Description here:\n"
                context.description
            }
        }
    }
}
//struct MarkdownView: ContextualTemplate {
//
//    struct Context {
//        let title: String
//        let description: String
//    }
//
//    func build() -> View {
//        return div.child(
//            markdown(
//                "# Title: ", variable(\.title),
//                "\n## Description here:\n", variable(\.description)
//            )
//        )
//    }
//}
//
//struct LocalizedView: LocalizedTemplate {
//
//    static let localePath: KeyPath<LocalizedView.Context, String>? = \.locale
//
//    enum LocalizationKeys: String {
//        case helloWorld = "hello.world"
//        case unreadMessages = "unread.messages"
//    }
//
//    /// The content needed to render StringKeys.unreadMessages
//    struct DescriptionContent: Codable {
//        let numberTest: Int
//    }
//
//    struct Context: Codable {
//        let locale: String
//        let description: DescriptionContent
//        let numberTest: Int
//    }
//
//    func build() -> View {
//        return div.child(
//            h1.child(
//                localize(.helloWorld)
//            ),
//            p.child(
//                localize(.unreadMessages, with: \.description)
//            ),
//            p.child(
//                localize(.unreadMessages, with: ["numberTest" : 1])
//            ),
//            p.child(
//                localizeWithContext(.unreadMessages)
//            )
//        )
//    }
//}
//
//
//struct DateView: ContextualTemplate {
//
//    struct Context {
//        let date: Date
//    }
//
//    func build() -> View {
//        return div.child(
//            p.child(
//                date(\.date, dateStyle: .short, timeStyle: .short)
//            ),
//            p.child(
//                date(\.date, format: "MM/dd/yyyy")
//            )
//        )
//    }
//}
//
//
//struct LocalizedDateView: LocalizedTemplate {
//
//    enum LocalizationKeys: String {
//        case none
//    }
//
//    static let localePath: KeyPath<LocalizedDateView.Context, String>? = \.locale
//
//    struct Context {
//        let date: Date
//        let locale: String
//    }
//
//    func build() -> View {
//        return div.child(
//            p.child(
//                date(\.date, dateStyle: .short, timeStyle: .short)
//            ),
//            p.child(
//                date(\.date, format: "MM/dd/yyyy")
//            )
//        )
//    }
//}
