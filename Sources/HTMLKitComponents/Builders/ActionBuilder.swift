@resultBuilder
public struct ActionBuilder {
    
    public static func buildBlock(_ components: Action...) -> [Action] {
        return components
    }
}
