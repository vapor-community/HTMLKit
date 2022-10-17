import HTMLKit
import Foundation

#if canImport(FoundationXML)
import FoundationXML
#endif

internal class Parser {
    
    internal enum ParserError: Error {
        
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
    
    internal static let shared = Parser()
    
    private init() {}
    
    internal func parse(node: XMLNode, indent: Int? = nil) throws -> String {
        
        switch node.kind {
        case .text:
            return TextElement(node: node).build()
            
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
                    return try ContentElement(element: element).build(verbatim: "Strong")
                    
                case "u":
                    return try ContentElement(element: element).build(verbatim: "SampleOutput")
                    
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
                    
                case "g":
                    return try ContentElement(element: element).build(verbatim: "Group")
                    
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
                return try ValueAttribute<String>(node: node).build()
                
            case "accept":
                return try ValueAttribute<String>(node: node).build()
                
            case "action":
                return try ValueAttribute<String>(node: node).build()
                
            case "alt":
                return try ValueAttribute<String>(node: node).build(verbatim: "alternate")
                
            case "async":
                return try EmptyAttribute(node: node).build(verbatim: "asynchronously")
                
            case "autocapitalize":
                return try TypeAttribute<Values.Capitalization>(node: node).build()
                
            case "autocomplete":
                return try ValueAttribute<Bool>(node: node).build(verbatim: "hasCompletion")
                
            case "autofocus":
                return try EmptyAttribute(node: node).build()
                
            case "autoplay":
                return try EmptyAttribute(node: node).build()
                
            case "checked":
                return try EmptyAttribute(node: node).build()
                
            case "cite":
                return try ValueAttribute<String>(node: node).build()
                
            case "class":
                return try ValueAttribute<String>(node: node).build()
                
            case "cols":
                return try ValueAttribute<Int>(node: node).build(verbatim: "columns")
                
            case "colspan":
                return try ValueAttribute<Int>(node: node).build(verbatim: "columnSpan")
                
            case "content":
                return try ValueAttribute<String>(node: node).build()
                
            case "contenteditable":
                return try ValueAttribute<Bool>(node: node).build(verbatim: "isEditable")
                
            case "controls":
                return try EmptyAttribute(node: node).build()
                
            case "coords":
                return try ValueAttribute<String>(node: node).build(verbatim: "coordinates")
                
            case "data":
                return try ValueAttribute<String>(node: node).build()
                
            case "datetime":
                return try ValueAttribute<String>(node: node).build(verbatim: "dateTime")
                
            case "default":
                return try EmptyAttribute(node: node).build()
                
            case "defer":
                return try EmptyAttribute(node: node).build()
                
            case "dir":
                return try TypeAttribute<Values.Direction>(node: node).build(verbatim: "direction")
                
            case "disabled":
                return try EmptyAttribute(node: node).build()
                
            case "download":
                return try EmptyAttribute(node: node).build()
                
            case "draggable":
                return try ValueAttribute<String>(node: node).build(verbatim: "isDraggable")
                
            case "enctype":
                return try TypeAttribute<Values.Encoding>(node: node).build(verbatim: "encoding")
                
            case "enterkeyhint":
                return try TypeAttribute<Values.Hint>(node: node).build(verbatim: "enterKeyHint")
                
            case "for":
                return try ValueAttribute<String>(node: node).build()
                
            case "form":
                return try ValueAttribute<String>(node: node).build()
                
            case "formaction":
                return try ValueAttribute<String>(node: node).build(verbatim: "formAction")
                
            case "headers":
                return try ValueAttribute<String>(node: node).build()
                
            case "height":
                return try ValueAttribute<Int>(node: node).build()
                
            case "hidden":
                return try EmptyAttribute(node: node).build()
                
            case "high":
                return try ValueAttribute<Float>(node: node).build()
                
            case "href":
                return try ValueAttribute<String>(node: node).build(verbatim: "reference")
                
            case "hreflang":
                return try TypeAttribute<Values.Language>(node: node).build(verbatim: "referenceLanguage")
                
            case "id":
                return try ValueAttribute<String>(node: node).build()
                
            case "ismap":
                return try EmptyAttribute(node: node).build(verbatim: "isMap")
                
            case "inputmode":
                return try ValueAttribute<String>(node: node).build(verbatim: "inputMode")
                
            case "is":
                return try ValueAttribute<String>(node: node).build()
                
            case "itemid":
                return try ValueAttribute<String>(node: node).build(verbatim: "itemId")
                
            case "itemproperty":
                return try ValueAttribute<String>(node: node).build(verbatim: "itemProperty")
                
            case "itemref":
                return try ValueAttribute<String>(node: node).build(verbatim: "itemReference")
                
            case "itemscope":
                return try ValueAttribute<String>(node: node).build(verbatim: "itemScope")
                
            case "itemtype":
                return try ValueAttribute<String>(node: node).build(verbatim: "itemType")
                
            case "kind":
                return try TypeAttribute<Values.Kind>(node: node).build()
                
            case "label":
                return try ValueAttribute<String>(node: node).build()
                
            case "lang":
                return try TypeAttribute<Values.Language>(node: node).build(verbatim: "language")
                
            case "list":
                return try ValueAttribute<String>(node: node).build()
                
            case "loop":
                return try EmptyAttribute(node: node).build()
                
            case "low":
                return try ValueAttribute<Float>(node: node).build()
                
            case "max":

                if let parent = node.parent {
                    
                    switch parent.localName {
                    case "progress", "meter":
                        return try ValueAttribute<Float>(node: node).build(verbatim: "maximum")
                        
                    default:
                        return try ValueAttribute<String>(node: node).build(verbatim: "maximum")
                    }
                }
                
            case "media":
                return try ValueAttribute<String>(node: node).build()
                
            case "method":
                return try TypeAttribute<HTMLKit.Values.Method>(node: node).build()
                
            case "min":
                return try ValueAttribute<String>(node: node).build(verbatim: "minimum")
                
            case "multiple":
                return try EmptyAttribute(node: node).build()
                
            case "muted":
                return try EmptyAttribute(node: node).build()
                
            case "name":
                
                if let parent = node.parent {
                    
                    switch parent.localName {
                    case "meta":
                        return try TypeAttribute<Values.Name>(node: node).build()
                        
                    default:
                        return try ValueAttribute<String>(node: node).build()
                    }
                }
                
            case "nonce":
                return try ValueAttribute<String>(node: node).build()
                
            case "novalidate":
                return try EmptyAttribute(node: node).build()
                
            case "open":
                return try ValueAttribute<Bool>(node: node).build(verbatim: "isOpen")
                
            case "optimum":
                return try ValueAttribute<Float>(node: node).build()
                
            case "pattern":
                return try ValueAttribute<String>(node: node).build()
                
            case "part":
                return try ValueAttribute<String>(node: node).build()
                
            case "ping":
                return try ValueAttribute<String>(node: node).build()
                
            case "placeholder":
                return try ValueAttribute<String>(node: node).build()
                
            case "poster":
                return try ValueAttribute<String>(node: node).build()
                
            case "preload":
                return try TypeAttribute<Values.Preload>(node: node).build()
                
            case "readonly":
                return try EmptyAttribute(node: node).build()
                
            case "referrerpolicy":
                return try TypeAttribute<Values.Policy>(node: node).build(verbatim: "referrerPolicy")
                
            case "rel":
                return try TypeAttribute<Values.Relation>(node: node).build(verbatim: "relationship")
                
            case "required":
                return try EmptyAttribute(node: node).build()
                
            case "reversed":
                return try EmptyAttribute(node: node).build()
                
            case "role":
                return try TypeAttribute<Values.Role>(node: node).build()
                
            case "rows":
                return try ValueAttribute<String>(node: node).build()
                
            case "rowspan":
                return try ValueAttribute<Int>(node: node).build(verbatim: "rowSpan")
                
            case "sandbox":
                return try EmptyAttribute(node: node).build()
                
            case "scope":
                return try ValueAttribute<String>(node: node).build()
                
            case "shape":
                return try TypeAttribute<Values.Shape>(node: node).build()
                
            case "size":
                return try ValueAttribute<String>(node: node).build()
                
            case "sizes":
                return try ValueAttribute<Int>(node: node).build()
                
            case "slot":
                return try ValueAttribute<String>(node: node).build()
                
            case "span":
                return try ValueAttribute<Int>(node: node).build()
                
            case "spellcheck":
                return try ValueAttribute<Bool>(node: node).build(verbatim: "hasSpellCheck")
                
            case "src":
                return try ValueAttribute<String>(node: node).build(verbatim: "source")
                
            case "start":
                return try ValueAttribute<Int>(node: node).build()
                
            case "step":
                return try ValueAttribute<Int>(node: node).build()
                
            case "style":
                return try ValueAttribute<String>(node: node).build()
                
            case "tabindex":
                return try ValueAttribute<Int>(node: node).build(verbatim: "tabIndex")
                
            case "target":
                return try TypeAttribute<Values.Target>(node: node).build()
                
            case "title":
                return try ValueAttribute<String>(node: node).build()
                
            case "translate":
                return try TypeAttribute<Values.Decision>(node: node).build()
                
            case "type":

                if let parent = node.parent {
                    
                    switch parent.localName {
                        
                    case "input":
                        return try TypeAttribute<Values.Input>(node: node).build()
                        
                    case "button":
                        return try TypeAttribute<Values.Button>(node: node).build()
                        
                    case "link", "script", "audio":
                        return try TypeAttribute<Values.Media>(node: node).build()
                        
                    default:
                        return try ValueAttribute<String>(node: node).build()
                    }
                }
                
            case "value":
                return try ValueAttribute<String>(node: node).build()
                
            case "width":
                return try ValueAttribute<Int>(node: node).build()
                
            case "wrap":
                return try TypeAttribute<Values.Wrapping>(node: node).build()
                
            case "property":
                return try TypeAttribute<Values.Graph>(node: node).build()
                
            case "charset":
                return try TypeAttribute<Values.Charset>(node: node).build()
                
            case "http-equiv":
                return try TypeAttribute<Values.Equivalent>(node: node).build()
                
            case "selected":
                return try EmptyAttribute(node: node).build()
                
            case "maxlength":
                return try ValueAttribute<String>(node: node).build(verbatim: "maximum")
                
            case "minlength":
                return try ValueAttribute<String>(node: node).build(verbatim: "minimum")
                
            case "d":
                return try ValueAttribute<String>(node: node).build(verbatim: "draw")
                
            case "fill":
                return try ValueAttribute<String>(node: node).build()
                
            case "fill-opacity":
                return try ValueAttribute<Double>(node: node).build(verbatim: "fillOpacity")
                
            case "stroke":
                return try ValueAttribute<String>(node: node).build()
                
            case "stroke-width":
                return try ValueAttribute<Int>(node: node).build(verbatim: "strokeWidth")
                
            case "stroke-opacity":
                return try ValueAttribute<Double>(node: node).build(verbatim: "strokeOpacity")
                
            case "stroke-linecap":
                return try TypeAttribute<Values.Linecap>(node: node).build(verbatim: "strokeLineCap")
                
            case "stroke-linejoin":
                return try TypeAttribute<Values.Linejoin>(node: node).build(verbatim: "strokeLineJoin")
                
            case "r":
                return try ValueAttribute<Int>(node: node).build(verbatim: "radius")
                
            case "viewbox":
                return try ValueAttribute<String>(node: node).build(verbatim: "viewBox")
                
            case "onafterprint":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onbeforeprint":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onbeforeunload":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onhashchange":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onlanguagechange":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onmessage":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onmessageerror":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onoffline":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "ononline":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onpagehide":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onpageshow":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onpopstate":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onrejectionhandled":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onstorage":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onunhandledrejection":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onunload":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onerror":
                return try EventAttribute<Events.Window>(node: node).build()
                
            case "onblur":
                return try EventAttribute<Events.Focus>(node: node).build()
                
            case "onfocus":
                return try EventAttribute<Events.Focus>(node: node).build()
                
            case "onpointercancel":
                return try EventAttribute<Events.Pointer>(node: node).build()
                
            case "onpointerdown":
                return try EventAttribute<Events.Pointer>(node: node).build()
                
            case "onpointerenter":
                return try EventAttribute<Events.Pointer>(node: node).build()
                
            case "onpointerleave":
                return try EventAttribute<Events.Pointer>(node: node).build()
                
            case "onpointermove":
                return try EventAttribute<Events.Pointer>(node: node).build()
                
            case "onpointerout":
                return try EventAttribute<Events.Pointer>(node: node).build()
                
            case "onpointerover":
                return try EventAttribute<Events.Pointer>(node: node).build()
                
            case "onpointerup":
                return try EventAttribute<Events.Pointer>(node: node).build()
                
            case "onlostpointercapture":
                return try EventAttribute<Events.Pointer>(node: node).build()
                
            case "onclick":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "oncontextmenu":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "ondblclick":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "onmousedown":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "onmouseenter":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "onmouseleave":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "onmousemove":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "onmouseout":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "onmouseover":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "onmouseup":
                return try EventAttribute<Events.Mouse>(node: node).build()
                
            case "onwheel":
                return try EventAttribute<Events.Wheel>(node: node).build()
                
            case "onbeforeinput":
                return try EventAttribute<Events.Input>(node: node).build()
                
            case "oninput":
                return try EventAttribute<Events.Input>(node: node).build()
                
            case "onselect":
                return try EventAttribute<Events.Input>(node: node).build()
                
            case "onkeydown":
                return try EventAttribute<Events.Keyboard>(node: node).build()
                
            case "onkeyup":
                return try EventAttribute<Events.Keyboard>(node: node).build()
                
            case "ondrag":
                return try EventAttribute<Events.Drag>(node: node).build()
                
            case "ondragend":
                return try EventAttribute<Events.Drag>(node: node).build()
                
            case "ondragenter":
                return try EventAttribute<Events.Drag>(node: node).build()
                
            case "ondragleave":
                return try EventAttribute<Events.Drag>(node: node).build()
                
            case "ondragover":
                return try EventAttribute<Events.Drag>(node: node).build()
                
            case "ondragstart":
                return try EventAttribute<Events.Drag>(node: node).build()
                
            case "ondrop":
                return try EventAttribute<Events.Drag>(node: node).build()
                
            case "oncopy":
                return try EventAttribute<Events.Clipboard>(node: node).build()
                
            case "oncut":
                return try EventAttribute<Events.Clipboard>(node: node).build()
                
            case "onpaste":
                return try EventAttribute<Events.Clipboard>(node: node).build()
                
            case "onselectionchange":
                return try EventAttribute<Events.Selection>(node: node).build()
                
            case "onselectstart":
                return try EventAttribute<Events.Selection>(node: node).build()
                
            case "onabort":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "oncanplay":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "oncanplaythrough":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "ondurationchange":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onemptied":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onended":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onplay":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onplaying":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onpause":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onratechange":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onseeked":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onseeking":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onstalled":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onsuspend":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "ontimeupdate":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onvolumechange":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onwaiting":
                return try EventAttribute<Events.Media>(node: node).build()
                
            case "onreset":
                return try EventAttribute<Events.Form>(node: node).build()
                
            case "onsubmit":
                return try EventAttribute<Events.Form>(node: node).build()
                
            case "ontoggle":
                return try EventAttribute<Events.Detail>(node: node).build()
                
            case "aria-activedescendant":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "activeDescendant")
                
            case "aria-atomic":
                return try ValueAttribute<Bool>(node: node, kind: .aria).build(verbatim: "atomic")
                
            case "aria-autocomplete":
                return try TypeAttribute<Values.Accessibility.Complete>(node: node, kind: .aria).build(verbatim: "autoComplete")
                
            case "aria-busy":
                return try ValueAttribute<Bool>(node: node, kind: .aria).build(verbatim: "busy")
                
            case "aria-checked":
                return try TypeAttribute<Values.Accessibility.Check>(node: node, kind: .aria).build(verbatim: "checked")
                
            case "aria-colcount":
                return try ValueAttribute<Int>(node: node, kind: .aria).build(verbatim: "columnCount")
                
            case "aria-colindex":
                return try ValueAttribute<Int>(node: node, kind: .aria).build(verbatim: "columnIndex")
                
            case "aria-colspan":
                return try ValueAttribute<Int>(node: node, kind: .aria).build(verbatim: "columnSpan")
                
            case "aria-controls":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "controls")
                
            case "aria-current":
                return try TypeAttribute<Values.Accessibility.Current>(node: node, kind: .aria).build(verbatim: "current")
                
            case "aria-describedby":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "describedBy")
                
            case "aria-details":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "details")
                
            case "aria-disabled":
                return try ValueAttribute<Bool>(node: node, kind: .aria).build(verbatim: "disabled")
                
            case "aria-errormessage":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "errorMessage")
                
            case "aria-expanded":
                return try ValueAttribute<Bool>(node: node, kind: .aria).build(verbatim: "expanded")
                
            case "aria-flowto":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "flowTo")
                
            case "aria-haspopup":
                return try TypeAttribute<Values.Accessibility.Popup>(node: node, kind: .aria).build(verbatim: "hasPopup")
                
            case "aria-hidden":
                return try ValueAttribute<Bool>(node: node).build(verbatim: "hidden")
                
            case "aria-invalid":
                return try TypeAttribute<Values.Accessibility.Invalid>(node: node, kind: .aria).build(verbatim: "invalid")
                
            case "aria-keyshortcuts":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "keyShortcuts")
                
            case "aria-label":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "label")
                
            case "aria-labeledby":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "labeledBy")
                
            case "aria-level":
                return try ValueAttribute<Int>(node: node, kind: .aria).build(verbatim: "level")
                
            case "aria-live":
                return try TypeAttribute<Values.Accessibility.Live>(node: node, kind: .aria).build(verbatim: "live")
                
            case "aria-modal":
                return try ValueAttribute<Bool>(node: node, kind: .aria).build(verbatim: "modal")
                
            case "aria-multiline":
                return try ValueAttribute<Bool>(node: node, kind: .aria).build(verbatim: "multiline")
                
            case "aria-multiselectable":
                return try ValueAttribute<Bool>(node: node, kind: .aria).build(verbatim: "multiselectable")
                
            case "aria-orientation":
                return try TypeAttribute<Values.Accessibility.Orientation>(node: node, kind: .aria).build(verbatim: "orientation")
                
            case "aria-owns":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "owns")
                
            case "aria-placeholder":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "placeholder")
                 
            case "aria-posinset":
                return try ValueAttribute<Int>(node: node, kind: .aria).build(verbatim: "positionIndex")
                
            case "aria-pressed":
                return try TypeAttribute<Values.Accessibility.Pressed>(node: node, kind: .aria).build(verbatim: "pressed")
                
            case "aria-readonly":
                return try ValueAttribute<Bool>(node: node, kind: .aria).build(verbatim: "readonly")
                
            case "aria-relevant":
                return try TypeAttribute<Values.Accessibility.Relevant>(node: node, kind: .aria).build(verbatim: "relevant")
                
            case "aria-required":
                return try ValueAttribute<Bool>(node: node, kind: .aria).build(verbatim: "required")
                
            case "aria-roledescription":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "roleDescription")
                
            case "aria-rowcount":
                return try ValueAttribute<Int>(node: node, kind: .aria).build(verbatim: "rowCount")
                
            case "aria-rowindex":
                return try ValueAttribute<Int>(node: node, kind: .aria).build(verbatim: "rowIndex")
                
            case "aria-rowspan":
                return try ValueAttribute<Int>(node: node, kind: .aria).build(verbatim: "rowSpan")
                
            case "aria-selected":
                return try TypeAttribute<Values.Accessibility.Selected>(node: node, kind: .aria).build(verbatim: "selected")
                
            case "aria-setsize":
                return try ValueAttribute<Int>(node: node, kind: .aria).build(verbatim: "setSize")
                
            case "aria-sort":
                return try TypeAttribute<Values.Accessibility.Sort>(node: node, kind: .aria).build(verbatim: "sort")
                
            case "aria-valuemax":
                return try ValueAttribute<Float>(node: node, kind: .aria).build(verbatim: "valueMaximum")
                
            case "aria-valuemin":
                return try ValueAttribute<Float>(node: node, kind: .aria).build(verbatim: "valueMinimum")
                
            case "aria-valuenow":
                return try ValueAttribute<Float>(node: node, kind: .aria).build(verbatim: "valueNow")
                
            case "aria-valuetext":
                return try ValueAttribute<String>(node: node, kind: .aria).build(verbatim: "valueText")
                
            default:
                throw ParserError.unkownAttribute(localName)
            }
            
        default:
            break
        }
        
        return ""
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
        
        internal func build(preindent: Int = 0) -> String {
            
            let indent = String(repeating: "\t", count: (level + preindent))
            
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
        
        internal func build(preindent: Int = 0) -> String {
            
            let indent = String(repeating: "\t", count: (level + preindent))
            
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
        
        internal func build(preindent: Int = 0) throws -> String {
            
            let indent = String(repeating: "\t", count: (level + preindent))
            
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
        
        internal func build(verbatim: String, preindent: Int = 0) throws -> String {
            
            let indent = String(repeating: "\t", count: (level + preindent))
            
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
        
        internal func build(preindent: Int = 0) throws -> String {

            let indent = String(repeating: "\t", count: (level + preindent))
            
            var yield: String = ""
            
            yield += "\(indent)\(try name)()\n"
            
            if let attributes = try attributes {
                yield += "\(indent)\t\(attributes.joined(separator: "\t\(indent)"))"
            }
            
            return yield
        }
        
        internal func build(verbatim: String, preindent: Int = 0) throws -> String {

            let indent = String(repeating: "\t", count: (level + preindent))

            var yield: String = ""
            
            yield += "\(indent)\(verbatim)()\n"
            
            if let attributes = try attributes {
                yield += "\(indent)\t\(attributes.joined(separator: "\t\(indent)"))"
            }
            
            return yield
        }
    }
    
    internal struct ValueAttribute<T: InitRepresentable> {
        
        internal enum AttributeKind {
            case normal
            case aria
        }
        
        private var kind: AttributeKind
        
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
        
        internal init(node: XMLNode, kind: AttributeKind = .normal) {
            self.node = node
            self.kind = kind
        }
        
        internal func build() throws -> String {

            switch kind {
            case .normal:
                
                if let value = self.value {
                    
                    switch value {
                    case is Float, is Int, is Double, is Bool:
                        return ".\(try name)(\(value))\n"
                        
                    default:
                        return ".\(try name)(\"\(value)\")\n"
                    }
                }
                
                return ".\(try name)()\n"
                
            case .aria:
                
                if let value = self.value {
                    
                    switch value {
                    case is Float, is Int, is Double, is Bool:
                        return ".aria(\(try name): \(value))\n"
                        
                    default:
                        return ".aria(\(try name): \"\(value)\")\n"
                    }
                }
                
                return ".aria(\(try name): \"\")\n"
            }
        }
        
        internal func build(verbatim: String) throws -> String {

            switch kind {
            case .normal:
                
                if let value = value {
                    
                    switch value {
                    case is Float, is Int, is Double, is Bool:
                        return ".\(verbatim)(\(value))\n"
                        
                    default:
                        return ".\(verbatim)(\"\(value)\")\n"
                    }
                }
                
                return ".\(verbatim)()\n"
                
            case .aria:
                
                if let value = value {
                    
                    switch value {
                    case is Float, is Int, is Double, is Bool:
                        return ".aria(\(verbatim): \(value))\n"
                        
                    default:
                        return ".aria(\(verbatim): \"\(value)\")\n"
                    }
                }
                
                return ".aria(\(verbatim): \"\")\n"
            }
        }
    }

    internal struct EmptyAttribute {
        
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
        
        internal func build(verbatim: String) throws -> String {
            return ".\(verbatim)()\n"
        }
    }

    internal struct TypeAttribute<T: RawRepresentable> {
        
        internal enum AttributeKind {
            case normal
            case aria
        }
        
        private var kind: AttributeKind
        
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
        
        internal init(node: XMLNode, kind: AttributeKind = .normal) {
            self.node = node
            self.kind = kind
        }
        
        internal func build() throws -> String {

            switch kind {
            case .normal:
                
                if let value = value {
                    return ".\(try name)(.\(value))\n"
                }
                
                return ".\(try name)()\n"
                
            case .aria:
                
                if let value = value {
                    return ".aria(\(try name): .\(value))\n"
                }
                
                return ".aria(\(try name): \"\")\n"
            }
        }
        
        internal func build(verbatim: String) throws -> String {

            switch kind {
            case .normal:
                
                if let value = value {
                    return ".\(verbatim)(.\(value))\n"
                }
                
                return ".\(verbatim)()\n"
                
            case .aria:
                
                if let value = value {
                    return ".aria(\(verbatim): .\(value))\n"
                }
                
                return ".aria(\(verbatim): \"\")\n"
            }
        }
    }

    internal struct CustomAttribute {
        
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

    internal struct EventAttribute<T: RawRepresentable> {
        
        private var name: T {

            get throws {
             
                guard let name = T(rawValue: node.localName?.lowercased() as! T.RawValue)  else {
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
                return ".on(event: .\(try name), \"\(value)\")\n"
            }
            
            return ".on(event: .\(try name), \"\")\n"
        }
    }
}
