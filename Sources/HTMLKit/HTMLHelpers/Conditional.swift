
struct _Conditional {
    let condition: ConditionTemplate
    var node: TemplateNode
    var runtimeValues: [TemplateRuntimeValue] { condition.runtimeValues }
}

public struct Conditional {
    let condition: ConditionTemplate
    let content: ContentRepresentable
}

public struct IF<S: HTMLScope>: ContentRepresentable, _HTML {

    public typealias Content = Never
    public typealias HTMLScope = S

    let conditions: [Conditional]

    var node: TemplateNode {
        return .conditional(
            conditions.map { _Conditional(condition: $0.condition, node: $0.content.node) }
        )
    }

    public var html: Never { fatalError() }

    init(conditions: [Conditional]) {
        self.conditions = conditions
    }

    public init<T: HTML>(_ condition: ConditionTemplate, @TemplateBuilder<T.HTMLScope> build: () -> T) where T.HTMLScope == S {
        self.conditions = [
            .init(
                condition: condition,
                content: AnyHTML<Content.HTMLScope>(content: build())
            )
        ]
    }

    public func `else`<Content: HTML>(if condition: ConditionTemplate, @TemplateBuilder<Content.HTMLScope> build: () -> Content) -> IF {
        IF(conditions:
            conditions +
            [.init(
                condition: condition,
                content: AnyHTML<Content.HTMLScope>(content: build())
            )]
        )
    }

    public func `else`<Content: HTML>(@TemplateBuilder<Content.HTMLScope> build: () -> Content) -> IF {
        IF(conditions:
            conditions +
            [.init(
                condition: true,
                content: AnyHTML<Content.HTMLScope>(content: build())
            )]
        )
    }
}

public func renderConditional<Content: HTML>(if condition: ConditionTemplate, @TemplateBuilder<Content.HTMLScope> build: () -> Content) -> IF<Content.HTMLScope> {
    IF(condition, build: build)
}
