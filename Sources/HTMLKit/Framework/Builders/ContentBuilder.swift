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
    
    /// Builds a block with one element.
    ///
    /// ```swift
    /// Tag {
    ///    Tag {
    ///    }
    /// }
    /// ```
    public static func buildPartialBlock(first: Component) -> Component {
        return first
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
    public static func buildPartialBlock(accumulated: Component, next: Component) -> Component {
        return accumulated + next
    }

    /// Builds a block
    ///
    /// ```swift
    /// let content = "Content"
    ///
    /// Tag {
    ///    content
    /// }
    /// ```
    public static func buildExpression(_ element: Expression?) -> Component {
        
        guard let element else {
            return []
        }
        return [element]
    }
    
    /// Builds a block
    ///
    /// ```swift
    /// let content: [Type]
    ///
    /// Tag {
    ///    content
    /// }
    /// ```
    public static func buildExpression(_ element: Component) -> Component {
        return element
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

        guard let component else {
            return []
        }
        return component
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
    public static func buildEither(first: Component) -> Component {
        return first
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
    public static func buildEither(second: Component) -> Component {
        return second
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
