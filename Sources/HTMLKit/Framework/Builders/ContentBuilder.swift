// Abstract:
// The file contains the builder to build up the result from a sequence of elements.

/// The builder builds up a result value from a sequence of elements.
@resultBuilder public enum ContentBuilder<T> {
    
    public typealias Component = [T]
    
    public typealias Expression = T

    /// Builds an empty block
    ///
    /// ```swift
    /// Tag {
    /// }
    /// ```
    public static func buildBlock() -> Component {
        return []
    }
    
    /// Builds a block with more than one element.
    ///
    /// ```swift
    /// Tag {
    ///    Tag {
    ///    }
    ///    Tag {
    ///    }
    /// }
    /// ```
    public static func buildBlock(_ components: Component...) -> Component {
        return components.flatMap { $0 }
    }
    
    /// Builds a block
    public static func buildPartialBlock(first: Component) -> Component {
        return first
    }

    /// Builds a block
    public static func buildPartialBlock(first: [Component]) -> Component {
        return first.flatMap { $0 }
    }

    /// Builds a block
    public static func buildPartialBlock(accumulated: Component, next: Expression?) -> Component {
        guard let next else {
            return accumulated
        }
        return accumulated + [next]
    }

    /// Builds a block
    public static func buildPartialBlock(accumulated: Component, next: Component) -> Component {
        return accumulated + next
    }

    /// Builds a block
    public static func buildPartialBlock(accumulated: Component, next: [Component]) -> Component {
        return accumulated + next.flatMap { $0 }
    }

    /// Builds a block
    public static func buildExpression(_ element: Expression?) -> Component {
        guard let element else {
            return []
        }
        return [element]
    }
    
    /// Builds a block
    public static func buildExpression(_ statement: Void) -> Component {
        return []
    }

    /// Builds a block
    public static func buildExpression(_ statement: Component) -> Component {
        return statement
    }

    /// Builds a block with one element.
    ///
    /// ```swift
    /// Tag {
    ///    if let unwrapped = optional {
    ///       Tag {
    ///          unwrapped
    ///       }
    ///    }
    /// }
    /// ```
    public static func buildOptional(_ component: Component?) -> Component {
        component ?? []
    }

    /// Builds a block, if the condition is true.
    ///
    /// ```swift
    /// Tag {
    ///    if(true) {
    ///       Tag {
    ///       }
    ///    }
    /// }
    /// ```
    public static func buildEither(first component: Component) -> Component {
        return component
    }

    /// Builds a block, if the condition is false.
    ///
    /// ```swift
    /// Tag {
    ///    if(false) {
    ///       Tag {
    ///       }
    ///    }
    ///    else {
    ///       Tag {
    ///       }
    ///    }
    /// }
    /// ```
    public static func buildEither(second component: Component) -> Component {
        return component
    }

    /// Builds blocks by running through a sequence of elements.
    ///
    /// ```swift
    /// Tag {
    ///    for element in sequence {
    ///       Tag {
    ///          element
    ///       }
    ///    }
    /// }
    /// ```
    public static func buildArray(_ components: [Component]) -> Component {
        return components.flatMap { $0 }
    }
}
