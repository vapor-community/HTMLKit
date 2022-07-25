import Foundation

#if canImport(FoundationXML)
import FoundationXML
#endif

internal class LeafTag {
    
    internal enum Kind: Int {
        
        case invalid = 0
        case variable = 1
        case count = 2
        case loop = 3
        case `import` = 4
        case extend = 5
        case export = 6
        case statement = 7
        case condition = 8
        case closure = 9
        case uppercase = 10
        case lowercase = 11
        case capitalize = 12
        case date = 13
    }
    
    internal var kind: LeafTag.Kind
    
    internal var value: String?
    
    internal var level: Int
    
    internal init?(value: String, level: Int) {
        
        if !value.contains("#") {
            return nil
        }
        
        self.level = level
        
        switch value {
        case let content where value.contains("#count"):
            
            self.kind = .count
            self.value = content.substring(from: "(", to: ")")
            
        case let content where value.contains("#import"):
            
            self.kind = .import
            self.value = content.substring(from: "(\"", to: "\")")
            
        case let content where value.contains("#if"):
            
            self.kind = .statement
            self.value = content.substring(from: "(", to: ")")
            
        case _ where value.contains("#else"):
            
            self.kind = .condition
            self.value = nil
            
        case let content where value.contains("#for"):
            
            self.kind = .loop
            self.value = content.substring(from: "(", to: ")")
            
        case let content where value.contains("#export"):
            
            self.kind = .export
            self.value = content
            
        case let content where value.contains("#extend"):
            
            self.kind = .extend
            self.value = content.substring(from: "(\"", to: "\")")
            
        case let content where value.contains("#lowercased"):
            
            self.kind = .lowercase
            self.value = content.substring(from: "(", to: ")")
            
        case let content where value.contains("#uppercased"):
            
            self.kind = .uppercase
            self.value = content.substring(from: "(", to: ")")
            
        case let content where value.contains("#capitalized"):
            
            self.kind = .capitalize
            self.value = content.substring(from: "(", to: ")")
            
        case let content where value.contains("#date"):
            
            self.kind = .date
            self.value = content.substring(from: "(", to: ")")
            
        case _ where value.contains("#end"):
            
            self.kind = .closure
            self.value = nil
            
        default:
            
            self.kind = .variable
            self.value = value.substring(from: "(", to: ")")
        }
    }
}
