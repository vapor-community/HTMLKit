/// The builder is for
///
///
@resultBuilder public struct StringBuilder {
    
    public static func buildBlock(_ components: String...) -> String {
        return components.joined()
    }
}
