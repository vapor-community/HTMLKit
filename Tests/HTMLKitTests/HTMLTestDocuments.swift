
@testable import HTMLKit

protocol HTMLTestable: TemplateBuilder {
    static var expextedOutput: String { get }
}


struct SimpleView: StaticBuild, HTMLTestable {

    static var expextedOutput: String = "<div><p>Text</p></div>"

    static func build() -> CompiledTemplate {
        return
            div.child(
                p.child("Text")
        )
    }
}

struct StaticEmbedView: Templating {

    struct Context {
        let string: String
        let int: Int?
    }

    static func build() -> CompiledTemplate {
        return
            div.child(
                embed(static: SimpleView.self),
                p.child( variable(at: \.string)),

                renderIf(\.int != nil,
                         small.child( variable(at: \.int))
                )
        )
//            div(
//                SimpleView.build(),
//                p( variable(at: \.string)),
//                renderIf(\.int != nil,
//                         small( variable(at: \.int))
//                )
//        )
    }
}

struct BaseView: ViewTemplating {

    struct Context {
        let title: String
    }

    struct ViewContext {
        let body: CompiledTemplate
    }

    static func build(with context: BaseView.ViewContext) -> CompiledTemplate {
        return
            html.child(
                head.child(
                    title.child( variable(at: \.title)),
                    link.href("some url").rel("stylesheet"),
                    meta.name("viewport").content("width=device-width, initial-scale=1.0")
                ),
                body.child(context.body)
        )
//            html(
//                head(
//                    title(variable(at: \.title))
//                ),
//                body(context.body)
//        )
    }
}

struct StringView: Templating {

    struct Context {
        let string: String
    }

    static func build() -> CompiledTemplate {
        return p.child( variable(at: \.string))
//            p(variable(at: \.string))
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

    static func build() -> CompiledTemplate {
        return
            embed(
                BaseView.self,
                with: .init(
                    body: p.child("Hello ", variable(at: \.name), "!")
//                    p("Hello ", variable(at: \.name), "!")
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

    static func build() -> CompiledTemplate {
        return
            div.id("array").child(
                forEach(in: \.array, render: StringView.self)
        )
//            div(attr: [.id("array")],
//                forEach(in: \.array, render: StringView.self)
//        )
    }
}


struct IFView: Templating {

    struct Context {
        let name: String
        let age: Int
        let nullable: String?
        let bool: Bool
    }

    static func build() -> CompiledTemplate {
        return
            div.child(
                renderIf(\.name == "Mats",
                    p.child("My name is: ", variable(at: \.name), "!")
                ),

                renderIf(\.age < 20,
                    "I am a child"
                ).elseIf(\.age > 20,
                    "I am older"
                ).else(render:
                    "I am growing"
                ),

                renderIf(\.nullable != nil,
                    b.child( variable(at: \.nullable))
                ).elseIf(\.bool,
                    p.child("Simple bool")
                )

        )
//            div(
//                renderIf(\.name == "Mats",
//                    p("My name is: ", variable(at: \.name), "!")
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
//                    b( variable(at: \.nullable))
//                ).elseIf(\.bool,
//                    p("Simple bool")
//                )
//            )
    }
}

class FormInput: TemplateBuilder {

    var id: String?
    var type: String?
    var required: Bool = false
    var placeholder: String?
    var label: String?


    func id(_ value: String) -> FormInput {
        self.id = value
        return self
    }

    func label(_ value: String) -> FormInput {
        label = value
        if id == nil {
            id = value.replacingOccurrences(of: " ", with: "-").lowercased()
        }
        return self
    }

    func `required`(_ value: Bool = true) -> FormInput {
        required = value
        return self
    }

    func placeholder(_ value: String) -> FormInput {
        placeholder = value
        return self
    }

    static func build() -> CompiledTemplate {
        
        return ""
//            div(attr: [.class("form-group")],
//            label(attr: [.for(id)], label),
//            input(attr: .class("form-control"), .type(type), .required, .name(id), .id(id), .placeholder(placeholder))
//        )
    }
}

class BuildTest: StaticBuild {

    static func build() -> CompiledTemplate {
        return html.child(
            body
                .child(
                    div.class("hero")
                        .child(
                            h1.child("Point-Free")
                    ),
                    p.class("p1")
                        .child("This p tag gets styles from the tag element and classes."),

                    p.id("some-id").class("bold leading")
                        .child("This p tag gets styles from the id, classes, inline styles, and element tag!"),

                    div.id("footer")
                        .child("I'm a div footer with an id"),

                    div.class("footer")
                        .child("I'm a div footer with a class"),

                    footer
                        .child("I'm a footer element")
            )
        )
    }
}


struct Sidebar: StaticBuild {

    static func build() -> CompiledTemplate {
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

struct Topbar: Templating {

    struct Context {
        let name: String
        let email: String
    }

    static func build() -> CompiledTemplate {
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


struct PerformanceBase: ViewTemplating {

    struct Context {
        let topBar: Topbar.Context

        static func content(name: String, email: String) -> Context {
            return Context(topBar: .init(name: name, email: email))
        }
    }

    struct ViewContext {
        let body: CompiledTemplate
        let headerLinks: CompiledTemplate?
        let scripts: CompiledTemplate?
        let modals: CompiledTemplate?
    }

    static func build(with context: PerformanceBase.ViewContext) -> CompiledTemplate {
        return
            div.class("wrapper").child(
                embed(static: Sidebar.self),
                div.class("content-page").child(
                    embed(Topbar.self, contextPath: \.topBar),
                    div.class("content").child(
                        div.class("container").child(context.body)
                    ),
                    script.src("/assets/js/app.min.js").type("text/javascript")
                )
        )
    }
}

struct Card: Templating {

    struct Context {
        let name: String
        let numberOfTopics: Int
        let id: Int
        let imageUrl: String
    }

    static func build() -> CompiledTemplate {
        return
            div.class("col-md-6 col-xl-4").child(
                a.href(["subjects/", variable(at: \.id)]).class("text-dark").child(
                    div.class("card d-block").child(
                        comment(" project-thumbnail "),
                        img.class("card-img-top").src(variable(at: \.imageUrl)).alt("project image cap"),
                        div.class("card-body position-relative").child(
                            comment(" project title"),
                            h4.class("mt-0").child(
                                variable(at: \.name)
                            ),
                            comment(" project detail"),
                            p.child(
                                span.class("pr-2 text-nowrap").child(
                                    b.child(
                                        variable(at: \.numberOfTopics)
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


struct PerformanceTest: Templating {

    struct Context {
        let base: PerformanceBase.Context
        let cards: [Card.Context]

        static func content(with name: String, email: String, cards: [Card.Context]) -> Context {
            return .init(base: .content(name: name, email: email),
                         cards: cards)
        }
    }

    static func build() -> CompiledTemplate {
        return
         embed(
            PerformanceBase.self,
            with: .init(
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
                        forEach(in: \.cards, render: Card.self),
                        comment(" end col ")
                    )
                ],
                headerLinks: nil,
                scripts: nil,
                modals: nil
            ),
            contextPath: \.base)
    }
}
