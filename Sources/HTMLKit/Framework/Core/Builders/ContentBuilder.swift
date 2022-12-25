/*
 Abstract:
 The file contains the builder to build up the result from a sequence of elements.
 */

/// The builder builds up a result value from a sequence of elements.
@resultBuilder public class ContentBuilder<T> {
    
    /// Builds an empty block
    ///
    /// ```swift
    /// Tag {
    /// }
    /// ```
    public static func buildBlock() -> [T] {
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
    public static func buildBlock(_ component: T) -> [T] {
        return [component]
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
    public static func buildBlock(_ components: T...) -> [T] {
        return components.compactMap { $0 }
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
    public static func buildOptional(_ component: T?) -> [T] {
        
        if let component = component {
            return [component]
        }
        
        return []
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
    public static func buildEither(first component: T) -> [T] {
        return [component]
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
    public static func buildEither(second component: T) -> [T] {
        return [component]
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
    public static func buildArray(_ components: [[T]]) -> [T] {
        return components.flatMap { $0 }
    }
    
    /// Builds a block with embeded content.
    ///
    /// ```swift
    /// Tag {
    ///    content
    ///    Tag {
    ///    }
    /// }
    /// ```
    public static func buildBlock(_ content: [T], _ components: T...) -> [T] {
        return content + components.compactMap { $0 }
    }
}
