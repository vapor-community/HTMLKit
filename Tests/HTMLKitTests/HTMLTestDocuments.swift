
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
                )
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
//            p(variable(\.string))
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
//            div(attr: [.id("array")],
//                forEach(in: \.array, render: StringView.self)
//        )
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
                ).else(render:
                    "I am growing"
                ),

                renderIf(\.nullable != nil,
                    b.child( variable(\.nullable))
                ).elseIf(\.bool,
                    p.child("Simple bool")
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

class BuildTest: TemplateBuilder {

    func build() -> CompiledTemplate {
        return html.child(
            body
                .child(
                    div.class("hero").child(
                        h1.child(
                            "Point-Free"
                        )
                    ),
                    p.class("p1").child(
                        "This p tag gets styles from the tag element and classes."
                    ),
                    p.id("some-id").class("bold leading").child(
                        "This p tag gets styles from the id, classes, inline styles, and element tag!"
                    ),
                    div.id("footer").child(
                        "I'm a div footer with an id"
                    ),
                    div.class("footer").child(
                        "I'm a div footer with a class"
                    ),
                    footer.child(
                        "I'm a footer element"
                    )
            )
        )
    }
}


struct Sidebar: TemplateBuilder {

    func build() -> CompiledTemplate {
        return
            div.class("left-side-menu").child(
                div.class("slimscroll-menu").child(
                    comment(" LOGO "),
                    a.href("/").class("logo text-center").child(
                        span.class("logo-lg").child(
                            img.src("/assets/images/logo.png").alt("").height(30)
                        ),
                        span.class("logo-sm").child(
                            img.src("/assets/images/logo_sm.png").alt("").height(30)
                        )
                    ),
                    comment("- Sidemenu "),
                    ul.class("metismenu side-nav").child(
                        li.class("side-nav-title side-nav-item").child("Navigation"),
                        li.class("side-nav-item").child(
                            a.href("/").class("side-nav-link").child(
                                span.child("Dashboard ",
                                           small.child("Kommer snart")
                                )
                            )
                        ),
                        li.class("side-nav-item").child(
                            a.href("/subjects").class("side-nav-link").child(
                                span.child("Faginnhold")
                            )
                        ),
                        li.class("side-nav-item").child(
                            a.href("/results").class("side-nav-link").child(
                                span.child("Test Resultater")
                            )
                        )
                    ),
                    comment(" Help Box "),
                    div.class("help-box text-white text-center").child(
                        a.href("javascript:%20void(0);").class("float-right close-btn text-white"),
                        img.src("/assets/images/help-icon.svg").height(90).alt("Helper Icon Image"),
                        h5.class("mt-3").child("Unlimited Access"),
                        p.class("mb-3").child("Upgrade to plan to get access to unlimited reports"),
                        a.href("javascript:%20void(0);").class("btn btn-outline-light btn-sm").child("Upgrade")
                    ),
                    comment(" end Help Box "),
                    comment(" End Sidebar "),
                    div.class("clearfix")
                ),
                comment(" Sidebar -left "),
                comment(" Left Sidebar End ")
        )
    }
}

struct Topbar: ContextualTemplate {

    struct Context {
        let name: String
        let email: String
    }

    func build() -> CompiledTemplate {
        return
            div.class("navbar-custom").child(
                ul.class("list-unstyled topbar-right-menu float-right mb-0").child(
                    li.class("dropdown notification-list").child(
                        a.class("nav-link dropdown-toggle arrow-none").dataToggle("dropdown").href("#").role("button").ariaHaspopup(false).ariaExpanded(false),
                        div.class("dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-lg").child(
                            comment(" item"),
                            div.class("dropdown-item noti-title").child(
                                h5.class("m-0").child(
                                    span.class("float-right").child(
                                        a.href("javascript:%20void(0);").class("text-dark").child(
                                            small.child("Clear All")
                                        )
                                    ),
                                    " Notification"
                                )
                            ),
                            div.class("slimscroll").style("max-height: 230px;").child(
                                comment(" item"),
                                a.href("javascript:void(0);").class("dropdown-item notify-item"),
                                div.class("notify-icon bg-primary"),
                                p.class("notify-details").child(
                                    "Caleb Flakelar commented on Admin ",
                                    small.class("text-muted")
                                        .child("1 min ago")
                                ),
                                comment(" item"),
                                a.href("javascript:void(0);").class("dropdown-item notify-item"),
                                div.class("notify-icon bg-info"),
                                p.class("notify-details").child(
                                    "New user registered. ",
                                    small.class("text-muted")
                                        .child("5 hours ago")
                                ),
                                comment(" item"),
                                a.href("javascript:void(0);").class("dropdown-item notify-item"),
                                div.class("notify-icon").child(
                                    img.src("/assets/images/users/avatar-2.jpg").class("img-fluid rounded-circle").alt("")
                                ),
                                p.class("notify-details").child("Cristina Pride"),
                                p.class("text-muted mb-0 user-msg").child(
                                    small.child("Hi, How are you? What about our next meeting")
                                ),
                                comment(" item"),
                                a.href("javascript:void(0);").class("dropdown-item notify-item"),
                                div.class("notify-icon bg-primary"),
                                p.class("notify-details").child(
                                    "Caleb Flakelar commented on Admin ",
                                    small.class("text-muted").child("4 days ago")
                                ),
                                comment(" item"),
                                a.href("javascript:void(0);").class("dropdown-item notify-item"),
                                div.class("notify-icon").child(
                                    img.src("/assets/images/users/avatar-4.jpg").class("img-fluid rounded-circle").alt("")
                                ),
                                p.class("notify-details").child("Karen Robinson"),
                                p.class("text-muted mb-0 user-msg").child(
                                    small.child("Wow ! this admin looks good and awesome design")
                                ),
                                comment(" item"),
                                a.href("javascript:void(0);").class("dropdown-item notify-item"),
                                div.class("notify-icon bg-info"),
                                p.class("notify-details").child(
                                    "Carlos Crouch liked ",
                                    b.child("Admin"),
                                    small.class("text-muted").child("13 days ago")
                                )
                            ),
                            comment(" All"),
                            a.href("javascript:void(0);").class("dropdown-item text-center text-primary notify-item notify-all").child("View All")
                        )
                    ),
                    li.class("dropdown notification-list").child(
                        a.class("nav-link dropdown-toggle nav-user arrow-none mr-0").dataToggle("dropdown").href("#").role("button").ariaHaspopup(false).ariaExpanded(false).child(
                            span.class("account-user-avatar").child(
                                img.src("/assets/images/users/avatar-1.jpg").alt("user-image").class("rounded-circle")
                            ),
                            span.child(
                                span.class("account-user-name").child("#(user.name)"),
                                span.class("account-position").child("#(user.email)")
                            )
                        ),
                        div.class("dropdown-menu dropdown-menu-right dropdown-menu-animated profile-dropdown").child(
                            comment(" item"),
                            div.class(" dropdown-header noti-title").child(
                                h6.class("text-overflow m-0").child("Welcome !")
                            ),
                            comment(" item"),
                            a.href("javascript:void(0);").class("dropdown-item notify-item").child(
                                span.child("My Account")
                            ),
                            comment(" item"),
                            a.href("javascript:void(0);").class("dropdown-item notify-item").child(
                                span.child("Settings")
                            ),
                            comment(" item"),
                            a.href("javascript:void(0);").class("dropdown-item notify-item").child(
                                span.child("Support")
                            ),
                            comment(" item"),
                            a.href("/creator/subjects").class("dropdown-item notify-item").child(
                                span.child("Creator page")
                            ),
                            comment(" item"),
                            a.href("javascript:void(0);").class("dropdown-item notify-item").child(
                                span.child("Logout")
                            )
                        )
                    )
                ),
                div.class("app-search").child(
                    form.child(
                        div.class("input-group").child(
                            input.type("text").class("form-control").placeholder("Search..."),
                            div.class("input-group-append").child(
                                button.class("btn btn-primary").type("submit").child("Search")
                            )
                        )
                    )
                ),
                comment(" end Topbar ")
        )
    }
}


struct PerformanceBase: ContextualTemplate {

    struct Context {
        let topBar: Topbar.Context

        static func content(name: String, email: String) -> Context {
            return Context(topBar: .init(name: name, email: email))
        }
    }

    let body: CompiledTemplate
    let headerLinks: CompiledTemplate?
    let scripts: CompiledTemplate?
    let modals: CompiledTemplate?

    func build() -> CompiledTemplate {
        return
            div.class("wrapper").child(
                Sidebar(),
                div.class("content-page").child(
                    Topbar().embed(withPath: \Context.topBar),
                    div.class("content").child(
                        div.class("container").child(body)
                    ),
                    script.src("/assets/js/app.min.js").type("text/javascript")
                )
        )
    }
}

struct Card: ContextualTemplate {

    struct Context {
        let name: String
        let numberOfTopics: Int
        let id: Int
        let imageUrl: String
    }

    func build() -> CompiledTemplate {
        return
            div.class("col-md-6 col-xl-4").child(
                a.href(["subjects/", variable(\.id)]).class("text-dark").child(
                    div.class("card d-block").child(
                        comment(" project-thumbnail "),
                        img.class("card-img-top").src(variable(\.imageUrl)).alt("project image cap"),
                        div.class("card-body position-relative").child(
                            comment(" project title"),
                            h4.class("mt-0").child(
                                variable(\.name)
                            ),
                            comment(" project detail"),
                            p.child(
                                span.class("pr-2 text-nowrap").child(
                                    b.child(
                                        variable(\.numberOfTopics)
                                    ),
                                    " Topics"
                                )
                            )
                        ),
                        comment(" end card-body")),
                    comment(" end card")
                )
        )
    }
}


struct PerformanceTest: ContextualTemplate {

    struct Context {
        let base: PerformanceBase.Context
        let cards: [Card.Context]

        func content(with name: String, email: String, cards: [Card.Context]) -> Context {
            return .init(base: .content(name: name, email: email),
                         cards: cards)
        }
    }

    func build() -> CompiledTemplate {
        return
            PerformanceBase(
                body: [
                    div.class("row").child(
                        div.class("col-12").child(
                            div.class("page-title-box").child(
                                div.class("page-title-right").child(
                                    ol.class("breadcrumb m-0").child(
                                        li.class("breadcrumb-item active").child("Fag")
                                    )
                                ),
                                h4.class("page-title").child("Fag")
                            )
                        )
                    ),
                    comment(" end page title "),
                    div.class("row mb-2").child(
                        div.class("col-12").child(
                            div.class("text-sm-right").child(
                                div.class("btn-group mb-3").child(
                                    button.type("button").class("btn btn-primary").child("All")
                                ),
                                div.class("btn-group mb-3 ml-1").child(
                                    button.type("button").class("btn btn-light").child("Ongoing"),
                                    button.type("button").class("btn btn-light").child("Finished")
                                ),
                                div.class("btn-group mb-3 ml-2 d-none d-sm-inline-block"),
                                div.class("btn-group mb-3 d-none d-sm-inline-block")
                            )
                        ),
                        comment(" end col")
                    ),
                    comment(" end row"),
                    div.class("row").child(
                        forEach(in: \.cards, render: Card()),
                        comment(" end col ")
                    )
                ],
                headerLinks: nil,
                scripts: nil,
                modals: nil
                )
                .embed(withPath: \Context.base)
    }
}

class FormInput: ContextualTemplate {

    struct Context {
        let test: String
    }

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
