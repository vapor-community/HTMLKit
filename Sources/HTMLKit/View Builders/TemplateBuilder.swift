extension LocalizableNode {
    public init<T>(_ localizedKey: String, with context: T) where T: Encodable {
        self.init(localizedKey, with: TemplateValue<T>.constant(context))
    }
}

@_functionBuilder
public class HTMLBuilder {

    public static func buildBlock(_ children: HTML...) -> HTML {
        return children
    }
}

public struct HTMLNode: ContentNode {

    public var name: String { "html" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTML

    public init(@HTMLBuilder builder: () -> HTML) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTML = "") {
        self.content = content
        self.attributes = attributes
    }
}

typealias Acronym = Abbreviation

public typealias Hyperlink = Anchor
