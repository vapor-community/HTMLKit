public struct Title: HTMLComponent, AttributeNode, LocalizableNode {

    struct Node: ContentNode {
        public var name: String { "title" }

        public var attributes: [HTMLAttribute] = []

        public var content: HTML
    }

    let content: HTML
    public var attributes: [HTMLAttribute]
    let useOpenGraphMetadata: Conditionable
    let useTwitterMetadata: Conditionable

    public var body: HTML {
        [
            Node(attributes: attributes, content: content),
            IF(useOpenGraphMetadata) { Meta().property("og:title").content(content) },
            IF(useTwitterMetadata) { Meta().name("twitter:title").content(content) }
        ]
    }

    public init(_ localizedKey: String) {
        content = Localized(key: localizedKey)
        attributes = []
        useOpenGraphMetadata = true
        useTwitterMetadata = true
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        content = Localized(key: localizedKey, context: context)
        attributes = []
        useOpenGraphMetadata = true
        useTwitterMetadata = true
    }

    public init(@HTMLBuilder builder: () -> HTML) {
        content = builder()
        attributes = []
        useOpenGraphMetadata = true
        useTwitterMetadata = true
    }

    init(attributes: [HTMLAttribute] = [], content: HTML = "", useOpenGraphMetadata: Conditionable = true, useTwitterMetadata: Conditionable = true) {
        self.content = content
        self.attributes = attributes
        self.useOpenGraphMetadata = useOpenGraphMetadata
        self.useTwitterMetadata = useTwitterMetadata
    }

    public func useOpenGraph(metadata: Conditionable) -> Title {
        .init(attributes: attributes, content: content, useOpenGraphMetadata: metadata, useTwitterMetadata: useTwitterMetadata)
    }

    public func useTwitter(metadata: Conditionable) -> Title {
        .init(attributes: attributes, content: content, useOpenGraphMetadata: useOpenGraphMetadata, useTwitterMetadata: metadata)
    }

    public func copy(with attributes: [HTMLAttribute]) -> Title {
        .init(attributes: attributes, content: content, useOpenGraphMetadata: useOpenGraphMetadata, useTwitterMetadata: useTwitterMetadata)
    }
}

public struct Stylesheet: HTMLComponent {

    @TemplateValue(String.self)
    var url

    public init(url: TemplateValue<String>) {
        self.url = url
    }

    public init(url: String) {
        self.url = .constant(url)
    }

    public var body: HTML {
        Link()
            .relationship(.stylesheet)
            .href(url)
            .type("text/css")
    }
}

public struct Description: HTMLComponent, LocalizableNode {

    var description: HTML

    let useOpenGraphMetadata: Conditionable
    let useTwitterMetadata: Conditionable

    public var body: HTML {
        [
            Meta().name(.description).content(description),
            IF(useOpenGraphMetadata) { Meta().property("og:description").content(description) },
            IF(useTwitterMetadata) { Meta().name("twitter:description").content(description) }
        ]
    }

    public init(description: () -> HTML) {
        self.description = description()
        self.useTwitterMetadata = true
        self.useOpenGraphMetadata = true
    }

    public init(_ localizedKey: String) {
        description = Localized(key: localizedKey)
        self.useTwitterMetadata = true
        self.useOpenGraphMetadata = true
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        description = Localized(key: localizedKey, context: context)
        self.useTwitterMetadata = true
        self.useOpenGraphMetadata = true
    }

    init(description: HTML, useOpenGraphMetadata: Conditionable, useTwitterMetadata: Conditionable) {
        self.description = description
        self.useOpenGraphMetadata = useOpenGraphMetadata
        self.useTwitterMetadata = useTwitterMetadata
    }

    public func useOpenGraph(metadata: Conditionable) -> Description {
        .init(description: description, useOpenGraphMetadata: metadata, useTwitterMetadata: useTwitterMetadata)
    }

    public func useTwitter(metadata: Conditionable) -> Description {
        .init(description: description, useOpenGraphMetadata: useOpenGraphMetadata, useTwitterMetadata: metadata)
    }
}

public struct FavIcon: HTMLComponent {

    let url: TemplateValue<String>

    public init(url: String) {
        self.url = .constant(url)
    }

    public init(url: TemplateValue<String>) {
        self.url = url
    }

    public var body: HTML {
        Link().relationship(.shortcutIcon).href(url)
    }
}

public struct Viewport: HTMLComponent {

    public enum WidthMode {
        case accordingToDevice
        case constant(Int)

        public var width: String {
            switch self {
            case .accordingToDevice: return "device-width"
            case .constant(let width): return "\(width)"
            }
        }
    }

    var mode: WidthMode
    var internalScale: Double = 1

    public init(_ mode: WidthMode, internalScale: Double = 1) {
        self.mode = mode
        self.internalScale = internalScale
    }

    public var body: HTML {
        Meta().name(.viewport).content("width=\(mode.width), initial-scale=\(internalScale)")
    }
}

public struct Author: HTMLComponent, LocalizableNode {

    var author: HTML

    @TemplateValue(String?.self)
    var twitterHandle

    public var body: HTML {
        [
            Meta().name(.author).content(author),
            Unwrap(twitterHandle) { handle in
                Meta().name("twitter:creator").content(handle)
            }
        ]
    }

    public init(author: () -> HTML) {
        self.author = author()
    }

    public init(_ localizedKey: String) {
        author = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        author = Localized(key: localizedKey, context: context)
    }

    init(author: HTML, handle: TemplateValue<String?>) {
        self.author = author
        self.twitterHandle = handle
    }

    public func twitter(handle: TemplateValue<String>) -> Author {
        .init(author: author, handle: handle.makeOptional())
    }

    public func twitter(handle: TemplateValue<String?>) -> Author {
        .init(author: author, handle: handle)
    }
}
