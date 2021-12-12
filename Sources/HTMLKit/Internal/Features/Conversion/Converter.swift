/// # Description:
/// The file contains the converter.
///
/// # Note:
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// # Authors:
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

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
                
                let layout = PageLayout<DocumentType>(name: fileName, doctype: dtd, root: root).build()
                
                print(layout)
                
            } else {
                
                let layout = ViewLayout(name: fileName, root: root).build()
                
                print(layout)
            }
            
        case .file:
            
            if let dtd = document.dtd {
                
                let layout = PageLayout<DocumentType>(name: fileName, doctype: dtd, root: root).build()
                
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
    
    @StringBuilder internal func decode(attribute: XMLNode) -> String {
        
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
            ValueProperty(node: attribute).build()
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
            ValueProperty(node: attribute).build()
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
        case "source":
            ValueProperty(node: attribute).build()
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
            TypeProperty<Inputs>(node: attribute).build()
        case "value":
            ValueProperty(node: attribute).build()
        case "width":
            ValueProperty(node: attribute).build()
        case "wrap":
            TypeProperty<Wrapping>(node: attribute).build()
        case "property":
            TypeProperty<Graphs>(node: attribute).build()
        default:
            "attribute is not listed. contact the author"
        }
    }
    
    @StringBuilder internal func decode(element: XMLNode, preindent: Int? = nil) -> String {
        
        switch element.kind {
        case .text:
            
            TextElement(node: element).build(preindent: preindent)
            
        case .comment:
            
            CommentElement(node: element).build(preindent: preindent)
            
        default:
            
            if let element = element as? XMLElement {
             
                switch element.localName {
                case "html":
                    ContentElement(element: element).build(preindent: preindent)
                case "head":
                    ContentElement(element: element).build(verbatim: "Head", preindent: preindent)
                case "body":
                    ContentElement(element: element).build(preindent: preindent)
                case "nav":
                    ContentElement(element: element).build(verbatim: "Navigation", preindent: preindent)
                case "link":
                    EmptyElement(element: element).build(preindent: preindent)
                case "aside":
                    ContentElement(element: element).build(preindent: preindent)
                case "section":
                    ContentElement(element: element).build(preindent: preindent)
                case "h1":
                    ContentElement(element: element).build(verbatim: "Heading1", preindent: preindent)
                case "h2":
                    ContentElement(element: element).build(verbatim: "Heading2", preindent: preindent)
                case "h3":
                    ContentElement(element: element).build(verbatim: "Heading3", preindent: preindent)
                case "h4":
                    ContentElement(element: element).build(verbatim: "Heading4", preindent: preindent)
                case "h5":
                    ContentElement(element: element).build(verbatim: "Heading5", preindent: preindent)
                case "h6":
                    ContentElement(element: element).build(verbatim: "Heading6", preindent: preindent)
                case "hgroup":
                    ContentElement(element: element).build(verbatim: "HeadingGroup", preindent: preindent)
                case "header":
                    ContentElement(element: element).build(preindent: preindent)
                case "footer":
                    ContentElement(element: element).build(preindent: preindent)
                case "address":
                    ContentElement(element: element).build(preindent: preindent)
                case "p":
                    ContentElement(element: element).build(verbatim: "Paragraph", preindent: preindent)
                case "hr":
                    EmptyElement(element: element).build(verbatim: "HorizontalRule", preindent: preindent)
                case "pre":
                    ContentElement(element: element).build(verbatim: "PreformattedText", preindent: preindent)
                case "blockquote":
                    ContentElement(element: element).build(preindent: preindent)
                case "ol":
                    ContentElement(element: element).build(verbatim: "OrderdList", preindent: preindent)
                case "ul":
                    ContentElement(element: element).build(verbatim: "UnorderdList", preindent: preindent)
                case "dl":
                    ContentElement(element: element).build(verbatim: "DescriptionList", preindent: preindent)
                case "figure":
                    ContentElement(element: element).build(preindent: preindent)
                case "a":
                    ContentElement(element: element).build(verbatim: "Anchor", preindent: preindent)
                case "em":
                    ContentElement(element: element).build(verbatim: "Emphasize", preindent: preindent)
                case "small":
                    ContentElement(element: element).build(preindent: preindent)
                case "s":
                    ContentElement(element: element).build(verbatim: "StrikeThrough", preindent: preindent)
                case "main":
                    ContentElement(element: element).build(preindent: preindent)
                case "div":
                    ContentElement(element: element).build(verbatim: "Division", preindent: preindent)
                case "dfn":
                    ContentElement(element: element).build(verbatim: "Definition", preindent: preindent)
                case "cite":
                    ContentElement(element: element).build(preindent: preindent)
                case "q":
                    ContentElement(element: element).build(verbatim: "ShortQuote", preindent: preindent)
                case "rt":
                    ContentElement(element: element).build(verbatim: "RubyText", preindent: preindent)
                case "rp":
                    ContentElement(element: element).build(verbatim: "RubyPronunciation", preindent: preindent)
                case "abbr":
                    ContentElement(element: element).build(verbatim: "Abbreviation", preindent: preindent)
                case "data":
                    ContentElement(element: element).build(preindent: preindent)
                case "time":
                    ContentElement(element: element).build(preindent: preindent)
                case "code":
                    ContentElement(element: element).build(preindent: preindent)
                case "v":
                    ContentElement(element: element).build(verbatim: "Variable", preindent: preindent)
                case "samp":
                    ContentElement(element: element).build(verbatim: "SampleOutput", preindent: preindent)
                case "kbd":
                    ContentElement(element: element).build(verbatim: "KeyboardOutput", preindent: preindent)
                case "sub":
                    ContentElement(element: element).build(verbatim: "Subscript", preindent: preindent)
                case "sup":
                    ContentElement(element: element).build(verbatim: "Superscript", preindent: preindent)
                case "i":
                    ContentElement(element: element).build(verbatim: "Italic", preindent: preindent)
                case "b":
                    ContentElement(element: element).build(verbatim: "Bold", preindent: preindent)
                case "u":
                    ContentElement(element: element).build(verbatim: "SampleOutput", preindent: preindent)
                case "mark":
                    ContentElement(element: element).build(preindent: preindent)
                case "bdi":
                    ContentElement(element: element).build(preindent: preindent)
                case "bdo":
                    EmptyElement(element: element).build(preindent: preindent)
                case "span":
                    ContentElement(element: element).build(preindent: preindent)
                case "br":
                    EmptyElement(element: element).build(verbatim: "LineBreak", preindent: preindent)
                case "wbr":
                    EmptyElement(element: element).build(verbatim: "WordBreak", preindent: preindent)
                case "ins":
                    ContentElement(element: element).build(verbatim: "InsertedText", preindent: preindent)
                case "del":
                    ContentElement(element: element).build(verbatim: "DeletedText", preindent: preindent)
                case "img":
                    ContentElement(element: element).build(verbatim: "Image", preindent: preindent)
                case "embed":
                    ContentElement(element: element).build(preindent: preindent)
                case "iframe":
                    ContentElement(element: element).build(verbatim: "InlineFrame", preindent: preindent)
                case "param":
                    EmptyElement(element: element).build(verbatim: "Parameter", preindent: preindent)
                case "dt":
                    ContentElement(element: element).build(verbatim: "TermName", preindent: preindent)
                case "dd":
                    ContentElement(element: element).build(verbatim: "TermDefinition", preindent: preindent)
                case "figcaption":
                    ContentElement(element: element).build(verbatim: "FigureCaption", preindent: preindent)
                case "optgroup":
                    ContentElement(element: element).build(verbatim: "OptionGroup", preindent: preindent)
                case "option":
                    ContentElement(element: element).build(preindent: preindent)
                case "legend":
                    ContentElement(element: element).build(preindent: preindent)
                case "summary":
                    ContentElement(element: element).build(preindent: preindent)
                case "li":
                    ContentElement(element: element).build(verbatim: "ListItem", preindent: preindent)
                case "colgroup":
                    ContentElement(element: element).build(verbatim: "ColumnGroup", preindent: preindent)
                case "col":
                    ContentElement(element: element).build(verbatim: "Column", preindent: preindent)
                case "tbody":
                    ContentElement(element: element).build(verbatim: "TableBody", preindent: preindent)
                case "thead":
                    ContentElement(element: element).build(verbatim: "TableHead", preindent: preindent)
                case "tfoot":
                    ContentElement(element: element).build(verbatim: "TableFoot", preindent: preindent)
                case "tr":
                    ContentElement(element: element).build(verbatim: "TableRow", preindent: preindent)
                case "td":
                    ContentElement(element: element).build(verbatim: "DataCell", preindent: preindent)
                case "th":
                    ContentElement(element: element).build(verbatim: "HeaderCell", preindent: preindent)
                case "textarea":
                    ContentElement(element: element).build(verbatim: "TextArea", preindent: preindent)
                case "input":
                    EmptyElement(element: element).build(preindent: preindent)
                case "video":
                    ContentElement(element: element).build(preindent: preindent)
                case "audio":
                    ContentElement(element: element).build(preindent: preindent)
                case "map":
                    ContentElement(element: element).build(preindent: preindent)
                case "area":
                    ContentElement(element: element).build(preindent: preindent)
                case "form":
                    ContentElement(element: element).build(preindent: preindent)
                case "datalist":
                    ContentElement(element: element).build(preindent: preindent)
                case "output":
                    ContentElement(element: element).build(preindent: preindent)
                case "meter":
                    ContentElement(element: element).build(preindent: preindent)
                case "details":
                    ContentElement(element: element).build(preindent: preindent)
                case "dialog":
                    ContentElement(element: element).build(preindent: preindent)
                case "script":
                    ContentElement(element: element).build(preindent: preindent)
                case "noscript":
                    ContentElement(element: element).build(preindent: preindent)
                case "template":
                    ContentElement(element: element).build(preindent: preindent)
                case "canvas":
                    ContentElement(element: element).build(preindent: preindent)
                case "table":
                    ContentElement(element: element).build(preindent: preindent)
                case "fieldset":
                    ContentElement(element: element).build(preindent: preindent)
                case "button":
                    ContentElement(element: element).build(preindent: preindent)
                case "select":
                    ContentElement(element: element).build(preindent: preindent)
                case "label":
                    ContentElement(element: element).build(preindent: preindent)
                case "title":
                    ContentElement(element: element).build(preindent: preindent)
                case "base":
                    EmptyElement(element: element).build(preindent: preindent)
                case "meta":
                    EmptyElement(element: element).build(preindent: preindent)
                case "style":
                    ContentElement(element: element).build(preindent: preindent)
                case "source":
                    EmptyElement(element: element).build(preindent: preindent)
                case "track":
                    EmptyElement(element: element).build(preindent: preindent)
                case "article":
                    ContentElement(element: element).build(preindent: preindent)
                default:
                    "element is not listed. contact the author"
                }
            }
        }
    }
}
