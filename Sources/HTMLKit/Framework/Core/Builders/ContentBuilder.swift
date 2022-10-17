/*
 Abstract:
 The file contains the builder to build up the result from a sequence of elements.
 */

/// The builder builds up a result value from a sequence of any content.
@resultBuilder public class ContentBuilder<T> {
    
    public static func buildBlock() -> [T] {
        return []
    }
    
    public static func buildBlock(_ component: T) -> [T] {
        return [component]
    }

    public static func buildBlock(_ components: T...) -> [T] {
        return components
    }
    
    public static func buildBlock(_ components: [T], _ trailing: T...) -> [T] {
        return components + trailing
    }
    
    public static func buildBlock(_ c1: T, _ components: [T], _ trailing: T...) -> [T] {
        return [c1] + components + trailing
    }
    
    public static func buildBlock(_ c1: T, _ c2: T, _ components: [T], _ trailing: T...) -> [T] {
        return [c1, c2] + components + trailing
    }
    
    public static func buildBlock(_ c1: T, _ c2: T, _ c3: T, _ components: [T], _ trailing: T...) -> [T] {
        return [c1, c2, c3] + components + trailing
    }
    
    public static func buildBlock(_ cs1: [T], _ components: [T], _ trailing: T...) -> [T] {
        return cs1 + components + trailing
    }
    
    public static func buildBlock(_ cs1: [T], _ cs2: [T], _ components: [T], _ trailing: T...) -> [T] {
        return cs1 + cs2 + components + trailing
    }
}
