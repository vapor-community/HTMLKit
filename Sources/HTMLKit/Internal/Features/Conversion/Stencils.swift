/// # Description:
/// The file contains the stencils for the converter.
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
internal struct CommentElement {
    
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

@available(macOS 11.0, *)
internal struct TextElement {
    
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

@available(macOS 11.0, *)
internal struct ContentElement {

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
            return Converter.default.decode(element: child, preindent: 2)
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

@available(macOS 11.0, *)
internal struct EmptyElement {

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

@available(macOS 11.0, *)
internal struct PageLayout<T: RawRepresentable> {
    
    private var name: String
    
    private var content: String {
        return Converter.default.decode(element: root, preindent: 2)
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

@available(macOS 11.0, *)
internal struct ViewLayout {
    
    private var name: String
    
    private var content: String {
        return Converter.default.decode(element: root, preindent: 2)
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

@available(macOS 11.0, *)
internal struct ValueProperty{
    
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

@available(macOS 11.0, *)
internal struct EmptyProperty {
    
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

@available(macOS 11.0, *)
internal struct TypeProperty<T: RawRepresentable>{
    
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

        if let type = T(rawValue: value as! T.RawValue) {
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
