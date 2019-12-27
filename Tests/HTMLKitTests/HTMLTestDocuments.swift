
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

struct SimpleView: HTMLPage, HTMLTestable {

    static var expextedOutput: String = "<div><p>Text</p></div>"

    var body: HTML {
        Div {
            P { "Text" }
        }
    }
}

struct StaticEmbedView: HTMLTemplate {

    @TemplateValue(SimpleData.self)
    var context

    var body: HTML {
        Div {
            SimpleView()
            P {
                context.string
            }
            Unwrap(context.int) { int in
                Small {
                    int
                }
            }
        }
    }
}

struct BaseView<Root>: HTMLComponent {

    let context: TemplateValue<Root, String>
    let content: HTML

    init(context: TemplateValue<Root, String>, @HTMLBuilder content: () -> HTML) {
        self.context = context
        self.content = content()
    }

    var body: HTML {
        HTMLNode {
            Head {
                Title { context }
                Link()
                    .href("some url")
                    .relationship(.stylesheet)
                Meta()
                    .name(.viewport)
                    .content("width=device-width, initial-scale=1.0")
            }
            Body {
                content
            }
        }
    }
}

extension BaseView where Root == Void {
    init(context: String, @HTMLBuilder content: () -> HTML) {
        self.context = .constant(context)
        self.content = content()
    }
}

struct SomeView: HTMLTemplate {

    struct Context {
        let name: String
        let title: String
    }

    var body: HTML {
        BaseView(context: context.title) {
            P { "Hello " + context.name + "!" }
        }
    }
}

struct SomeViewStaticTitle: HTMLTemplate {

    var context: RootValue<String> = .root()

    var body: HTML {
        BaseView(context: "Test") {
            P { "Hello " + context + "!" }
        }
    }
}

struct ForEachView: HTMLTemplate {

    let context: RootValue<[String]> = .root()

    var body: HTML {
        Div {
            ForEach(in: context) { text in
                P { text }
            }
        }.id("array")
    }
}

//struct ForEachViewRuntime: StaticView {
//
//    let context: [String]
//
//    var body: HTML {
//        Test {
//            ForEachRuntime(values: context) { value in
//                P { value }
//            }
//        }
//    }
//}

struct IFView: HTMLTemplate {

    struct Value {
        let name: String
        let age: Int
        let nullable: String?
        let bool: Bool
    }

    var context: RootValue<Value> = .root()

    var body: HTML {
        Div {
            IF(context.name == "Mats") {
                P {
                    "My name is: " + context.name + "!"
                }
                .direction(.leftToRight)
            }

            IF(context.age < 20) {
                "I am a child"
            }.elseIf(context.age > 20) {
                "I am older"
            }.else {
                "I am growing"
            }

            IF(context.nullable.isDefined) {
                Bold { context.nullable }
            }.elseIf(context.bool) {
                P { "Simple bool" }
            }

            IF(context.nullable == "Some" && context.name == "Per") {
                Div { "And" }
            }
        }
    }
}

//struct IFViewRuntime: StaticView {
//
//    struct Value {
//        let name: String
//        let age: Int
//        let nullable: String?
//        let bool: Bool
//    }
//
//    let context: Value
//
//    var body: HTML {
//        Test {
//            if context.name == "Mats" {
//                P {
//                    "My name is: " + context.name + "!"
//                }
//                .direction(.leftToRight)
//            } else {
//                ""
//            }
//
//            if context.age < 20 {
//                "I am a child"
//            } else if context.age > 20 {
//                "I am older"
//            } else {
//                "I am growing"
//            }
//
//            if context.nullable != nil {
//                Bold { context.nullable }
//            } else if context.bool {
//                P { "Simple bool" }
//            } else {
//                ""
//            }
//
//            if context.nullable == "Some" && context.name == "Per" {
//                Div { "And" }
//            } else {
//                ""
//            }
//        }
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
//    func build() -> HTML {
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
//    func build() -> HTML {
//        return
//            div.id("Test").child(
//                FormInput(label: "Email", type: .email)
//        )
//    }
//}
//
//struct ChainedEqualAttributes: StaticView {
//
//    func build() -> HTML {
//        return div.class("foo").class("bar").id("id")
//    }
//}
//
//struct ChainedEqualAttributesDataNode: StaticView {
//
//    func build() -> HTML {
//        return img.class("foo").class("bar").id("id")
//    }
//}
//
struct ChainedEqualAttributes: HTMLPage {
    var body: HTML {
        Div()
            .class("foo")
            .class("bar")
            .id("id")
    }
}

struct ChainedEqualAttributesDataNode: HTMLPage {
    var body: HTML {
        Img()
            .class("foo")
            .class("bar")
            .id("id")
//            .margin(.bottom, amount: 3, for: .medium)
    }
}


struct VariableView<Root>: HTMLComponent {

    var context: TemplateValue<Root, String>

    var body: HTML {
        Div {
            P { context }
            P { context.escaping(.unsafeNone) }
        }
    }
}

struct MultipleContextualEmbed: HTMLTemplate {

    struct Context {
        let title: String
        let string: String
    }

    var body: HTML {
        BaseView(context: context.title) { () -> HTML in
            Span { "Some text" }
            VariableView(context: context.string)
            UnsafeVariable(context: context)
        }
    }
}

public enum Direction: String {
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

public enum BootstrapSizing: String {
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

struct BootstrapAlert: HTMLComponent, AttributeNode {

    var attributes: [HTMLAttribute]

    let content: HTML

    init(attributes: [HTMLAttribute] = [], @HTMLBuilder content: () -> HTML) {
        self.attributes = attributes
        self.content = content()
    }

    var body: HTML {
        Div {
            content
        }
            .class("alert alert-primary")
            .role("alert")
            .add(attributes: attributes)
    }

    func copy(with attributes: [HTMLAttribute]) -> BootstrapAlert {
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
//    func build() -> HTML {
//        return div.class("foo")
//            .if(\.isChecked, add: .class("checked"))
//            .if(\.isActive, add: .init(attribute: "active", value: nil))
//            .if(isNil: \.isOptional, add: .selected)
//            .if(isNotNil: \.isOptional, add: .class("not-nil"))
//    }
//}
//

//struct LoginPageTest: HTMLTemplate {
//
//    typealias Context = String?
//
//    var body: HTML {
//        Div {
//            Div {
//                Div {
//                    Div {
//                        IF(context != nil) {
//                            Div {
//                                Button {
//                                    Span {
//                                        "×"
//                                    }.aria(for: "hidden", value: "true")
//                                }.type(.button).class("close").data(for: "dismiss", value: "alert").aria(for: "label", value: "Close")
//                                context
//                            }.class("alert alert-secondary alert-dismissible bg-danger text-white border-0 fade show").role("alert")
//                        }
//                        Div {
//                            Div {
//                                Anchor {
//                                    Span {
//                                        Img().source("assets/images/logo.png").alt("Logo").height(30)
//                                    }
//                                }.href("index.html")
//                            }.class("card-header pt-4 pb-4 text-center bg-primary")
//                            Div {
//                                Div {
//                                    H4 {
//                                        "Title"
//                                    }
//                                        .class("text-dark-50 text-center mt-0 font-weight-bold")
//                                    P {
//                                        "Subtitle"
//                                    }
//                                        .class("text-muted mb-4")
//                                }.class("text-center w-75 m-auto")
//                                Form {
//                                    Div {
//                                        Label {
//                                            "Mail title"
//                                        }
//                                            .for("emailaddress")
//                                        Input()
//                                            .class("form-control")
//                                            .type(.email)
//                                            .name("email")
//                                            .id("email")
//                                    }.class("form-group")
//                                    Div {
//                                        Anchor {
//                                            Small { "password" }
//                                        }
//                                        .href("/start-reset-password")
//
//                                        Label {
//                                            "Password"
//                                        }
//                                            .for("password")
//                                        Input()
//                                            .class("form-control")
//                                            .type(.password)
//                                            .name("password")
//                                            .id("password")
//                                    }.class("form-group")
//                                    Div {
//                                        Button {
//                                            "Login"
//                                        }
//                                            .id("submit-button")
//                                            .class("btn btn-primary")
//                                            .type(.submit)
//                                    }.class("form-group mb-0 text-center")
//                                }.action("/login").method(.post)
//                            }.class("card-body p-4")
//                        }.class("card")
//                        Div {
//                            Div {
//                                P {
//                                    "Not logged in"
//                                }
//                                Anchor {
//                                    Bold { "No user" }
//                                }
//                                .href("/signup")
//                                .class("ml-1")
//                            }
//                            .class("col-12 text-center")
//                        }.class("row mt-3")
//                    }.class("col-lg-5")
//                }.class("row justify-content-center")
//            }.class("container")
//        }.class("account-pages mt-5 mb-5")
//    }
//}

//struct LoginPageTestRuntime: StaticView {
//
//    let errorMessage: String?
//
//    var body: HTML {
//        Div {
//            Div {
//                Div {
//                    Div {
//                        Test {
//                            if errorMessage != nil {
//                                Div {
//                                    Button {
//                                        Span {
//                                            "×"
//                                        }.aria(for: "hidden", value: "true")
//                                    }.type(.button).class("close").data(for: "dismiss", value: "alert").aria(for: "label", value: "Close")
//                                    errorMessage
//                                }.class("alert alert-secondary alert-dismissible bg-danger text-white border-0 fade show").role("alert")
//                            } else {
//                                ""
//                            }
//                        }
//                        Div {
//                            Div {
//                                Anchor {
//                                    Span {
//                                        Img().source("assets/images/logo.png").alt("Logo").height(30)
//                                    }
//                                }.href("index.html")
//                            }.class("card-header pt-4 pb-4 text-center bg-primary")
//                            Div {
//                                Div {
//                                    H4 {
//                                        "Title"
//                                    }
//                                        .class("text-dark-50 text-center mt-0 font-weight-bold")
//                                    P {
//                                        "Subtitle"
//                                    }
//                                        .class("text-muted mb-4")
//                                }.class("text-center w-75 m-auto")
//                                Form {
//                                    Div {
//                                        Label {
//                                            "Mail title"
//                                        }
//                                            .for("emailaddress")
//                                        Input()
//                                            .class("form-control")
//                                            .type(.email)
//                                            .name("email")
//                                            .id("email")
//                                    }.class("form-group")
//                                    Div {
//                                        Anchor {
//                                            Small { "password" }
//                                        }
//                                        .href("/start-reset-password")
//
//                                        Label {
//                                            "Password"
//                                        }
//                                            .for("password")
//                                        Input()
//                                            .class("form-control")
//                                            .type(.password)
//                                            .name("password")
//                                            .id("password")
//                                    }.class("form-group")
//                                    Div {
//                                        Button {
//                                            "Login"
//                                        }
//                                            .id("submit-button")
//                                            .class("btn btn-primary")
//                                            .type(.submit)
//                                    }.class("form-group mb-0 text-center")
//                                }.action("/login").method(.post)
//                            }.class("card-body p-4")
//                        }.class("card")
//                        Div {
//                            Div {
//                                P {
//                                    "Not logged in"
//                                }
//                                Anchor {
//                                    Bold { "No user" }
//                                }
//                                .href("/signup")
//                                .class("ml-1")
//                            }
//                            .class("col-12 text-center")
//                        }.class("row mt-3")
//                    }.class("col-lg-5")
//                }.class("row justify-content-center")
//            }.class("container")
//        }.class("account-pages mt-5 mb-5")
//    }
//}

struct DynamicAttribute: HTMLTemplate {

    struct Value {
        let isChecked: Bool
        let isActive: Bool
        let isOptional: Bool?
    }

    let context: RootValue<Value> = .root()

    var body: HTML {
        Div()
            .class("foo")
            .modify(if: context.isChecked) {
                $0.class("checked")
            }
            .modify(if: context.isActive) {
                $0.add(HTMLAttribute(attribute: "active", value: nil))
            }
            .modify(if: context.isOptional.isNotDefined) {
                $0.add(HTMLAttribute(attribute: "selected", value: nil))
            }
            .modify(if: context.isOptional.isDefined) {
                $0.class("not-nil")
        }
    }
}

struct SelfContextPassing: HTMLTemplate {

    var context: RootValue<String> = .root()

    var body: HTML {
        Div {
            VariableView(context: context)
        }
    }
}

struct SelfLoopingView: HTMLTemplate {

    typealias Context = [SimpleData]

    var body: HTML {
        Div {
            ForEach(in: context) { data in
                StaticEmbedView(context: data)
            }
        }.class("list")
    }
}
//
struct UnsafeVariable<Root>: HTMLPage {

    var context: TemplateValue<Root, MultipleContextualEmbed.Context>

    var body: HTML {
        Div {
            P {
                context.string
            }
            P {
                context.title
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
//    var body: HTML {
//        Div {
//            Markdown {
//                "# Title: " + context.title
//                "\n## Description here:\n"
//                context.description
//            }
//        }
//    }
//}

struct LocalizedView: HTMLTemplate {

    struct DescriptionContent: Codable {
        let numberTest: Int
    }

    struct Context: Codable {
        let locale: String
        let description: DescriptionContent
        let numberTest: Int
    }

    var body: HTML {
        Div {
            H1("hello.world")
            P("unread.messages", with: context.description)
            P("unread.messages", with: ["numberTest": 2])
            P("unread.messages", with: context)
        }
        .enviroment(locale: context.locale)
    }
}

struct DateView: HTMLTemplate {

    typealias Context = Date

    var body: HTML {
        Div {
            P { context.style() }
            P { context.formatted(string: "MM/dd/yyyy") }
        }
    }
}

struct OptionalDateView: HTMLTemplate {

    typealias Context = Date?

    var body: HTML {
        Div {
            P { context.style() }
            P { context.formatted(string: "MM/dd/yyyy") }
        }
    }
}

class FailingCondition: Conditionable {

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

struct StaticIfPrerenderingTest: HTMLTemplate {

    typealias Context = Bool

    var body: HTML {
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
//    func build() -> HTML {
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

struct LocalizedDateView: HTMLTemplate {

    struct Context {
        let date: Date
        let locale: String
    }

    var body: HTML {
        Div {
            P {
                context.date.style(date: .short, time: .short)
            }
            P {
                context.date.formatted(string: "MM/dd/yyyy")
            }
        }
        .enviroment(locale: context.locale)
    }
}

struct PracticeSession {

    /// The session id
    var id: Int?

    let timeUsed: Int?

    /// The number of task to complete in the session
    let numberOfTaskGoal: Int

    let createdAt: Date
}


//struct BigForTest: HTMLTemplate {
//
//    static let testData: [PracticeSession] = [
//        .init(id: 1, timeUsed: 20, numberOfTaskGoal: 10, createdAt: Date()),
//        .init(id: 2, timeUsed: 20, numberOfTaskGoal: 15, createdAt: Date()),
//        .init(id: 3, timeUsed: 20, numberOfTaskGoal: 12, createdAt: Date()),
//        .init(id: 4, timeUsed: 20, numberOfTaskGoal: 13, createdAt: Date()),
//        .init(id: 5, timeUsed: 20, numberOfTaskGoal: 8, createdAt: Date())
//    ]
//
//    typealias Context = [PracticeSession]
//
//    var body: HTML {
//        Div {
//            Table {
//                TableHead {
//                    TableRow {
//                        TableHeader {
//                            "historyDateColumn"
//                        }
//                        TableHeader {
//                            "historyGoalColumn"
//                        }
//                        TableHeader {
//                            "historyDurationColumn"
//                        }
//                    }
//                }
//                .class("thead-light")
//
//                TableBody {
//                    ForEach(in: context) { session in
//                        TableRow {
//                            TableCell {
//                                Anchor {
//                                    session.createdAt
//                                        .style(date: .medium, time: .short)
//                                }
//                                .href("/practice-sessions/" + session.id + "/result")
//                                .class("text-muted")
//                            }
//                            TableCell {
//                                Anchor {
//                                    session.numberOfTaskGoal
//                                    " oppgaver"
//                                }
//                                .href("/practice-sessions/" + session.id + "/result")
//                                .class("text-muted")
//                            }
//                            TableCell {
//                                Anchor {
//                                    IF(session.timeUsed.isDefined) {
//                                        session.timeUsed
//                                    }.else {
//                                        Div {
//                                            "Ikke helt fullført"
//                                        }
//                                    }
//                                }
//                                .href("/practice-sessions/" + session.id + "/result")
//                                .class("text-muted")
//                            }
//                        }
//                    }
//                }
//            }
//            .class("table table-centered w-100 dt-responsive nowrap")
//        }
//        .class("table-responsive")
//    }
//}

//struct BigForTestRuntime: StaticView {
//
//    let sessions: [PracticeSession]
//
//    var body: HTML {
//        Div {
//            Table {
//                TableHead {
//                    TableRow {
//                        TableHeader {
//                            "historyDateColumn"
//                        }
//                        TableHeader {
//                            "historyGoalColumn"
//                        }
//                        TableHeader {
//                            "historyDurationColumn"
//                        }
//                    }
//                }
//                .class("thead-light")
//
//                TableBody {
//                    ForEachRuntime(values: sessions) { (session: PracticeSession) in
//                        TableRow {
//                            TableCell {
//                                Anchor {
//                                    session.createdAt
//                                        .style(dateStyle: .medium, timeStyle: .short)
//                                }
//                                .href("/practice-sessions/" + session.id + "/result")
//                                .class("text-muted")
//                            }
//                            TableCell {
//                                Anchor {
//                                    session.numberOfTaskGoal
//                                    " oppgaver"
//                                }
//                                .href("/practice-sessions/" + session.id + "/result")
//                                .class("text-muted")
//                            }
//                            TableCell {
//                                Anchor {
//                                    Test {
//                                        if session.timeUsed != nil {
//                                            session.timeUsed
//                                        } else {
//                                            Div {
//                                                "Ikke helt fullført"
//                                            }
//                                        }
//                                    }
//                                }
//                                .href("/practice-sessions/" + session.id + "/result")
//                                .class("text-muted")
//                            }
//                        }
//                    }
//                }
//            }
//            .class("table table-centered w-100 dt-responsive nowrap")
//        }
//        .class("table-responsive")
//    }
//
//
//}
//
//extension Date {
//
//    func style(dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = dateStyle
//        formatter.timeStyle = timeStyle
//        return formatter.string(from: self)
//    }
//}

struct Flash {
    let message: String
    let kind: String
}

struct FlashView: HTMLPage {

    let flashes: [Flash]

    var body: HTML {
        Div {
            ForEach(in: flashes) { flash in
                Div {
                    P { flash.message }
                }
                .class("message \(flash.kind)")
            }
        }
        .id("flash")
    }
}

struct MenuLink {
    let name: String
    let link: String
}

struct Test: HTMLTemplate {

    struct Context {
        var header: Bool
        var links: [MenuLink]
        var text: String
    }

    var body: HTML {
        Document(type: .html5) {
            Head {
                Title { "Welkom bij Autimatisering" }
                Meta().add(.init(attribute: "charset", value: "utf8"))
                Meta().add(.init(attribute: "viewport", value: "width=device-width, initial-scale=1"))
                Link().add(.init(attribute: "stylesheet", value: "https://autimatisering.nl/styles/template.css"))
                Link().add(.init(attribute: "stylesheet", value: "https://autimatisering.nl/styles/content.css"))
            }
            Body {
                IF(context.header) {
                    Header {
                        Img(source: "https://autimatisering.nl/img/AMLogo-Full-White.svg")
                            .id("logo")
                    }
                }
                .elseIf(context.text != "Test") {
                    Anchor {
                        "Tap here"
                    }
                    .href("Some value")
                }
                .else {
                    "None of them"
                }

                AMMenu(links: context.links)
                Header {
                    Section {
                        Embed().source("https://autimatisering.nl/styles/svg/pagehead-img-home.svg")
                    }.id("banner-image-container")

                    Article {
                        H1 {
                            "WELKOM"
                        }.id("banner-text-title")

                        P {
                            context.text
                            context.text
                            context.text
                            context.text
                        }.id("banner-text-body")
                    }.id("banner-text")

                    Section().id("angle")
                }
            }
        }
    }

    struct AMMenu<T>: HTMLComponent {

        let links: TemplateValue<T, [MenuLink]>

        var body: HTML {
            Nav {
                ForEach(in: links) { link in
                    Anchor {
                        link.name
                    }
                    .class("selected")
                    .href(link.link)
                }

            }.id("menu")
        }
    }
}
