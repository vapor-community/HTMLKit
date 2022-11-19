/*
 Abstract:
 The file contains the html context.
 */

/// The class is for
@propertyWrapper @dynamicMemberLookup public class HTMLContext<Value> {
    
    internal let pathId: String
    
    internal let rootId: String
    
    internal let escaping: EscapingOption
    
    internal let isMasqueradingOptional: Bool
    
    internal let keyPath: AnyKeyPath

    public var wrappedValue: HTMLContext { self }

    public init<Root>(keyPath: KeyPath<Root, Value>, pathId: String, rootId: String = "", escaping: EscapingOption = .safeHTML, isMasqueradingOptional: Bool = false) {
        
        self.keyPath = keyPath
        self.pathId = pathId
        self.rootId = rootId
        self.escaping = escaping
        self.isMasqueradingOptional = isMasqueradingOptional
    }

    public init(keyPath: AnyKeyPath, pathId: String, rootId: String = "", escaping: EscapingOption = .safeHTML, isMasqueradingOptional: Bool = false) {
        
        self.keyPath = keyPath
        self.pathId = pathId
        self.rootId = rootId
        self.escaping = escaping
        self.isMasqueradingOptional = isMasqueradingOptional
    }

    public init(_ value: Value.Type, pathId: String = "", rootId: String = "", escaping: EscapingOption = .safeHTML, isMasqueradingOptional: Bool = false) {
        
        self.keyPath = \Value.self
        self.pathId = pathId
        self.rootId = rootId
        self.escaping = escaping
        self.isMasqueradingOptional = isMasqueradingOptional
    }

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> HTMLContext<Subject> {
        
        guard let newPath = self.keyPath.appending(path: keyPath) else {
            fatalError()
        }
        
        return .init(keyPath: newPath, pathId: pathId + "-" + String(reflecting: Subject.self), rootId: rootId, isMasqueradingOptional: isMasqueradingOptional)
    }

    public func makeOptional() -> HTMLContext<Value?> {
        return .init(keyPath: keyPath, pathId: pathId, rootId: rootId, escaping: escaping, isMasqueradingOptional: true)
    }
    
    public func escaping(_ option: EscapingOption) -> HTMLContext<Value> {
        return .init(keyPath: keyPath, pathId: pathId, rootId: rootId, escaping: option, isMasqueradingOptional: isMasqueradingOptional)
    }
    
    public func unsafeCast<T>(to type: T.Type) -> HTMLContext<T> {
       return .init(keyPath: keyPath, pathId: pathId, rootId: rootId, escaping: escaping, isMasqueradingOptional: isMasqueradingOptional)
    }
}

extension HTMLContext where Value: AnyContent {

    internal func applyEscaping(_ render: String) -> String {
        
        switch escaping {
        case .safeHTML:
            
            return render.reduce(into: "") { (result, char) in
                
                    switch char {
                    case "&":
                        return result += "&amp;"
                        
                    case "<":
                        return result += "&lt;"
                        
                    case ">":
                        return result += "&gt;"
                        
                    case "\"":
                        return result += "&quot;"
                        
                    case "'":
                        return result += "&#39;"
                        
                    default:
                        return result += String(char)
                    }
                }
            
        case .unsafeNone:
            return render
        }
    }
}

extension HTMLContext: Conditionable where Value == Bool {
    
    public func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try manager.value(for: self)
    }
}

extension HTMLContext: Node {
    
    internal func prerender(with formula: Formula) {
        formula.add(ingridient: self)
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        
        var result = ""
        
        if let node = try? manager.value(for: self) as? Node {
            result += node.render(with: manager)
        }
        
        return result
    }
}
