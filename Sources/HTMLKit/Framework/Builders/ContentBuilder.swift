// Abstract:
// The file contains the builder to build up the result from a sequence of elements.

/// The builder builds up a result value from a sequence of elements.
@resultBuilder public enum ContentBuilder<T> {
    public typealias Component = [T]
    public typealias Expression = T

    public static func buildBlock() -> Component {
        return []
    }

    public static func buildExpression( _ statement: Void) -> Component {
        return []
    }

    public static func buildExpression(_ element: Expression?) -> Component {
        guard let element else {
            return []
        }
        return [element]
    }

    public static func buildExpression( _ statement: Component) -> Component {
        return statement
    }

    public static func buildOptional(_ component: Component?) -> Component {
        component ?? []
    }

    public static func buildEither(first component: Component) -> Component {
        return component
    }

    public static func buildEither(second component: Component) -> Component {
        return component
    }

    public static func buildArray(_ components: [Component]) -> Component {
        return components.flatMap { $0 }
    }

    public static func buildBlock(_ components: Component...) -> Component {
        return components.flatMap { $0 }
    }

    public static func buildPartialBlock(first: Component) -> Component {
        return first
    }

    public static func buildPartialBlock(first: [Component]) -> Component {
        return first.flatMap { $0 }
    }

    public static func buildPartialBlock(accumulated: Component, next: Expression?) -> Component {
        guard let next else {
            return accumulated
        }
        return accumulated + [next]
    }

    public static func buildPartialBlock(accumulated: Component, next: Component) -> Component {
        return accumulated + next
    }

    public static func buildPartialBlock(accumulated: Component, next: [Component]) -> Component {
        return accumulated + next.flatMap { $0 }
    }
}
