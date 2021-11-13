// MARK: components

/// The component ist for
///
///
public struct MetaTitle: HTMLComponent {
    
    private var title: String
    
    private let useOpenGraph: Bool
    
    private let useTwitter: Bool
    
    public init(title: String, useOpenGraph: Bool = true, useTwitter: Bool = true) {
        self.title = title
        self.useOpenGraph = useOpenGraph
        self.useTwitter = useTwitter
    }
    
    public var body: Content {
        Title {
            self.title
        }
        if(useOpenGraph) {
            Meta()
                .property(.title)
                .content(self.title)
        }
        if(useTwitter) {
            Meta()
                .name(.init(rawValue: "twitter:title")!)
                .content(self.title)
        }
    }
}

/// The component ist for
///
///
public struct Stylesheet: HTMLComponent {
    
    private var url: String

    public init(url: String) {
        self.url = url
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
public struct MetaDescription: HTMLComponent {

    private var description: String

    private let useOpenGraph: Bool
    
    private let useTwitter: Bool

    public var body: Content {
        Meta()
            .name(.description)
            .content(description)
        if(useOpenGraph) {
            Meta()
                .property(.description)
                .content(description)
        }
        if(useTwitter) {
            Meta()
                .name(.init(rawValue: "twitter:description")!)
                .content(description)
        }
    }

    public init(description: String, useOpenGraph: Bool = true, useTwitter: Bool = true) {
        self.description = description
        self.useOpenGraph = useOpenGraph
        self.useTwitter = useTwitter
    }
}

/// The component ist for
///
///
public struct Favicon: HTMLComponent {

    private let url: String

    public init(url: String) {
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

    public var body: Content {
        Meta()
            .name(.viewport)
            .content("width=\(mode.width), initial-scale=\(internalScale)")
    }
}

/// The component ist for
///
///
public struct Author: HTMLComponent {

    private var author: String

    private var handle: String?

    public var body: Content {
        Meta()
            .name(.author)
            .content(author)
        if let handle = self.handle {
            Meta()
                .name(.init(rawValue: "twitter:creator")!)
                .content(handle)
        }
    }
    
    public init(author: String, handle: String? = nil) {
        self.author = author
        self.handle = handle
    }
}
