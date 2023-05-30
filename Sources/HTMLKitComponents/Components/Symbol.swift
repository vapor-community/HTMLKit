/*
 Abstract:
 The file contains everything related to the symbol component.
 */

import Foundation
import HTMLKit
import OrderedCollections

#if canImport(FoundationXML)
import FoundationXML
#endif

/// A component that displays symbols.
public struct Symbol: View, Modifiable {
    
    /// The content of the symbol.
    internal let content: [VectorElement]
    
    /// The classes of the symbol.
    internal var classes: [String]
    
    /// Retrieves a symbol.
    public init(system name: String) {
        
        if let url = Bundle.module.url(forResource: name, withExtension: "svg") {
            
            if let content = try? Symbol.load(contentsOfFile: url) {
                self.content = content
                
            } else {
                self.content = []
            }
            
        } else {
            self.content = []
        }
        
        self.classes = ["symbol"]
    }
    
    /// Creates a symbol.
    internal init(content: [VectorElement], classes: [String]) {

        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        Vector {
            content
        }
        .viewBox("0 0 20 16")
        .class(classes.joined(separator: " "))
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Symbol {
        
        var newSelf = self
        newSelf.classes.append(size.rawValue)
        
        return newSelf
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Symbol {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

extension Symbol {
    
    fileprivate static func load(contentsOfFile path: URL) throws -> [VectorElement] {
        
        var elements = [VectorElement]()
        
        let document = try XMLDocument(contentsOf: path, options: .documentIncludeContentTypeDeclaration)
        
        if let root = document.rootElement() {
            
            if let children = root.children {
                
                for child in children {
                    
                    if let element = try parse(node: child) {
                        elements.append(element)
                    }
                }
            }
        }
        
        return elements
    }
    
    fileprivate static func parse(node: XMLNode) throws -> VectorElement? {
        
        var tempAttributes: OrderedDictionary<String, Any> = [:]
        var tempContent: [Content] = []
        
        guard let element = node as? XMLElement else {
            return nil
        }
        
        guard let localName = element.localName else {
            return nil
        }
        
        if let attributes = element.attributes {
            
            for attribute in attributes {
                
                if let attributeName = attribute.localName {
                    tempAttributes[attributeName] = attribute.stringValue
                }
            }
        }
        
        if let children = element.children {
            
            for child in children {
                
                if let model = try parse(node: child) {
                    tempContent.append(model)
                }
            }
        }
        
        return Custom(name: localName, attributes: tempAttributes, content: tempContent)
    }
}
