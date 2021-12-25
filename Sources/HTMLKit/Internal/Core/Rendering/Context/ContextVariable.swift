/// The class is for
///
///
@dynamicMemberLookup public class ContextVariable<Root, Value> {

    public let pathId: String
    
    public let rootId: String
    
    public let root: KeyPath<Root, Value>
    
    public let escaping: EscapingOption

    public init(value: KeyPath<Root, Value>, id: String, rootId: String = "", escaping: EscapingOption = .safeHTML) {
        
        self.root = value
        self.pathId = id
        self.rootId = rootId
        self.escaping = escaping
    }

    public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> ContextVariable<Root, Subject> {
        
        let newPath = root.appending(path: keyPath)
        
        return ContextVariable<Root, Subject>(value: newPath, id: pathId + "-" + String(reflecting: Subject.self), rootId: rootId)
    }

    public func escaping(_ option: EscapingOption) -> ContextVariable<Root, Value> {
        
        return .init(value: root, id: pathId, rootId: rootId, escaping: option)
    }

    public func append<V>(_ context: ContextVariable<Value, V>) throws -> ContextVariable<Root, V> {
        
        let path = root.appending(path: context.root)
        
        return .init(value: path, id: pathId + "-" + context.pathId, rootId: rootId, escaping: escaping)
    }
}

extension ContextVariable {
    
    public static func root<T>(_ value: T.Type = T.self, rootId: String = "") -> ContextVariable<T, T> {
        
        return ContextVariable<T, T>(value: \T.self, id: rootId + String(reflecting: T.self), rootId: rootId)
    }
    
    public func applyEscaping(_ render: String) -> String {
        
        switch escaping {
        case .safeHTML:
            
            return render
                .replacingOccurrences(of: "&", with: "&amp;")
                .replacingOccurrences(of: "<", with: "&lt;")
                .replacingOccurrences(of: ">", with: "&gt;")
                .replacingOccurrences(of: "\"", with: "&quot;")
                .replacingOccurrences(of: "'", with: "&#39;")
            
        case .unsafeNone:
            return render
        }
    }
}
