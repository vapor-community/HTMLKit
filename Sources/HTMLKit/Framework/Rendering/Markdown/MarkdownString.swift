import Foundation

public struct MarkdownString: Content {
    
    public let string: String
    
    public init(string: String) {
        self.string = string
    }
}
