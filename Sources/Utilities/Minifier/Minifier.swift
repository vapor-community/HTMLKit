import Foundation

public struct Minifier {
    
    public struct Compression: OptionSet {
        
        public var rawValue: Int
        
        public static let stripComments = Compression(rawValue: 1 << 0)
        public static let removeWhitespaces = Compression(rawValue: 1 << 1)
        public static let mangleVariables = Compression(rawValue: 1 << 2)
        public static let omitUnits = Compression(rawValue: 2 << 3)
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    /// The level of compression
    private var compression: [Compression]
    
    /// Initiates a minifier
    public init(compression: [Compression]) {
        
        self.compression = compression
    }
    
    /// Minifies a stylesheet string
    public func minify(css content: String) -> String {
        
        var tokens = Stylesheet().consume(content)
        
        if compression.contains(.stripComments) {
            tokens.removeAll(where:  { $0 is Stylesheet.CommentToken })
        }
        
        var yield = [Token]()
        
        if compression.contains(.removeWhitespaces) {
            
            for (index, token) in tokens.enumerated() {
                
                if token is Stylesheet.WhitespaceToken {
                    
                    let previous = tokens.index(before: index)
                    let next = tokens.index(after: index)
                    
                    if previous >= tokens.startIndex && next < tokens.endIndex {
                        
                        // keep the whitespace if its between two selectors
                        if tokens[previous] is Stylesheet.SelectorToken && tokens[next] is Stylesheet.SelectorToken {
                            yield.append(token)
                        }
                        
                        // keep the whitespace if its between one selector and value token
                        if tokens[previous] is Stylesheet.SelectorToken && tokens[next] is Stylesheet.LiteralToken {
                            yield.append(token)
                        }
                        
                        // keep the whitespace if its between two value tokens
                        if tokens[previous] is Stylesheet.ValueToken && tokens[next] is Stylesheet.ValueToken {
                            yield.append(token)
                        }
                    }
                    
                } else {
                    yield.append(token)
                }
            }
        }
        
        return yield.map({ $0.present() }).joined()
    }
    
    /// Minifies a javascript string
    public func minify(js content: String) -> String {
        
        var tokens = Javascript().consume(content)
        
        if compression.contains(.stripComments) {
            tokens.removeAll(where:  { $0 is Javascript.CommentToken })
        }
        
        var yield = [Token]()
        
        if compression.contains(.removeWhitespaces) {
            
            for (index, token) in tokens.enumerated() {
                
                if token is Javascript.WhitespaceToken {
                    
                    let previous = tokens.index(before: index)
                    let next = tokens.index(after: index)
                    
                    if previous >= tokens.startIndex && next < tokens.endIndex {
                        
                        if tokens[previous] is Javascript.WordToken && tokens[next] is Javascript.WordToken {
                            yield.append(token)
                        }
                    }
                    
                } else {
                    yield.append(token)
                }
            }
        }
        
        return yield.map({ $0.present() }).joined()
    }
}
