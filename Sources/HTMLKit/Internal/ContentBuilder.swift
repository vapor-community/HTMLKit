/// The builder is for
///
///
@resultBuilder public class ContentBuilder {

    public static func buildBlock(_ children: Content...) -> Content {
        return children
    }
    
    public static func buildExpression(_ expression: Content) -> Content {
       return expression
     }
    
    public static func buildEither(first component: Content) -> Content {
        component
    }

    public static func buildEither(second component: Content) -> Content {
        component
    }
    
    public static func buildOptional(_ component: Content?) -> Content {
        return component ?? []
    }
}
