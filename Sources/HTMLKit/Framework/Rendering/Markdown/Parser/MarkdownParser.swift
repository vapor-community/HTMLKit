internal final class MarkdownParser {
    
    /// A enumeration of different level of logging
    ///
    /// None is the initial state.
    internal enum LogLevel {
        
        case none
        case information
        case debug
    }
    
    /// The tree with nodes
    private var tree: [MarkdownNode]
    
    /// The collection of nodes
    private var nodes: [MarkdownNode]
    
    /// The level of logging
    private var level: LogLevel
    
    /// Creates a the parser
    internal init(log level: LogLevel = .none) {
         
        self.tree = []
        self.nodes = []
        self.level = level
    }
    
    /// Logs the steps of the tokenizer depending on the log level
    private func verbose(_ message: Any...) {
        
        switch self.level {
        case .information:
            print(message)
            
        default:
            break
        }
    }
    
    /// Inserts the node into the syntax tree
    private func insert(node: MarkdownNode) {
        
        self.verbose(#function, node.value)
        
        self.tree.append(node)
    }
    
    /// Emits the node into the node collection
    private func emit(node: MarkdownNode) {
        
        self.verbose(#function, node.value)
        
        self.nodes.append(node)
    }
    
    /// Transforms the token into a node
    private func transform(token: MarkdownToken) -> MarkdownNode {
        
        switch token.kind {
        case .link:
            return MarkdownNode(kind: .block("link"), value: token.value)
            
        case .code:
            return MarkdownNode(kind: .block("code"), value: token.value)
            
        case .textLiteral:
            return MarkdownNode(kind: .inline("text"), value: token.value)
            
        case .emphasis:
            return MarkdownNode(kind: .block("emphasis"), value: token.value)
        }
    }
    
    /// Processes the tokens and emits it to the syntax tree or node collection
    internal func process(tokens: [MarkdownToken]) -> [MarkdownNode] {
        
        for (index, token) in tokens.enumerated() {
            
            self.verbose(#function, token.value)
            
            let node = transform(token: token)
            
            if let last = self.nodes.last {
                
                if last.value != node.value {
                    
                    if node.kind == last.kind {
                        self.emit(node: node)
                        
                    } else {
                        
                        if last.kind == .block("emphasis") || last.kind == .block("code") || last.kind == .block("link") {
                            last.children.append(node)
                            
                        } else {
                            
                            self.insert(node: self.nodes.removeLast())
                            
                            self.emit(node: node)
                        }
                    }
                    
                } else {
                    
                    let last = self.nodes.removeLast()
                    
                    if let penultimate = self.nodes.last {
                        
                        if penultimate.kind == .block("emphasis") || last.kind == .block("code") || last.kind == .block("link") {
                            penultimate.children.append(last)
                        }
                        
                    } else {
                        self.insert(node: last)
                    }
                }
                
            } else {
                self.emit(node: node)
            }
            
            if index == (tokens.count - 1) {
                
                if !self.nodes.isEmpty {
                    self.insert(node: self.nodes.removeLast())
                }
            }
        }
        
        return self.tree
    }
}

