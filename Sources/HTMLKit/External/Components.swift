/// The component ist for
///
///
public struct MetaTitle: HTMLComponent, AttributeNode, LocalizableNode {

    struct Node: ContentNode {
        public var name: String { "title" }

        public var attributes: [HTMLAttribute] = []

        public var content: HTMLContent
    }

    let content: HTMLContent
    public var attributes: [HTMLAttribute]
    let useOpenGraphMetadata: Conditionable
    let useTwitterMetadata: Conditionable

    public var body: HTMLContent {
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

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
        attributes = []
        useOpenGraphMetadata = true
        useTwitterMetadata = true
    }

    init(attributes: [HTMLAttribute] = [], content: HTMLContent = "", useOpenGraphMetadata: Conditionable = true, useTwitterMetadata: Conditionable = true) {
        self.content = content
        self.attributes = attributes
        self.useOpenGraphMetadata = useOpenGraphMetadata
        self.useTwitterMetadata = useTwitterMetadata
    }

    public func useOpenGraph(metadata: Conditionable) -> MetaTitle {
        .init(attributes: attributes, content: content, useOpenGraphMetadata: metadata, useTwitterMetadata: useTwitterMetadata)
    }

    public func useTwitter(metadata: Conditionable) -> MetaTitle {
        .init(attributes: attributes, content: content, useOpenGraphMetadata: useOpenGraphMetadata, useTwitterMetadata: metadata)
    }

    public func copy(with attributes: [HTMLAttribute]) -> MetaTitle {
        .init(attributes: attributes, content: content, useOpenGraphMetadata: useOpenGraphMetadata, useTwitterMetadata: useTwitterMetadata)
    }
}

/// The component ist for
///
///
public struct Stylesheet: HTMLComponent {

    @TemplateValue(String.self)
    var url

    public init(url: TemplateValue<String>) {
        self.url = url
    }

    public init(url: String) {
        self.url = .constant(url)
    }

    public var body: HTMLContent {
        Link()
            .relationship(.stylesheet)
            .reference(url)
            .type("text/css")
    }
}

/// The component ist for
///
///
public struct MetaDescription: HTMLComponent, LocalizableNode {

    var description: HTMLContent

    let useOpenGraphMetadata: Conditionable
    let useTwitterMetadata: Conditionable

    public var body: HTMLContent {
        [
            Meta().name(.description).content(description),
            IF(useOpenGraphMetadata) { Meta().property("og:description").content(description) },
            IF(useTwitterMetadata) { Meta().name("twitter:description").content(description) }
        ]
    }

    public init(description: () -> HTMLContent) {
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

    init(description: HTMLContent, useOpenGraphMetadata: Conditionable, useTwitterMetadata: Conditionable) {
        self.description = description
        self.useOpenGraphMetadata = useOpenGraphMetadata
        self.useTwitterMetadata = useTwitterMetadata
    }

    public func useOpenGraph(metadata: Conditionable) -> MetaDescription {
        .init(description: description, useOpenGraphMetadata: metadata, useTwitterMetadata: useTwitterMetadata)
    }

    public func useTwitter(metadata: Conditionable) -> MetaDescription {
        .init(description: description, useOpenGraphMetadata: useOpenGraphMetadata, useTwitterMetadata: metadata)
    }
}

/// The component ist for
///
///
public struct FavIcon: HTMLComponent {

    let url: TemplateValue<String>

    public init(url: String) {
        self.url = .constant(url)
    }

    public init(url: TemplateValue<String>) {
        self.url = url
    }

    public var body: HTMLContent {
        Link()
            .relationship(.shortcutIcon)
            .reference(url)
    }
}

/// The component ist for
///
///
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

    public var body: HTMLContent {
        Meta().name(.viewport).content("width=\(mode.width), initial-scale=\(internalScale)")
    }
}

/// The component ist for
///
///
public struct Author: HTMLComponent, LocalizableNode {

    var author: HTMLContent

    @TemplateValue(String?.self)
    var twitterHandle

    public var body: HTMLContent {
        [
            Meta().name(.author).content(author),
            Unwrap(twitterHandle) { handle in
                Meta().name("twitter:creator").content(handle)
            }
        ]
    }

    public init(author: () -> HTMLContent) {
        self.author = author()
    }

    public init(_ localizedKey: String) {
        author = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        author = Localized(key: localizedKey, context: context)
    }

    init(author: HTMLContent, handle: TemplateValue<String?>) {
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
