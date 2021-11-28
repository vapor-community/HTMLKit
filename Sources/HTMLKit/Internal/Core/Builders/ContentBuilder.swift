/// The builder is for
///
///
@resultBuilder public class ContentBuilder {

    public static func buildBlock(_ children: AnyContent...) -> AnyContent {
        return children
    }
}
