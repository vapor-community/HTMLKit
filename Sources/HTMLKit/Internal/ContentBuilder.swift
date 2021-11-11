/// The builder is for
///
///
@resultBuilder public class ContentBuilder {

    public static func buildBlock(_ children: HTMLContent...) -> HTMLContent {
        return children
    }
}
