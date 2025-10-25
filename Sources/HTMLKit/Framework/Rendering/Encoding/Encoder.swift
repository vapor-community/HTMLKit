import Foundation

/// A type responsible for encoding characters to their safe equivalents
internal struct Encoder {
    
    /// A enumeration of potential encoding mechanism
    internal enum Mechanism {
        
        /// The context the mechanism should be based on
        internal enum Context {
            
            /// Mechanism to use on an attribute value
            case attribute
            
            /// Mechanism to use on the element body
            case body
        }
        
        /// Use a html encoding mechanism
        case html(Context)
        
        /// Use a css encoding mechanism
        case css
        
        /// Use a js encoding mechanism
        case js
        
        /// The characters to replace based on the mechanism and context
        var characters: Set<Unicode.Scalar> {
            
            switch self {
            case .html(let context):
                
                switch context {
                case .attribute:
                    return ["&", "'", "\""]
                    
                case .body:
                    return ["<", ">"]
                }
                
            case .css:
                return ["<", ">"]
                
            case .js:
                return ["<", ">"]
            }
        }
        
        /// The characters to replace with based on the mechanism
        var replacements: [Unicode.Scalar: String] {
            
            switch self {                
            case .html:
                return ["&": "&amp;", "<": "&lt;", ">": "&gt;", "\"": "&quot;", "'": "&apos;"]
                
            case .css:
                return ["<": "\\00003C", ">": "\\00003E"]
                
            case .js:
                return ["<": "\\u003C", ">": "\\u003E"]
            }
        }
        
        /// The delimiters to look for while encoding
        var delimiters: Set<Unicode.Scalar> {
            
            switch self {
            case .html:
                return []
                
            case .css:
                return ["\"", "'"]
                
            case .js:
                return ["\"", "'", "`"]
            }
        }
    }
    
    /// Encodes a string into a safe equivalent
    ///
    /// - Parameters:
    ///   - string: The string to encode
    ///   - mechansim: The mechnism to use
    ///
    /// - Returns: The encoded string
    internal func encode(_ string: String, as mechansim: Mechanism) -> String {
        
        switch mechansim {
        case .css, .js:
            return self.replace(mechansim.characters, with: mechansim.replacements, within: mechansim.delimiters, on: string)
            
        case .html:
            return self.replace(mechansim.characters, with: mechansim.replacements, on: string)
        }
    }
    
    /// Replaces occurrences of characters in a string with their corresponding replacements
    /// 
    /// - Parameters:
    ///   - set: The set of character to check against
    ///   - table: The table of replacements to use
    ///   - delimiters: The substrings to look for
    ///   - string: The string in which the replacement should be made
    ///   
    /// - Returns: The replaced string
    private func replace(_ set: Set<Unicode.Scalar>, with table: [Unicode.Scalar: String], within delimiters: Set<Unicode.Scalar>, on string: String) -> String {
        
        var result = ""
        
        var isLiteral = false
        
        for scalar in string.unicodeScalars {
            
            if delimiters.contains(scalar) {
            
                if isLiteral == true {
                    
                    result.append(String(scalar))
                    
                    isLiteral = false
                    
                } else {
                    
                    result.append(String(scalar))
                    
                    isLiteral = true
                }
                
            } else {
                
                if isLiteral == true {

                    if set.contains(scalar) {
                        
                        if let replacement = table[scalar] {
                            result.append(contentsOf: replacement)
                            
                        } else {
                            result.append(contentsOf: String(scalar))
                        }
                        
                    } else {
                        result.append(contentsOf: String(scalar))
                    }
                    
                } else {
                    result.append(String(scalar))
                }
            }
        }
        
        return result
    }
    
    /// Replaces occurrences of characters in a string with their corresponding replacements
    /// 
    /// - Parameters:
    ///   - set: The set of characters to check against
    ///   - table: The table of replacements to use
    ///   - string: The string in which the replacement should be made
    /// 
    /// - Returns: The replaced string
    private func replace(_ set: Set<Unicode.Scalar>, with table: [Unicode.Scalar: String], on string: String) -> String {
        
        var result = ""
        
        for scalar in string.unicodeScalars {
            
            if set.contains(scalar) {
                
                if let replacement = table[scalar] {
                    result.append(contentsOf: replacement)
                    
                } else {
                    result.append(contentsOf: String(scalar))
                }
                
            } else {
                result.append(contentsOf: String(scalar))
            }
        }
        
        return result
    }
}
