
import HTMLKit
import Foundation
import XCTest

protocol HTMLTestable {
    static var expextedOutput: String { get }
}


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

    var context: RootValue<SimpleData> = .root()

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

struct BaseView<Root>: StaticView {

    let context: TemplateValue<Root, String>
    let content: View

    init(context: TemplateValue<Root, String>, @HTMLBuilder content: () -> View) {
        self.context = context
        self.content = content()
    }

    var body: View {
        HTMLNode {
            Head {
                Title { context }
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

    struct Value {
        let name: String
        let baseContext: String

        static func contentWith(name: String, title: String) -> Value {
            return .init(name: name, baseContext: title)
        }
    }

    var context: RootValue<Value> = .root()

    var body: View {
        BaseView(context: context.baseContext) {
            P { "Hello " + context.name + "!" }
        }
    }
}

struct SomeViewStaticTitle: TemplateView {

    var context: RootValue<String> = .root()

    var body: View {
        BaseView<Void>(context: "Test") {
            P { "Hello " + context + "!" }
        }
    }
}

struct ForEachView: TemplateView {

    struct Value {
        let array: [String]
    }

    let context: RootValue<Value> = .root()

    var body: View {
        Div {
            ForEach(in: context.array) { text in
                P { text }
            }
        }.id("array")
    }
}

struct IFView: TemplateView {

    struct Value {
        let name: String
        let age: Int
        let nullable: String?
        let bool: Bool
    }

    var context: RootValue<Value> = .root()

    var body: View {
        Div {
            IF(context.name == "Mats") {
                P {
                    "My name is: " + context.name + "!"
                }
            }

            IF(context.age < 20) {
                "I am a child"
            }.elseIf(context.age > 20) {
                "I am older"
            }.else {
                "I am growing"
            }

            IF(context.nullable != nil) {
                B { context.nullable }
            }.elseIf(context.bool) {
                P { "Simple bool" }
            }

            IF(context.nullable == "Some" && context.name == "Per") {
                Div { "And" }
            }
        }
    }
}
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
struct ChainedEqualAttributes : StaticView {
    var body: View {
        Div()
            .class("foo")
            .class("bar")
            .id("id")
    }
}

struct ChainedEqualAttributesDataNode : StaticView {
    var body: View {
        Img()
            .class("foo")
            .class("bar")
            .id("id")
//            .margin(.bottom, amount: 3, for: .medium)
    }
}


struct VariableView<Root>: StaticView {

    var context: TemplateValue<Root, String>

    var body: View {
        Div {
            P { context }
            P { context.escaping(.unsafeNone) }
        }
    }
}

struct MultipleContextualEmbed : TemplateView {

    struct Value {
        let base: String
        let variable: String

        init(title: String, string: String) {
            base = title
            variable = string
        }
    }

    var context: RootValue<Value> = .root()

    var body: View {
        BaseView(context: context.base) { () -> View in
            Span { "Some text" }
            VariableView(context: context.variable)
            UnsafeVariable(context: context)
        }
    }
}

public enum Direction : String {
    case top
    case bottom
    case left
    case right

    var boostrapValue: String {
        switch self {
        case .bottom:   return "b"
        case .top:      return "t"
        case .left:     return "l"
        case .right:    return "r"
        }
    }
}

public enum BootstrapSizing : String {
    case extraLarge     = "-xl"
    case large          = "-lg"
    case medium         = "-md"
    case small          = "-sm"
    case all            = ""
}

extension Comparable {
    public func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

extension Strideable where Stride: SignedInteger {
    public func clamped(to limits: CountableClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

extension AttributeNode {
    public func margin(_ direction: Direction, amount: Int, for size: BootstrapSizing = .all) -> Self {
        self.class("m\(direction.boostrapValue)\(size.rawValue)-\(amount.clamped(to: 0...5))")
    }
}

struct BootstrapAlert : StaticView, AttributeNode {

    var attributes: [HTML.Attribute]

    let content: View

    init(attributes: [HTML.Attribute] = [], @HTMLBuilder content: () -> View) {
        self.attributes = attributes
        self.content = content()
    }

    var body: View {
        Div {
            content
        }
            .class("alert alert-primary")
            .role("alert")
            .add(attributes: attributes)
    }

    func copy(with attributes: [HTML.Attribute]) -> BootstrapAlert {
        .init(attributes: attributes, content: { content })
    }
}

//struct DynamicAttribute: ContextualTemplate {
//
//    struct Value {
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
struct SelfContextPassing : TemplateView {

    var context: RootValue<String> = .root()

    var body: View {
        Div {
            VariableView(context: context)
        }
    }
}

struct SelfLoopingView: TemplateView {

    var context: RootValue<[SimpleData]> = .root()

    var body: View {
        Div {
            ForEach(in: context) { data in
                StaticEmbedView(context: data)
            }
        }.class("list")
    }
}

struct UnsafeVariable<Root> : StaticView {

    var context: TemplateValue<Root, MultipleContextualEmbed.Value>

    var body: View {
        Div {
            P {
                context.variable
            }
            P {
                context.base
            }
        }
    }
}

//struct MarkdownView: TemplateView {
//
//    struct Value {
//        let title: String
//        let description: String
//    }
//
//    let context: RootValue<Value> = .root()
//
//    var body: View {
//        Div {
//            Markdown {
//                "# Title: " + context.title
//                "\n## Description here:\n"
//                context.description
//            }
//        }
//    }
//}

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
//    struct Value: Codable {
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
//    struct Value {
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

struct DateView : TemplateView {

    var context: RootValue<Date> = .root()

    var body: View {
        Div {
            P { context.style() }
            P { context.formating(string: "MM/dd/yyyy") }
        }
    }
}

struct OptionalDateView : TemplateView {

    var context: RootValue<Date?> = .root()

    var body: View {
        Div {
            P { context.style() }
            P { context.formating(string: "MM/dd/yyyy") }
        }
    }
}

class FailingCondition : Conditionable {

    let evaluationResult: Bool
    var hasBeenEvaluated = false

    init(evaluationResult: Bool) {
        self.evaluationResult = evaluationResult
    }

    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        guard hasBeenEvaluated == false else {
            XCTFail("This should never run")
            return false
        }
        self.hasBeenEvaluated = true
        return evaluationResult
    }
}

struct StaticIfPrerenderingTest : TemplateView {

    var context: RootValue<Bool> = .root()

    var body: View {
        Div {
            IF(FailingCondition(evaluationResult: true)) {
                "This should be prerenderd"
            }.else {
                "This sould never be renderd"
            }

            P {
                IF(context) {
                    "This may run"
                }.else {
                    "This as well"
                }
            }

            P {
                IF(FailingCondition(evaluationResult: false)) {
                    "This sould never be renderd"
                }.else {
                    "This should be prerenderd"
                }
            }
        }
    }
}


//
//struct LocalizedDateView: LocalizedTemplate {
//
//    enum LocalizationKeys: String {
//        case none
//    }
//
//    static let localePath: KeyPath<LocalizedDateView.Context, String>? = \.locale
//
//    struct Value {
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
