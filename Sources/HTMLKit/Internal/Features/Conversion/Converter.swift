/*
 Abstract:
 The file contains the converter.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import Foundation
 #if canImport(FoundationXML)
 import FoundationXML
 #endif

@available(macOS 11.0, *)
public class Converter {
    
    public enum Extension: String {
        case html
        case leaf
    }
    
    public enum Output: String {
        case print
        case file
    }
    
    public enum Errors: Error {
        case rootNotFound
    }
    
    public static let `default` = Converter()

    private init() {}
    
    public func convert(directory: URL, fileExtension: Extension = .html, option: Output) throws {
        
        if let enumerator = FileManager.default.enumerator(at: directory, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
            
            for case let path as URL in enumerator {
                
                if !path.hasDirectoryPath {

                    if path.pathExtension != fileExtension.rawValue {
                        enumerator.skipDescendants()
                    } else {
                        try convert(file: path, option: option)
                    }
                    
                }
            }
        }
    }

    public func convert(file: URL, option: Output) throws {
        
        let fileName = file.deletingPathExtension().lastPathComponent
        
        let document = try XMLDocument(contentsOf: file, options: [.documentIncludeContentTypeDeclaration])
        
        guard let root = document.rootElement() else {
            throw Errors.rootNotFound
        }
        
        switch option {
        case .print:
            
            if let dtd = document.dtd {
                
                let layout = PageLayout<Doctypes>(name: fileName, doctype: dtd, root: root).build()
                
                print(layout)
                
            } else {
                
                let layout = ViewLayout(name: fileName, root: root).build()
                
                print(layout)
            }
            
        case .file:
            
            if let dtd = document.dtd {
                
                let layout = PageLayout<Doctypes>(name: fileName, doctype: dtd, root: root).build()
                
                try layout.write(to: file.deletingPathExtension().appendingPathExtension("swift"),
                              atomically: true,
                              encoding: .utf8)
                
            } else {
                
                let layout = ViewLayout(name: fileName, root: root).build()
                
                try layout.write(to: file.deletingPathExtension().appendingPathExtension("swift"),
                              atomically: true,
                              encoding: .utf8)
            }
        }
    }
    
    /// Converts only as a component to be put into an existing Page or View layout
    public func convert(html: String) throws -> String {
        let document = try XMLDocument(xmlString: html, options: [.documentIncludeContentTypeDeclaration])
        
        guard let root = document.rootElement() else {
            throw Errors.rootNotFound
        }
        
        let content = Converter.default.decode(element: root, indent: 2)
        return content
    }
    
    @StringBuilder private func decode(attribute: XMLNode) -> String {
        
        switch attribute.localName {
        case "accesskey":
            ValueProperty(node: attribute).build()
        case "accept":
            ValueProperty(node: attribute).build()
        case "action":
            ValueProperty(node: attribute).build()
        case "alt":
            ValueProperty(node: attribute).build(verbatim: "alternate")
        case "async":
            EmptyProperty(node: attribute).build(verbatim: "asynchronously")
        case "autocapitalize":
            TypeProperty<Capitalization>(node: attribute).build()
        case "autocomplete":
            ValueProperty(node: attribute).build()
        case "autofocus":
            EmptyProperty(node: attribute).build()
        case "autoplay":
            EmptyProperty(node: attribute).build()
        case "checked":
            EmptyProperty(node: attribute).build()
        case "cite":
            ValueProperty(node: attribute).build()
        case "class":
            ValueProperty(node: attribute).build()
        case "cols":
            ValueProperty(node: attribute).build(verbatim: "columns")
        case "colspan":
            ValueProperty(node: attribute).build(verbatim: "columnSpan")
        case "content":
            ValueProperty(node: attribute).build()
        case "contenteditable":
            ValueProperty(node: attribute).build(verbatim: "isEditable")
        case "controls":
            EmptyProperty(node: attribute).build()
        case "coords":
            ValueProperty(node: attribute).build(verbatim: "coordinates")
        case "data":
            ValueProperty(node: attribute).build()
        case "datetime":
            ValueProperty(node: attribute).build(verbatim: "dateTime")
        case "default":
            EmptyProperty(node: attribute).build()
        case "defer":
            EmptyProperty(node: attribute).build()
        case "dir":
            TypeProperty<Direction>(node: attribute).build(verbatim: "direction")
        case "disabled":
            EmptyProperty(node: attribute).build()
        case "download":
            EmptyProperty(node: attribute).build()
        case "draggable":
            ValueProperty(node: attribute).build(verbatim: "isDraggable")
        case "enctype":
            TypeProperty<Encoding>(node: attribute).build(verbatim: "encoding")
        case "enterkeyhint":
            TypeProperty<Hint>(node: attribute).build(verbatim: "enterKeyHint")
        case "for":
            ValueProperty(node: attribute).build()
        case "form":
            ValueProperty(node: attribute).build()
        case "formaction":
            ValueProperty(node: attribute).build(verbatim: "formAction")
        case "headers":
            ValueProperty(node: attribute).build()
        case "height":
            ValueProperty(node: attribute).build()
        case "hidden":
            EmptyProperty(node: attribute).build()
        case "high":
            ValueProperty(node: attribute).build()
        case "href":
            ValueProperty(node: attribute).build(verbatim: "reference")
        case "hreflang":
            TypeProperty<Language>(node: attribute).build(verbatim: "referenceLanguage")
        case "id":
            ValueProperty(node: attribute).build()
        case "ismap":
            EmptyProperty(node: attribute).build(verbatim: "isMap")
        case "inputmode":
            ValueProperty(node: attribute).build(verbatim: "inputMode")
        case "is":
            ValueProperty(node: attribute).build()
        case "itemid":
            ValueProperty(node: attribute).build(verbatim: "itemId")
        case "itemproperty":
            ValueProperty(node: attribute).build(verbatim: "itemProperty")
        case "itemref":
            ValueProperty(node: attribute).build(verbatim: "itemReference")
        case "itemscope":
            ValueProperty(node: attribute).build(verbatim: "itemScope")
        case "itemtype":
            ValueProperty(node: attribute).build(verbatim: "itemType")
        case "kind":
            ValueProperty(node: attribute).build()
        case "label":
            ValueProperty(node: attribute).build()
        case "lang":
            TypeProperty<Language>(node: attribute).build(verbatim: "language")
        case "list":
            ValueProperty(node: attribute).build()
        case "loop":
            EmptyProperty(node: attribute).build()
        case "low":
            ValueProperty(node: attribute).build()
        case "max":
            ValueProperty(node: attribute).build(verbatim: "maximum")
        case "media":
            ValueProperty(node: attribute).build()
        case "method":
            TypeProperty<Method>(node: attribute).build()
        case "min":
            ValueProperty(node: attribute).build(verbatim: "minimum")
        case "multiple":
            EmptyProperty(node: attribute).build()
        case "muted":
            EmptyProperty(node: attribute).build()
        case "name":
            
            if let parent = attribute.parent {
                
                switch parent.localName {
                case "meta":
                    TypeProperty<Names>(node: attribute).build()
                default:
                    ValueProperty(node: attribute).build()
                }
            }
            
        case "nonce":
            ValueProperty(node: attribute).build()
        case "novalidate":
            EmptyProperty(node: attribute).build()
        case "open":
            ValueProperty(node: attribute).build(verbatim: "isOpen")
        case "optimum":
            ValueProperty(node: attribute).build()
        case "pattern":
            ValueProperty(node: attribute).build()
        case "part":
            ValueProperty(node: attribute).build()
        case "ping":
            ValueProperty(node: attribute).build()
        case "placeholder":
            ValueProperty(node: attribute).build()
        case "poster":
            ValueProperty(node: attribute).build()
        case "preload":
            ValueProperty(node: attribute).build()
        case "readonly":
            EmptyProperty(node: attribute).build()
        case "referrerpolicy":
            TypeProperty<Policy>(node: attribute).build(verbatim: "referrerPolicy")
        case "rel":
            TypeProperty<Relation>(node: attribute).build(verbatim: "relationship")
        case "required":
            EmptyProperty(node: attribute).build()
        case "reversed":
            EmptyProperty(node: attribute).build()
        case "role":
            TypeProperty<Roles>(node: attribute).build()
        case "rows":
            ValueProperty(node: attribute).build()
        case "rowspan":
            ValueProperty(node: attribute).build(verbatim: "rowSpan")
        case "sandbox":
            EmptyProperty(node: attribute).build()
        case "scope":
            ValueProperty(node: attribute).build()
        case "shape":
            TypeProperty<Shape>(node: attribute).build()
        case "size":
            ValueProperty(node: attribute).build()
        case "sizes":
            ValueProperty(node: attribute).build()
        case "slot":
            ValueProperty(node: attribute).build()
        case "span":
            ValueProperty(node: attribute).build()
        case "spellcheck":
            ValueProperty(node: attribute).build(verbatim: "hasSpellCheck")
        case "src":
            ValueProperty(node: attribute).build(verbatim: "source")
        case "start":
            ValueProperty(node: attribute).build()
        case "step":
            ValueProperty(node: attribute).build()
        case "style":
            ValueProperty(node: attribute).build()
        case "tabindex":
            ValueProperty(node: attribute).build(verbatim: "tabIndex")
        case "target":
            TypeProperty<Target>(node: attribute).build()
        case "title":
            ValueProperty(node: attribute).build()
        case "translate":
            ValueProperty(node: attribute).build()
        case "type":

            if let parent = attribute.parent {
                
                switch parent.localName {
                case "input":
                    TypeProperty<Inputs>(node: attribute).build()
                case "button":
                    TypeProperty<Buttons>(node: attribute).build()
                case "link":
                    TypeProperty<Medias>(node: attribute).build()
                case "script":
                    TypeProperty<Medias>(node: attribute).build()
                case "audio":
                    TypeProperty<Medias>(node: attribute).build()
                default:
                    ValueProperty(node: attribute).build()
                }
            }
            
        case "value":
            ValueProperty(node: attribute).build()
        case "width":
            ValueProperty(node: attribute).build()
        case "wrap":
            TypeProperty<Wrapping>(node: attribute).build()
        case "property":
            TypeProperty<Graphs>(node: attribute).build()
        case "charset":
            TypeProperty<Charset>(node: attribute).build()
        case "http-equiv":
            TypeProperty<Equivalent>(node: attribute).build()
        case "selected":
            EmptyProperty(node: attribute).build()
        default:
            CustomProperty(node: attribute).build()
        }
    }
    
    @StringBuilder private func decode(element: XMLNode, indent: Int? = nil) -> String {
        
        switch element.kind {
        case .text:
            
            TextElement(node: element).build(preindent: indent)
            
        case .comment:
            
            CommentElement(node: element).build(preindent: indent)
            
        default:
            
            if let element = element as? XMLElement {
             
                switch element.localName {
                case "html":
                    ContentElement(element: element).build(preindent: indent)
                case "head":
                    ContentElement(element: element).build(verbatim: "Head", preindent: indent)
                case "body":
                    ContentElement(element: element).build(preindent: indent)
                case "nav":
                    ContentElement(element: element).build(verbatim: "Navigation", preindent: indent)
                case "link":
                    EmptyElement(element: element).build(preindent: indent)
                case "aside":
                    ContentElement(element: element).build(preindent: indent)
                case "section":
                    ContentElement(element: element).build(preindent: indent)
                case "h1":
                    ContentElement(element: element).build(verbatim: "Heading1", preindent: indent)
                case "h2":
                    ContentElement(element: element).build(verbatim: "Heading2", preindent: indent)
                case "h3":
                    ContentElement(element: element).build(verbatim: "Heading3", preindent: indent)
                case "h4":
                    ContentElement(element: element).build(verbatim: "Heading4", preindent: indent)
                case "h5":
                    ContentElement(element: element).build(verbatim: "Heading5", preindent: indent)
                case "h6":
                    ContentElement(element: element).build(verbatim: "Heading6", preindent: indent)
                case "hgroup":
                    ContentElement(element: element).build(verbatim: "HeadingGroup", preindent: indent)
                case "header":
                    ContentElement(element: element).build(preindent: indent)
                case "footer":
                    ContentElement(element: element).build(preindent: indent)
                case "address":
                    ContentElement(element: element).build(preindent: indent)
                case "p":
                    ContentElement(element: element).build(verbatim: "Paragraph", preindent: indent)
                case "hr":
                    EmptyElement(element: element).build(verbatim: "HorizontalRule", preindent: indent)
                case "pre":
                    ContentElement(element: element).build(verbatim: "PreformattedText", preindent: indent)
                case "blockquote":
                    ContentElement(element: element).build(preindent: indent)
                case "ol":
                    ContentElement(element: element).build(verbatim: "OrderedList", preindent: indent)
                case "ul":
                    ContentElement(element: element).build(verbatim: "UnorderedList", preindent: indent)
                case "dl":
                    ContentElement(element: element).build(verbatim: "DescriptionList", preindent: indent)
                case "figure":
                    ContentElement(element: element).build(preindent: indent)
                case "a":
                    ContentElement(element: element).build(verbatim: "Anchor", preindent: indent)
                case "em":
                    ContentElement(element: element).build(verbatim: "Emphasize", preindent: indent)
                case "small":
                    ContentElement(element: element).build(preindent: indent)
                case "s":
                    ContentElement(element: element).build(verbatim: "StrikeThrough", preindent: indent)
                case "main":
                    ContentElement(element: element).build(preindent: indent)
                case "div":
                    ContentElement(element: element).build(verbatim: "Division", preindent: indent)
                case "dfn":
                    ContentElement(element: element).build(verbatim: "Definition", preindent: indent)
                case "cite":
                    ContentElement(element: element).build(preindent: indent)
                case "q":
                    ContentElement(element: element).build(verbatim: "ShortQuote", preindent: indent)
                case "rt":
                    ContentElement(element: element).build(verbatim: "RubyText", preindent: indent)
                case "rp":
                    ContentElement(element: element).build(verbatim: "RubyPronunciation", preindent: indent)
                case "abbr":
                    ContentElement(element: element).build(verbatim: "Abbreviation", preindent: indent)
                case "data":
                    ContentElement(element: element).build(preindent: indent)
                case "time":
                    ContentElement(element: element).build(preindent: indent)
                case "code":
                    ContentElement(element: element).build(preindent: indent)
                case "v":
                    ContentElement(element: element).build(verbatim: "Variable", preindent: indent)
                case "samp":
                    ContentElement(element: element).build(verbatim: "SampleOutput", preindent: indent)
                case "kbd":
                    ContentElement(element: element).build(verbatim: "KeyboardOutput", preindent: indent)
                case "sub":
                    ContentElement(element: element).build(verbatim: "Subscript", preindent: indent)
                case "sup":
                    ContentElement(element: element).build(verbatim: "Superscript", preindent: indent)
                case "i":
                    ContentElement(element: element).build(verbatim: "Italic", preindent: indent)
                case "b":
                    ContentElement(element: element).build(verbatim: "Bold", preindent: indent)
                case "u":
                    ContentElement(element: element).build(verbatim: "SampleOutput", preindent: indent)
                case "mark":
                    ContentElement(element: element).build(preindent: indent)
                case "bdi":
                    ContentElement(element: element).build(preindent: indent)
                case "bdo":
                    EmptyElement(element: element).build(preindent: indent)
                case "span":
                    ContentElement(element: element).build(preindent: indent)
                case "br":
                    EmptyElement(element: element).build(verbatim: "LineBreak", preindent: indent)
                case "wbr":
                    EmptyElement(element: element).build(verbatim: "WordBreak", preindent: indent)
                case "ins":
                    ContentElement(element: element).build(verbatim: "InsertedText", preindent: indent)
                case "del":
                    ContentElement(element: element).build(verbatim: "DeletedText", preindent: indent)
                case "img":
                    EmptyElement(element: element).build(verbatim: "Image", preindent: indent)
                case "embed":
                    ContentElement(element: element).build(preindent: indent)
                case "iframe":
                    ContentElement(element: element).build(verbatim: "InlineFrame", preindent: indent)
                case "param":
                    EmptyElement(element: element).build(verbatim: "Parameter", preindent: indent)
                case "dt":
                    ContentElement(element: element).build(verbatim: "TermName", preindent: indent)
                case "dd":
                    ContentElement(element: element).build(verbatim: "TermDefinition", preindent: indent)
                case "figcaption":
                    ContentElement(element: element).build(verbatim: "FigureCaption", preindent: indent)
                case "optgroup":
                    ContentElement(element: element).build(verbatim: "OptionGroup", preindent: indent)
                case "option":
                    ContentElement(element: element).build(preindent: indent)
                case "legend":
                    ContentElement(element: element).build(preindent: indent)
                case "summary":
                    ContentElement(element: element).build(preindent: indent)
                case "li":
                    ContentElement(element: element).build(verbatim: "ListItem", preindent: indent)
                case "colgroup":
                    ContentElement(element: element).build(verbatim: "ColumnGroup", preindent: indent)
                case "col":
                    ContentElement(element: element).build(verbatim: "Column", preindent: indent)
                case "tbody":
                    ContentElement(element: element).build(verbatim: "TableBody", preindent: indent)
                case "thead":
                    ContentElement(element: element).build(verbatim: "TableHead", preindent: indent)
                case "tfoot":
                    ContentElement(element: element).build(verbatim: "TableFoot", preindent: indent)
                case "tr":
                    ContentElement(element: element).build(verbatim: "TableRow", preindent: indent)
                case "td":
                    ContentElement(element: element).build(verbatim: "DataCell", preindent: indent)
                case "th":
                    ContentElement(element: element).build(verbatim: "HeaderCell", preindent: indent)
                case "textarea":
                    ContentElement(element: element).build(verbatim: "TextArea", preindent: indent)
                case "input":
                    EmptyElement(element: element).build(preindent: indent)
                case "video":
                    ContentElement(element: element).build(preindent: indent)
                case "audio":
                    ContentElement(element: element).build(preindent: indent)
                case "map":
                    ContentElement(element: element).build(preindent: indent)
                case "area":
                    ContentElement(element: element).build(preindent: indent)
                case "form":
                    ContentElement(element: element).build(preindent: indent)
                case "datalist":
                    ContentElement(element: element).build(preindent: indent)
                case "output":
                    ContentElement(element: element).build(preindent: indent)
                case "meter":
                    ContentElement(element: element).build(preindent: indent)
                case "details":
                    ContentElement(element: element).build(preindent: indent)
                case "dialog":
                    ContentElement(element: element).build(preindent: indent)
                case "script":
                    ContentElement(element: element).build(preindent: indent)
                case "noscript":
                    ContentElement(element: element).build(preindent: indent)
                case "template":
                    ContentElement(element: element).build(preindent: indent)
                case "canvas":
                    ContentElement(element: element).build(preindent: indent)
                case "table":
                    ContentElement(element: element).build(preindent: indent)
                case "fieldset":
                    ContentElement(element: element).build(preindent: indent)
                case "button":
                    ContentElement(element: element).build(preindent: indent)
                case "select":
                    ContentElement(element: element).build(preindent: indent)
                case "label":
                    ContentElement(element: element).build(preindent: indent)
                case "title":
                    ContentElement(element: element).build(preindent: indent)
                case "base":
                    EmptyElement(element: element).build(preindent: indent)
                case "meta":
                    EmptyElement(element: element).build(preindent: indent)
                case "style":
                    ContentElement(element: element).build(preindent: indent)
                case "source":
                    EmptyElement(element: element).build(preindent: indent)
                case "track":
                    EmptyElement(element: element).build(preindent: indent)
                case "article":
                    ContentElement(element: element).build(preindent: indent)
                default:
                    "element is not listed. contact the author"
                }
            }
        }
    }
}

@available(macOS 11.0, *)
extension Converter {
    
    private struct CommentElement {
        
        private var comment: String? {
            
            guard let comment = node.stringValue else {
                return nil
            }
            
            return comment
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: (node.level - 1) + (preindent ?? 0))
            
            if let comment = comment
            {
                "\(indent)Comment(\"\(comment)\")\n"
            }
        }
    }

    private struct TextElement {
        
        private var text: String? {
            
            guard let text = node.stringValue else {
                return nil
            }
            
            return text
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: (node.level - 1) + (preindent ?? 0))
            
            if let text = text {
                "\(indent)\"\(text)\"\n"
            }
        }
    }

    private struct ContentElement {

        private var name: String? {
            
            guard let name = element.name else {
                return nil
            }
        
            return name.capitalized
        }
        
        private var attributes: [String]? {
            
            guard let attributes = element.attributes else {
                return nil
            }
            
            return attributes.map { attribute in
                return Converter.default.decode(attribute: attribute)
            }
        }
        
        private var content: [String]? {
            
            guard let children = element.children else {
                return nil
            }
            
            return children.map { child in
                return Converter.default.decode(element: child, indent: 2)
            }
        }
        
        private var level: Int {
            return element.level
        }
        
        private let element: XMLElement
        
        internal init(element: XMLElement) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: (level - 1) + (preindent ?? 0))
            
            if let name = name {
                
                "\(indent)\(name) {\n"

                if let content = content {
                    content.joined()
                }
                
                "\(indent)}\n"
                
                if let attributes = attributes {
                    "\(indent)\(attributes.joined(separator: "\(indent)"))"
                }
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil, preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: (level - 1) + (preindent ?? 0))
            
            if let verbatim = verbatim {
                
                "\(indent)\(verbatim) {\n"

                if let content = content {
                    content.joined()
                }
                
                "\(indent)}\n"
                
                if let attributes = attributes {
                    "\(indent)\(attributes.joined(separator: "\(indent)"))"
                }
            }
        }
    }

    private struct EmptyElement {

        private var name: String? {
            
            guard let name = element.name else {
                return nil
            }
        
            return name.capitalized
        }
        
        private var attributes: [String]? {
            
            guard let attributes = element.attributes else {
                return nil
            }
            
            return attributes.map { attribute in
                return Converter.default.decode(attribute: attribute)
            }
        }
        
        private var level: Int {
            return element.level
        }
        
        private let element: XMLElement
        
        internal init(element: XMLElement) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {

            let indent = String(repeating: "\t", count: (level - 1) + (preindent ?? 0))

            if let name = name {
                
                "\(indent)\(name)()\n"
                
                if let attributes = attributes {
                    "\(indent)\t\(attributes.joined(separator: "\t\(indent)"))"
                }
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil, preindent: Int? = nil) -> String {

            let indent = String(repeating: "\t", count: (level - 1) + (preindent ?? 0))

            if let verbatim = verbatim {
        
                "\(indent)\(verbatim)()\n"
                
                if let attributes = attributes {
                    "\(indent)\t\(attributes.joined(separator: "\t\(indent)"))"
                }
                
            }
        }
    }

    private struct PageLayout<T: RawRepresentable> {
        
        private var name: String
        
        private var content: String {
            return Converter.default.decode(element: root, indent: 2)
        }
        
        private var type: String {
            
            if let name = doctype.name, let publicId = doctype.publicID, let systemId = doctype.systemID {
                
                if let type = T(rawValue: "\(name) PUBLIC \"\(publicId)\" \"\(systemId)\"" as! T.RawValue) {
                    return ".\(type)"
                }
            }
            
            return ".html5"
        }
        
        private var doctype: XMLDTD
        
        private var root: XMLElement
        
        internal init(name: String, doctype: XMLDTD, root: XMLElement) {
            self.name = name.capitalized
            self.doctype = doctype
            self.root = root
        }
        
        internal func build() -> String {
            
            """
            import HTMLKit
            
            struct \(name)Page: Page {
            
                public var body: AnyContent {
                    Document(type: \(type))
            \(content)
                }
            }
            """
        }
    }

    private struct ViewLayout {
        
        private var name: String
        
        private var content: String {
            return Converter.default.decode(element: root, indent: 2)
        }
        
        private var root: XMLElement
        
        internal init(name: String, root: XMLElement) {
            self.name = name.capitalized
            self.root = root
        }
        
        internal func build() -> String {
            
            """
            import HTMLKit
            
            struct \(name)View: View {
            
                var context: TemplateValue<String> = ""
            
                public var body: AnyContent {
            \(content)
                }
            }
            """
        }
    }

    private struct ValueProperty{
        
        private var name: String? {
            
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: String? {
            guard let value = node.stringValue else {
                return nil
            }
            
            return value
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {

            if let name = name, let value = value {
                
                ".\(name)(\"\(value)\")\n"
                
            } else if let name = name{
                
                ".\(name)()"
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {

            if let verbatim = verbatim, let value = value {
                
                ".\(verbatim)(\"\(value)\")\n"
                
            } else if let verbatim = verbatim {
                
                ".\(verbatim)()"
            }
        }
    }

    private struct EmptyProperty {
        
        private var name: String? {
            
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {

            if let name = name {
                ".\(name)()\n"
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {

            if let verbatim = verbatim {
                ".\(verbatim)()\n"
            }
        }
    }

    private struct TypeProperty<T: RawRepresentable>{
        
        private var name: String? {
            
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: String? {

            guard let value = node.stringValue  else {
                return nil
            }

            if let type = T(rawValue: value.lowercased() as! T.RawValue) {
                return ".\(type)"
            }
            
            return ""
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {

            if let name = name, let value = value {
                
                ".\(name)(\(value))\n"
                
            } else if let name = name{
                
                ".\(name)()"
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {

            if let verbatim = verbatim, let value = value {
                
                ".\(verbatim)(\(value))\n"
                
            } else if let verbatim = verbatim {
                
                ".\(verbatim)()"
            }
        }
    }

    private struct CustomProperty {
        
        private var name: String? {
            
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: String? {
            
            guard let value = node.stringValue else {
                return nil
            }
            
            return value
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {

            if let name = name {
                ".custom(key: \"\(name)\", value: \"\(value ?? "")\")\n"
            }
        }
    }
}
