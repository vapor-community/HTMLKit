import HTMLKit

public struct SimplePage: Page {
    
    private let content: [BodyElement]
    
    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }
    
    public var body: AnyContent {
        Document(type: .html5)
        Html {
            Head {
                Title {
                    "SimplePage"
                }
            }
            Body {
                content
            }
        }
    }
}
