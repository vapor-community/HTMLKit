/// ## Description
/// The file contains the basic attribute handlers.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

/// ## Description
/// The builder builds up a result value from a sequence of any content.
///
/// ## References
///
@resultBuilder public class ContentBuilder<T> {
    
    public static func buildBlock() -> [T] {
        return []
    }

    public static func buildBlock(_ component: T...) -> [T] {
        return component
    }
    
    public static func buildBlock(_ component: [T]...) -> [T] {
        return component.flatMap( { $0 } )
    }
}
