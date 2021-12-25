/// ## Description
/// The file contains the result builder for string.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

/// ## Description
/// The builder builds up a result value from a sequence of string.
///
/// ## References
///
@resultBuilder public class StringBuilder {

    public static func buildBlock(_ component: String...) -> String {
        return component.joined()
    }
    
    public static func buildOptional(_ component: String?) -> String {
        return component ?? ""
    }
    
    public static func buildEither(first component: String) -> String {
        return component
    }

    public static func buildEither(second component: String) -> String {
        return component
    }
    
    public static func buildArray(_ components: [String]) -> String {
        return components.joined()
    }
}
