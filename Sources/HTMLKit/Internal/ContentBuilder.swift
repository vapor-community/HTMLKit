/// The builder is for
///
///
@resultBuilder public class ContentBuilder {

    public static func buildBlock(_ children: Content...) -> Content {
        return children
    }
}
