/// ## Description
/// The file contains the view components.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

/// ## Description
/// The component returns a meta element with twitter and opengraph.
///
/// ## References
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
                .content(self.title)
        }
        IF(useTwitter) {
            Meta()
                .custom(key: "name", value: "twitter:title")
                .content(self.title.rawValue)
        }
    }
}

/// ## Description
/// The component returns a meta element with twitter and opengraph.
///
/// ## References
///
public struct MetaDescription: Component {

    private var description: TemplateValue<String>

    private let useOpenGraph: Conditionable
    
    private let useTwitter: Conditionable

    public var body: AnyContent {
        Meta()
            .name(.description)
            .content(self.description)
        IF(useOpenGraph) {
            Meta()
                .property(.description)
                .content(self.description)
        }
        IF(useTwitter) {
            Meta()
                .custom(key: "name", value: "twitter:description")
                .content(self.description.rawValue)
        }
    }

    public init(description: TemplateValue<String>, useOpenGraph: Conditionable = true, useTwitter: Conditionable = true) {
        self.description = description
        self.useOpenGraph = useOpenGraph
        self.useTwitter = useTwitter
    }
}

/// ## Description
/// The component returns a link element.
///
/// ## References
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

/// ## Description
/// The component returns a link element.
///
/// ## References
///
public struct Stylesheet: Component {
    
    private var url: TemplateValue<String>

    public init(url: TemplateValue<String>) {
        self.url = url
    }

    public var body: AnyContent {
        Link()
            .relationship(.stylesheet)
            .reference(self.url)
            .type(.css)
    }
}

/// ## Description
/// The component returns a meta element.
///
/// ## References
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
            .content("width=\(self.mode.width), initial-scale=\(self.internalScale)")
    }
}

/// ## Description
/// The component returns a meta element.
///
/// ## References
///
public struct Author: Component {

    private var author: TemplateValue<String>

    private var handle: TemplateValue<String?>

    public var body: AnyContent {
        Meta()
            .name(.author)
            .content(self.author)
        Unwrap(self.handle) { handle in
            Meta()
                .custom(key: "name", value: "twitter:creator")
                .content(handle)
        }
    }
    
    public init(author: TemplateValue<String>, handle: TemplateValue<String?>) {
        self.author = author
        self.handle = handle
    }
}
