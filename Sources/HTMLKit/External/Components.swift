// MARK: components

/// The component ist for
///
///
public struct MetaTitle: Component {
    
    private var title: TemplateValue<String>
    
    private let useOpenGraph: Conditionable
    
    private let useTwitter: Conditionable
    
    public init(title: TemplateValue<String>, useOpenGraph: Conditionable = true, useTwitter: Conditionable = true) {
        self.title = title
        self.useOpenGraph = useOpenGraph
        self.useTwitter = useTwitter
    }
    
    public var body: AnyContent {
        Title {
            self.title.rawValue
        }
        IF(useOpenGraph) {
            Meta()
                .property(.title)
                .content(self.title.rawValue)
        }
        IF(useTwitter) {
            Meta()
                .name(.init(rawValue: "twitter:title")!)
                .content(self.title.rawValue)
        }
    }
}

/// The component ist for
///
///
public struct MetaDescription: Component {

    private var description: TemplateValue<String>

    private let useOpenGraph: Conditionable
    
    private let useTwitter: Conditionable

    public var body: AnyContent {
        Meta()
            .name(.description)
            .content(self.description.rawValue)
        IF(useOpenGraph) {
            Meta()
                .property(.description)
                .content(self.description.rawValue)
        }
        IF(useTwitter) {
            Meta()
                .name(.init(rawValue: "twitter:description")!)
                .content(self.description.rawValue)
        }
    }

    public init(description: TemplateValue<String>, useOpenGraph: Conditionable = true, useTwitter: Conditionable = true) {
        self.description = description
        self.useOpenGraph = useOpenGraph
        self.useTwitter = useTwitter
    }
}

/// The component ist for
///
///
public struct Favicon: Component {

    private let url: TemplateValue<String>

    public init(url: TemplateValue<String>) {
        self.url = url
    }

    public var body: AnyContent {
        Link()
            .relationship(.shortcutIcon)
            .reference(self.url.rawValue)
    }
}

/// The component ist for
///
///
public struct Stylesheet: Component {
    
    private var url: TemplateValue<String>

    public init(url: TemplateValue<String>) {
        self.url = url
    }

    public var body: AnyContent {
        Link()
            .relationship(.stylesheet)
            .reference(self.url.rawValue)
            .type("text/css")
    }
}

/// The component ist for
///
///
public struct Viewport: Component {

    private var mode: WidthMode
    private var internalScale: Double = 1

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
    
    public init(_ mode: WidthMode, internalScale: Double = 1) {
        self.mode = mode
        self.internalScale = internalScale
    }

    public var body: AnyContent {
        Meta()
            .name(.viewport)
            .content("width=\(mode.width), initial-scale=\(internalScale)")
    }
}

/// The component ist for
///
///
public struct Author: Component {

    private var author: TemplateValue<String>

    private var handle: TemplateValue<String?>

    public var body: AnyContent {
        Meta()
            .name(.author)
            .content(self.author.rawValue)
        Unwrap(handle) { handle in
            Meta()
                .name(.init(rawValue: "twitter:creator")!)
                .content(handle.rawValue)
        }
    }
    
    public init(author: TemplateValue<String>, handle: TemplateValue<String?>) {
        self.author = author
        self.handle = handle
    }
}
