/*
 Abstract:
 The file contains the tag helpers. A helper combine several html elements, wich are commonly used.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import Foundation

/// The component returns a meta element with twitter and opengraph.
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

/// The component returns a meta element with twitter and opengraph.
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

/// The component returns a link element.
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

/// The component returns a link element.
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

/// The component returns a meta element.
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

/// The component returns a meta element.
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

/// The component returns a meta element useful for tell visiting robots whether a document may be indexed, or used to harvest more links.
public struct Robots: Component {
    public enum IndexingOption: CustomStringConvertible {
        /// There are no restrictions for indexing or serving. This directive is the default value and has no effect if explicitly listed.
        case all
        /// Do not show this page, media, or resource in search results. If you don't specify this directive, the page, media, or resource may be indexed and shown in search results.
        case noIndex
        /// Do not follow the links on this page. If you don't specify this directive, search engines may use the links on the page to discover those linked pages.
        case noFollow
        /// Equivalent to ``noIndex``, ``noFollow``.
        case none
        /// Do not show a cached link in search results. If you don't specify this directive, search engines may generate a cached page and users may access it through the search results.
        case noArchive
        /// Do not show a sitelinks search box in the search results for this page. If you don't specify this directive, search engines may generate a search box specific to your site in search results, along with other direct links to your site.
        case noSiteLinksSearchBox
        /// Do not show a text snippet or video preview in the search results for this page. A static image thumbnail (if available) may still be visible, when it results in a better user experience. This applies to all forms of search results.
        ///
        /// If you don't specify this directive, search engines may generate a text snippet and video preview based on information found on the page.
        case noSnippet
        /// Search engines are allowed to index the content of a page if it's embedded in another page through iframes or similar HTML tags, in spite of a ``noIndex`` directive.
        ///
        /// ``indexIfEmbedded`` only has an effect if it's accompanied by ``noIndex``.
        case indexIfEmbedded
        /// Use a maximum number characters as a textual snippet for this search result. (Note that a URL may appear as multiple search results within a search results page.) This does not affect image or video previews. This directive is ignored if no parseable number is specified.
        ///
        /// If you don't specify this directive, search engines will choose the length of the snippet.
        ///
        /// Special values:
        ///
        /// - `0`: No snippet is to be shown. Equivalent to ``noSnippet``.
        /// - `-1`: Search engines will choose the snippet length that it believes is most effective to help users discover your content and direct users to your site.
        case maximumSnippetLength(Int)
        /// Set the maximum size of an image preview for this page in a search results.
        ///
        /// If you don't specify the `max-image-preview` directive, search engines may show an image preview of the default size.
        case maximumImagePreview(MaximumImagePreview)
        /// Use a maximum of number of seconds as a video snippet for videos on this page in search results.
        ///
        /// Special values:
        ///
        /// - `0`: At most, a static image may be used, in accordance to the max-image-preview setting.
        /// - `-1`: There is no limit.
        case maximumVideoPreview(Int)
        /// Don't offer translation of this page in search results.
        case noTranslate
        /// Do not index images on this page. If you don't specify this value, images on the page may be indexed and shown in search results.
        case noImageIndex
        /// Do not show this page in search results after the specified date/time.
        ///
        /// The directive is ignored if no valid date/time is specified. By default there is no expiration date for content.
        ///
        /// If you don't specify this directive, this page may be shown in search results indefinitely.
        case unavailableAfter(Date)

        public var description: String {
            switch self {
                case .all:
                    return "all"
                case .noIndex:
                    return "noindex"
                case .noFollow:
                    return "nofollow"
                case .none:
                    return "none"
                case .noArchive:
                    return "noarchive"
                case .noSiteLinksSearchBox:
                    return "nositelinkssearchbox"
                case .noSnippet:
                    return "nosnippet"
                case .indexIfEmbedded:
                    return "indexifembedded"
                case .maximumSnippetLength(let value):
                    return "max-snippet-length: \(value)"
                case .maximumImagePreview(let value):
                    return "max-image-preview: \(value.rawValue)"
                case .maximumVideoPreview(let value):
                    return "max-video-preview: \(value)"
                case .noTranslate:
                    return "notranslate"
                case .noImageIndex:
                    return "noimageindex"
                case .unavailableAfter(let date):
                    return "unavailable-after: \(Self.dateFormatter.string(from: date))"
            }
        }

        static let dateFormatter = ISO8601DateFormatter()
    }

    public enum MaximumImagePreview: String {
        /// No image preview is to be shown.
        case none
        /// A default image preview may be shown.
        case standard
        /// A larger image preview, up to the width of the viewport, may be shown.
        case large
    }

    private var indexingOptions: [IndexingOption]

    public var body: AnyContent {
        Meta()
            .name(.robots)
            .content(self.indexingOptions.map(\.description).joined(separator: ", "))
    }

    public init(indexing: [IndexingOption]) {
        self.indexingOptions = indexing
    }
}
