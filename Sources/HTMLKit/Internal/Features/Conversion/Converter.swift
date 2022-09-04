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
    
    /// Converts an HTML component to be put into an existing Page or View layout.
    /// 
    /// The whole html string needs to be inside a tag.
    /// For example, multiple `div`s will give an error. They need to be inside another `div`.
    public func convert(html: String) throws -> String {
        
        let document = try XMLDocument(xmlString: html, options: [.documentIncludeContentTypeDeclaration])
        
        guard let root = document.rootElement() else {
            throw Errors.rootNotFound
        }
        
        let content = Converter.default.decode(element: root)
        
        // The user would put this to a line that's already indented. So, remove the extra indentation:
        return content.replacingOccurrences(of: "\t\t\t", with: "\t")
    }
    
    @StringBuilder private func decode(attribute: XMLNode) -> String {
        
        switch attribute.localName {
        case "accesskey":
            ValueProperty<String>(node: attribute).build()
        case "accept":
            ValueProperty<String>(node: attribute).build()
        case "action":
            ValueProperty<String>(node: attribute).build()
        case "alt":
            ValueProperty<String>(node: attribute).build(verbatim: "alternate")
        case "async":
            EmptyProperty(node: attribute).build(verbatim: "asynchronously")
        case "autocapitalize":
            TypeProperty<Capitalization>(node: attribute).build()
        case "autocomplete":
            ValueProperty<Bool>(node: attribute).build(verbatim: "hasCompletion")
        case "autofocus":
            EmptyProperty(node: attribute).build()
        case "autoplay":
            EmptyProperty(node: attribute).build()
        case "checked":
            EmptyProperty(node: attribute).build()
        case "cite":
            ValueProperty<String>(node: attribute).build()
        case "class":
            ValueProperty<String>(node: attribute).build()
        case "cols":
            ValueProperty<Int>(node: attribute).build(verbatim: "columns")
        case "colspan":
            ValueProperty<Int>(node: attribute).build(verbatim: "columnSpan")
        case "content":
            ValueProperty<String>(node: attribute).build()
        case "contenteditable":
            ValueProperty<Bool>(node: attribute).build(verbatim: "isEditable")
        case "controls":
            EmptyProperty(node: attribute).build()
        case "coords":
            ValueProperty<String>(node: attribute).build(verbatim: "coordinates")
        case "data":
            ValueProperty<String>(node: attribute).build()
        case "datetime":
            ValueProperty<String>(node: attribute).build(verbatim: "dateTime")
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
            ValueProperty<String>(node: attribute).build(verbatim: "isDraggable")
        case "enctype":
            TypeProperty<Encoding>(node: attribute).build(verbatim: "encoding")
        case "enterkeyhint":
            TypeProperty<Hint>(node: attribute).build(verbatim: "enterKeyHint")
        case "for":
            ValueProperty<String>(node: attribute).build()
        case "form":
            ValueProperty<String>(node: attribute).build()
        case "formaction":
            ValueProperty<String>(node: attribute).build(verbatim: "formAction")
        case "headers":
            ValueProperty<String>(node: attribute).build()
        case "height":
            ValueProperty<Int>(node: attribute).build()
        case "hidden":
            EmptyProperty(node: attribute).build()
        case "high":
            ValueProperty<Float>(node: attribute).build()
        case "href":
            ValueProperty<String>(node: attribute).build(verbatim: "reference")
        case "hreflang":
            TypeProperty<Language>(node: attribute).build(verbatim: "referenceLanguage")
        case "id":
            ValueProperty<String>(node: attribute).build()
        case "ismap":
            EmptyProperty(node: attribute).build(verbatim: "isMap")
        case "inputmode":
            ValueProperty<String>(node: attribute).build(verbatim: "inputMode")
        case "is":
            ValueProperty<String>(node: attribute).build()
        case "itemid":
            ValueProperty<String>(node: attribute).build(verbatim: "itemId")
        case "itemproperty":
            ValueProperty<String>(node: attribute).build(verbatim: "itemProperty")
        case "itemref":
            ValueProperty<String>(node: attribute).build(verbatim: "itemReference")
        case "itemscope":
            ValueProperty<String>(node: attribute).build(verbatim: "itemScope")
        case "itemtype":
            ValueProperty<String>(node: attribute).build(verbatim: "itemType")
        case "kind":
            TypeProperty<Kinds>(node: attribute).build()
        case "label":
            ValueProperty<String>(node: attribute).build()
        case "lang":
            TypeProperty<Language>(node: attribute).build(verbatim: "language")
        case "list":
            ValueProperty<String>(node: attribute).build()
        case "loop":
            EmptyProperty(node: attribute).build()
        case "low":
            ValueProperty<Float>(node: attribute).build()
        case "max":

            if let parent = attribute.parent {
                
                switch parent.localName {
                case "progress", "meter":
                    ValueProperty<Float>(node: attribute).build(verbatim: "maximum")
                default:
                    ValueProperty<String>(node: attribute).build(verbatim: "maximum")
                }
            }
            
        case "media":
            ValueProperty<String>(node: attribute).build()
        case "method":
            TypeProperty<Method>(node: attribute).build()
        case "min":
            ValueProperty<String>(node: attribute).build(verbatim: "minimum")
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
                    ValueProperty<String>(node: attribute).build()
                }
            }
            
        case "nonce":
            ValueProperty<String>(node: attribute).build()
        case "novalidate":
            EmptyProperty(node: attribute).build()
        case "open":
            ValueProperty<Bool>(node: attribute).build(verbatim: "isOpen")
        case "optimum":
            ValueProperty<Float>(node: attribute).build()
        case "pattern":
            ValueProperty<String>(node: attribute).build()
        case "part":
            ValueProperty<String>(node: attribute).build()
        case "ping":
            ValueProperty<String>(node: attribute).build()
        case "placeholder":
            ValueProperty<String>(node: attribute).build()
        case "poster":
            ValueProperty<String>(node: attribute).build()
        case "preload":
            TypeProperty<Preload>(node: attribute).build()
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
            ValueProperty<String>(node: attribute).build()
        case "rowspan":
            ValueProperty<Int>(node: attribute).build(verbatim: "rowSpan")
        case "sandbox":
            EmptyProperty(node: attribute).build()
        case "scope":
            ValueProperty<String>(node: attribute).build()
        case "shape":
            TypeProperty<Shape>(node: attribute).build()
        case "size":
            ValueProperty<String>(node: attribute).build()
        case "sizes":
            ValueProperty<Int>(node: attribute).build()
        case "slot":
            ValueProperty<String>(node: attribute).build()
        case "span":
            ValueProperty<Int>(node: attribute).build()
        case "spellcheck":
            ValueProperty<Bool>(node: attribute).build(verbatim: "hasSpellCheck")
        case "src":
            ValueProperty<String>(node: attribute).build(verbatim: "source")
        case "start":
            ValueProperty<Int>(node: attribute).build()
        case "step":
            ValueProperty<Int>(node: attribute).build()
        case "style":
            ValueProperty<String>(node: attribute).build()
        case "tabindex":
            ValueProperty<Int>(node: attribute).build(verbatim: "tabIndex")
        case "target":
            TypeProperty<Target>(node: attribute).build()
        case "title":
            ValueProperty<String>(node: attribute).build()
        case "translate":
            TypeProperty<Decision>(node: attribute).build()
        case "type":

            if let parent = attribute.parent {
                
                switch parent.localName {
                case "input":
                    TypeProperty<Inputs>(node: attribute).build()
                case "button":
                    TypeProperty<Buttons>(node: attribute).build()
                case "link", "script", "audio":
                    TypeProperty<Medias>(node: attribute).build()
                default:
                    ValueProperty<String>(node: attribute).build()
                }
            }
            
        case "value":
            ValueProperty<String>(node: attribute).build()
        case "width":
            ValueProperty<Int>(node: attribute).build()
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
        case "maxlength":
            ValueProperty<String>(node: attribute).build(verbatim: "maximum")
        case "minlength":
            ValueProperty<String>(node: attribute).build(verbatim: "minimum")
        case "fill":
            ValueProperty<String>(node: attribute).build()
        case "fill-opacity":
            ValueProperty<Double>(node: attribute).build(verbatim: "fillOpacity")
        case "stroke":
            ValueProperty<String>(node: attribute).build()
        case "stroke-width":
            ValueProperty<Int>(node: attribute).build(verbatim: "strokeWidth")
        case "stroke-opacity":
            ValueProperty<Double>(node: attribute).build(verbatim: "strokeOpacity")
        case "stroke-linecap":
            TypeProperty<Linecap>(node: attribute).build(verbatim: "strokeLineCap")
        case "stroke-linejoin":
            TypeProperty<Linejoin>(node: attribute).build(verbatim: "strokeLineJoin")
        case "r":
            ValueProperty<Int>(node: attribute).build(verbatim: "radius")
        case "viewbox":
            ValueProperty<String>(node: attribute).build(verbatim: "viewBox")
        case "onafterprint":
            EventProperty<Events.Window>(node: attribute).build()
        case "onbeforeprint":
            EventProperty<Events.Window>(node: attribute).build()
        case "onbeforeunload":
            EventProperty<Events.Window>(node: attribute).build()
        case "onhashchange":
            EventProperty<Events.Window>(node: attribute).build()
        case "onlanguagechange":
            EventProperty<Events.Window>(node: attribute).build()
        case "onmessage":
            EventProperty<Events.Window>(node: attribute).build()
        case "onmessageerror":
            EventProperty<Events.Window>(node: attribute).build()
        case "onoffline":
            EventProperty<Events.Window>(node: attribute).build()
        case "ononline":
            EventProperty<Events.Window>(node: attribute).build()
        case "onpagehide":
            EventProperty<Events.Window>(node: attribute).build()
        case "onpageshow":
            EventProperty<Events.Window>(node: attribute).build()
        case "onpopstate":
            EventProperty<Events.Window>(node: attribute).build()
        case "onrejectionhandled":
            EventProperty<Events.Window>(node: attribute).build()
        case "onstorage":
            EventProperty<Events.Window>(node: attribute).build()
        case "onunhandledrejection":
            EventProperty<Events.Window>(node: attribute).build()
        case "onunload":
            EventProperty<Events.Window>(node: attribute).build()
        case "onerror":
            EventProperty<Events.Window>(node: attribute).build()
        case "onblur":
            EventProperty<Events.Focus>(node: attribute).build()
        case "onfocus":
            EventProperty<Events.Focus>(node: attribute).build()
        case "onpointercancel":
            EventProperty<Events.Pointer>(node: attribute).build()
        case "onpointerdown":
            EventProperty<Events.Pointer>(node: attribute).build()
        case "onpointerenter":
            EventProperty<Events.Pointer>(node: attribute).build()
        case "onpointerleave":
            EventProperty<Events.Pointer>(node: attribute).build()
        case "onpointermove":
            EventProperty<Events.Pointer>(node: attribute).build()
        case "onpointerout":
            EventProperty<Events.Pointer>(node: attribute).build()
        case "onpointerover":
            EventProperty<Events.Pointer>(node: attribute).build()
        case "onpointerup":
            EventProperty<Events.Pointer>(node: attribute).build()
        case "onlostpointercapture":
            EventProperty<Events.Pointer>(node: attribute).build()
        case "onclick":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "oncontextmenu":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "ondblclick":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "onmousedown":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "onmouseenter":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "onmouseleave":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "onmousemove":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "onmouseout":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "onmouseover":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "onmouseup":
            EventProperty<Events.Mouse>(node: attribute).build()
        case "onwheel":
            EventProperty<Events.Wheel>(node: attribute).build()
        case "onbeforeinput":
            EventProperty<Events.Input>(node: attribute).build()
        case "oninput":
            EventProperty<Events.Input>(node: attribute).build()
        case "onselect":
            EventProperty<Events.Input>(node: attribute).build()
        case "onkeydown":
            EventProperty<Events.Keyboard>(node: attribute).build()
        case "onkeyup":
            EventProperty<Events.Keyboard>(node: attribute).build()
        case "ondrag":
            EventProperty<Events.Drag>(node: attribute).build()
        case "ondragend":
            EventProperty<Events.Drag>(node: attribute).build()
        case "ondragenter":
            EventProperty<Events.Drag>(node: attribute).build()
        case "ondragleave":
            EventProperty<Events.Drag>(node: attribute).build()
        case "ondragover":
            EventProperty<Events.Drag>(node: attribute).build()
        case "ondragstart":
            EventProperty<Events.Drag>(node: attribute).build()
        case "ondrop":
            EventProperty<Events.Drag>(node: attribute).build()
        case "oncopy":
            EventProperty<Events.Clipboard>(node: attribute).build()
        case "oncut":
            EventProperty<Events.Clipboard>(node: attribute).build()
        case "onpaste":
            EventProperty<Events.Clipboard>(node: attribute).build()
        case "onselectionchange":
            EventProperty<Events.Selection>(node: attribute).build()
        case "onselectstart":
            EventProperty<Events.Selection>(node: attribute).build()
        case "onabort":
            EventProperty<Events.Media>(node: attribute).build()
        case "oncanplay":
            EventProperty<Events.Media>(node: attribute).build()
        case "oncanplaythrough":
            EventProperty<Events.Media>(node: attribute).build()
        case "ondurationchange":
            EventProperty<Events.Media>(node: attribute).build()
        case "onemptied":
            EventProperty<Events.Media>(node: attribute).build()
        case "onended":
            EventProperty<Events.Media>(node: attribute).build()
        case "onplay":
            EventProperty<Events.Media>(node: attribute).build()
        case "onplaying":
            EventProperty<Events.Media>(node: attribute).build()
        case "onpause":
            EventProperty<Events.Media>(node: attribute).build()
        case "onratechange":
            EventProperty<Events.Media>(node: attribute).build()
        case "onseeked":
            EventProperty<Events.Media>(node: attribute).build()
        case "onseeking":
            EventProperty<Events.Media>(node: attribute).build()
        case "onstalled":
            EventProperty<Events.Media>(node: attribute).build()
        case "onsuspend":
            EventProperty<Events.Media>(node: attribute).build()
        case "ontimeupdate":
            EventProperty<Events.Media>(node: attribute).build()
        case "onvolumechange":
            EventProperty<Events.Media>(node: attribute).build()
        case "onwaiting":
            EventProperty<Events.Media>(node: attribute).build()
        case "onreset":
            EventProperty<Events.Form>(node: attribute).build()
        case "onsubmit":
            EventProperty<Events.Form>(node: attribute).build()
        case "ontoggle":
            EventProperty<Events.Detail>(node: attribute).build()
        case "aria-activedescendant":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "activeDescendant")
        case "aria-atomic":
            ValueProperty<Bool>(node: attribute, kind: .aria).build(verbatim: "atomic")
        case "aria-autocomplete":
            TypeProperty<Accessibility.Complete>(node: attribute, kind: .aria).build(verbatim: "autoComplete")
        case "aria-busy":
            ValueProperty<Bool>(node: attribute, kind: .aria).build(verbatim: "busy")
        case "aria-checked":
            TypeProperty<Accessibility.Check>(node: attribute, kind: .aria).build(verbatim: "checked")
        case "aria-colcount":
            ValueProperty<Int>(node: attribute, kind: .aria).build(verbatim: "columnCount")
        case "aria-colindex":
            ValueProperty<Int>(node: attribute, kind: .aria).build(verbatim: "columnIndex")
        case "aria-colspan":
            ValueProperty<Int>(node: attribute, kind: .aria).build(verbatim: "columnSpan")
        case "aria-controls":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "controls")
        case "aria-current":
            TypeProperty<Accessibility.Current>(node: attribute, kind: .aria).build(verbatim: "current")
        case "aria-describedby":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "describedBy")
        case "aria-details":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "details")
        case "aria-disabled":
            ValueProperty<Bool>(node: attribute, kind: .aria).build(verbatim: "disabled")
        case "aria-errormessage":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "errorMessage")
        case "aria-expanded":
            ValueProperty<Bool>(node: attribute, kind: .aria).build(verbatim: "expanded")
        case "aria-flowto":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "flowTo")
        case "aria-haspopup":
            TypeProperty<Accessibility.Popup>(node: attribute, kind: .aria).build(verbatim: "hasPopup")
        case "aria-hidden":
            ValueProperty<Bool>(node: attribute).build(verbatim: "hidden")
        case "aria-invalid":
            TypeProperty<Accessibility.Invalid>(node: attribute, kind: .aria).build(verbatim: "invalid")
        case "aria-keyshortcuts":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "keyShortcuts")
        case "aria-label":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "label")
        case "aria-labeledby":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "labeledBy")
        case "aria-level":
            ValueProperty<Int>(node: attribute, kind: .aria).build(verbatim: "level")
        case "aria-live":
            TypeProperty<Accessibility.Live>(node: attribute, kind: .aria).build(verbatim: "live")
        case "aria-modal":
            ValueProperty<Bool>(node: attribute, kind: .aria).build(verbatim: "modal")
        case "aria-multiline":
            ValueProperty<Bool>(node: attribute, kind: .aria).build(verbatim: "multiline")
        case "aria-multiselectable":
            ValueProperty<Bool>(node: attribute, kind: .aria).build(verbatim: "multiselectable")
        case "aria-orientation":
            TypeProperty<Accessibility.Orientation>(node: attribute, kind: .aria).build(verbatim: "orientation")
        case "aria-owns":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "owns")
        case "aria-placeholder":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "placeholder")
        case "aria-posinset":
            ValueProperty<Int>(node: attribute, kind: .aria).build(verbatim: "positionIndex")
        case "aria-pressed":
            TypeProperty<Accessibility.Pressed>(node: attribute, kind: .aria).build(verbatim: "pressed")
        case "aria-readonly":
            ValueProperty<Bool>(node: attribute, kind: .aria).build(verbatim: "readonly")
        case "aria-relevant":
            TypeProperty<Accessibility.Relevant>(node: attribute, kind: .aria).build(verbatim: "relevant")
        case "aria-required":
            ValueProperty<Bool>(node: attribute, kind: .aria).build(verbatim: "required")
        case "aria-roledescription":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "roleDescription")
        case "aria-rowcount":
            ValueProperty<Int>(node: attribute, kind: .aria).build(verbatim: "rowCount")
        case "aria-rowindex":
            ValueProperty<Int>(node: attribute, kind: .aria).build(verbatim: "rowIndex")
        case "aria-rowspan":
            ValueProperty<Int>(node: attribute, kind: .aria).build(verbatim: "rowSpan")
        case "aria-selected":
            TypeProperty<Accessibility.Selected>(node: attribute, kind: .aria).build(verbatim: "selected")
        case "aria-setsize":
            ValueProperty<Int>(node: attribute, kind: .aria).build(verbatim: "setSize")
        case "aria-sort":
            TypeProperty<Accessibility.Sort>(node: attribute, kind: .aria).build(verbatim: "sort")
        case "aria-valuemax":
            ValueProperty<Float>(node: attribute, kind: .aria).build(verbatim: "valueMaximum")
        case "aria-valuemin":
            ValueProperty<Float>(node: attribute, kind: .aria).build(verbatim: "valueMinimum")
        case "aria-valuenow":
            ValueProperty<Float>(node: attribute, kind: .aria).build(verbatim: "valueNow")
        case "aria-valuetext":
            ValueProperty<String>(node: attribute, kind: .aria).build(verbatim: "valueText")
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
                case "strong":
                    ContentElement(element: element).build(verbatim: "Strong", preindent: indent)
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
                case "progress":
                    ContentElement(element: element).build(preindent: indent)
                case "circle":
                    ContentElement(element: element).build(preindent: indent)
                case "rect":
                    ContentElement(element: element).build(verbatim: "Rectangle", preindent: indent)
                case "ellipse":
                    ContentElement(element: element).build(preindent: indent)
                case "line":
                    ContentElement(element: element).build(preindent: indent)
                case "polygon":
                    ContentElement(element: element).build(preindent: indent)
                case "path":
                    ContentElement(element: element).build(preindent: indent)
                case "use":
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
                
                if node.parent?.localName == "pre" {
                    
                    "\(indent)\"\"\"\n\(text)\"\"\"\n"
                    
                } else {
                    
                    "\(indent)\"\(text.trimmingCharacters(in: .whitespacesAndNewlines))\"\n"
                }
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
            
                @TemplateValue(String.self) var context
            
                public var body: AnyContent {
            \(content)
                }
            }
            """
        }
    }

    private struct ValueProperty<T: InitRepresentable> {
        
        internal enum PropertyKind {
            case normal
            case aria
        }
        
        private var kind: PropertyKind
        
        private var name: String? {
            
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: T? {
            
            guard let value = node.stringValue else {
                return nil
            }
            
            return T(value: value)
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode, kind: PropertyKind = .normal) {
            self.node = node
            self.kind = kind
        }
        
        @StringBuilder internal func build() -> String {

            switch kind {
            case .normal:
                
                if let name = self.name, let value = self.value {
                    
                    switch value {
                    case is Float, is Int, is Double, is Bool:
                        
                        ".\(name)(\(value))\n"
                        
                    default:
                        
                        ".\(name)(\"\(value)\")\n"
                    }
                    
                } else if let name = name {
                    
                    ".\(name)()\n"
                }
                
            case .aria:
                
                if let name = self.name, let value = self.value {
                    
                    switch value {
                    case is Float, is Int, is Double, is Bool:
                        ".aria(\(name): \(value))\n"
                        
                    default:
                        ".aria(\(name): \"\(value)\")\n"
                    }
                }
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {

            switch kind {
            case .normal:
                
                if let verbatim = verbatim, let value = value {
                    
                    switch value {
                    case is Float, is Int, is Double, is Bool:
                        
                        ".\(verbatim)(\(value))\n"
                        
                    default:
                        
                        ".\(verbatim)(\"\(value)\")\n"
                    }
                    
                } else if let verbatim = verbatim {
                    
                    ".\(verbatim)()\n"
                }
                
            case .aria:
                
                if let verbatim = verbatim, let value = value {
                    
                    switch value {
                    case is Float, is Int, is Double, is Bool:
                        ".aria(\(verbatim): \(value))\n"
                        
                    default:
                        ".aria(\(verbatim): \"\(value)\")\n"
                    }
                }
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
        
        internal enum PropertyKind {
            case normal
            case aria
        }
        
        private var kind: PropertyKind
        
        private var name: String? {
            
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: T? {

            guard let value = node.stringValue  else {
                return nil
            }
            
            return T(rawValue: value.lowercased() as! T.RawValue)
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode, kind: PropertyKind = .normal) {
            self.node = node
            self.kind = kind
        }
        
        @StringBuilder internal func build() -> String {

            switch kind {
            case .normal:
                
                if let name = name, let value = value {
                    
                    ".\(name)(.\(value))\n"
                    
                } else if let name = name{
                    
                    ".\(name)()\n"
                }
                
            case .aria:
                
                if let name = name, let value = value {
                    ".aria(\(name): .\(value))\n"
                }
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {

            switch kind {
            case .normal:
                
                if let verbatim = verbatim, let value = value {
                    
                    ".\(verbatim)(.\(value))\n"
                    
                } else if let verbatim = verbatim {
                    
                    ".\(verbatim)()\n"
                }
                
            case .aria:
                
                if let verbatim = verbatim, let value = value {
                    ".aria(\(verbatim): .\(value))\n"
                }
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
    
    private struct EventProperty<T: RawRepresentable> {
        
        private var name: T? {

            guard let name = node.localName  else {
                return nil
            }
            
            return T(rawValue: name.lowercased() as! T.RawValue)
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
                ".on(event: .\(name), \"\(value ?? "")\")\n"
            }
        }
    }
}

public protocol InitRepresentable {
    
    init?(value: String)
}

extension String: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}

extension Float: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}

extension Int: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}

extension Double: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}

extension Bool: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}
