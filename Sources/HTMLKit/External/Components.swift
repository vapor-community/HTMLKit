// MARK: components

/// The component ist for
///
///
public struct MetaTitle: HTMLComponent, Localizable {

    struct Node: ContentNode {
        public var name: String { "title" }

        public var attributes: [HTMLAttribute] = []

        public var content: Content
    }

    public let content: Content
    
    public var attributes: [HTMLAttribute]
    
    public let useOpenGraphMetadata: Conditionable
    
    public let useTwitterMetadata: Conditionable

    public var body: Content {
        [
            Node(attributes: attributes, content: content),
            IF(useOpenGraphMetadata) {
                Meta()
                    .property(.title)
                    .content(content)
            },
            IF(useTwitterMetadata) {
                Meta()
                    .property(.title)
                    .content(content)
            }
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

    public init(@ContentBuilder builder: () -> Content) {
        content = builder()
        attributes = []
        useOpenGraphMetadata = true
        useTwitterMetadata = true
    }

    public init(attributes: [HTMLAttribute] = [], content: Content = "", useOpenGraphMetadata: Conditionable = true, useTwitterMetadata: Conditionable = true) {
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
    public var url

    public init(url: TemplateValue<String>) {
        self.url = url
    }

    public init(url: String) {
        self.url = .constant(url)
    }

    public var body: Content {
        Link()
            .relationship(.stylesheet)
            .reference(url)
            .type("text/css")
    }
}

/// The component ist for
///
///
public struct MetaDescription: HTMLComponent, Localizable {

    public var description: Content

    public let useOpenGraphMetadata: Conditionable
    
    public let useTwitterMetadata: Conditionable

    public var body: Content {
        [
            Meta()
                .property(.description)
                .content(description),
            IF(useOpenGraphMetadata) {
                Meta()
                    .property(.description)
                    .content(description)
            },
            IF(useTwitterMetadata) {
                Meta()
                    .property(.description)
                    .content(description)
            }
        ]
    }

    public init(description: () -> Content) {
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

    public init(description: Content, useOpenGraphMetadata: Conditionable, useTwitterMetadata: Conditionable) {
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

    public let url: TemplateValue<String>

    public init(url: String) {
        self.url = .constant(url)
    }

    public init(url: TemplateValue<String>) {
        self.url = url
    }

    public var body: Content {
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

    public var mode: WidthMode
    public var internalScale: Double = 1

    public init(_ mode: WidthMode, internalScale: Double = 1) {
        self.mode = mode
        self.internalScale = internalScale
    }

    public var body: Content {
        Meta()
            .name(.viewport)
            .content("width=\(mode.width), initial-scale=\(internalScale)")
    }
}

/// The component ist for
///
///
public struct Author: HTMLComponent, Localizable {

    public var author: Content

    @TemplateValue(String?.self)
    public var twitterHandle

    public var body: Content {
        [
            Meta().name(.author).content(author),
            Unwrap(twitterHandle) { handle in
                Meta()
                    .name(.init(rawValue: "twitter:creator")!)
                    .content(handle)
            }
        ]
    }

    public init(author: () -> Content) {
        self.author = author()
    }

    public init(_ localizedKey: String) {
        author = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        author = Localized(key: localizedKey, context: context)
    }

    public init(author: Content, handle: TemplateValue<String?>) {
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
