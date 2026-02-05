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

/// A view that represents an text icon.
///
/// Use `Symbol` to display an icon.
///
/// ```swift
/// Symbol(system: .folder)
/// ```
public struct Symbol: View, Modifiable {
    
    public enum ChartVariants {
        case pie
    }
    
    public enum ChevronVariants: String {
        case left
        case right
        case down
        case up
    }
    
    public enum SidebarVariants: String {
        case left
        case right
        case split
    }
    
    public enum TextVariants: String {
        case left
        case right
        case justify
        case center
    }
    
    public enum EllipsisVariants: String {
        case horizontal
        case vertical
    }
    
    public enum WindowVariants: String {
        case maximize
        case minimize
    }
    
    public enum SymbolNames {
        
        case bell
        case bookmark
        case calendar
        case chart(ChartVariants)
        case chevron(ChevronVariants)
        case clock
        case cloud
        case ellipsis(EllipsisVariants)
        case envelope
        case eye
        case file
        case filter
        case flask
        case folder
        case house
        case key
        case lifepreserver
        case lightbulb
        case location
        case lock
        case pencil
        case person
        case photo
        case refresh
        case sidebar(SidebarVariants)
        case scope
        case target
        case text(TextVariants)
        case trash
        case tresor
        
        public var rawValue: String {
            
            switch self {
            case .bell:
                return "bell"
                
            case .bookmark:
                return "bookmark"
                
            case .calendar:
                return "calendar"
                
            case .chart(.pie):
                return "chart.pie"
                
            case .chevron(.left):
                return "chevron.left"
                
            case .chevron(.right):
                return "chevron.right"
                
            case .chevron(.down):
                return "chevron.down"
                
            case .chevron(.up):
                return "chevron.up"
                
            case .clock:
                return "clock"
                
            case .cloud:
                return "cloud"
                
            case .ellipsis(.horizontal):
                return "ellipsis.horizontal"
                
            case .ellipsis(.vertical):
                return "ellipsis.vertical"
                
            case .envelope:
                return "envelope"
                
            case .eye:
                return "eye"
                
            case .file:
                return "file"
                
            case .filter:
                return "filter"
                
            case .flask:
                return "flask"
                
            case .folder:
                return "folder"
                
            case .house:
                return "house"
                
            case .key:
                return "key"
                
            case .lifepreserver:
                return "lifepreserver"
                
            case .lightbulb:
                return "lightbulb"
                
            case .location:
                return "location"
                
            case .lock:
                return "lock"
                
            case .pencil:
                return "pencil"
                
            case .person:
                return "person"
                
            case .photo:
                return "photo"
                
            case .refresh:
                return "refresh"
                
            case .sidebar(.left):
                return "sidebar.left"
                
            case .sidebar(.right):
                return "sidebar.right"
                
            case .sidebar(.split):
                return "square.split"
                
            case .scope:
                return "scope"
                
            case .target:
                return "target"
                
            case .text(.left):
                return "text.alignleft"
                
            case .text(.right):
                return "text.alignright"
                
            case .text(.center):
                return "text.aligncenter"
                
            case .text(.justify):
                return "text.alignjustify"
                
            case .trash:
                return "trash"
                
            case .tresor:
                return "tresor"
            }
        }
    }
    
    /// The content of the symbol.
    internal let content: [VectorElement]
    
    /// The class names of the symbol.
    internal var classes: [String]
    
    /// Retrieves a symbol.
    ///
    /// - Parameter name: The name of the symbol to use.
    public init(system name: SymbolNames) {
        
        if let url = Bundle.module.url(forResource: name.rawValue, withExtension: "svg") {
            
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
    
    public var body: Content {
        Vector {
            content
        }
        .viewBox(x: 0, y: 0, width: 20, height: 16)
        .class(classes)
    }
    
    /// Set the size for the symbol.
    ///
    /// - Parameter size: The unit to size the symbol.
    ///
    /// - Returns: The symbol
    public func fontSize(_ size: Tokens.FontSize) -> Symbol {
        return self.mutate(classes: "size:\(size.value)")
    }
    
    /// Fill the foreground of the symbol.
    ///
    /// - Parameter color: The color to use for the foreground.
    ///
    /// - Returns: The symbol
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Symbol {
        return self.mutate(classes: "foreground:\(color.value)")
    }
    
    /// Set the drop shadow for the symbol.
    ///
    /// - Parameters:
    ///   - radius: The radius to extend the shadow.
    ///   - color: The color to fill the shadow.
    ///
    /// - Returns: The symbol
    public func shadow(_ radius: Tokens.BlurRadius, color: Tokens.ShadowColor = .black) -> Symbol {
        return self.mutate(classes: "shadow:\(radius.value)", "shadow:\(color.value)")
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
        
        var tempAttributes: OrderedDictionary<String, AttributeData> = [:]
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
                    
                    if let stringValue = attribute.stringValue {
                        tempAttributes[attributeName] = AttributeData(stringValue, context: .trusted)
                    }
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
