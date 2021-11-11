/// The builder is for
///
///
@resultBuilder public class HTMLBuilder {

    public static func buildBlock(_ children: HTMLContent...) -> HTMLContent {
        return children
    }
}
