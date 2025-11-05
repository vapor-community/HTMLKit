/// A type responsible for sanitizing the renderer output
internal struct Sanitizer {
    
    /// Strip a tag from a given string
    /// 
    /// - Parameters:
    ///   - tag: The tag to remove
    ///   - string: The string to remove it from
    ///   
    /// - Returns: The sanitized string
    internal func strip(_ tag: String, from string: String) -> String {
        
        return string.replacingOccurrences(of: "<\(tag)>", with: "")
            .replacingOccurrences(of: "</\(tag)>", with: "")
    }
}
