import Foundation

#if canImport(FoundationXML)
import FoundationXML
#endif

internal class Parser {
    
    public enum ParserError: Error {
        
        case noLocalName
        case unkownElement(String)
        case unkownAttribute(String)
        case unknownTag(String)
        
        var description: String {
            
            switch self {
            case .noLocalName:
                return "No local name."
                
            case .unkownElement(let element):
                return "Element '\(element) not found."
                
            case .unkownAttribute(let attribute):
                return "Attribute '\(attribute) not found."
                
            case .unknownTag(let tag):
                return "Tag '\(tag)' not found."
            }
        }
    }
    
    public static let shared = Parser()
    
    private init() {}
    
    internal func parse(tag: LeafTag) throws -> String {
        
        switch tag.kind {
        case .variable:
            return VariableTag(element: tag).build()
            
        case .count:
            return CountTag(element: tag).build()
            
        case .import:
            return ImportTag(element: tag).build()
            
        case .statement:
            return StatementTag(element: tag).build()
            
        case .condition:
            return ConditionTag(element: tag).build()
            
        case .loop:
            return LoopTag(element: tag).build()
            
        case .extend:
            return ExtendTag(element: tag).build()
            
        case .export:
            return ExportTag(element: tag).build()
            
        case .closure:
            return ClosureTag(element: tag).build()
            
        case .capitalize:
            return CapitalizeTag(element: tag).build()
            
        case .lowercase:
            return LowercaseTag(element: tag).build()
            
        case .uppercase:
            return UppercaseTag(element: tag).build()
            
        case .date:
            return DateTag(element: tag).build()
            
        default:
            throw ParserError.unknownTag("tag")
        }
    }
    
    internal func parse(node: XMLNode) throws -> String {
        
        switch node.kind {
            
        case .text:

            if let value = node.stringValue {
                
                if let tag = LeafTag(value: value, level: node.level) {
                    return try parse(tag: tag)
                }
                
                return TextElement(node: node).build()
            }
            
        case .comment:
            return CommentElement(node: node).build()
            
        case .element:
            
            if let element = node as? XMLElement {
                
                guard let localName = element.localName else {
                    throw ParserError.noLocalName
                }
            
                switch localName {
                case "html":
                    return try ContentElement(element: element).build()
                    
                case "head":
                    return try ContentElement(element: element).build(verbatim: "Head")
                    
                case "body":
                    return try ContentElement(element: element).build()
                    
                case "nav":
                    return try ContentElement(element: element).build(verbatim: "Navigation")
                    
                case "link":
                    return try EmptyElement(element: element).build()
                    
                case "aside":
                    return try ContentElement(element: element).build()
                    
                case "section":
                    return try ContentElement(element: element).build()
                    
                case "h1":
                    return try ContentElement(element: element).build(verbatim: "Heading1")
                    
                case "h2":
                    return try ContentElement(element: element).build(verbatim: "Heading2")
                    
                case "h3":
                    return try ContentElement(element: element).build(verbatim: "Heading3")
                    
                case "h4":
                    return try ContentElement(element: element).build(verbatim: "Heading4")
                    
                case "h5":
                    return try ContentElement(element: element).build(verbatim: "Heading5")
                    
                case "h6":
                    return try ContentElement(element: element).build(verbatim: "Heading6")
                    
                case "hgroup":
                    return try ContentElement(element: element).build(verbatim: "HeadingGroup")
                    
                case "header":
                    return try ContentElement(element: element).build()
                    
                case "footer":
                    return try ContentElement(element: element).build()
                    
                case "address":
                    return try ContentElement(element: element).build()
                    
                case "p":
                    return try ContentElement(element: element).build(verbatim: "Paragraph")
                    
                case "hr":
                    return try EmptyElement(element: element).build(verbatim: "HorizontalRule")
                    
                case "pre":
                    return try ContentElement(element: element).build(verbatim: "PreformattedText")
                    
                case "blockquote":
                    return try ContentElement(element: element).build()
                    
                case "ol":
                    return try ContentElement(element: element).build(verbatim: "OrderedList")
                    
                case "ul":
                    return try ContentElement(element: element).build(verbatim: "UnorderedList")
                    
                case "dl":
                    return try ContentElement(element: element).build(verbatim: "DescriptionList")
                    
                case "figure":
                    return try ContentElement(element: element).build()
                    
                case "a":
                    return try ContentElement(element: element).build(verbatim: "Anchor")
                    
                case "em":
                    return try ContentElement(element: element).build(verbatim: "Emphasize")
                    
                case "small":
                    return try ContentElement(element: element).build()
                    
                case "s":
                    return try ContentElement(element: element).build(verbatim: "StrikeThrough")
                    
                case "main":
                    return try ContentElement(element: element).build()
                    
                case "div":
                    return try ContentElement(element: element).build(verbatim: "Division")
                    
                case "dfn":
                    return try ContentElement(element: element).build(verbatim: "Definition")
                    
                case "cite":
                    return try ContentElement(element: element).build()
                    
                case "q":
                    return try ContentElement(element: element).build(verbatim: "ShortQuote")
                    
                case "rt":
                    return try ContentElement(element: element).build(verbatim: "RubyText")
                    
                case "rp":
                    return try ContentElement(element: element).build(verbatim: "RubyPronunciation")
                    
                case "abbr":
                    return try ContentElement(element: element).build(verbatim: "Abbreviation")
                    
                case "data":
                    return try ContentElement(element: element).build()
                    
                case "time":
                    return try ContentElement(element: element).build()
                    
                case "code":
                    return try ContentElement(element: element).build()
                    
                case "v":
                    return try ContentElement(element: element).build(verbatim: "Variable")
                    
                case "samp":
                    return try ContentElement(element: element).build(verbatim: "SampleOutput")
                    
                case "kbd":
                    return try ContentElement(element: element).build(verbatim: "KeyboardOutput")
                    
                case "sub":
                    return try ContentElement(element: element).build(verbatim: "Subscript")
                    
                case "sup":
                    return try ContentElement(element: element).build(verbatim: "Superscript")
                    
                case "i":
                    return try ContentElement(element: element).build(verbatim: "Italic")
                    
                case "b":
                    return try ContentElement(element: element).build(verbatim: "Bold")
                    
                case "strong":
                    return try ContentElement(element: element).build()
                    
                case "u":
                    return try ContentElement(element: element).build(verbatim: "Underline")
                    
                case "mark":
                    return try ContentElement(element: element).build()
                    
                case "bdi":
                    return try ContentElement(element: element).build()
                    
                case "bdo":
                    return try EmptyElement(element: element).build()
                    
                case "span":
                    return try ContentElement(element: element).build()
                    
                case "br":
                    return try EmptyElement(element: element).build(verbatim: "LineBreak")
                    
                case "wbr":
                    return try EmptyElement(element: element).build(verbatim: "WordBreak")
                    
                case "ins":
                    return try ContentElement(element: element).build(verbatim: "InsertedText")
                    
                case "del":
                    return try ContentElement(element: element).build(verbatim: "DeletedText")
                    
                case "img":
                    return try EmptyElement(element: element).build(verbatim: "Image")
                    
                case "embed":
                    return try ContentElement(element: element).build()
                    
                case "iframe":
                    return try ContentElement(element: element).build(verbatim: "InlineFrame")
                    
                case "param":
                    return try EmptyElement(element: element).build(verbatim: "Parameter")
                    
                case "dt":
                    return try ContentElement(element: element).build(verbatim: "TermName")
                    
                case "dd":
                    return try ContentElement(element: element).build(verbatim: "TermDefinition")
                    
                case "figcaption":
                    return try ContentElement(element: element).build(verbatim: "FigureCaption")
                    
                case "optgroup":
                    return try ContentElement(element: element).build(verbatim: "OptionGroup")
                    
                case "option":
                    return try ContentElement(element: element).build()
                    
                case "legend":
                    return try ContentElement(element: element).build()
                    
                case "summary":
                    return try ContentElement(element: element).build()
                    
                case "li":
                    return try ContentElement(element: element).build(verbatim: "ListItem")
                    
                case "colgroup":
                    return try ContentElement(element: element).build(verbatim: "ColumnGroup")
                    
                case "col":
                    return try ContentElement(element: element).build(verbatim: "Column")
                    
                case "tbody":
                    return try ContentElement(element: element).build(verbatim: "TableBody")
                    
                case "thead":
                    return try ContentElement(element: element).build(verbatim: "TableHead")
                    
                case "tfoot":
                    return try ContentElement(element: element).build(verbatim: "TableFoot")
                    
                case "tr":
                    return try ContentElement(element: element).build(verbatim: "TableRow")
                    
                case "td":
                    return try ContentElement(element: element).build(verbatim: "DataCell")
                    
                case "th":
                    return try ContentElement(element: element).build(verbatim: "HeaderCell")
                    
                case "textarea":
                    return try ContentElement(element: element).build(verbatim: "TextArea")
                    
                case "input":
                    return try EmptyElement(element: element).build()
                    
                case "video":
                    return try ContentElement(element: element).build()
                    
                case "audio":
                    return try ContentElement(element: element).build()
                    
                case "map":
                    return try ContentElement(element: element).build()
                    
                case "area":
                    return try ContentElement(element: element).build()
                    
                case "form":
                    return try ContentElement(element: element).build()
                    
                case "datalist":
                    return try ContentElement(element: element).build()
                    
                case "output":
                    return try ContentElement(element: element).build()
                    
                case "meter":
                    return try ContentElement(element: element).build()
                    
                case "details":
                    return try ContentElement(element: element).build()
                    
                case "dialog":
                    return try ContentElement(element: element).build()
                    
                case "script":
                    return try ContentElement(element: element).build()
                    
                case "noscript":
                    return try ContentElement(element: element).build()
                    
                case "template":
                    return try ContentElement(element: element).build()
                    
                case "canvas":
                    return try ContentElement(element: element).build()
                    
                case "table":
                    return try ContentElement(element: element).build()
                    
                case "fieldset":
                    return try ContentElement(element: element).build()
                    
                case "button":
                    return try ContentElement(element: element).build()
                    
                case "select":
                    return try ContentElement(element: element).build()
                    
                case "label":
                    return try ContentElement(element: element).build()
                    
                case "title":
                    return try ContentElement(element: element).build()
                    
                case "base":
                    return try EmptyElement(element: element).build()
                    
                case "meta":
                    return try EmptyElement(element: element).build()
                    
                case "style":
                    return try ContentElement(element: element).build()
                    
                case "source":
                    return try EmptyElement(element: element).build()
                    
                case "track":
                    return try EmptyElement(element: element).build()
                    
                case "article":
                    return try ContentElement(element: element).build()
                    
                case "progress":
                    return try ContentElement(element: element).build()
                    
                case "circle":
                    return try ContentElement(element: element).build()
                    
                case "rect":
                    return try ContentElement(element: element).build(verbatim: "Rectangle")
                    
                case "ellipse":
                    return try ContentElement(element: element).build()
                    
                case "line":
                    return try ContentElement(element: element).build()
                    
                case "polygon":
                    return try ContentElement(element: element).build()
                    
                case "path":
                    return try ContentElement(element: element).build()
                    
                case "use":
                    return try ContentElement(element: element).build()
                    
                default:
                    throw ParserError.unkownElement(localName)
                }
            }
            
        case .attribute:
            
            guard let localName = node.localName else  {
                throw ParserError.noLocalName
            }

            switch localName {
            case "accesskey":
                return try ValueProperty<String>(node: node).build()
                
            case "accept":
                return try ValueProperty<String>(node: node).build()
                
            case "action":
                return try ValueProperty<String>(node: node).build()
                
            case "alt":
                return ValueProperty<String>(node: node).build(verbatim: "alternate")
                
            case "async":
                return EmptyProperty(node: node).build(verbatim: "asynchronously")
                
            case "autocapitalize":
                return try TypeProperty<Capitalization>(node: node).build()
                
            case "autocomplete":
                return ValueProperty<Bool>(node: node).build(verbatim: "hasCompletion")
                
            case "autofocus":
                return try EmptyProperty(node: node).build()
                
            case "autoplay":
                return try EmptyProperty(node: node).build()
                
            case "checked":
                return try EmptyProperty(node: node).build()
                
            case "cite":
                return try ValueProperty<String>(node: node).build()
                
            case "class":
                return try ValueProperty<String>(node: node).build()
                
            case "cols":
                return ValueProperty<Int>(node: node).build(verbatim: "columns")
                
            case "colspan":
                return ValueProperty<Int>(node: node).build(verbatim: "columnSpan")
                
            case "content":
                return try ValueProperty<String>(node: node).build()
                
            case "contenteditable":
                return ValueProperty<Bool>(node: node).build(verbatim: "isEditable")
                
            case "controls":
                return try EmptyProperty(node: node).build()
                
            case "coords":
                return ValueProperty<String>(node: node).build(verbatim: "coordinates")
                
            case "data":
                return try ValueProperty<String>(node: node).build()
                
            case "datetime":
                return ValueProperty<String>(node: node).build(verbatim: "dateTime")
                
            case "default":
                return try EmptyProperty(node: node).build()
                
            case "defer":
                return try EmptyProperty(node: node).build()
                
            case "dir":
                return TypeProperty<Direction>(node: node).build(verbatim: "direction")
                
            case "disabled":
                return try EmptyProperty(node: node).build()
                
            case "download":
                return try EmptyProperty(node: node).build()
                
            case "draggable":
                return ValueProperty<String>(node: node).build(verbatim: "isDraggable")
                
            case "enctype":
                return TypeProperty<Encoding>(node: node).build(verbatim: "encoding")
                
            case "enterkeyhint":
                return TypeProperty<Hint>(node: node).build(verbatim: "enterKeyHint")
                
            case "for":
                return try ValueProperty<String>(node: node).build()
                
            case "form":
                return try ValueProperty<String>(node: node).build()
                
            case "formaction":
                return ValueProperty<String>(node: node).build(verbatim: "formAction")
                
            case "headers":
                return try ValueProperty<String>(node: node).build()
                
            case "height":
                return try ValueProperty<Int>(node: node).build()
                
            case "hidden":
                return try EmptyProperty(node: node).build()
                
            case "high":
                return try ValueProperty<Float>(node: node).build()
                
            case "href":
                return ValueProperty<String>(node: node).build(verbatim: "reference")
                
            case "hreflang":
                return TypeProperty<Language>(node: node).build(verbatim: "referenceLanguage")
                
            case "id":
                return try ValueProperty<String>(node: node).build()
                
            case "ismap":
                return EmptyProperty(node: node).build(verbatim: "isMap")
                
            case "inputmode":
                return ValueProperty<String>(node: node).build(verbatim: "inputMode")
                
            case "is":
                return try ValueProperty<String>(node: node).build()
                
            case "itemid":
                return ValueProperty<String>(node: node).build(verbatim: "itemId")
                
            case "itemproperty":
                return ValueProperty<String>(node: node).build(verbatim: "itemProperty")
                
            case "itemref":
                return ValueProperty<String>(node: node).build(verbatim: "itemReference")
                
            case "itemscope":
                return ValueProperty<String>(node: node).build(verbatim: "itemScope")
                
            case "itemtype":
                return ValueProperty<String>(node: node).build(verbatim: "itemType")
                
            case "kind":
                return try TypeProperty<Kinds>(node: node).build()
                
            case "label":
                return try ValueProperty<String>(node: node).build()
                
            case "lang":
                return TypeProperty<Language>(node: node).build(verbatim: "language")
                
            case "list":
                return try ValueProperty<String>(node: node).build()
                
            case "loop":
                return try EmptyProperty(node: node).build()
                
            case "low":
                return try ValueProperty<Float>(node: node).build()
                
            case "max":

                if let parent = node.parent {
                    
                    guard let localName = parent.localName else  {
                        throw ParserError.noLocalName
                    }
                    
                    switch localName {
                    case "progress", "meter":
                        return ValueProperty<Float>(node: node).build(verbatim: "maximum")
                        
                    default:
                        return ValueProperty<String>(node: node).build(verbatim: "maximum")
                    }
                }
                
            case "media":
                return try ValueProperty<String>(node: node).build()
                
            case "method":
                return try TypeProperty<Method>(node: node).build()
                
            case "min":
                return ValueProperty<String>(node: node).build(verbatim: "minimum")
                
            case "multiple":
                return try EmptyProperty(node: node).build()
                
            case "muted":
                return try EmptyProperty(node: node).build()
                
            case "name":
                
                if let parent = node.parent {
                    
                    guard let localName = parent.localName else {
                        throw ParserError.noLocalName
                    }
                    
                    switch localName {
                    case "meta":
                        return try TypeProperty<Names>(node: node).build()
                        
                    default:
                        return try ValueProperty<String>(node: node).build()
                    }
                }
                
            case "nonce":
                return try ValueProperty<String>(node: node).build()
                
            case "novalidate":
                return try EmptyProperty(node: node).build()
                
            case "open":
                return ValueProperty<Bool>(node: node).build(verbatim: "isOpen")
                
            case "optimum":
                return try ValueProperty<Float>(node: node).build()
                
            case "pattern":
                return try ValueProperty<String>(node: node).build()
                
            case "part":
                return try ValueProperty<String>(node: node).build()
                
            case "ping":
                return try ValueProperty<String>(node: node).build()
                
            case "placeholder":
                return try ValueProperty<String>(node: node).build()
                
            case "poster":
                return try ValueProperty<String>(node: node).build()
                
            case "preload":
                return try TypeProperty<Preload>(node: node).build()
                
            case "readonly":
                return try EmptyProperty(node: node).build()
                
            case "referrerpolicy":
                return TypeProperty<Policy>(node: node).build(verbatim: "referrerPolicy")
                
            case "rel":
                return TypeProperty<Relation>(node: node).build(verbatim: "relationship")
                
            case "required":
                return try EmptyProperty(node: node).build()
                
            case "reversed":
                return try EmptyProperty(node: node).build()
                
            case "role":
                return try TypeProperty<Roles>(node: node).build()
                
            case "rows":
                return try ValueProperty<String>(node: node).build()
                
            case "rowspan":
                return ValueProperty<Int>(node: node).build(verbatim: "rowSpan")
                
            case "sandbox":
                return try EmptyProperty(node: node).build()
                
            case "scope":
                return try ValueProperty<String>(node: node).build()
                
            case "shape":
                return try TypeProperty<Shape>(node: node).build()
                
            case "size":
                return try ValueProperty<String>(node: node).build()
                
            case "sizes":
                return try ValueProperty<Int>(node: node).build()
                
            case "slot":
                return try ValueProperty<String>(node: node).build()
                
            case "span":
                return try ValueProperty<Int>(node: node).build()
                
            case "spellcheck":
                return ValueProperty<Bool>(node: node).build(verbatim: "hasSpellCheck")
                
            case "src":
                return ValueProperty<String>(node: node).build(verbatim: "source")
                
            case "start":
                return try ValueProperty<Int>(node: node).build()
                
            case "step":
                return try ValueProperty<Int>(node: node).build()
                
            case "style":
                return try ValueProperty<String>(node: node).build()
                
            case "tabindex":
                return ValueProperty<Int>(node: node).build(verbatim: "tabIndex")
                
            case "target":
                return try TypeProperty<Target>(node: node).build()
                
            case "title":
                return try ValueProperty<String>(node: node).build()
                
            case "translate":
                return try TypeProperty<Decision>(node: node).build()
                
            case "type":

                if let parent = node.parent {
                    
                    guard let localName = parent.localName else {
                        throw ParserError.noLocalName
                    }
                    
                    switch localName {
                    case "input":
                        return try TypeProperty<Inputs>(node: node).build()
                        
                    case "button":
                        return try TypeProperty<Buttons>(node: node).build()
                        
                    case "link", "script", "audio":
                        return try TypeProperty<Medias>(node: node).build()
                        
                    default:
                        return try ValueProperty<String>(node: node).build()
                    }
                }
                
            case "value":
                return try ValueProperty<String>(node: node).build()
                
            case "width":
                return try ValueProperty<Int>(node: node).build()
                
            case "wrap":
                return try TypeProperty<Wrapping>(node: node).build()
                
            case "property":
                return try TypeProperty<Graphs>(node: node).build()
                
            case "charset":
                return try TypeProperty<Charset>(node: node).build()
                
            case "http-equiv":
                return try TypeProperty<Equivalent>(node: node).build()
                
            case "selected":
                return try EmptyProperty(node: node).build()
                
            case "maxlength":
                return ValueProperty<String>(node: node).build(verbatim: "maximum")
                
            case "minlength":
                return ValueProperty<String>(node: node).build(verbatim: "minimum")
                
            case "fill":
                return try ValueProperty<String>(node: node).build()
                
            case "fill-opacity":
                return ValueProperty<Double>(node: node).build(verbatim: "fillOpacity")
                
            case "stroke":
                return try ValueProperty<String>(node: node).build()
                
            case "stroke-width":
                return ValueProperty<Int>(node: node).build(verbatim: "strokeWidth")
                
            case "stroke-opacity":
                return ValueProperty<Double>(node: node).build(verbatim: "strokeOpacity")
                
            case "stroke-linecap":
                return TypeProperty<Linecap>(node: node).build(verbatim: "strokeLineCap")
                
            case "stroke-linejoin":
                return TypeProperty<Linejoin>(node: node).build(verbatim: "strokeLineJoin")
                
            case "r":
                return ValueProperty<Int>(node: node).build(verbatim: "radius")
                
            case "viewbox":
                return ValueProperty<String>(node: node).build(verbatim: "viewBox")
                
            default:
                throw ParserError.unkownAttribute(localName)
            }
            
        default:
            break
        }
        
        return ""
    }
}

extension Parser {
    
    internal struct CommentElement {
        
        private var value: String? {
            
            guard let value = node.stringValue else {
                return nil
            }
            
            return value
        }
        
        private var level: Int {
            return node.level - 1
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let value = value {
                return "\(indent)Comment(\"\(value)\")\n"
            }
            
            return "\(indent)Comment(\"\")\n"
        }
    }

    internal struct TextElement {
        
        private var value: String? {
            
            guard let value = node.stringValue else {
                return nil
            }
            
            return value
        }
        
        private var level: Int {
            return node.level - 1
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let value = value {
                return "\(indent)\"\(value)\"\n"
            }
            
            return "\(indent)\"\"\n"
        }
    }

    internal struct ContentElement {

        private var name: String {
            
            get throws {
                
                guard let name = element.name else {
                    throw ParserError.noLocalName
                }
            
                return name.capitalized
            }
        }
        
        private var attributes: [String]? {
            
            get throws {
                
                guard let attributes = element.attributes else {
                    return nil
                }
                
                return try attributes.map { attribute in
                    return try Parser.shared.parse(node: attribute)
                }
            }
        }
        
        private var content: [String]? {
            
            get throws {
                
                guard let children = element.children else {
                    return nil
                }
                
                return try children.compactMap { child in
                    return try Parser.shared.parse(node: child)
                }
            }
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: XMLElement
        
        internal init(element: XMLElement) {
            self.element = element
        }
        
        internal func build(preindent: Int? = nil) throws -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            var yield: String = ""
            
            yield += "\(indent)\(try name) {\n"

            if let content = try content {
                yield += content.joined()
            }
            
            yield += "\(indent)}\n"
            
            if let attributes = try attributes {
                yield += "\(indent)\(attributes.joined(separator: "\(indent)"))"
            }
            
            return yield
        }
        
        internal func build(verbatim: String, preindent: Int? = nil) throws -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            var yield: String = ""
            
            yield += "\(indent)\(verbatim) {\n"

            if let content = try content {
                yield += content.joined()
            }
            
            yield += "\(indent)}\n"
            
            if let attributes = try attributes {
                yield += "\(indent)\(attributes.joined(separator: "\(indent)"))"
            }
            
            return yield
        }
    }

    internal struct EmptyElement {

        private var name: String {
            
            get throws {
                
                guard let name = element.name else {
                    throw ParserError.noLocalName
                }
            
                return name.capitalized
            }
        }
        
        private var attributes: [String]? {
            
            get throws {
                
                guard let attributes = element.attributes else {
                    return nil
                }
                
                return try attributes.map { attribute in
                    return try Parser.shared.parse(node: attribute)
                }
            }
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: XMLElement
        
        internal init(element: XMLElement) {
            self.element = element
        }
        
        internal func build(preindent: Int? = nil) throws -> String {

            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            var yield: String = ""
            
            yield += "\(indent)\(try name)()\n"
            
            if let attributes = try attributes {
                yield += "\(indent)\t\(attributes.joined(separator: "\t\(indent)"))"
            }
            
            return yield
        }
        
        internal func build(verbatim: String, preindent: Int? = nil) throws -> String {

            let indent = String(repeating: "\t", count: level + (preindent ?? 0))

            
            
            var yield: String = ""
            
            yield += "\(indent)\(verbatim)()\n"
            
            if let attributes = try attributes {
                yield += "\(indent)\t\(attributes.joined(separator: "\t\(indent)"))"
            }
            
            return yield
        }
    }

    internal struct PageLayout<T: RawRepresentable> {
        
        private let name: String
        
        private var content: String {
            
            get throws {
                return try Parser.shared.parse(node: element)
            }
        }
        
        private var type: String {
            
            if let name = doctype.name, let publicId = doctype.publicID, let systemId = doctype.systemID {
                
                if let type = T(rawValue: "\(name) PUBLIC \"\(publicId)\" \"\(systemId)\"" as! T.RawValue) {
                    return ".\(type)"
                }
            }
            
            return ".html5"
        }
        
        private let doctype: XMLDTD
        
        private let element: XMLElement
        
        internal init(name: String, doctype: XMLDTD, element: XMLElement) {
            self.name = name.capitalized
            self.doctype = doctype
            self.element = element
        }
        
        internal func build() throws -> String {
            
            return """
            import HTMLKit
            
            struct \(name)Page: Page {
            
                public var body: AnyContent {
                    Document(type: \(type))
            \(try content)
                }
            }
            """
        }
    }

    internal struct ViewLayout {
        
        private let name: String
        
        private var content: String {

            get throws {
                return try Parser.shared.parse(node: element)
            }
        }
        
        private let element: XMLElement
        
        internal init(name: String, element: XMLElement) {
            self.name = name.capitalized
            self.element = element
        }
        
        internal func build() throws -> String {
            
            return """
            import HTMLKit
            
            struct \(name)View: View {
            
                @TemplateValue(String.self) var context
            
                public var body: AnyContent {
            \(try content)
                }
            }
            """
        }
    }

    internal struct ValueProperty<T: InitRepresentable> {
        
        private var name: String {
            
            get throws {
                
                guard let name = node.name else {
                    throw ParserError.noLocalName
                }
                
                return name
            }
        }
        
        private var value: T? {
            
            guard let value = node.stringValue else {
                return nil
            }
            
            return T(value: value)
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        internal func build() throws -> String {

            if let value = self.value {
                
                switch value {
                case is Float, is Int, is Double, is Bool:
                    
                    return ".\(try name)(\(value))\n"
                    
                default:
                    return ".\(try name)(\"\(value)\")\n"
                }
            }
            
            return ".\(try name)()\n"
        }
        
        internal func build(verbatim: String) -> String {

            if let value = value {
                
                switch value {
                case is Float, is Int, is Double, is Bool:
                    return ".\(verbatim)(\(value))\n"
                    
                default:
                    return ".\(verbatim)(\"\(value)\")\n"
                }
            }
            
            return ".\(verbatim)()\n"
        }
    }

    internal struct EmptyProperty {
        
        private var name: String {
            
            get throws {
                
                guard let name = node.name else {
                    throw ParserError.noLocalName
                }
                
                return name
            }
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        internal func build() throws -> String {
            return ".\(try name)()\n"
        }
        
        internal func build(verbatim: String) -> String {
            return ".\(verbatim)()\n"
        }
    }

    internal struct TypeProperty<T: RawRepresentable>{
        
        private var name: String {
            
            get throws {
                
                guard let name = node.name else {
                    throw ParserError.noLocalName
                }
                
                return name
            }
        }
        
        private var value: T? {

            guard let value = node.stringValue  else {
                return nil
            }
            
            return T(rawValue: value.lowercased() as! T.RawValue)
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        internal func build() throws -> String {

            if let value = value {
                return ".\(try name)(.\(value))\n"
            }
            
            return ".\(try name)()\n"
        }
        
        internal func build(verbatim: String) -> String {

            if let value = value {
                return ".\(verbatim)(.\(value))\n"
            }
            
            return ".\(verbatim)()\n"
        }
    }

    internal struct CustomProperty {
        
        private var name: String {
            
            get throws {
                
                guard let name = node.name else {
                    throw ParserError.noLocalName
                }
                
                return name
            }
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
        
        internal func build() throws -> String {
            
            if let value = value {
                return ".custom(key: \"\(try name)\", value: \"\(value)\")\n"
            }
            
            return ".custom(key: \"\(try name)\", value: \"\")\n"
        }
    }
    
    internal struct VariableTag {
        
        private var text: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let text = text {
                "\(indent)context.\(text)\n"
            }
        }
    }

    internal struct CountTag {
        
        private var text: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let text = text {
                "\(indent)context.\(text).count\n"
            }
        }
    }

    internal struct ImportTag {
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            "\(indent)content\n"
        }
    }

    internal struct StatementTag {
        
        private var text: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value.capitalized
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let text = text {
                "\(indent)IF(\(text)) {\n"
            }
        }
    }

    internal struct ConditionTag {
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            "\(indent)}.else {\n"
        }
    }

    internal struct LoopTag {
        
        private var collection: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value.components(separatedBy: " in ").last
        }
        
        private var single: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value.components(separatedBy: " in ").first
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let collection = collection, let single = single {
                "\(indent)ForEach(in: \(collection)) { \(single) in\n"
            }
        }
    }

    internal struct ExtendTag {
        
        private var text: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value.capitalized
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let text = text {
                "\(indent)\(text)View()\n"
            }
        }
    }

    internal struct ExportTag {
        
        private var children: [String]? {
            
            guard let value = element.value else {
                return nil
            }
            
            let components: [String] = value.components(separatedBy: "#")
                .compactMap { component in
                
                if !component.isEmpty {
                    return component.substring(from: "(\"", to: "\")")
                }
                
                return nil
            }
            
            return components
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let children = children {
                
                if let first = children.first {
                    "\(indent)\(first.capitalized) {\n"
                }
                
                if let last = children.last {
                    "\(indent)\(last.capitalized) {\n"
                }
            }
        }
    }

    internal struct ClosureTag {
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            "\(indent)}\n"
        }
    }

    internal struct UppercaseTag {
        
        private var text: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let text = text {
                "\(indent)context.\(text).uppercased()\n"
            }
        }
    }

    internal struct LowercaseTag {
        
        private var text: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let text = text {
                "\(indent)context.\(text).lowercased()\n"
            }
        }
    }

    internal struct CapitalizeTag {
        
        private var text: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let text = text {
                "\(indent)context.\(text).capitalized\n"
            }
        }
    }

    internal struct DateTag {
        
        private var parameter: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value.substring(to: ",")
        }
        
        private var format: String? {
            
            guard let value = element.value else {
                return nil
            }
            
            return value.substring(from: "\"", to: "\"", lastOption: .backwards)
        }
        
        private var level: Int {
            return element.level - 1
        }
        
        private let element: LeafTag
        
        internal init(element: LeafTag) {
            self.element = element
        }
        
        @StringBuilder internal func build(preindent: Int? = nil) -> String {
            
            let indent = String(repeating: "\t", count: level + (preindent ?? 0))
            
            if let parameter = parameter, let format = format {
                "\(indent)context.\(parameter).formatted(string: \"\(format)\")\n"
            }
        }
    }
}
