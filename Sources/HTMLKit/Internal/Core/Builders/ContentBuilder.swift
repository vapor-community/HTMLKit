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
    public static func buildBlock(_ components: T...) -> [T] {
        components
    }
    
    public static func buildArray(_ components: [[T]]) -> [T] {
        components.flatMap { $0 }
    }
}
